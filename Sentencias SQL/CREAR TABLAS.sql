create table AGE_RANGE
(
  pk_ar_id        NUMBER(6) not null,
  search_counter  NUMBER(6),
  ar_from         NUMBER(6) default 0,
  ar_to           NUMBER(6) default 0,
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
alter table AGE_RANGE
  add constraint PK_AGE_RANGE_ID primary key (PK_AR_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
  );
create table BODY_TYPE
(
  body_type_id    NUMBER(6) not null,
  body_type_name  VARCHAR2(20),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BODY_TYPE
  add constraint PK_BODY_TYPE_ID primary key (BODY_TYPE_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table BODY_TYPE_X_PERSON
(
  fk_body_type_id NUMBER(6) not null,
  fk_person_id    NUMBER(6) not null,
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BODY_TYPE_X_PERSON
  add constraint PK_BODY_TYPE_ID_X_PERSON_ID primary key (FK_BODY_TYPE_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table BODY_TYPE_X_PERSON
  add constraint FK_BODY_TYPE_ID foreign key (FK_BODY_TYPE_ID)
  references BODY_TYPE (BODY_TYPE_ID);
alter table BODY_TYPE_X_PERSON
  add constraint FK_PERSON_ID_IN_BODY_TYPE foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table BTAB
(
  idimagen        NUMBER(6) not null,
  blobdata        BLOB,
  fk_person_id    NUMBER(6),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10),
  imgpos          NUMBER(6)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BTAB
  add constraint PK_IDIMAGEN primary key (IDIMAGEN)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table BTAB
  add constraint FK_PERSON_ID_IN_IMG foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table CITY
(
  city_id         NUMBER(6) not null,
  city_name       VARCHAR2(20),
  fk_country_id   NUMBER(6),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CITY
  add constraint PK_CITY_ID primary key (CITY_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table CITY
  add constraint FK_COUNTRY_ID_IN_CITY foreign key (FK_COUNTRY_ID)
  references COUNTRY (COUNTRY_ID);
create table COUNTRY
(
  country_id      NUMBER(6) not null,
  country_name    VARCHAR2(20),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table COUNTRY
  add constraint PK_COUNTRY_ID primary key (COUNTRY_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table DRINKER
(
  drinker_id      NUMBER(6) not null,
  drinker_type    VARCHAR2(20),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRINKER
  add constraint PK_DRINKER primary key (DRINKER_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table DRINKER_X_PERSON
(
  fk_drinker_id   NUMBER(6) not null,
  fk_person_id    NUMBER(6) not null,
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRINKER_X_PERSON
  add constraint PK_DRINKER_X_PERSON_ID primary key (FK_DRINKER_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table DRINKER_X_PERSON
  add constraint FK_DRINKER foreign key (FK_DRINKER_ID)
  references DRINKER (DRINKER_ID);
alter table DRINKER_X_PERSON
  add constraint FK_PERSON_IN_DRINKER foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table EDUCATION_LEVEL
(
  education_level_id   NUMBER(6) not null,
  education_level_name VARCHAR2(20),
  fec_creacion         DATE,
  creado_por           VARCHAR2(10),
  fec_ultima_mod       DATE,
  user_ultima_mod      VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EDUCATION_LEVEL
  add constraint PK_EDUCATION_LEVEL_ID primary key (EDUCATION_LEVEL_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table EDUCATION_LEVEL_X_PERSON
(
  fk_education_level_id NUMBER(6) not null,
  fk_person_id          NUMBER(6) not null,
  fec_creacion          DATE,
  creado_por            VARCHAR2(10),
  fec_ultima_mod        DATE,
  user_ultima_mod       VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EDUCATION_LEVEL_X_PERSON
  add constraint PK_EDU_LEVEL_ID_X_PERSON_ID primary key (FK_EDUCATION_LEVEL_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table EDUCATION_LEVEL_X_PERSON
  add constraint FK_EDUCATION_LEVEL_ID foreign key (FK_EDUCATION_LEVEL_ID)
  references EDUCATION_LEVEL (EDUCATION_LEVEL_ID);
alter table EDUCATION_LEVEL_X_PERSON
  add constraint FK_PERSON_ID_IN_EDU_LEVEL foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table E_MAIL
(
  e_mail_address  VARCHAR2(100) not null,
  fk_person_id    NUMBER(6),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table E_MAIL
  add constraint PK_E_MAIL_ADDRESS primary key (E_MAIL_ADDRESS)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table E_MAIL
  add constraint FK_PERSON_ID_IN_EMAIL foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table EVENT
(
  event_id          NUMBER(6) not null,
  event_name        VARCHAR2(20),
  event_description VARCHAR2(100),
  fec_creacion      DATE,
  creado_por        VARCHAR2(10),
  fec_ultima_mod    DATE,
  user_ultima_mod   VARCHAR2(10),
  fk_city_id        NUMBER(6),
  event_hour        NUMBER(24),
  event_date        VARCHAR2(100)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EVENT
  add constraint PK_EVENT_ID primary key (EVENT_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table EVENT
  add constraint FK_CITY_ID_IN_EVENT foreign key (FK_CITY_ID)
  references CITY (CITY_ID);
create table EXERCISE
(
  exercise_id     NUMBER(6) not null,
  exercise_name   VARCHAR2(20),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EXERCISE
  add constraint PK_EXERCISE_ID primary key (EXERCISE_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table EXERCISE_FRECUENCY
(
  exercise_frecuency_id   NUMBER(6) not null,
  exercise_frecuency_name VARCHAR2(20),
  fec_creacion            DATE,
  creado_por              VARCHAR2(10),
  fec_ultima_mod          DATE,
  user_ultima_mod         VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EXERCISE_FRECUENCY
  add constraint PK_EXERCISE_FRECUENCY_ID primary key (EXERCISE_FRECUENCY_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table EXERCISE_FRECUENCY_X_PERSON
(
  fk_exercise_fre_id NUMBER(6) not null,
  fk_person_id       NUMBER(6) not null,
  fec_creacion       DATE,
  creado_por         VARCHAR2(10),
  fec_ultima_mod     DATE,
  user_ultima_mod    VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EXERCISE_FRECUENCY_X_PERSON
  add constraint PK_EXERCISE_FRE_ID_X_PERSON_ID primary key (FK_EXERCISE_FRE_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table EXERCISE_FRECUENCY_X_PERSON
  add constraint FK_EXERCISE_FRE_ID foreign key (FK_EXERCISE_FRE_ID)
  references EXERCISE_FRECUENCY (EXERCISE_FRECUENCY_ID);
alter table EXERCISE_FRECUENCY_X_PERSON
  add constraint FK_PERSON_ID_IN_EXER_FRE foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table EXERCISE_X_PERSON
(
  fk_exercise_id  NUMBER(6) not null,
  fk_person_id    NUMBER(6) not null,
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EXERCISE_X_PERSON
  add constraint PK_EXERCISE_ID_X_PERSON_ID primary key (FK_EXERCISE_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table EXERCISE_X_PERSON
  add constraint FK_EXERCISE_ID foreign key (FK_EXERCISE_ID)
  references EXERCISE (EXERCISE_ID);
alter table EXERCISE_X_PERSON
  add constraint FK_PERSON_ID_IN_EXCERCISE foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table EYE_COLOR
(
  eye_color_id    NUMBER(6) not null,
  eye_color_name  VARCHAR2(20),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EYE_COLOR
  add constraint PK_EYE_COLOR_ID primary key (EYE_COLOR_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table EYE_COLOR_X_PERSON
(
  fk_eye_color_id NUMBER(6) not null,
  fk_person_id    NUMBER(6) not null,
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EYE_COLOR_X_PERSON
  add constraint PK_EYE_COLOR_ID_X_PERSON_ID primary key (FK_EYE_COLOR_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table EYE_COLOR_X_PERSON
  add constraint FK_EYE_COLOR_ID foreign key (FK_EYE_COLOR_ID)
  references EYE_COLOR (EYE_COLOR_ID);
alter table EYE_COLOR_X_PERSON
  add constraint FK_PERSON_ID_IN_EYE_COLOR foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table GENRE
(
  genre_id        NUMBER(6) not null,
  genre_name      VARCHAR2(20),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
alter table GENRE
  add constraint PK_GENRE primary key (GENRE_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
  );
create table HAIR_COLOR
(
  hair_color_id   NUMBER(6) not null,
  hair_color_name VARCHAR2(20),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAIR_COLOR
  add constraint PK_HAIR_COLOR_ID primary key (HAIR_COLOR_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table HAIR_COLOR_X_PERSON
(
  fk_hair_color_id NUMBER(6) not null,
  fk_person_id     NUMBER(6) not null,
  fec_creacion     DATE,
  creado_por       VARCHAR2(10),
  fec_ultima_mod   DATE,
  user_ultima_mod  VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAIR_COLOR_X_PERSON
  add constraint PK_HAIR_COLOR_ID_X_PERSON_ID primary key (FK_HAIR_COLOR_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table HAIR_COLOR_X_PERSON
  add constraint FK_HAIR_COLOR_ID foreign key (FK_HAIR_COLOR_ID)
  references HAIR_COLOR (HAIR_COLOR_ID);
alter table HAIR_COLOR_X_PERSON
  add constraint FK_PERSON_ID_IN_HAIR_COLOR foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table HOBBIE
(
  hobbie_id       NUMBER(6) not null,
  hobbie_name     VARCHAR2(20),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HOBBIE
  add constraint PK_HOBBIE_ID primary key (HOBBIE_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table HOBBIE_X_PERSON
(
  fk_hobbie_id    NUMBER(6) not null,
  fk_person_id    NUMBER(6) not null,
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HOBBIE_X_PERSON
  add constraint PK_HOBBIE_ID_X_PERSON_ID primary key (FK_HOBBIE_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table HOBBIE_X_PERSON
  add constraint FK_HOBBIE_ID foreign key (FK_HOBBIE_ID)
  references HOBBIE (HOBBIE_ID);
alter table HOBBIE_X_PERSON
  add constraint FK_PERSON_ID_IN_HOBBIE foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table LANGUAGE
(
  language_id     NUMBER(6) not null,
  language_name   VARCHAR2(20),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LANGUAGE
  add constraint PK_LANGUAGE_ID primary key (LANGUAGE_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table LANGUAGE_X_PERSON
(
  fk_language_id  NUMBER(6) not null,
  fk_person_id    NUMBER(6) not null,
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LANGUAGE_X_PERSON
  add constraint PK_LANGUAGE_ID_X_PERSON_ID primary key (FK_LANGUAGE_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table LANGUAGE_X_PERSON
  add constraint FK_LANGUAGE_ID foreign key (FK_LANGUAGE_ID)
  references LANGUAGE (LANGUAGE_ID);
alter table LANGUAGE_X_PERSON
  add constraint FK_PERSON_ID_IN_LANGUAGE foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table LIFE_STYLE
(
  life_style_id   NUMBER(6) not null,
  wants_pets      VARCHAR2(1),
  likes_pets      VARCHAR2(1),
  has_pets        VARCHAR2(1),
  wants_children  VARCHAR2(1),
  cant_children   NUMBER(3),
  smoker          VARCHAR2(1),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LIFE_STYLE
  add constraint PK_LIFE_STYLE primary key (LIFE_STYLE_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table LIFE_STYLE_X_PERSON
(
  fk_life_style_id NUMBER(6) not null,
  fk_person_id     NUMBER(6) not null,
  fec_creacion     DATE,
  creado_por       VARCHAR2(10),
  fec_ultima_mod   DATE,
  user_ultima_mod  VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LIFE_STYLE_X_PERSON
  add constraint PK_LIFE_STYLE_ID_X_PERSON_ID primary key (FK_LIFE_STYLE_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table LIFE_STYLE_X_PERSON
  add constraint FK_LIFE_STYLE_ID foreign key (FK_LIFE_STYLE_ID)
  references LIFE_STYLE (LIFE_STYLE_ID);
alter table LIFE_STYLE_X_PERSON
  add constraint FK_PERSON_ID_IN_LIFE_STYLE foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table MARITAL_STATUS
(
  marital_status_id   NUMBER(6) not null,
  marital_status_name VARCHAR2(20),
  fec_creacion        DATE,
  creado_por          VARCHAR2(10),
  fec_ultima_mod      DATE,
  user_ultima_mod     VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MARITAL_STATUS
  add constraint PK_MARITAL_STATUS_ID primary key (MARITAL_STATUS_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table MARITAL_STATUS_X_PERSON
(
  fk_marital_status_id NUMBER(6) not null,
  fk_person_id         NUMBER(6) not null,
  fec_creacion         DATE,
  creado_por           VARCHAR2(10),
  fec_ultima_mod       DATE,
  user_ultima_mod      VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MARITAL_STATUS_X_PERSON
  add constraint PK_MAR_STATUS_ID_X_PERSON_ID primary key (FK_MARITAL_STATUS_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table MARITAL_STATUS_X_PERSON
  add constraint FK_MARITAL_STATUS_ID foreign key (FK_MARITAL_STATUS_ID)
  references MARITAL_STATUS (MARITAL_STATUS_ID);
alter table MARITAL_STATUS_X_PERSON
  add constraint FK_PERSON_ID_IN_MAR_STATUS foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table MY_USER
(
  nick_name       VARCHAR2(20) not null,
  password        VARCHAR2(20),
  fk_person_id    NUMBER(6),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MY_USER
  add constraint PK_NICK_NAME primary key (NICK_NAME)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table MY_USER
  add constraint FK_PERSON_ID foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table OCUPATION
(
  ocupation_id          NUMBER(6) not null,
  ocupation_name        VARCHAR2(20),
  ocupation_description VARCHAR2(100),
  fec_creacion          DATE,
  creado_por            VARCHAR2(10),
  fec_ultima_mod        DATE,
  user_ultima_mod       VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table OCUPATION
  add constraint PK_OCUPATION primary key (OCUPATION_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table OCUPATION_X_PERSON
(
  fk_person_id    NUMBER(6) not null,
  fk_ocupation_id NUMBER(6) not null,
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table OCUPATION_X_PERSON
  add constraint PK_OCUPATION_ID_X_PERSON_ID primary key (FK_OCUPATION_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table OCUPATION_X_PERSON
  add constraint FK_OCUPATION_ID foreign key (FK_OCUPATION_ID)
  references OCUPATION (OCUPATION_ID);
alter table OCUPATION_X_PERSON
  add constraint FK_PERSON_ID_IN_OCUPATION foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table PARAMETER
(
  parameter_id          NUMBER(6) not null,
  parameter_name        VARCHAR2(20),
  parameter_value       NUMBER(6),
  parameter_description VARCHAR2(100),
  fec_creacion          DATE,
  creado_por            VARCHAR2(10),
  fec_ultima_mod        DATE,
  user_ultima_mod       VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PARAMETER
  add constraint PK_PARAMETER primary key (PARAMETER_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table PARTNER_TYPE
(
  partner_type_id   NUMBER(6) not null,
  partner_type_name VARCHAR2(20),
  fec_creacion      DATE,
  creado_por        VARCHAR2(10),
  fec_ultima_mod    DATE,
  user_ultima_mod   VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PARTNER_TYPE
  add constraint PK_PARTNER_TYPE_ID primary key (PARTNER_TYPE_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table PARTNER_TYPE_X_PERSON
(
  fk_partner_type_id NUMBER(6) not null,
  fk_person_id       NUMBER(6) not null,
  fec_creacion       DATE,
  creado_por         VARCHAR2(10),
  fec_ultima_mod     DATE,
  user_ultima_mod    VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PARTNER_TYPE_X_PERSON
  add constraint PK_PARTNER_TYPE_ID_X_PERSON_ID primary key (FK_PARTNER_TYPE_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table PARTNER_TYPE_X_PERSON
  add constraint FK_PARTNER_TYPE_ID foreign key (FK_PARTNER_TYPE_ID)
  references PARTNER_TYPE (PARTNER_TYPE_ID);
alter table PARTNER_TYPE_X_PERSON
  add constraint FK_PERSON_ID_IN_PARTNER_TYPE foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table PERSON
(
  person_id       NUMBER(6) not null,
  person_name     VARCHAR2(20),
  person_lastname VARCHAR2(20),
  person_bday     DATE,
  person_photo    VARCHAR2(20),
  person_phrase   VARCHAR2(100),
  person_weight   NUMBER(6),
  person_height   NUMBER(6),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10),
  fk_city_id      NUMBER(6),
  person_genre    VARCHAR2(1),
  married         VARCHAR2(1)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PERSON
  add constraint PK_PERSON primary key (PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table PERSON
  add constraint FK_CITY_ID_IN_PERSON foreign key (FK_CITY_ID)
  references CITY (CITY_ID);
create table PERSON_X_EVENT
(
  event_date      DATE,
  event_place     VARCHAR2(20),
  fk_person_id    NUMBER(6) not null,
  fk_event_id     NUMBER(6) not null,
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
alter table PERSON_X_EVENT
  add constraint PK_PERSON_ID_X_EVENT_ID primary key (FK_PERSON_ID, FK_EVENT_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
  );
alter table PERSON_X_EVENT
  add constraint FK_EVENT_ID foreign key (FK_EVENT_ID)
  references EVENT (EVENT_ID);
alter table PERSON_X_EVENT
  add constraint FK_PERSON_ID_IN_EVENT foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table RELIGION
(
  religion_id     NUMBER(6) not null,
  religion_name   VARCHAR2(20),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table RELIGION
  add constraint PK_RELIGION_ID primary key (RELIGION_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table RELIGION_X_PERSON
(
  fk_religion_id  NUMBER(6) not null,
  fk_person_id    NUMBER(6) not null,
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table RELIGION_X_PERSON
  add constraint PK_RELIGION_ID_X_PERSON_ID primary key (FK_RELIGION_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table RELIGION_X_PERSON
  add constraint FK_PERSON_ID_IN_RELIGION foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
alter table RELIGION_X_PERSON
  add constraint FK_RELIGION_ID foreign key (FK_RELIGION_ID)
  references RELIGION (RELIGION_ID);
create table SALARY_RANGE
(
  salary_range_id NUMBER(6) not null,
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10),
  sal_from        NUMBER(12),
  sal_to          NUMBER(12)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SALARY_RANGE
  add constraint PK_SALARY_RANGE_ID primary key (SALARY_RANGE_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table SALARY_RANGE_X_PERSON
(
  fk_salary_range_id NUMBER(6) not null,
  fk_person_id       NUMBER(6) not null,
  fec_creacion       DATE,
  creado_por         VARCHAR2(10),
  fec_ultima_mod     DATE,
  user_ultima_mod    VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SALARY_RANGE_X_PERSON
  add constraint PK_SALARY_RANGE_ID_X_PERSON_ID primary key (FK_SALARY_RANGE_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table SALARY_RANGE_X_PERSON
  add constraint FK_PERSON_ID_IN_SAL_RANGE foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
alter table SALARY_RANGE_X_PERSON
  add constraint FK_SALARY_RANGE_ID foreign key (FK_SALARY_RANGE_ID)
  references SALARY_RANGE (SALARY_RANGE_ID);
create table SKIN_COLOR
(
  skin_color_id   NUMBER(6) not null,
  skin_color_name VARCHAR2(20),
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SKIN_COLOR
  add constraint PK_SKIN_COLOR_ID primary key (SKIN_COLOR_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
create table SKIN_COLOR_X_PERSON
(
  fk_skin_color_id NUMBER(6) not null,
  fk_person_id     NUMBER(6) not null,
  fec_creacion     DATE,
  creado_por       VARCHAR2(10),
  fec_ultima_mod   DATE,
  user_ultima_mod  VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SKIN_COLOR_X_PERSON
  add constraint PK_SKIN_COLOR_ID_X_PERSON_ID primary key (FK_SKIN_COLOR_ID, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table SKIN_COLOR_X_PERSON
  add constraint FK_PERSON_ID_IN_SKIN_COLOR foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
alter table SKIN_COLOR_X_PERSON
  add constraint FK_SKIN_COLOR_ID foreign key (FK_SKIN_COLOR_ID)
  references SKIN_COLOR (SKIN_COLOR_ID);
create table USER_ROL
(
  user_rol_id       NUMBER(6) not null,
  description       VARCHAR2(100),
  fk_user_nick_name VARCHAR2(20),
  fec_creacion      DATE,
  creado_por        VARCHAR2(10),
  fec_ultima_mod    DATE,
  user_ultima_mod   VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USER_ROL
  add constraint PK_USER_ROL_ID primary key (USER_ROL_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table USER_ROL
  add constraint FK_MY_USER_NICK_NAME foreign key (FK_USER_NICK_NAME)
  references MY_USER (NICK_NAME);
create table USER_X_PERSON
(
  fk_nick_name    VARCHAR2(20) not null,
  fk_person_id    NUMBER(6) not null,
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
alter table USER_X_PERSON
  add constraint PK_NICK_NAME_X_PERSON_ID primary key (FK_NICK_NAME, FK_PERSON_ID)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
  );
alter table USER_X_PERSON
  add constraint FK_NICK_NAME foreign key (FK_NICK_NAME)
  references MY_USER (NICK_NAME);
alter table USER_X_PERSON
  add constraint FK_PERSON_X_USER_ID foreign key (FK_PERSON_ID)
  references PERSON (PERSON_ID);
create table VISIT
(
  fk_host         NUMBER(6) not null,
  fk_visitor      NUMBER(6) not null,
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10),
  counter         NUMBER(6)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VISIT
  add constraint PK_VISITOR_X_HOST primary key (FK_HOST, FK_VISITOR)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table VISIT
  add constraint FK_HOST foreign key (FK_HOST)
  references PERSON (PERSON_ID);
alter table VISIT
  add constraint FK_VISITOR foreign key (FK_VISITOR)
  references PERSON (PERSON_ID);
create table WINK
(
  fk_wink_by      NUMBER(6) not null,
  fk_wink_for     NUMBER(6) not null,
  fec_creacion    DATE,
  creado_por      VARCHAR2(10),
  fec_ultima_mod  DATE,
  user_ultima_mod VARCHAR2(10)
)
tablespace LE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WINK
  add constraint PK_WINK_BY_X_WINK_FOR primary key (FK_WINK_BY, FK_WINK_FOR)
  using index 
  tablespace LE_IND
  pctfree 20
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents unlimited
  );
alter table WINK
  add constraint FK_WINK_BY foreign key (FK_WINK_BY)
  references PERSON (PERSON_ID);
alter table WINK
  add constraint FK_WINK_FOR foreign key (FK_WINK_FOR)
  references PERSON (PERSON_ID);
