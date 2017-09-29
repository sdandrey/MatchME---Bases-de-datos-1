CREATE OR REPLACE PROCEDURE anadirVisit(new_fk_host_id IN NUMBER, new_fk_visitor_Id IN NUMBER)
AS
cantidad NUMBER(6);
BEGIN
  SELECT COUNTER INTO cantidad FROM VISIT WHERE FK_HOST=new_fk_host_id AND FK_VISITOR=new_fk_visitor_Id;
  UPDATE VISIT
         SET COUNTER=cantidad+1
         WHERE FK_HOST=new_fk_host_id AND FK_VISITOR=new_fk_visitor_Id;
  COMMIT;
END;
CREATE OR REPLACE PROCEDURE CountExercises (p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
    SELECT exercise_id,exercise_name,  (select count(*) from Exercise_X_Person
     where fk_exercise_id = exercise_id) from Exercise;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END CountExercises;
CREATE OR REPLACE PROCEDURE CountHobbie (p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
    SELECT hobbie_id,hobbie_name,  (select count(*) from Hobbie_X_Person
     where fk_hobbie_id = hobbie_id) from Hobbie;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END CountHobbie;
CREATE OR REPLACE PROCEDURE CountMariStatus (p_recordset OUT SYS_REFCURSOR) AS

BEGIN
	OPEN p_recordset FOR
		SELECT marital_status_name,  (select count(*) from marital_status_x_person
		 where fk_marital_status_id = marital_status_id) from marital_status;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END CountMariStatus;
CREATE OR REPLACE PROCEDURE CountPersonasinCity(nombrePais IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
		SELECT city_name, (select count(*) from Person
 where city_id = fk_city_id)from city where fk_country_id=nombrePais ;



EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END CountPersonasinCity;
CREATE OR REPLACE PROCEDURE 
del_body_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Body_type_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_body_x_person;
CREATE OR REPLACE PROCEDURE 
del_drinker_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Drinker_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_drinker_x_person;
CREATE OR REPLACE PROCEDURE 
del_educationlv_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Education_level_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_educationlv_x_person;
CREATE OR REPLACE PROCEDURE 
delete_body_type(Var_body_type_id IN NUMBER) AS

BEGIN

	DELETE FROM Body_type_X_Person
	Where fk_body_type_id = Var_body_type_id;
	DELETE FROM Body_type
	Where body_type_id = Var_body_type_id;
	commit;

END delete_body_type;
CREATE OR REPLACE PROCEDURE 
delete_drinker(Var_Drinker_id IN NUMBER) AS

BEGIN

	DELETE FROM Drinker_X_Person
	Where fk_drinker_id = Var_Drinker_id;
	DELETE FROM Drinker
	Where drinker_id = Var_Drinker_id;
	commit;

END delete_drinker;
CREATE OR REPLACE PROCEDURE 
delete_education_level(Var_EduLevel_id IN NUMBER) AS

BEGIN

	DELETE FROM Education_level_X_Person
	Where fk_education_level_id = Var_EduLevel_id;
	DELETE FROM Education_level
	Where education_level_id = Var_EduLevel_id;
	commit;

END delete_education_level;
CREATE OR REPLACE PROCEDURE 
delete_exercise(Var_Exercise_id IN NUMBER) AS

BEGIN

	DELETE FROM Exercise_X_Person
	Where fk_exercise_id = Var_Exercise_id;
	DELETE FROM Exercise
	Where exercise_id = Var_Exercise_id;
	commit;

END delete_exercise;
CREATE OR REPLACE PROCEDURE 
delete_exercise_frec(Var_Exer_fre_id IN NUMBER) AS

BEGIN

	DELETE FROM Exercise_frecuency_X_Person
	Where fk_exercise_fre_id = Var_Exer_fre_id;
	DELETE FROM Exercise_frecuency
	Where exercise_frecuency_id = Var_Exer_fre_id;
	commit;

END delete_exercise_frec;
CREATE OR REPLACE PROCEDURE 
delete_eyecolor(Var_EyeColor_id IN NUMBER) AS

BEGIN

	DELETE FROM Eye_color_X_Person
	Where fk_eye_color_id = Var_EyeColor_id;
	DELETE FROM Eye_color
	Where eye_color_id = Var_EyeColor_id;
	commit;

END delete_eyecolor;
CREATE OR REPLACE PROCEDURE 
delete_haircolor(Var_HairColor_id IN NUMBER) AS

BEGIN

	DELETE FROM Hair_color_X_Person
	Where fk_hair_color_id = Var_HairColor_id;
	DELETE FROM Hair_color
	Where hair_color_id = Var_HairColor_id;
	commit;

END delete_haircolor;
CREATE OR REPLACE PROCEDURE 
delete_hobbie(Var_Hobbie_id IN NUMBER) AS

BEGIN

	DELETE FROM Hobbie_X_Person
	Where fk_hobbie_id = Var_Hobbie_id;
	DELETE FROM Hobbie
	Where hobbie_id = Var_Hobbie_id;
	commit;

END delete_hobbie;
CREATE OR REPLACE PROCEDURE 
delete_language(Var_Language_id IN NUMBER) AS

BEGIN

	DELETE FROM Language_X_Person
	Where fk_language_id = Var_Language_id;
	DELETE FROM Language
	Where language_id = Var_Language_id;
	commit;

END delete_language;
CREATE OR REPLACE PROCEDURE 
delete_lifeStyle(Var_LifeStyle_id IN NUMBER) AS

BEGIN

	DELETE FROM Life_style_X_Person
	Where Fk_Life_Style_Id = Var_LifeStyle_id;
	DELETE FROM Life_style
	Where Life_Style_Id = Var_LifeStyle_id;
	commit;

END delete_lifeStyle;
CREATE OR REPLACE PROCEDURE 
delete_maritalstatus(Var_MariStatus_id IN NUMBER) AS

BEGIN

	DELETE FROM Marital_status_X_Person
	Where fk_marital_status_id = Var_MariStatus_id;
	DELETE FROM Marital_status
	Where marital_status_id = Var_MariStatus_id;
	commit;

END delete_maritalstatus;
CREATE OR REPLACE PROCEDURE 
Delete_Ocupation_elm(Var_Ocupation_id IN NUMBER) AS

BEGIN

	DELETE FROM Ocupation_X_Person
	Where fk_ocupation_id = Var_Ocupation_id;
	DELETE FROM Ocupation
	Where ocupation_id = Var_Ocupation_id;
	commit;

END Delete_Ocupation_elm;
CREATE OR REPLACE PROCEDURE 
delete_partnertype(Var_Partner_id IN NUMBER) AS

BEGIN

	DELETE FROM Partner_Type_X_Person
	Where fk_partner_Type_id = Var_Partner_id;
	DELETE FROM Partner_Type
	Where partner_Type_id = Var_Partner_id;
	commit;

END delete_partnertype;
CREATE OR REPLACE PROCEDURE 
delete_religion(Var_Religion_id IN NUMBER) AS

BEGIN

	DELETE FROM Religion_X_Person
	Where fk_religion_id = Var_Religion_id;
	DELETE FROM Religion
	Where religion_id = Var_Religion_id;
	commit;

END delete_religion;
CREATE OR REPLACE PROCEDURE 
delete_salary(Var_Salary_id IN NUMBER) AS

BEGIN

	DELETE FROM Salary_range_X_Person
	Where fk_salary_range_id = Var_Salary_id;
	DELETE FROM Salary_range
	Where salary_range_id = Var_Salary_id;
	commit;

END delete_salary;
CREATE OR REPLACE PROCEDURE 
delete_skincolor(Var_SkinColor_id IN NUMBER) AS

BEGIN

	DELETE FROM Skin_color_X_Person
	Where fk_skin_color_id = Var_SkinColor_id;
	DELETE FROM Skin_color
	Where skin_color_id = Var_SkinColor_id;
	commit;

END delete_skincolor;
CREATE OR REPLACE PROCEDURE 
del_event_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Person_X_Event
	Where fk_person_id = personna_id;
	commit;

END del_event_x_person;
CREATE OR REPLACE PROCEDURE 
del_exercise_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Exercise_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_exercise_x_person;
CREATE OR REPLACE PROCEDURE 
del_Exer_fre_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Exercise_frecuency_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_Exer_fre_x_person;
CREATE OR REPLACE PROCEDURE 
del_eye_col_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Eye_color_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_eye_col_x_person;
CREATE OR REPLACE PROCEDURE 
del_hair_col_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Hair_color_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_hair_col_x_person;
CREATE OR REPLACE PROCEDURE 
del_hobbie_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Hobbie_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_hobbie_x_person;
CREATE OR REPLACE PROCEDURE delImagen(newImgPos IN NUMBER,personID IN NUMBER) AS
BEGIN
  DELETE BTAB
  WHERE IMGPOS=newImgPos AND personID=FK_PERSON_ID;
  COMMIT;
END delImagen;
CREATE OR REPLACE PROCEDURE 
del_language_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Language_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_language_x_person;
CREATE OR REPLACE PROCEDURE 
del_life_style_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Life_style_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_life_style_x_person;
CREATE OR REPLACE PROCEDURE 
del_marital_status_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Marital_status_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_marital_status_x_person;
CREATE OR REPLACE PROCEDURE 
del_ocupation_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Ocupation_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_ocupation_x_person;
CREATE OR REPLACE PROCEDURE 
del_partner_type_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Partner_Type_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_partner_type_x_person;
CREATE OR REPLACE PROCEDURE 
del_religion_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Religion_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_religion_x_person;
CREATE OR REPLACE PROCEDURE 
del_salary_range_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Salary_range_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_salary_range_x_person;
CREATE OR REPLACE PROCEDURE 
del_skin_color_x_person(personna_id IN NUMBER) AS

BEGIN

	DELETE FROM Skin_color_X_Person
	Where fk_person_id = personna_id;
	commit;

END del_skin_color_x_person;
CREATE OR REPLACE PROCEDURE delWink(newidFor IN NUMBER, newidBy IN NUMBER)AS
BEGIN
  DELETE WINK where FK_WINK_BY=newidBy AND fk_wink_for=newidFor;
  COMMIT;
END delWink;
CREATE OR REPLACE PROCEDURE get_all_Country(p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
    SELECT country_id,
    	   country_name
    FROM Country;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END get_all_Country;
CREATE OR REPLACE PROCEDURE GET_BODY_TYPE(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR

 SELECT BODY_TYPE_ID,BODY_TYPE_NAME,FK_PERSON_ID FROM (BODY_TYPE_X_PERSON A INNER JOIN
  BODY_TYPE ON BODY_TYPE_ID=FK_BODY_TYPE_ID) WHERE FK_PERSON_ID=persona_id;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_BODY_TYPE;
CREATE OR REPLACE PROCEDURE 
get_Body_type_Categories(bt_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN bt_recordset FOR
    SELECT body_type_id,
           body_type_name
    FROM Body_type;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Body_type_Categories;
CREATE OR REPLACE PROCEDURE GET_BODYTYPE_PERSONAS(p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
 SELECT BODY_TYPE_ID,BODY_TYPE_NAME,FK_PERSON_ID FROM (BODY_TYPE_X_PERSON A INNER JOIN
  BODY_TYPE ON BODY_TYPE_ID=FK_BODY_TYPE_ID);

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_BODYTYPE_PERSONAS;
CREATE OR REPLACE PROCEDURE GetCard(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR


   SELECT person_id,person_name,
        person_lastname,
        person_phrase,country_name, city_name
FROM (person full outer JOIN (SELECT city_id,country_name, city_name
 FROM (Country INNER JOIN City ON fk_country_id = country_id)) ON city_id=fk_city_id) where person_id=persona_id;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GetCard;
CREATE OR REPLACE PROCEDURE get_Cities_in_Country(country_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
    SELECT city_name
    FROM City
    WHERE fk_country_id = country_id ;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END get_Cities_in_Country;
CREATE OR REPLACE PROCEDURE getCountries (p_recordset OUT SYS_REFCURSOR) AS

BEGIN
	OPEN p_recordset FOR
		SELECT country_id, country_name
		from Country;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END getCountries;
CREATE OR REPLACE PROCEDURE 
get_Drinker_Categories(dr_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN dr_recordset FOR
    SELECT drinker_id,
           drinker_type
    FROM Drinker;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Drinker_Categories;
CREATE OR REPLACE PROCEDURE GET_DRINKERS_PERSONAS(p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
 SELECT DRINKER_ID,DRINKER_TYPE,FK_PERSON_ID FROM (DRINKER A INNER JOIN
  DRINKER_X_PERSON ON DRINKER_ID=FK_DRINKER_ID);
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_DRINKERS_PERSONAS;
CREATE OR REPLACE PROCEDURE GET_DRINKER_X_PERSON(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR

  SELECT DRINKER_ID,DRINKER_TYPE,FK_PERSON_ID FROM (DRINKER A INNER JOIN
  DRINKER_X_PERSON ON DRINKER_ID=FK_DRINKER_ID) WHERE FK_PERSON_ID=persona_id;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_DRINKER_X_PERSON;
CREATE OR REPLACE PROCEDURE 
get_Education_level_Cat(dl_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN dl_recordset FOR
    SELECT education_level_id,
           education_level_name
    FROM Education_level;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Education_level_Cat;
CREATE OR REPLACE PROCEDURE GET_EDUCATION_PERSONAS(p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
  SELECT EDUCATION_LEVEL_ID,EDUCATION_LEVEL_NAME,FK_PERSON_ID FROM (EDUCATION_LEVEL A INNER JOIN
  EDUCATION_LEVEL_X_PERSON ON EDUCATION_LEVEL_ID=FK_EDUCATION_LEVEL_ID);
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_EDUCATION_PERSONAS;
CREATE OR REPLACE PROCEDURE GET_EDUCATION_X_PERSON(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR

   SELECT EDUCATION_LEVEL_ID,EDUCATION_LEVEL_NAME,FK_PERSON_ID FROM (EDUCATION_LEVEL A INNER JOIN
  EDUCATION_LEVEL_X_PERSON ON EDUCATION_LEVEL_ID=FK_EDUCATION_LEVEL_ID) WHERE FK_PERSON_ID=persona_id;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_EDUCATION_X_PERSON;
CREATE OR REPLACE PROCEDURE GET_EJERCICIOS_DE_PERSONA(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
      SELECT EXERCISE_ID,EXERCISE_NAME,FK_PERSON_ID FROM (EXERCISE_X_PERSON A INNER JOIN
  EXERCISE ON EXERCISE_ID=FK_EXERCISE_ID) WHERE FK_PERSON_ID=persona_id;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_EJERCICIOS_DE_PERSONA;
CREATE OR REPLACE PROCEDURE GET_EJERCICIOS_DE_PERSONAS(p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
  SELECT EXERCISE_ID,EXERCISE_NAME,FK_PERSON_ID FROM (EXERCISE_X_PERSON A INNER JOIN
  EXERCISE ON EXERCISE_ID=FK_EXERCISE_ID) ;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_EJERCICIOS_DE_PERSONAS;
CREATE OR REPLACE PROCEDURE GET_EJERCICIOS_FREC_DE_PERSONA(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
  SELECT FK_EXERCISE_FRE_ID,EXERCISE_FRECUENCY_NAME,FK_PERSON_ID FROM (EXERCISE_FRECUENCY_X_PERSON A INNER JOIN
  EXERCISE_FRECUENCY ON EXERCISE_FRECUENCY_ID=FK_EXERCISE_FRE_ID) WHERE FK_PERSON_ID=persona_id;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_EJERCICIOS_FREC_DE_PERSONA;
CREATE OR REPLACE PROCEDURE getEmailXPerson(id_persona IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
    SELECT e_Mail_Address from E_mail where Fk_Person_Id=id_persona;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END getEmailXPerson;
CREATE OR REPLACE PROCEDURE 
get_Exercise_Cat(ex_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN ex_recordset FOR
    SELECT exercise_id,
           exercise_name
    FROM Exercise;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Exercise_Cat;
CREATE OR REPLACE PROCEDURE 
get_Exercise_frecuency_Cat(ef_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN ef_recordset FOR
    SELECT exercise_frecuency_id,
           exercise_frecuency_name
    FROM Exercise_frecuency;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Exercise_frecuency_Cat;
CREATE OR REPLACE PROCEDURE 
get_Eye_color_Cat(ec_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN ec_recordset FOR
    SELECT eye_color_id,
           eye_color_name
    FROM Eye_color;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Eye_color_Cat;
CREATE OR REPLACE PROCEDURE GET_EYECOLOR_PERSONAS(p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
  SELECT EYE_COLOR_ID,EYE_COLOR_NAME,FK_EYE_COLOR_ID FROM (EYE_COLOR A INNER JOIN
  EYE_COLOR_X_PERSON ON EYE_COLOR_ID=FK_EYE_COLOR_ID);
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_EYECOLOR_PERSONAS;
CREATE OR REPLACE PROCEDURE GET_EYECOLOR_X_PERSON(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR

    SELECT EYE_COLOR_ID,EYE_COLOR_NAME,FK_EYE_COLOR_ID FROM (EYE_COLOR A INNER JOIN
  EYE_COLOR_X_PERSON ON EYE_COLOR_ID=FK_EYE_COLOR_ID) WHERE FK_PERSON_ID=persona_id;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_EYECOLOR_X_PERSON;
CREATE OR REPLACE PROCEDURE 
get_Hair_color_Cat(hc_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN hc_recordset FOR
    SELECT hair_color_id,
           hair_color_name
    FROM Hair_color;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Hair_color_Cat;
CREATE OR REPLACE PROCEDURE GET_HAIRCOLOR_PERSONAS(p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
 SELECT HAIR_COLOR_ID,HAIR_COLOR_NAME,FK_PERSON_ID FROM (HAIR_COLOR A INNER JOIN
  HAIR_COLOR_X_PERSON ON HAIR_COLOR_ID=FK_HAIR_COLOR_ID) ;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_HAIRCOLOR_PERSONAS;
CREATE OR REPLACE PROCEDURE GET_HAIRCOLOR_X_PERSON(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR

    SELECT HAIR_COLOR_ID,HAIR_COLOR_NAME,FK_PERSON_ID FROM (HAIR_COLOR A INNER JOIN
  HAIR_COLOR_X_PERSON ON HAIR_COLOR_ID=FK_HAIR_COLOR_ID) WHERE FK_PERSON_ID=persona_id;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_HAIRCOLOR_X_PERSON;
CREATE OR REPLACE PROCEDURE 
get_Hobbie_Cat(hc_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN hc_recordset FOR
    SELECT hobbie_id,
           hobbie_name
    FROM Hobbie;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Hobbie_Cat;
CREATE OR REPLACE PROCEDURE GET_HOBBIES_X_PERSON(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR

   SELECT HOBBIE_ID,HOBBIE_NAME,FK_PERSON_ID FROM (HOBBIE A INNER JOIN
  HOBBIE_X_PERSON ON HOBBIE_ID=FK_HOBBIE_ID) WHERE FK_PERSON_ID=persona_id;
 EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_HOBBIES_X_PERSON;
CREATE OR REPLACE PROCEDURE getIDsPersonas(id_ciudad IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
    SELECT Person_Id from Person where Fk_City_Id=id_ciudad;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END getIDsPersonas;
CREATE OR REPLACE PROCEDURE get_info_pers_dos(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS
BEGIN
 OPEN p_recordset FOR
      SELECT CITY_NAME,COUNTRY_NAME FROM ((SELECT CITY_NAME FROM (PERSON A INNER join
      CITY ON FK_CITY_ID=CITY_ID) WHERE PERSON_ID=persona_id) FULL OUTER join
      (SELECT COUNTRY_NAME FROM (COUNTRY INNER join
      (  SELECT FK_COUNTRY_ID FROM (PERSON A INNER join
      CITY ON FK_CITY_ID=CITY_ID) WHERE PERSON_ID=persona_id) ON FK_COUNTRY_ID=COUNTRY_ID)) ON 2=2);
 EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END get_info_pers_dos;
CREATE OR REPLACE PROCEDURE get_info_pers_tres(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS
BEGIN
 OPEN p_recordset FOR
      SELECT EYE_COLOR_NAME,EDUCATION_LEVEL_NAME,HAIR_COLOR_NAME,SKIN_COLOR_NAME,BODY_TYPE_NAME FROM ((SELECT EYE_COLOR_NAME,EDUCATION_LEVEL_NAME,HAIR_COLOR_NAME FROM ((SELECT EYE_COLOR_NAME ,EDUCATION_LEVEL_NAME,FK_PERSON_ID FROM ((SELECT EDUCATION_LEVEL_ID,EDUCATION_LEVEL_NAME,FK_EDUCATION_LEVEL_ID,FK_PERSON_ID FROM (EDUCATION_LEVEL A full outer join
      EDUCATION_LEVEL_X_PERSON ON EDUCATION_LEVEL_ID=FK_EDUCATION_LEVEL_ID) WHERE FK_PERSON_ID=4) full outer join
      (SELECT EYE_COLOR_ID,EYE_COLOR_NAME,FK_EYE_COLOR_ID FROM (EYE_COLOR A full outer join
      EYE_COLOR_X_PERSON ON EYE_COLOR_ID=FK_EYE_COLOR_ID) WHERE FK_PERSON_ID=4) ON EDUCATION_LEVEL_ID=FK_EDUCATION_LEVEL_ID) WHERE FK_PERSON_ID=4) full outer join
      (SELECT HAIR_COLOR_NAME,HOBBIE_NAME FROM ( (
      SELECT HAIR_COLOR_ID,HAIR_COLOR_NAME,FK_HAIR_COLOR_ID,FK_PERSON_ID FROM (HAIR_COLOR A full outer join
      HAIR_COLOR_X_PERSON ON HAIR_COLOR_ID=FK_HAIR_COLOR_ID) WHERE FK_PERSON_ID=4) full outer join
      (SELECT HOBBIE_ID,HOBBIE_NAME,FK_HOBBIE_ID FROM (HOBBIE A full outer join
      HOBBIE_X_PERSON ON HOBBIE_ID=FK_HOBBIE_ID) WHERE FK_PERSON_ID=4) ON HAIR_COLOR_ID=FK_HAIR_COLOR_ID) WHERE FK_PERSON_ID=4) ON 2=2) WHERE FK_PERSON_ID=4) full outer join
        (    SELECT SKIN_COLOR_NAME,BODY_TYPE_NAME FROM ((SELECT SKIN_COLOR_NAME FROM (SKIN_COLOR A full outer join
        SKIN_COLOR_X_PERSON ON SKIN_COLOR_ID=FK_SKIN_COLOR_ID) where fk_person_id=4) full outer join
      (SELECT BODY_TYPE_NAME FROM (BODY_TYPE_X_PERSON A full outer join
      BODY_TYPE ON BODY_TYPE_ID=FK_BODY_TYPE_ID) WHERE FK_PERSON_ID=4) ON 2=2)) ON 2=2);
 EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END get_info_pers_tres;
CREATE OR REPLACE PROCEDURE get_info_pers_uno(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
 OPEN p_recordset FOR
      SELECT PERSON_ID,PERSON_NAME,PERSON_LASTNAME,MARRIED,PERSON_GENRE,PERSON_BDAY,PERSON_PHOTO,PERSON_PHRASE,
      PERSON_HEIGHT,PERSON_WEIGHT,WANTS_PETS,LIKES_PETS,HAS_PETS,WANTS_CHILDREN,CANT_CHILDREN,SMOKER,
      FK_LIFE_STYLE_ID,MARITAL_STATUS_NAME,SAL_FROM,SAL_TO,EXERCISE_FRECUENCY_NAME,DRINKER_TYPE,OCUPATION_NAME,RELIGION_NAME
      FROM ((  SELECT PERSON_ID,PERSON_NAME,PERSON_LASTNAME,MARRIED,PERSON_GENRE,PERSON_BDAY,PERSON_PHOTO,PERSON_PHRASE,PERSON_HEIGHT,PERSON_WEIGHT,WANTS_PETS,LIKES_PETS,HAS_PETS,WANTS_CHILDREN,CANT_CHILDREN,SMOKER,FK_LIFE_STYLE_ID,MARITAL_STATUS_NAME,SAL_FROM,SAL_TO,EXERCISE_FRECUENCY_NAME,DRINKER_TYPE,OCUPATION_NAME FROM ((    SELECT PERSON_ID,PERSON_NAME,PERSON_LASTNAME,MARRIED,PERSON_GENRE,PERSON_BDAY,PERSON_PHOTO,PERSON_PHRASE,PERSON_HEIGHT,PERSON_WEIGHT,WANTS_PETS,LIKES_PETS,HAS_PETS,WANTS_CHILDREN,CANT_CHILDREN,SMOKER,FK_LIFE_STYLE_ID,MARITAL_STATUS_NAME,SAL_FROM,SAL_TO,EXERCISE_FRECUENCY_NAME,DRINKER_TYPE FROM ((SELECT PERSON_ID,PERSON_NAME,PERSON_LASTNAME,MARRIED,PERSON_GENRE,PERSON_BDAY,PERSON_PHOTO,PERSON_PHRASE,PERSON_HEIGHT,PERSON_WEIGHT,WANTS_PETS,LIKES_PETS,HAS_PETS,WANTS_CHILDREN,CANT_CHILDREN,SMOKER,FK_LIFE_STYLE_ID,MARITAL_STATUS_NAME,SAL_FROM,SAL_TO,EXERCISE_FRECUENCY_NAME FROM ((SELECT PERSON_ID,PERSON_NAME,PERSON_LASTNAME,MARRIED,PERSON_GENRE,PERSON_BDAY,PERSON_PHOTO,PERSON_PHRASE,PERSON_HEIGHT,PERSON_WEIGHT,WANTS_PETS,LIKES_PETS,HAS_PETS,WANTS_CHILDREN,CANT_CHILDREN,SMOKER,FK_LIFE_STYLE_ID,MARITAL_STATUS_NAME,SAL_FROM,SAL_TO FROM ( (    SELECT PERSON_ID,PERSON_NAME,PERSON_LASTNAME,MARRIED,PERSON_GENRE,PERSON_BDAY,PERSON_PHOTO,PERSON_PHRASE,PERSON_HEIGHT,PERSON_WEIGHT,WANTS_PETS,LIKES_PETS,HAS_PETS,WANTS_CHILDREN,CANT_CHILDREN,SMOKER,FK_LIFE_STYLE_ID,MARITAL_STATUS_NAME FROM ((SELECT MARITAL_STATUS_ID,MARITAL_STATUS_NAME,FK_MARITAL_STATUS_ID FROM (MARITAL_STATUS A FULL OUTER JOIN
      MARITAL_STATUS_X_PERSON ON MARITAL_STATUS_ID=FK_MARITAL_STATUS_ID) WHERE FK_PERSON_ID=persona_id) FULL OUTER JOIN
      (SELECT PERSON_ID,PERSON_NAME,PERSON_LASTNAME,MARRIED,PERSON_GENRE,PERSON_BDAY,PERSON_PHOTO,PERSON_PHRASE,PERSON_HEIGHT,PERSON_WEIGHT,WANTS_PETS,LIKES_PETS,HAS_PETS,WANTS_CHILDREN,CANT_CHILDREN,SMOKER,FK_LIFE_STYLE_ID FROM ((SELECT WANTS_PETS,LIKES_PETS,HAS_PETS,WANTS_CHILDREN,CANT_CHILDREN,SMOKER,FK_LIFE_STYLE_ID FROM (LIFE_STYLE A FULL OUTER JOIN
      LIFE_STYLE_X_PERSON ON LIFE_STYLE_ID=FK_LIFE_STYLE_ID) WHERE FK_PERSON_ID=persona_id) FULL OUTER JOIN
      (SELECT PERSON_ID,PERSON_NAME,PERSON_LASTNAME,MARRIED,PERSON_GENRE,PERSON_BDAY,PERSON_PHOTO,PERSON_PHRASE,PERSON_HEIGHT,PERSON_WEIGHT FROM PERSON WHERE PERSON_ID=persona_id) ON 2=2) ) ON 2=2)) FULL OUTER JOIN
      (SELECT SAL_FROM,SAL_TO FROM (SALARY_RANGE A FULL OUTER JOIN
      SALARY_RANGE_X_PERSON ON SALARY_RANGE_ID=FK_SALARY_RANGE_ID) WHERE FK_PERSON_ID=persona_id)
       ON 2=2)) FULL OUTER JOIN
      (SELECT EXERCISE_FRECUENCY_NAME FROM (EXERCISE_FRECUENCY_X_PERSON A FULL OUTER JOIN
      EXERCISE_FRECUENCY ON EXERCISE_FRECUENCY_ID=FK_EXERCISE_FRE_ID) WHERE FK_PERSON_ID=persona_id) ON 2=2)) FULL OUTER JOIN
      (SELECT DRINKER_TYPE FROM (DRINKER A FULL OUTER JOIN
      DRINKER_X_PERSON ON DRINKER_ID=FK_DRINKER_ID) WHERE FK_PERSON_ID=persona_id) ON 2=2)) FULL OUTER JOIN
      (SELECT OCUPATION_NAME FROM (OCUPATION A FULL OUTER JOIN
      OCUPATION_X_PERSON ON OCUPATION_ID=FK_OCUPATION_ID) WHERE FK_PERSON_ID=persona_id) ON 2=2)) full OUTER JOIN
      (SELECT RELIGION_NAME FROM (RELIGION A FULL OUTER JOIN
      RELIGION_X_PERSON ON RELIGION_ID=FK_RELIGION_ID) WHERE FK_PERSON_ID=persona_id) ON 2=2);
 EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END get_info_pers_uno;
CREATE OR REPLACE PROCEDURE 
get_Language_Cat(la_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN la_recordset FOR
    SELECT language_id,
           language_name
    FROM Language;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Language_Cat;
CREATE OR REPLACE PROCEDURE GET_LANGUAGE_X_PERSON(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR

    SELECT LANGUAGE_ID,LANGUAGE_NAME,FK_PERSON_ID FROM (LANGUAGE A INNER JOIN
  LANGUAGE_X_PERSON ON LANGUAGE_ID=FK_LANGUAGE_ID) WHERE FK_PERSON_ID=persona_id;
   EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_LANGUAGE_X_PERSON;
CREATE OR REPLACE PROCEDURE 
get_Marital_status_Cat(ms_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN ms_recordset FOR
    SELECT marital_status_id,
           marital_status_name
    FROM Marital_status;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Marital_status_Cat;
CREATE OR REPLACE PROCEDURE GET_MARITALSTATUS_X_PERSON(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR

    SELECT MARITAL_STATUS_ID,MARITAL_STATUS_NAME,FK_PERSON_ID FROM (MARITAL_STATUS A INNER JOIN
  MARITAL_STATUS_X_PERSON ON MARITAL_STATUS_ID=FK_MARITAL_STATUS_ID) WHERE FK_PERSON_ID=persona_id;
  EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_MARITALSTATUS_X_PERSON;
CREATE OR REPLACE PROCEDURE 
get_Ocupation_Cat(oc_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN oc_recordset FOR
    SELECT ocupation_id,
           ocupation_name
    FROM Ocupation;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Ocupation_Cat;
CREATE OR REPLACE PROCEDURE GET_OCUPATION_X_PERSON(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR

  SELECT OCUPATION_ID,OCUPATION_NAME,FK_PERSON_ID FROM (OCUPATION A INNER JOIN
  OCUPATION_X_PERSON ON OCUPATION_ID=FK_OCUPATION_ID) WHERE FK_PERSON_ID=persona_id;
  EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_OCUPATION_X_PERSON;
CREATE OR REPLACE PROCEDURE 
get_Partner_Type_Cat(pt_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN pt_recordset FOR
    SELECT partner_Type_id,
           partner_Type_name
    FROM Partner_Type;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Partner_Type_Cat;
CREATE OR REPLACE PROCEDURE GET_PARTNERTYPE_X_PERSON(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR

   SELECT PARTNER_TYPE_ID,PARTNER_TYPE_NAME,FK_PERSON_ID FROM (PARTNER_TYPE A INNER JOIN
  PARTNER_TYPE_X_PERSON ON PARTNER_TYPE_ID=FK_PARTNER_TYPE_ID) WHERE FK_PERSON_ID=persona_id;
  EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_PARTNERTYPE_X_PERSON;
CREATE OR REPLACE PROCEDURE get_PeopleWhoMadeMeWink(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
	OPEN p_recordset FOR
		SELECT person_id

		FROM Person, Wink
		WHERE Person.person_id = Wink.fk_wink_by And Wink.fk_wink_for  =  persona_id;


EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END get_PeopleWhoMadeMeWink;
CREATE OR REPLACE PROCEDURE get_PeopleWhoVisitMe(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
    SELECT person_id

    FROM Person ,Visit
   -- LEFT  JOIN Visit ON Person.person_id = Visit.fk_visitor And Visit.fk_host  =  persona_id;
    WHERE Person.person_id = Visit.fk_visitor And Visit.fk_host  =  persona_id;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END get_PeopleWhoVisitMe;
CREATE OR REPLACE PROCEDURE getPersonasEnExercise (the_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
	OPEN p_recordset FOR
		SELECT fk_person_id
		from Exercise_X_Person
		 where fk_exercise_id = the_id;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END getPersonasEnExercise;
CREATE OR REPLACE PROCEDURE getPersonasEnHobbie (the_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
	OPEN p_recordset FOR
		SELECT fk_person_id
		from Hobbie_X_Person
		 where fk_hobbie_id = the_id;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END getPersonasEnHobbie;
CREATE OR REPLACE PROCEDURE 
get_Personas_Por_Nombre(buscarNombre in VARCHAR2 ,buscarApellido in VARCHAR2 ,bt_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN bt_recordset FOR
    SELECT person_id
    FROM Person
    WHERE person_name LIKE buscarNombre || '%'
    AND person_lastname LIKE buscarApellido || '%';


EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Personas_Por_Nombre;
CREATE OR REPLACE PROCEDURE 
get_Religion_Cat(pt_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN pt_recordset FOR
    SELECT religion_id,
           religion_name
    FROM Religion;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Religion_Cat;
CREATE OR REPLACE PROCEDURE GET_RELIGION_X_PERSON(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR

  SELECT RELIGION_ID,RELIGION_NAME,FK_PERSON_ID FROM (RELIGION A INNER JOIN
  RELIGION_X_PERSON ON RELIGION_ID=FK_RELIGION_ID) WHERE FK_PERSON_ID=persona_id;
    EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_RELIGION_X_PERSON;
CREATE OR REPLACE PROCEDURE 
get_Salary_range_Cat(sr_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN sr_recordset FOR
    SELECT salary_range_id,
           sal_from,
           sal_to
    FROM Salary_range;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Salary_range_Cat;
CREATE OR REPLACE PROCEDURE GET_SALARYRANGE_X_PERSON(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR

    SELECT SALARY_RANGE_ID,SAL_FROM,SAL_TO,FK_PERSON_ID FROM (SALARY_RANGE A INNER JOIN
  SALARY_RANGE_X_PERSON ON SALARY_RANGE_ID=FK_SALARY_RANGE_ID) WHERE FK_PERSON_ID=persona_id;
        EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_SALARYRANGE_X_PERSON;
CREATE OR REPLACE PROCEDURE 
get_Skin_color_Cat(sc_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN sc_recordset FOR
    SELECT skin_color_id,
           skin_color_name
    FROM Skin_color;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_Skin_color_Cat;
CREATE OR REPLACE PROCEDURE GET_SKIN_X_PERSON(persona_id IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
  SELECT SKIN_COLOR_NAME,FK_PERSON_ID FROM (SKIN_COLOR A INNER JOIN
  SKIN_COLOR_X_PERSON ON SKIN_COLOR_ID=FK_SKIN_COLOR_ID) WHERE FK_PERSON_ID=persona_id;
    EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END GET_SKIN_X_PERSON;
CREATE OR REPLACE PROCEDURE get_TopVisits(p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR

    select fk_host,counter from (select fk_host,counter from visit order by counter desc)
    where rownum<=(select to_number(parameter_value) from Parameter where parameter_id = 2 and counter!=0 );



EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END get_TopVisits;
CREATE OR REPLACE PROCEDURE get_TopWinks(p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
   select person_id,win from (
    select person_id, (select count(*) from wink where person_id=fk_wink_for) as win
     from person order by win  desc) where rownum<=(select to_number(parameter_value) from Parameter where parameter_id=3 and win!=0 );


EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END get_TopWinks;
CREATE OR REPLACE PROCEDURE insert_Body_type(new_body_type_name IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  insert into Body_type(body_type_id,body_type_name)
  VALUES(ids_bodyType.Nextval,new_body_type_name);
  COMMIT;

  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_correo(new_e_mail_address IN VARCHAR2, new_fk_person_id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO E_mail(e_Mail_Address,Fk_Person_Id)
  VALUES(new_e_mail_address,new_fk_person_id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE 
Insert_Drinker_X_Person(fk_drinker_id IN NUMBER,Person_id IN NUMBER) AS

BEGIN

	INSERT INTO Drinker_X_Person(fk_drinker_id, fk_person_id)
	VALUES(fk_drinker_id,Person_id);
	commit;

END Insert_Drinker_X_Person;
CREATE OR REPLACE PROCEDURE insert_Education_level(new_education_level_name IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  insert into Education_level(education_level_id,education_level_name)
  VALUES(ids_education.nextval,new_education_level_name);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_Education_X_Person(new_fk_education_level_id IN NUMBER, new_fk_person_id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  insert into Education_level_X_Person(fk_education_level_id,fk_person_id)
  VALUES(new_fk_education_level_id,new_fk_person_id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_evento(new_event_name IN VARCHAR2, event_description IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Event(Event_Id,Event_Name,Event_Description)
  VALUES(ids_event.nextval,new_event_name,event_description);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_Excercise(new_exercise_name IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  insert into Exercise(exercise_id,exercise_name)
  VALUES(ids_exercise.nextval,new_exercise_name);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_Exercise_frec_X_Person(new_fk_exercise_fre_id IN NUMBER, new_fk_person_id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  insert into Exercise_frecuency_X_Person(fk_exercise_fre_id,fk_person_id)
  VALUES(new_fk_exercise_fre_id,new_fk_person_id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_exercise_frequency(new_exercise_frecuency_name IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Exercise_frecuency(Exercise_Frecuency_Id,Exercise_Frecuency_Name)
  VALUES(ids_exerFrec.Nextval,new_exercise_frecuency_name);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_eye_color(new_eye_color_name IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Eye_color(Eye_Color_Id,Eye_Color_Name)
  VALUES(ids_eyeColor.Nextval,new_eye_color_name);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_Eye_color_X_Person(new_fk_eye_color_id IN NUMBER, new_fk_person_id IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  insert into Eye_color_X_Person(fk_eye_color_id,fk_person_id)
  VALUES(new_fk_eye_color_id,new_fk_person_id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_Hair_color(new_hair_color_name IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  insert into Hair_color(hair_color_id,hair_color_name)
  VALUES(ids_hairColor.Nextval,new_hair_color_name);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_hobbie(new_hobbie_name IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Hobbie(Hobbie_Id, Hobbie_Name)
  VALUES(ids_hobbie.nextval,new_hobbie_name);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insertImagen(imagen IN BLOB, personID IN NUMBER,newImgPos IN NUMBER) AS
BEGIN
  INSERT INTO BTAB(IDIMAGEN,BLOBDATA,FK_PERSON_ID,IMGPOS)
  VALUES(ids_imagenes.nextval,imagen,personID,newImgPos);
  COMMIT;
END insertImagen;
CREATE OR REPLACE PROCEDURE insert_language(new_language_name IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Language(Language_Id,Language_Name)
  VALUES(ids_language.nextval,new_language_name);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_lifeStyle(new_wants_pets IN VARCHAR2, new_likes_pets IN VARCHAR2, new_has_pets IN VARCHAR2, new_wants_children IN VARCHAR2, new_cant_children IN NUMBER, new_smoker IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Life_style(Life_Style_Id,Wants_Pets,Likes_Pets,Has_Pets,Wants_Children,Cant_Children,Smoker)
  VALUES(ids_lifestyle.nextval, new_wants_pets, new_likes_pets, new_has_pets, new_wants_children, new_cant_children, new_smoker);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE 
Insert_lifeStyleXPerson(LifeStyle_id IN NUMBER,Person_id IN NUMBER) AS

BEGIN

	INSERT INTO Life_style_X_Person(fk_person_id, fk_life_style_id)
	VALUES(Person_id,LifeStyle_id);
	commit;

END Insert_lifeStyleXPerson;
CREATE OR REPLACE PROCEDURE insert_marital_status(new_marital_status_name IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Marital_status(Marital_Status_Id, Marital_Status_Name)
  VALUES(ids_marital.nextval,new_marital_status_name);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_My_user(new_nick_name IN VARCHAR2, new_password IN VARCHAR2,new_Fk_Person_Id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  insert into My_User(Nick_Name,Password,Fk_Person_Id)
  VALUES(new_nick_name,new_password,new_Fk_Person_Id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_ocupation(new_ocupation_name IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Ocupation(Ocupation_Id,Ocupation_Name)
  VALUES(ids_ocupation.nextval,new_ocupation_name);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_Ocupation_X_Person(new_fk_person_id IN NUMBER, new_fk_ocupation_id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  insert into Ocupation_X_Person(fk_person_id,fk_ocupation_id)
  VALUES(new_fk_person_id,new_fk_ocupation_id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_Parameter(new_parameter_name IN VARCHAR2,new_parameter_value IN NUMBER
,new_parameter_description IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  insert into Parameter(Parameter_Id,Parameter_Name,Parameter_Value,Parameter_Description)
  VALUES(ids_parameter.nextval,new_parameter_name,new_parameter_value,new_parameter_description);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_partner_type(new_partner_Type_id IN NUMBER, new_partner_Type_name IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Partner_Type(Partner_Type_Id,Partner_Type_Name)
  VALUES(new_partner_Type_id,new_partner_Type_name);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_Person(new_usuario IN VARCHAR2,new_person_name IN VARCHAR2, new_person_lastname IN VARCHAR2, new_e_mail IN VARCHAR2, new_pass IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Person(Person_Id,Person_Name,Person_Lastname)
  VALUES(id_personas.nextval, new_person_name, new_person_lastname);
  INSERT INTO MY_USER(NICK_NAME,PASSWORD,FK_PERSON_ID)
  VALUES(new_usuario,new_pass,ID_PERSONAS.Currval);
  INSERT INTO e_mail(e_mail_address,fk_person_id)
  VALUES(new_e_mail,ID_PERSONAS.Currval);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_person_x_bodyType(new_fk_body_type_id IN NUMBER, new_fk_person_Id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Body_type_X_Person(Fk_Body_Type_Id,Fk_Person_Id)
  VALUES(new_fk_body_type_id,new_fk_person_Id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_person_x_exercise(new_fk_exercise_id IN NUMBER, new_fk_person_id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Exercise_X_Person(Fk_Exercise_Id,Fk_Person_Id)
  VALUES(new_fk_exercise_id,new_fk_person_id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_person_x_eyeColor(new_fk_eye_color_id IN NUMBER, new_fk_person_Id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Eye_color_X_Person(Fk_Eye_Color_Id,Fk_Person_Id)
  VALUES(new_fk_eye_color_id,new_fk_person_Id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_person_x_hair(new_fk_hair_id IN NUMBER, new_fk_person_Id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO HAIR_COLOR_X_PERSON(FK_HAIR_COLOR_ID,FK_PERSON_ID)
  VALUES(new_fk_hair_id,new_fk_person_Id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_person_x_hobbie(new_fk_hobbie_id IN NUMBER, new_fk_person_id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Hobbie_X_Person(Fk_Hobbie_Id,Fk_Person_Id)
  VALUES(new_fk_hobbie_id,new_fk_person_id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_person_x_lenguaje(new_fk_language_id IN NUMBER, new_fk_person_Id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Language_X_Person(Fk_Language_Id,Fk_Person_Id)
  VALUES(new_fk_language_id,new_fk_person_Id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_person_x_maritalStatus(new_fk_marital_status_id IN NUMBER, new_fk_person_Id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Marital_status_X_Person(Fk_Marital_Status_Id,Fk_Person_Id)
  VALUES(new_fk_marital_status_id,new_fk_person_Id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_person_x_partnerType(new_fk_Partner_Type_Id IN NUMBER, new_fk_person_Id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Partner_Type_X_Person(Fk_Partner_Type_Id,Fk_Person_Id)
  VALUES(new_fk_Partner_Type_Id,new_fk_person_Id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_person_x_religion(new_fk_religion_id IN NUMBER, new_fk_person_id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Religion_X_Person(fk_religion_id,fk_person_id)
  VALUES(new_fk_religion_id,new_fk_person_id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_person_x_skinColor(new_fk_skin_color_id IN NUMBER, new_fk_person_id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Skin_color_X_Person(Fk_Skin_Color_Id,Fk_Person_Id)
  VALUES(new_fk_skin_color_id,new_fk_person_id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_religion(new_religion_name IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Religion(Religion_Id,Religion_Name)
  VALUES(ids_religion.nextval,new_religion_name);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_salary_range(new_salary_from IN VARCHAR2, new_salary_to IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  insert into Salary_range(salary_range_id,Sal_From,Sal_To)
  VALUES(ids_salaryRange.Nextval,new_salary_from,new_salary_to);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_Salary_range_X_Person(new_fk_salary_range_id IN NUMBER, new_fk_person_id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  insert into Salary_range_X_Person(fk_salary_range_id,fk_person_id)
  VALUES(new_fk_salary_range_id,new_fk_person_id);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_skin_color(new_skin_color_name IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Skin_Color(Skin_Color_Id, Skin_Color_Name)
  VALUES(ids_skinColor.Nextval,new_skin_color_name);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_User_rol(new_User_rol_description IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO User_Rol(User_Rol_Id, Description)
  VALUES(ids_userRol.Nextval,new_User_rol_description);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_visit(new_fk_host_id IN NUMBER, new_fk_visitor_Id IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Visit(Fk_Host,Fk_Visitor,Counter)
  VALUES(new_fk_host_id,new_fk_visitor_Id,1);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_Wink(new_fk_wink_by IN NUMBER, new_fk_wink_for IN NUMBER)
AS tot_emps NUMBER;
BEGIN
  insert into Wink(fk_wink_by,fk_wink_for)
  VALUES(new_fk_wink_by,new_fk_wink_for);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE Match_(persona_idP IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR

  select person_id,matchP(persona_idP,person_id) from person where person_id!=persona_idP order by  matchP(persona_idP,person_id) desc ;

        EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Match_;
CREATE OR REPLACE PROCEDURE PersonasinCity(nombrePais IN NUMBER,p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
		SELECT city_name, (select count(*) from Person
 where city_id = fk_city_id)from city where fk_country_id=nombrePais ;



EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END PersonasinCity;
CREATE OR REPLACE PROCEDURE registrarEvento(nombre IN VARCHAR2,descripcion IN VARCHAR2,hora in NUMBER,ciudad IN NUMBER,fecha IN VARCHAR2)AS
BEGIN
  INSERT INTO EVENT(EVENT_ID,EVENT_NAME,EVENT_DESCRIPTION,FK_CITY_ID,EVENT_HOUR,EVENT_DATE)
  VALUES(ids_eventos.nextval,nombre,descripcion,ciudad,hora,fecha);
  COMMIT;
END registrarEvento;
CREATE OR REPLACE PROCEDURE selectREdades(p_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN p_recordset FOR
    SELECT AR_from,
       AR_to
    FROM Age_Range;


EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END selectREdades;
CREATE OR REPLACE PROCEDURE update_bodyType(up_body_type_id IN NUMBER, new_body_type_name IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  UPDATE Body_type
  SET body_type_name = new_body_type_name
  WHERE body_type_id = up_body_type_id;
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE update_lifeStyle(up_life_style_id IN NUMBER, new_wants_pets IN VARCHAR2, new_likes_pets IN VARCHAR2, new_has_pets IN VARCHAR2, new_wants_children IN VARCHAR2, new_cant_children IN NUMBER, new_smoker IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  UPDATE Life_style
  SET wants_pets = new_wants_pets, likes_pets = new_likes_pets, has_pets = new_has_pets, wants_children = new_wants_children, cant_children=new_cant_children, smoker = new_smoker
  WHERE life_style_id = up_life_style_id;
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE update_My_user(new_nick_name IN VARCHAR2, new_password IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  UPDATE My_user
  SET password=new_password
  WHERE nick_name=new_nick_name;
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE update_Parameter(new_parameter_id IN NUMBER, new_parameter_name IN VARCHAR2,new_parameter_value IN NUMBER
,new_parameter_description IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  UPDATE Parameter
  SET parameter_name=new_parameter_name,
  parameter_value=new_parameter_value,
  parameter_description=new_parameter_description

  WHERE Parameter_Id=new_parameter_id;
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE update_Person(new_person_id IN NUMBER, new_person_name IN VARCHAR2,
       new_person_lastname IN VARCHAR2,
       new_person_bday IN DATE,
       new_person_genre IN VARCHAR2,
       new_person_phrase IN VARCHAR2,
       new_person_WEIGHT IN NUMBER,
       new_person_height IN NUMBER,
       new_fk_city IN NUMBER,
       new_married IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  UPDATE Person
  SET person_name=new_person_name
  ,person_lastname=new_person_lastname
  ,person_bday=new_person_bday
  ,person_genre=new_person_genre
  ,person_phrase=new_person_phrase
  ,person_WEIGHT=new_person_WEIGHT
  ,person_height=new_person_height
  ,fk_city_id=new_fk_city
  ,married=new_married

  WHERE person_id=new_person_id;
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE insert_drinker(new_drinker_name IN VARCHAR2)
AS tot_emps NUMBER;
BEGIN
  INSERT INTO Drinker(drinker_Id,drinker_type)
  VALUES(ids_bebedor.nextval,new_drinker_name);
  COMMIT;
  tot_emps:=tot_emps-1;
END;
CREATE OR REPLACE PROCEDURE 
get_parameters(hc_recordset OUT SYS_REFCURSOR) AS

BEGIN
  OPEN hc_recordset FOR
    SELECT Parameter_Id,
           Parameter_Name,
           Parameter_Value
    FROM Parameter;

EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
          WHEN OTHERS THEN RAISE;
END get_parameters;
CREATE OR REPLACE PROCEDURE updateParameter(new_id IN NUMBER,new_value IN NUMBER) AS
BEGIN
  UPDATE parameter
  SET parameter_value=new_value
  where parameter_id=new_id;
  COMMIT;
END updateParameter;
