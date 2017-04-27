--------------------------------------------------------
--  ������ ������ - �ݿ���-12��-09-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table REGISTERBOARD
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REGISTERBOARD" 
   (	"CODENUM" NUMBER(10,0), 
	"CATEGORY" VARCHAR2(15 BYTE), 
	"TITLE" VARCHAR2(100 BYTE), 
	"STARTDATE" VARCHAR2(30 BYTE), 
	"ENDDATE" VARCHAR2(30 BYTE), 
	"USERSTARTDATE" VARCHAR2(30 BYTE), 
	"USERENDDATE" VARCHAR2(30 BYTE), 
	"CONTENTS" VARCHAR2(2000 BYTE), 
	"BILL" NUMBER(15,0), 
	"DEPOSIT" NUMBER(15,0), 
	"PACKAGESTATUS" VARCHAR2(20 BYTE) DEFAULT '�뿩����', 
	"IMG" VARCHAR2(2000 BYTE), 
	"REAQUESTID" VARCHAR2(25 BYTE), 
	"REGISTERID" VARCHAR2(25 BYTE), 
	"COMPANY" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007421
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007421" ON "SYSTEM"."REGISTERBOARD" ("CODENUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table REGISTERBOARD
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REGISTERBOARD" ADD PRIMARY KEY ("CODENUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REGISTERBOARD" MODIFY ("REAQUESTID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REGISTERBOARD" MODIFY ("CONTENTS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REGISTERBOARD" MODIFY ("ENDDATE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REGISTERBOARD" MODIFY ("STARTDATE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REGISTERBOARD" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REGISTERBOARD" MODIFY ("CATEGORY" NOT NULL ENABLE);