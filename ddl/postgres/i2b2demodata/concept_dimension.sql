--
-- Name: concept_dimension; Type: TABLE; Schema: i2b2demodata; Owner: -
--
CREATE TABLE concept_dimension (
    concept_path character varying(700) NOT NULL,
    concept_cd character varying(50) NOT NULL,
    name_char character varying(2000),
    concept_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id numeric(38,0)
);

--
-- Name: concept_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: -
--
ALTER TABLE ONLY concept_dimension
    ADD CONSTRAINT concept_dimension_pk PRIMARY KEY (concept_path);

--
-- Name: cd_uploadid_idx; Type: INDEX; Schema: i2b2demodata; Owner: -
--
CREATE INDEX cd_uploadid_idx ON concept_dimension USING btree (upload_id);

