
CREATE SEQUENCE cmAvailServBind_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmAvailServBind (
  AvailServBindId number  NOT NULL,
  name varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  visualizationAction varchar2(100) NOT NULL,
  isMandatory number default 0 NOT NULL,
  isUserEditable number default 0 NOT NULL,
  isInheritable number default 0 NOT NULL,
  PRIMARY KEY  (AvailServBindId)
);



CREATE SEQUENCE cmAvailServBindSiNoTypeDef_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmAvailServBindSiNoTypeDef (
  AvailServBindId number default 0 NOT NULL,
  SiNoTypeDefId number default 0 NOT NULL,
  PRIMARY KEY  (AvailServBindId, SiNoTypeDefId)
);



CREATE SEQUENCE cmCont_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmCont (
  ContId number  NOT NULL,
  name varchar2(100) NOT NULL,
  publishDateTime date  NOT NULL,
  expireDateTime date  NOT NULL,
  contentTypeDefId number default NULL,
  parentContId number default NULL,
  creator varchar2(100) NOT NULL,
  repositoryId number default 0 NOT NULL,
  isBranch number default 0 NOT NULL,
  isProtected number default 2 NOT NULL,
  isDeleted number DEFAULT 0 NOT NULL,
);



CREATE SEQUENCE cmContRelation_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmContRelation (
  ContRelationId number  NOT NULL,
  relationInternalName varchar2(100) NOT NULL,
  relationTypeId number default 0 NOT NULL,
  sourceContId number default 0 NOT NULL,
  destinationContId number default 0 NOT NULL,
  PRIMARY KEY  (ContRelationId)
);



CREATE SEQUENCE cmContentTypeDef_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmContentTypeDef (
  contentTypeDefId number  NOT NULL,
  schemaValue clob NOT NULL,
  name varchar2(100) NOT NULL,
  parentContentTypeDefinitionId number DEFAULT -1,
  PRIMARY KEY  (contentTypeDefId)
);



CREATE SEQUENCE cmContVer_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmContVer (
  ContVerId number  NOT NULL,
  stateId number default 0 NOT NULL,
  VerValue clob NOT NULL,
  modifiedDateTime date  NOT NULL,
  VerComment varchar2(1024),
  isCheckedOut number default 0 NOT NULL,
  isActive number default 1 NOT NULL,
  ContId number default 0 NOT NULL,
  languageId number default 0 NOT NULL,
  versionModifier varchar2(1024) NOT NULL,
  PRIMARY KEY  (ContVerId)
);



CREATE SEQUENCE cmContVerDigAsset_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmContVerDigAsset (
  ContVerId number default 0 NOT NULL,
  DigAssetId number default 0 NOT NULL,
  PRIMARY KEY  (ContVerId, DigAssetId)
);



CREATE SEQUENCE cmDigAsset_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmDigAsset (
  DigAssetId number  NOT NULL,
  assetKey varchar2(255) NOT NULL,
  assetFileName varchar2(1024) NOT NULL,
  assetFilepath varchar2(1024) NOT NULL,
  assetFileSize number default 0 NOT NULL,
  assetContentType varchar2(255) NOT NULL,
  assetBlob blob,
  PRIMARY KEY  (DigAssetId)
);


CREATE SEQUENCE cmLanguage_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmLanguage (
  languageId number  NOT NULL,
  name varchar2(100) NOT NULL,
  languageCode varchar2(5) NOT NULL,
  charset varchar2(30) NOT NULL,
  PRIMARY KEY  (languageId)
);



CREATE SEQUENCE cmPublication_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmPublication (
  publicationId number  NOT NULL,
  name varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  publicationDateTime date  NOT NULL,
  publisher varchar2(100) NOT NULL,
  repositoryId number default 0 NOT NULL,
  PRIMARY KEY  (publicationId)
);



CREATE SEQUENCE cmQualifyer_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmQualifyer (
  qualifyerId number  NOT NULL,
  name varchar2(100) NOT NULL,
  value varchar2(100) NOT NULL,
  sortOrder number default 0 NOT NULL,
  ServBindId number default 0 NOT NULL,
  PRIMARY KEY  (qualifyerId)
);



CREATE SEQUENCE cmRepository_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmRepository (
  repositoryId number  NOT NULL,
  name varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  dnsName varchar2(255),
  PRIMARY KEY  (repositoryId)
);



CREATE SEQUENCE cmRepositoryContTypeDef_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmRepositoryContTypeDef (
  repositoryId number default 0 NOT NULL,
  contentTypeDefId number default 0 NOT NULL,
  PRIMARY KEY  (repositoryId, contentTypeDefId)
);



CREATE SEQUENCE cmRepositoryLanguage_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmRepositoryLanguage (
  repositoryLanguageId number  NOT NULL,
  repositoryId number default 0 NOT NULL,
  languageId number default 0 NOT NULL,
  isPublished number default 0 NOT NULL,
  PRIMARY KEY  (repositoryLanguageId)
);



CREATE SEQUENCE cmRole_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmRole (
  roleName varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  PRIMARY KEY  (roleName)
);



CREATE SEQUENCE cmServBind_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmServBind (
  ServBindId number  NOT NULL,
  name varchar2(100) NOT NULL,
  path varchar2(255) NOT NULL,
  BindTypeId number default 0 NOT NULL,
  ServDefId number default 0 NOT NULL,
  AvailServBindId number default 0 NOT NULL,
  SiNoVerId number default 0 NOT NULL,
  PRIMARY KEY  (ServBindId)
);



CREATE SEQUENCE cmServDef_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmServDef (
  ServDefId number  NOT NULL,
  className varchar2(100) NOT NULL,
  name varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  PRIMARY KEY  (ServDefId)
);



CREATE SEQUENCE cmServDefAvailServBind_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmServDefAvailServBind (
  ServDefId number default 0 NOT NULL,
  AvailServBindId number default 0 NOT NULL,
  PRIMARY KEY  (ServDefId, AvailServBindId)
);



CREATE SEQUENCE cmSiNo_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmSiNo (
  SiNoId number NOT NULL,
  name varchar2(100) NOT NULL,
  publishDateTime date NOT NULL,
  expireDateTime date NOT NULL,
  parentSiNoId number default NULL,
  creator varchar2(100) NOT NULL,
  repositoryId number default 0 NOT NULL,
  SiNoTypeDefId number default 0,
  isBranch number default 0 NOT NULL,
  PRIMARY KEY  (SiNoId)
);



CREATE SEQUENCE cmSiNoTypeDef_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmSiNoTypeDef (
  SiNoTypeDefId number  NOT NULL,
  invokerClassName varchar2(100) NOT NULL,
  name varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  PRIMARY KEY  (SiNoTypeDefId)
);



CREATE SEQUENCE cmSiNoVer_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmSiNoVer (


CREATE SEQUENCE cmSystemUser_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmSystemUser (
  userName varchar2(100) NOT NULL,
  password varchar2(100) NOT NULL,
  firstName varchar2(100) NOT NULL,
  lastName varchar2(100) NOT NULL,
  email varchar2(255) NOT NULL,
  PRIMARY KEY  (userName)
);



CREATE SEQUENCE cmSystemUserRole_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmSystemUserRole (
  userName varchar2(100) NOT NULL,
  roleName varchar2(100) NOT NULL,
  PRIMARY KEY  (userName, roleName)
);



CREATE SEQUENCE cmTransactionHistory_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmTransactionHistory (
  transactionHistoryId number  NOT NULL,
  name varchar2(200) NOT NULL,
  transactionDateTime date  NOT NULL,
  transactionTypeId number default 0 NOT NULL,
  transactionObjectId varchar2(200) NOT NULL,
  transactionObjectName varchar2(200) NOT NULL,
  systemUserName varchar2(200) NOT NULL,
  PRIMARY KEY  (transactionHistoryId)
);



CREATE SEQUENCE cmPublicationDetail_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmPublicationDetail (
  publicationDetailId number  NOT NULL,
  publicationId number default 0 NOT NULL,
  name varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  entityClass varchar2(255) NOT NULL,
  entityId number default 0 NOT NULL,
  creationDateTime date NOT NULL,
  typeId number default 0 NOT NULL,
  publisher varchar2(100) NOT NULL,
  PRIMARY KEY  (publicationDetailId)
);



CREATE SEQUENCE cmEvent_seq START WITH 100 INCREMENT BY 10;

CREATE TABLE cmEvent (
  eventId number  NOT NULL,
  repositoryId number default 0 NOT NULL,
  name varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  entityClass varchar2(255) NOT NULL,
  entityId number default 0 NOT NULL,
  creationDateTime date NOT NULL,
  typeId number default 0 NOT NULL,
  creator varchar2(100) NOT NULL,
  PRIMARY KEY  (eventId)
);



COMMIT;