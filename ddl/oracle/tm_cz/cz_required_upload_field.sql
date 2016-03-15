--
-- Type: TABLE; Owner: TM_CZ; Name: CZ_REQUIRED_UPLOAD_FIELD
--

 CREATE TABLE "TM_CZ"."CZ_REQUIRED_UPLOAD_FIELD" 
  (	"REQUIRED_UPLOAD_FIELD_ID" NUMBER(22,0) NOT NULL ENABLE, 
"TYPE" NVARCHAR2(50), 
"FIELD" NVARCHAR2(50),
 CONSTRAINT "CZ_REQUIRED_UPLOAD_FIELD_PK" PRIMARY KEY ("REQUIRED_UPLOAD_FIELD_ID")
 USING INDEX
 TABLESPACE "TRANSMART"  ENABLE
  ) SEGMENT CREATION IMMEDIATE 
 TABLESPACE "TRANSMART" ;

--
-- Type: TRIGGER; Owner: TM_CZ; Name: TRG_CZ_REQ_UPLOAD_FIELD_ID
--

  CREATE OR REPLACE TRIGGER "TM_CZ"."TRG_CZ_REQ_UPLOAD_FIELD_ID" before
  INSERT ON "TM_CZ"."CZ_REQUIRED_UPLOAD_FIELD" FOR EACH row  BEGIN IF inserting THEN IF :NEW."REQUIRED_UPLOAD_FIELD_ID" IS NULL THEN
  SELECT SEQ_REQUIRED_UPLOAD_FIELD_ID.nextval INTO :NEW."REQUIRED_UPLOAD_FIELD_ID" FROM dual;
END IF;
END IF;
END;
/
ALTER TRIGGER "TM_CZ"."TRG_CZ_REQ_UPLOAD_FIELD_ID" ENABLE;

