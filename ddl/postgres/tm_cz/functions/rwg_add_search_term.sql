-----------------------------------------------------------------------
--             DO NOT EDIT THIS FILE. IT IS AUTOGENERATED            --
-- Edit the original file in the macroed_functions directory instead --
-----------------------------------------------------------------------
-- Generated by Ora2Pg, the Oracle database Schema converter, version 11.4
-- Copyright 2000-2013 Gilles DAROLD. All rights reserved.
-- DATASOURCE: dbi:Oracle:host=mydb.mydom.fr;sid=SIDNAME


CREATE OR REPLACE FUNCTION tm_cz.rwg_add_search_term (
  New_Term text,
  category_name text,
  category_display	text,
  currentJobID bigint DEFAULT null
)
 RETURNS BIGINT AS $body$
DECLARE

/*************************************************************************
* Copyright 2008-2012 Janssen Research & Development, LLC.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
******************************************************************/
	--Audit variables
	newJobFlag    smallint;
	databaseName  varchar(100);
	procedureName varchar(100);
	jobID         bigint;
	stepCt        bigint;
	rowCt         bigint;
	errorNumber   varchar;
	errorMessage  varchar;

	Parent_Id          integer;
	new_Term_Id        integer;
	keyword_id         integer;
	Lcount             integer;
	Ncount             integer;
	v_category_display varchar(200);


BEGIN
	--Set Audit Parameters
	newJobFlag := 0; -- False (Default)
	jobID := currentJobID;
	SELECT current_user INTO databaseName; --(sic)
	procedureName := 'RWG_ADD_SEARCH_TERM';

	--Audit JOB Initialization
	--If Job ID does not exist, then this is a single procedure run and we need to create it
	IF (coalesce(jobID::text, '') = '' OR jobID < 1)
		THEN
		newJobFlag := 1; -- True
		SELECT cz_start_audit(procedureName, databaseName) INTO jobID;
	END IF;
	PERFORM cz_write_audit(jobId, databaseName, procedureName,
		'Start FUNCTION', 0, stepCt, 'Done');
	stepCt := 1;
	PERFORM cz_write_audit(jobId, databaseName, procedureName,
		'Term to add is ''' || new_term || ''', category is ''' ||
		category_name || '''', 0, stepCt, 'Done');

	/*
	1. Check if term exists in Search_Keyword_term
	2. Insert term into Searchapp.search_keyword
	3. Insert term into Searchapp.Search_Keyword_term
	 */
	/*
	-- check if the new term exists
	Select Count(*) 
	into Ncount
	From Searchapp.Search_Keyword
	where upper(Keyword) like upper(New_Term)
	and upper(Display_Data_Category) like upper(category_name);
	If(Ncount>0) Then
		RAISE Existing_Term;
	END IF;
    */

	IF coalesce(category_display::text, '') = '' THEN
		v_category_display := category_name;
	ELSE
		v_category_display := category_display;
	END IF;

	-- Insert taxonomy term into searchapp.search_keyword
	-- (searches Search_Keyword with the parent term to find the category to use)
	BEGIN
	INSERT INTO Searchapp.Search_Keyword(
		Data_Category,
		Keyword,
		Unique_Id,
		Source_Code,
		Display_Data_Category)
	SELECT
		category_name,
		New_Term,
		'RWG:'|| category_name || ':' || New_Term,
		'RWG_ADD_SEARCH_TERM',
		v_category_display
	WHERE
		NOT EXISTS
			(SELECT 1 FROM searchapp.search_keyword x
			WHERE upper(x.data_category) = upper(category_name)
				AND upper(x.keyword) = upper(New_Term));

	GET DIAGNOSTICS rowCt := ROW_COUNT;
	PERFORM cz_write_audit(jobId, databaseName, procedureName,
		'Term added to Searchapp.Search_Keyword', rowCt, stepCt, 'Done');
	stepCt := stepCt + 1;
	EXCEPTION
		WHEN OTHERS THEN
		errorNumber := SQLSTATE;
		errorMessage := SQLERRM;
		PERFORM cz_error_handler(jobID, procedureName, errorNumber, errorMessage);
		PERFORM cz_end_audit (jobID, 'FAIL');
		RETURN -16;
	END;

	-- Get the ID of the new term in Search_Keyword
	BEGIN
	SELECT Search_Keyword_Id INTO Keyword_Id 
	FROM Searchapp.Search_Keyword
	WHERE Upper(Keyword) = Upper(New_Term)
		AND upper(data_category) = upper(category_name);

	GET DIAGNOSTICS rowCt := ROW_COUNT;
	PERFORM cz_write_audit(jobId, databaseName, procedureName,
		'New search keyword ID stored in Keyword_Id', rowCt, stepCt, 'Done');
	stepCt := stepCt + 1;
	EXCEPTION
		WHEN OTHERS THEN
		errorNumber := SQLSTATE;
		errorMessage := SQLERRM;
		PERFORM cz_error_handler(jobID, procedureName, errorNumber, errorMessage);
		PERFORM cz_end_audit (jobID, 'FAIL');
		RETURN -16;
	END;

	-- Insert the new term into Searchapp.Search_Keyword_Term 
	BEGIN
	INSERT INTO Searchapp.Search_Keyword_Term(
		Keyword_Term,
		Search_Keyword_Id,
		Rank,
		Term_Length)
	SELECT
		New_Term,
		Keyword_Id,
		1,
		Length(New_Term)
	WHERE
		NOT EXISTS (
			SELECT
				1
			FROM
				searchapp.search_keyword_term x
			WHERE
				UPPER(x.keyword_term) = UPPER(New_Term)
				AND x.search_keyword_id = Keyword_Id);

	GET DIAGNOSTICS rowCt := ROW_COUNT;
	PERFORM cz_write_audit(jobId, databaseName, procedureName,
		'Term added to Searchapp.Search_Keyword_Term', rowCt, stepCt, 'Done');
	stepCt := stepCt + 1;
	EXCEPTION
		WHEN OTHERS THEN
		errorNumber := SQLSTATE;
		errorMessage := SQLERRM;
		PERFORM cz_error_handler(jobID, procedureName, errorNumber, errorMessage);
		PERFORM cz_end_audit (jobID, 'FAIL');
		RETURN -16;
	END;

     ---Cleanup OVERALL JOB if this proc is being run standalone    
	IF newJobFlag = 1
		THEN
		PERFORM cz_end_audit (jobID, 'SUCCESS');
	END IF;

	RETURN 0;
EXCEPTION
	WHEN OTHERS THEN
	errorNumber := SQLSTATE;
		errorMessage := SQLERRM;
		PERFORM cz_error_handler(jobID, procedureName, errorNumber, errorMessage);
		PERFORM cz_end_audit (jobID, 'FAIL');
		RETURN -16;
END;

$body$
LANGUAGE PLPGSQL;


