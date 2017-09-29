CREATE OR REPLACE FUNCTION compararUsuario(usuario IN VARCHAR2, pass in VARCHAR2)
RETURN NUMBER
IS cantUsuario NUMBER(9);cantUsuario2 NUMBER(9);
BEGIN
  SELECT COUNT(fk_person_id) INTO cantUsuario
  from my_user
  where password=pass AND usuario=nick_name;
  if(cantUsuario=0) then return -1;
  else 
    SELECT fk_person_id INTO cantUsuario2
    from my_user
    where password=pass AND usuario=nick_name;
    return cantUsuario2;
  end if;
END;
CREATE OR REPLACE FUNCTION countFemale RETURN NUMBER IS

var number;

BEGIN
 select count(*) into var from Person
 where Person.person_genre = 'F' or Person.person_genre = 'f';

RETURN var;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END countFemale;
CREATE OR REPLACE FUNCTION countMale RETURN NUMBER IS

var number;

BEGIN
 select count(*) into var from Person
 where Person.person_genre = 'M' or Person.person_genre = 'm';

RETURN var;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END countMale;
CREATE OR REPLACE FUNCTION countMarried RETURN NUMBER IS

var number;

BEGIN
 select count(*) into var from Person

 where Person.Married = 'S' or Person.Married = 's';

RETURN var;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END countMarried;
CREATE OR REPLACE FUNCTION count_Persons RETURN NUMBER IS

cant_Visits number;

BEGIN
select count(*) into cant_Visits from person;

RETURN cant_Visits;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END count_Persons;
CREATE OR REPLACE FUNCTION esAdmin(usuario IN VARCHAR2)
RETURN NUMBER
IS cantUsuario NUMBER(9);
BEGIN
  SELECT COUNT(user_rol_id) INTO cantUsuario
  from user_rol
  where usuario=fk_user_nick_name AND description='admin';
  if(cantUsuario=0) then return 0;
  else return 1;
  end if;
END;
CREATE OR REPLACE FUNCTION existeImagen(newImgPos IN NUMBER,new_fk_person IN NUMBER) RETURN NUMBER
IS existe NUMBER(6);
BEGIN
  select count(IDIMAGEN) INTO existe FROM BTAB
  WHERE IMGPOS=newImgPos AND new_fk_person=FK_PERSON_ID;
  return existe;
END existeImagen;
CREATE OR REPLACE FUNCTION existeUsuario(usuario IN VARCHAR2)
RETURN NUMBER
IS cantUsuario NUMBER(9);
BEGIN
  SELECT COUNT(fk_person_id) INTO cantUsuario
  from my_user
  where usuario=nick_name;
  if(cantUsuario=0) then return 0;
  else return 1;
  end if;
END;
CREATE OR REPLACE FUNCTION getCantEnGenero(genero IN VARCHAR2)
RETURN NUMBER
IS cantPerson NUMBER(9);
BEGIN
  SELECT COUNT(PERSON_ID)
  INTO cantPerson
  from PERSON
  where PERSON_GENRE=genero;
  RETURN cantPerson;
END;
CREATE OR REPLACE FUNCTION getCantEnMarried(state IN VARCHAR2)
RETURN NUMBER
IS cantPerson NUMBER(9);
BEGIN
  SELECT COUNT(FK_MARITAL_STATUS_ID)
  INTO cantPerson
  from Marital_Status_x_Person MP
  INNER JOIN(select MARITAL_STATUS_ID
             from Marital_Status
             where MARITAL_STATUS_NAME=state) M
  ON MP.FK_MARITAL_STATUS_ID = M.MARITAL_STATUS_ID;
  RETURN cantPerson;
END;
CREATE OR REPLACE FUNCTION getCantEntreFechas(firstAge NUMBER, secondAge NUMBER)
RETURN NUMBER
IS cantPerson NUMBER(9);
BEGIN
  SELECT COUNT(PERSON_ID)
  INTO cantPerson
  from PERSON
  where FLOOR(months_between(sysdate,PERSON_BDAY)/12)>=firstAge AND FLOOR(months_between(sysdate,PERSON_BDAY)/12)<=secondAge;
  RETURN cantPerson;
END;
CREATE OR REPLACE FUNCTION Get_City_Id_bynombre(var_city_name IN VARCHAR2,var_country_id IN number) RETURN NUMBER IS

id_resoult number;

BEGIN
 select city_id into id_resoult from City
 where fk_country_id = var_country_id
 		and city_name = var_city_name;

RETURN id_resoult;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_City_Id_bynombre;
CREATE OR REPLACE FUNCTION Get_contextura_Id(var_Body_Type_name IN VARCHAR2) RETURN NUMBER IS
id_resoult number;
BEGIN
 select count(Body_type_Id) into id_resoult from BODY_TYPE
 where Body_Type_Name = var_Body_Type_name;
 if(id_resoult = 0) then return -1;
 else    select Body_type_Id into id_resoult from Body_Type
 where Body_Type_Name = var_Body_Type_name;
      return id_resoult;
 end if;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_contextura_Id;
CREATE OR REPLACE FUNCTION Get_Drinker_Id(var_Drinker_name IN VARCHAR2) RETURN NUMBER IS

id_resoult number;

BEGIN


 select count(drinker_id) into id_resoult from Drinker
 where drinker_type = var_Drinker_name;
 if(id_resoult = 0) then return -1;
 else select drinker_id into id_resoult from Drinker
      where drinker_type = var_Drinker_name;
      return id_resoult;
 end if;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_Drinker_Id;
CREATE OR REPLACE FUNCTION getEdad(id_persona NUMBER)
RETURN NUMBER
IS edad NUMBER(9);
BEGIN
  SELECT FLOOR(months_between(sysdate,PERSON_BDAY)/12)
  INTO edad
  from PERSON
  where id_persona=Person_id;
  RETURN edad;
END;
CREATE OR REPLACE FUNCTION Get_educacion_Id(var_Education_Level_name IN VARCHAR2) RETURN NUMBER IS
id_resoult number;

BEGIN
 select count(Education_Level_Id) into id_resoult from Education_Level
 where Education_Level_Name = var_Education_Level_name;
 if(id_resoult = 0) then return -1;
 else   select Education_Level_Id into id_resoult from Education_Level
 where Education_Level_Name = var_Education_Level_name;
      return id_resoult;
 end if;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_educacion_Id;
CREATE OR REPLACE FUNCTION Get_estado_Id(var_Marital_Status_name IN VARCHAR2) RETURN NUMBER IS
id_resoult number;
BEGIN
 select count(Marital_Status_Id) into id_resoult from Marital_Status
 where Marital_Status_Name = var_Marital_Status_name;
 if(id_resoult = 0) then return -1;
 else  select Marital_Status_Id into id_resoult from Marital_Status
 where Marital_Status_Name = var_Marital_Status_name;
      return id_resoult;
 end if;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_estado_Id;
CREATE OR REPLACE FUNCTION Get_Exercise_frecuency_Id(var_Exercise_frecuency_name IN VARCHAR2) RETURN NUMBER IS

id_resoult number;

BEGIN
 select count(exercise_frecuency_id) into id_resoult from Exercise_frecuency
 where exercise_frecuency_name = var_Exercise_frecuency_name;
 if(id_resoult = 0) then return -1;
 else   select exercise_frecuency_id into id_resoult from Exercise_frecuency
 where exercise_frecuency_name = var_Exercise_frecuency_name;


      return id_resoult;
 end if;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_Exercise_frecuency_Id;
CREATE OR REPLACE FUNCTION Get_Exercise_Id(var_exercise_name IN VARCHAR2) RETURN NUMBER IS

id_resoult number;

BEGIN
 select exercise_id into id_resoult from Exercise
 where exercise_name = var_exercise_name;

RETURN id_resoult;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_Exercise_Id;
CREATE OR REPLACE FUNCTION Get_Eye_color_Id(var_Eye_color_name IN VARCHAR2) RETURN NUMBER IS

id_resoult number;

BEGIN
 select count(eye_color_id) into id_resoult from Eye_color
 where eye_color_name = var_Eye_color_name;
 if(id_resoult = 0) then return -1;
 else    select eye_color_id into id_resoult from Eye_color
         where eye_color_name = var_Eye_color_name;
      return id_resoult;
 end if;

 select eye_color_id into id_resoult from Eye_color
 where eye_color_name = var_Eye_color_name;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_Eye_color_Id;
CREATE OR REPLACE FUNCTION Get_Hobbie_Id(var_hobbie_name IN VARCHAR2) RETURN NUMBER IS

id_resoult number;

BEGIN
 select hobbie_id into id_resoult from Hobbie
 where hobbie_name = var_hobbie_name;

RETURN id_resoult;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_Hobbie_Id;
CREATE OR REPLACE FUNCTION getIDCiudad(ciudad IN VARCHAR2)
RETURN NUMBER
IS id_ciudad NUMBER(9);
BEGIN
  SELECT CITY_ID INTO id_ciudad
  from CITY
  where ciudad=CITY_NAME;
  return id_ciudad;
END;
CREATE OR REPLACE FUNCTION getIDPais(pais IN VARCHAR2)
RETURN NUMBER
IS id_number NUMBER(9);
BEGIN
  SELECT Country_Id INTO id_number
  from Country
  where Country_Name=pais;
  return id_number;
END;
CREATE OR REPLACE FUNCTION Get_Language_Id(var_language_name IN VARCHAR2) RETURN NUMBER IS

id_resoult number;

BEGIN
 select language_id into id_resoult from Language
 where language_name = var_language_name;

RETURN id_resoult;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_Language_Id;
CREATE OR REPLACE FUNCTION Get_LifeStyle_Id(Var_Persona_id IN NUMBER) RETURN NUMBER IS

id_resoult number(6);

BEGIN
 select count(fk_life_style_id) into id_resoult from Life_style_X_Person
 where fk_person_id = Var_Persona_id;
 if(id_resoult = 0) then return -1;
 else select fk_life_style_id into id_resoult from Life_style_X_Person
      where fk_person_id = Var_Persona_id; 
      return id_resoult;
 end if;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_LifeStyle_Id;
CREATE OR REPLACE FUNCTION Get_Ocupation_Id(var_Ocupation_name IN VARCHAR2) RETURN NUMBER IS

id_resoult number;

BEGIN


 select count(ocupation_id) into id_resoult from Ocupation
 where ocupation_name = var_Ocupation_name;
 if(id_resoult = 0) then return -1;
 else select ocupation_id into id_resoult from Ocupation
 	  where  ocupation_name = var_Ocupation_name;
      return id_resoult;
 end if;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_Ocupation_Id;
CREATE OR REPLACE FUNCTION Get_pelo_Id(var_Hair_Color_name IN VARCHAR2) RETURN NUMBER IS
id_resoult number;
BEGIN
 select count(Hair_Color_Id) into id_resoult from Hair_Color
 where Hair_Color_Name = var_Hair_Color_name;
 if(id_resoult = 0) then return -1;
 else  select Hair_Color_Id into id_resoult from Hair_Color
 where Hair_Color_Name = var_Hair_Color_name;

      return id_resoult;
 end if;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_pelo_Id;
CREATE OR REPLACE FUNCTION Get_religion_Id(var_religion_name IN VARCHAR2) RETURN NUMBER IS
id_resoult number;

BEGIN
 select count(RELIGION_ID) into id_resoult from RELIGION
 where RELIGION_NAME = var_religion_name;
 if(id_resoult = 0) then return -1;
 else   select RELIGION_ID INTO id_resoult from RELIGION
  where RELIGION_NAME = var_religion_name;
      return id_resoult;
 end if;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_religion_Id;
CREATE OR REPLACE FUNCTION Get_salaryRange_Id(var_Salary_Range_name IN VARCHAR2) RETURN NUMBER IS
id_resoult number;
BEGIN
 select count(salary_range_id) into id_resoult from Salary_Range
 where Sal_From || '-' || Sal_to = var_Salary_Range_name;
 if(id_resoult = 0) then return -1;
 else   select salary_range_id into id_resoult from Salary_Range
 where Sal_From || '-' || Sal_to = var_Salary_Range_name;

      return id_resoult;
 end if;

RETURN id_resoult;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_salaryRange_Id;
CREATE OR REPLACE FUNCTION Get_Skin_color_Id(var_Skin_color_name IN VARCHAR2) RETURN NUMBER IS

id_resoult number;

BEGIN
 select count(skin_color_id) into id_resoult from Skin_color
 where skin_color_name = var_Skin_color_name;
 if(id_resoult = 0) then return -1;
 else  select skin_color_id into id_resoult from Skin_color
 where skin_color_name = var_Skin_color_name;

      return id_resoult;
 end if;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Get_Skin_color_Id;
CREATE OR REPLACE FUNCTION hayVisit(newidhost IN NUMBER, newidvisitor IN NUMBER)
RETURN NUMBER
IS retorno NUMBER(9);
BEGIN
  SELECT COUNT(FK_HOST) INTO retorno
  from VISIT
  where FK_HOST=newidhost AND FK_VISITOR=newidvisitor;
  if(retorno=0) then return 0;
  else return 1;
  end if;
END hayVisit;
CREATE OR REPLACE FUNCTION hayWink(newidFor IN NUMBER, newidBy IN NUMBER)
RETURN NUMBER
IS retorno NUMBER(9);
BEGIN
  SELECT COUNT(FK_WINK_BY) INTO retorno
  from WINK
  where FK_WINK_BY=newidBy AND FK_WINK_FOR=newidFor;
  if(retorno=0) then return 0;
  else return 1;
  end if;
END hayWink;
CREATE OR REPLACE FUNCTION Insert_LifeStile(vlikes_pets IN VARCHAR2,
 							  vhas_pets IN VARCHAR2,
 							  vwants_children IN VARCHAR2,
 							  vcant_children IN NUMBER,
 							  vsmoker IN VARCHAR2) RETURN NUMBER IS

id_resoult number(9);

BEGIN
 	id_resoult := ids_lifestyle.nextval;
 	INSERT INTO Life_style(life_style_id, likes_pets,
 							  has_pets,  wants_children,
 							  cant_children,  smoker)
 	VALUES (ids_lifestyle.currval,
 			vlikes_pets,
 			vhas_pets,
 			vwants_children ,
 			vcant_children,
 			vsmoker );

RETURN id_resoult;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END Insert_LifeStile;
CREATE OR REPLACE FUNCTION matchP(usuario1 IN number, usuario2 in number)
RETURN NUMBER
IS

compatibilidad NUMBER(9);
temporal NUMBER(9);

total NUMBER(9);
totalTemporal NUMBER(9);

BEGIN
  compatibilidad:=0;
  total:=1;
  temporal:=0;
  totalTemporal:=1;

  --Hobbies
--compatibilidad

 SELECT COUNT(HOBBIE_ID)
  INTO temporal FROM(

  SELECT HOBBIE_ID FROM ( (SELECT HOBBIE_ID as hobbie_id_f FROM (HOBBIE A INNER JOIN
  HOBBIE_X_PERSON ON HOBBIE_ID=FK_HOBBIE_ID) WHERE FK_PERSON_ID=usuario1) A

INNER JOIN (SELECT HOBBIE_ID FROM (HOBBIE A INNER JOIN
  HOBBIE_X_PERSON ON HOBBIE_ID=FK_HOBBIE_ID) WHERE FK_PERSON_ID=usuario2) B
   ON 2=2 )

    WHERE HOBBIE_ID=HOBBIE_ID_F   );
 compatibilidad:=compatibilidad+temporal;

--mis hobbies
  SELECT COUNT(HOBBIE_ID_f)
  INTO totalTemporal FROM(
  SELECT HOBBIE_ID_f FROM (SELECT HOBBIE_ID as hobbie_id_f FROM (HOBBIE A INNER JOIN
  HOBBIE_X_PERSON ON HOBBIE_ID=FK_HOBBIE_ID) WHERE FK_PERSON_ID=usuario1) );

total:= totalTemporal+total;

-- fin de hobbies

--Ejercicios
--Persona compatible
SELECT COUNT(exercise_ID)
  INTO temporal FROM(
  SELECT EXERCISE_ID FROM ( (SELECT EXERCISE_ID,EXERCISE_NAME,FK_PERSON_ID FROM (EXERCISE_X_PERSON A INNER JOIN
  EXERCISE ON EXERCISE_ID=FK_EXERCISE_ID) WHERE FK_PERSON_ID=usuario1) A

INNER JOIN (SELECT EXERCISE_ID as EXERCISE_ID_f,EXERCISE_NAME,FK_PERSON_ID FROM (EXERCISE_X_PERSON A INNER JOIN
  EXERCISE ON EXERCISE_ID=FK_EXERCISE_ID) WHERE FK_PERSON_ID=usuario2) B
   ON 2=2) WHERE EXERCISE_ID=EXERCISE_ID_F
      );


compatibilidad:=compatibilidad+temporal;


--mis ejercicios
SELECT COUNT(EXERCISE_ID) INTO totalTemporal from(
    SELECT EXERCISE_ID FROM (EXERCISE_X_PERSON A INNER JOIN
  EXERCISE ON EXERCISE_ID=FK_EXERCISE_ID) WHERE FK_PERSON_ID=usuario1);

total:=total+totalTemporal;

---fin ejercicios


--lENGUAJES
--COMPATIBILIDAD
SELECT COUNT(LANGUAGE_ID)
  INTO temporal FROM(
  SELECT LANGUAGE_ID FROM ( (SELECT LANGUAGE_ID,LANGUAGE_NAME,FK_PERSON_ID FROM (LANGUAGE A INNER JOIN
  LANGUAGE_X_PERSON ON LANGUAGE_ID=FK_LANGUAGE_ID) WHERE FK_PERSON_ID=usuario1) A

INNER JOIN (SELECT LANGUAGE_ID as LANGUAGE_ID_f,LANGUAGE_NAME,FK_PERSON_ID FROM (LANGUAGE A INNER JOIN
  LANGUAGE_X_PERSON ON LANGUAGE_ID=FK_LANGUAGE_ID) WHERE FK_PERSON_ID=usuario2) B
   ON 2=2) WHERE LANGUAGE_ID=LANGUAGE_ID_F   );

compatibilidad:=compatibilidad+temporal;






--MIS LENGUAJES

SELECT COUNT(LANGUAGE_ID) INTO totalTemporal from(
    SELECT LANGUAGE_ID FROM (LANGUAGE A INNER JOIN
  LANGUAGE_X_PERSON ON LANGUAGE_ID=FK_LANGUAGE_ID) WHERE FK_PERSON_ID=usuario1 );

total:=total+totalTemporal;



--Estilo de vida
--Mi estilo de vida:
SELECT COUNT(LIFE_STYLE_ID) INTO totalTemporal from(
SELECT LIFE_STYLE_ID,WANTS_PETS,LIKES_PETS,HAS_PETS,WANTS_CHILDREN,CANT_CHILDREN,SMOKER,FK_LIFE_STYLE_ID,FK_PERSON_ID FROM (LIFE_STYLE A INNER JOIN
  LIFE_STYLE_X_PERSON ON LIFE_STYLE_ID=FK_LIFE_STYLE_ID) WHERE FK_PERSON_ID=usuario1);


total:=total+totalTemporal;


--Compatibilidad estilo de vida
  SELECT COUNT(LIFE_STYLE_ID)
  INTO temporal FROM(
  SELECT LIFE_STYLE_ID FROM ( (SELECT LIFE_STYLE_ID,WANTS_PETS,LIKES_PETS,HAS_PETS,WANTS_CHILDREN,CANT_CHILDREN,SMOKER,FK_LIFE_STYLE_ID,FK_PERSON_ID FROM (LIFE_STYLE A INNER JOIN
  LIFE_STYLE_X_PERSON ON LIFE_STYLE_ID=FK_LIFE_STYLE_ID) WHERE FK_PERSON_ID=usuario1) A

INNER JOIN (SELECT LIFE_STYLE_ID as LIFE_STYLE_ID_F ,WANTS_PETS,LIKES_PETS,HAS_PETS,WANTS_CHILDREN,CANT_CHILDREN,SMOKER,FK_LIFE_STYLE_ID,FK_PERSON_ID FROM (LIFE_STYLE A INNER JOIN
  LIFE_STYLE_X_PERSON ON LIFE_STYLE_ID=FK_LIFE_STYLE_ID) WHERE FK_PERSON_ID=usuario2) B
   ON 2=2) WHERE LIFE_STYLE_ID=LIFE_STYLE_ID_F   );

compatibilidad:=compatibilidad+temporal;

--Frecuencia de ejercicio
--Mi frecuencia de ejercicio
SELECT COUNT(FK_EXERCISE_FRE_ID) INTO totalTemporal from(
SELECT FK_EXERCISE_FRE_ID,EXERCISE_FRECUENCY_NAME,FK_PERSON_ID FROM (EXERCISE_FRECUENCY_X_PERSON A INNER JOIN
  EXERCISE_FRECUENCY ON EXERCISE_FRECUENCY_ID=FK_EXERCISE_FRE_ID) WHERE FK_PERSON_ID=usuario1);
total:=total+totalTemporal;



--Compatibilidad frecuencia de ejercicio
  SELECT COUNT(FK_EXERCISE_FRE_ID)
  INTO temporal FROM(
  SELECT FK_EXERCISE_FRE_ID FROM ( (SELECT FK_EXERCISE_FRE_ID,EXERCISE_FRECUENCY_NAME,FK_PERSON_ID FROM (EXERCISE_FRECUENCY_X_PERSON A INNER JOIN
  EXERCISE_FRECUENCY ON EXERCISE_FRECUENCY_ID=FK_EXERCISE_FRE_ID) WHERE FK_PERSON_ID=usuario1) A

INNER JOIN (SELECT FK_EXERCISE_FRE_ID as FK_EXERCISE_FRE_ID_F,EXERCISE_FRECUENCY_NAME,FK_PERSON_ID FROM (EXERCISE_FRECUENCY_X_PERSON A INNER JOIN
  EXERCISE_FRECUENCY ON EXERCISE_FRECUENCY_ID=FK_EXERCISE_FRE_ID) WHERE FK_PERSON_ID=usuario2) B
   ON 2=2) WHERE FK_EXERCISE_FRE_ID=FK_EXERCISE_FRE_ID_F   );

compatibilidad:=compatibilidad+temporal;




--Body type
-- para mi
SELECT COUNT(BODY_TYPE_ID) INTO totalTemporal from(
SELECT BODY_TYPE_ID,BODY_TYPE_NAME,FK_PERSON_ID FROM (BODY_TYPE_X_PERSON A INNER JOIN
  BODY_TYPE ON BODY_TYPE_ID=FK_BODY_TYPE_ID) WHERE FK_PERSON_ID=usuario1);
total:=total+totalTemporal;



--Compatibilidad

  SELECT COUNT(BODY_TYPE_ID)
  INTO temporal FROM(
  SELECT BODY_TYPE_ID FROM ( (SELECT BODY_TYPE_ID,FK_PERSON_ID FROM (BODY_TYPE_X_PERSON A INNER JOIN
  BODY_TYPE ON BODY_TYPE_ID=FK_BODY_TYPE_ID) WHERE FK_PERSON_ID=usuario1) A

INNER JOIN (SELECT BODY_TYPE_ID as BODY_TYPE_ID_F,FK_PERSON_ID FROM (BODY_TYPE_X_PERSON A INNER JOIN
  BODY_TYPE ON BODY_TYPE_ID=FK_BODY_TYPE_ID) WHERE FK_PERSON_ID=usuario2) B
   ON 2=2) WHERE BODY_TYPE_ID=BODY_TYPE_ID_F   );

compatibilidad:=compatibilidad+temporal;

--Drinker
-- para mi:
SELECT COUNT(DRINKER_ID) INTO totalTemporal from(
SELECT DRINKER_ID,FK_PERSON_ID FROM (DRINKER A INNER JOIN
  DRINKER_X_PERSON ON DRINKER_ID=FK_DRINKER_ID) WHERE FK_PERSON_ID=usuario1
);
total:=total+totalTemporal;



--Compatibilidad:
  SELECT COUNT(DRINKER_ID)
  INTO temporal FROM(
  SELECT DRINKER_ID FROM ( (SELECT DRINKER_ID,FK_PERSON_ID FROM (DRINKER A INNER JOIN
  DRINKER_X_PERSON ON DRINKER_ID=FK_DRINKER_ID) WHERE FK_PERSON_ID=usuario1) A

INNER JOIN (SELECT DRINKER_ID as DRINKER_ID_F,FK_PERSON_ID FROM (DRINKER A INNER JOIN
  DRINKER_X_PERSON ON DRINKER_ID=FK_DRINKER_ID) WHERE FK_PERSON_ID=usuario2) B
   ON 2=2) WHERE DRINKER_ID=DRINKER_ID_F   );

compatibilidad:=compatibilidad+temporal;



--Education level
--para mi:
SELECT COUNT(EDUCATION_LEVEL_ID) INTO totalTemporal from(
SELECT EDUCATION_LEVEL_ID,EDUCATION_LEVEL_NAME,FK_PERSON_ID FROM (EDUCATION_LEVEL A INNER JOIN
  EDUCATION_LEVEL_X_PERSON ON EDUCATION_LEVEL_ID=FK_EDUCATION_LEVEL_ID) WHERE FK_PERSON_ID=usuario1

);
total:=total+totalTemporal;

--compatibilidad
 SELECT COUNT(EDUCATION_LEVEL_ID)
  INTO temporal FROM(
  SELECT EDUCATION_LEVEL_ID FROM ( (SELECT EDUCATION_LEVEL_ID,EDUCATION_LEVEL_NAME,FK_PERSON_ID FROM (EDUCATION_LEVEL A INNER JOIN
  EDUCATION_LEVEL_X_PERSON ON EDUCATION_LEVEL_ID=FK_EDUCATION_LEVEL_ID) WHERE FK_PERSON_ID=usuario1) A

INNER JOIN (SELECT EDUCATION_LEVEL_ID as EDUCATION_LEVEL_ID_F,EDUCATION_LEVEL_NAME,FK_PERSON_ID FROM (EDUCATION_LEVEL A INNER JOIN
  EDUCATION_LEVEL_X_PERSON ON EDUCATION_LEVEL_ID=FK_EDUCATION_LEVEL_ID) WHERE FK_PERSON_ID=usuario2) B
   ON 2=2) WHERE EDUCATION_LEVEL_ID=EDUCATION_LEVEL_ID_F   );

compatibilidad:=compatibilidad+temporal;



  -- select * from hobbie_x_person;

 --Color de ojos:

 --Para mi:
 SELECT COUNT(EYE_COLOR_ID) INTO totalTemporal from(
SELECT EYE_COLOR_ID,EYE_COLOR_NAME,FK_EYE_COLOR_ID FROM (EYE_COLOR A INNER JOIN
  EYE_COLOR_X_PERSON ON EYE_COLOR_ID=FK_EYE_COLOR_ID) WHERE FK_PERSON_ID=usuario1

);



total:=total+totalTemporal;

--Compatibilidad:
 SELECT COUNT(EYE_COLOR_ID)
  INTO temporal FROM(
  SELECT EYE_COLOR_ID FROM ( (SELECT EYE_COLOR_ID,FK_EYE_COLOR_ID FROM (EYE_COLOR A INNER JOIN
  EYE_COLOR_X_PERSON ON EYE_COLOR_ID=FK_EYE_COLOR_ID) WHERE FK_PERSON_ID=usuario1) A

INNER JOIN (SELECT EYE_COLOR_ID as EYE_COLOR_ID_F,FK_EYE_COLOR_ID FROM (EYE_COLOR A INNER JOIN
  EYE_COLOR_X_PERSON ON EYE_COLOR_ID=FK_EYE_COLOR_ID) WHERE FK_PERSON_ID=usuario2) B
   ON 2=2) WHERE EYE_COLOR_ID=EYE_COLOR_ID_F   );

compatibilidad:=compatibilidad+temporal;

     --Ocupacion se omite porque no es tan relevante
--Religion
--Para mi:
 SELECT COUNT(RELIGION_ID) INTO totalTemporal from(
SELECT RELIGION_ID,FK_PERSON_ID FROM (RELIGION A INNER JOIN
  RELIGION_X_PERSON ON RELIGION_ID=FK_RELIGION_ID) WHERE FK_PERSON_ID=usuario1
);
total:=total+totalTemporal;

--Compatibilidad:
 SELECT COUNT(RELIGION_ID)
  INTO temporal FROM(
  SELECT RELIGION_ID FROM ( (SELECT RELIGION_ID,FK_PERSON_ID FROM (RELIGION A INNER JOIN
  RELIGION_X_PERSON ON RELIGION_ID=FK_RELIGION_ID) WHERE FK_PERSON_ID=usuario1) A

INNER JOIN (SELECT RELIGION_ID as RELIGION_ID_F,FK_PERSON_ID FROM (RELIGION A INNER JOIN
  RELIGION_X_PERSON ON RELIGION_ID=FK_RELIGION_ID) WHERE FK_PERSON_ID=usuario2) B
   ON 2=2) WHERE RELIGION_ID=RELIGION_ID_F   );

compatibilidad:=compatibilidad+temporal;

--Skin Color:
--para mi:
 SELECT COUNT(SKIN_COLOR_ID) INTO totalTemporal from(
SELECT SKIN_COLOR_ID,SKIN_COLOR_NAME,FK_PERSON_ID FROM (SKIN_COLOR A INNER JOIN
  SKIN_COLOR_X_PERSON ON SKIN_COLOR_ID=FK_SKIN_COLOR_ID) WHERE FK_PERSON_ID=usuario1
);
total:=total+totalTemporal;
--Compatibilidad:

 SELECT COUNT(SKIN_COLOR_ID)
  INTO temporal FROM(
  SELECT SKIN_COLOR_ID FROM ( (SELECT SKIN_COLOR_ID,FK_PERSON_ID FROM (SKIN_COLOR A INNER JOIN
  SKIN_COLOR_X_PERSON ON SKIN_COLOR_ID=FK_SKIN_COLOR_ID) WHERE FK_PERSON_ID=usuario1) A

INNER JOIN (SELECT SKIN_COLOR_ID as SKIN_COLOR_ID_F,SKIN_COLOR_NAME,FK_PERSON_ID FROM (SKIN_COLOR A INNER JOIN
  SKIN_COLOR_X_PERSON ON SKIN_COLOR_ID=FK_SKIN_COLOR_ID) WHERE FK_PERSON_ID=usuario2) B
   ON 2=2) WHERE SKIN_COLOR_ID=SKIN_COLOR_ID_F   );

compatibilidad:=compatibilidad+temporal;

   RETURN (compatibilidad/total)*100;






END matchP;
CREATE OR REPLACE FUNCTION signo_zodiacal(fnac in date) RETURN varchar2 IS
  dia number;
  mes number;
  signo varchar2(50);

BEGIN
 select to_number(to_char(fnac, 'DD')) into dia from dual;
 select to_number(to_char(fnac, 'MM')) into mes from dual;

 if((mes=1 and dia>=21)or(mes=2 and dia<=19))then
  signo := 'acuario';
  elsif((mes=2 and dia>=20)or(mes=3 and dia<=20))then
  signo := 'picis';
  elsif((mes=3 and dia>=20)or(mes=4 and dia<=21))then
  signo := 'aries';
  elsif((mes=4 and dia>=21)or(mes=5 and dia<=21))then
  signo := 'tauro';
  elsif((mes=5 and dia>=22)or(mes=6 and dia<=21))then
  signo := 'geminis';
  elsif((mes=6 and dia>=22)or(mes=7 and dia<=22))then
  signo := 'cancer';
  elsif((mes=7 and dia>=23)or(mes=8 and dia<=22))then
  signo := 'leo';
  elsif((mes=8 and dia>=23)or(mes=9 and dia<=22))then
  signo := 'virgo';
  elsif((mes=9 and dia>=23)or(mes=10 and dia<=22))then
  signo := 'libra';
  elsif((mes=10 and dia>=23)or(mes=11 and dia<=21))then
  signo := 'escorpio';
  elsif((mes=11 and dia>=22)or(mes=12 and dia<=21))then
  signo := 'sagitario';
  elsif((mes=12 and dia>=22)or(mes=1 and dia<=20))then
  signo := 'capricornio';
 end if;

RETURN signo;

EXCEPTION
 WHEN NO_DATA_FOUND THEN
 NULL;
 WHEN OTHERS THEN
 RAISE;
END signo_zodiacal;
