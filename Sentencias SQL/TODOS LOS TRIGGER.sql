CREATE OR REPLACE TRIGGER bef_ins_Body_type_X_Pers
       BEFORE INSERT ON Body_type_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_ins_Educat_level_X_Person
       BEFORE INSERT ON Education_level_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_ins_Exerc_frec_X_Person
       BEFORE INSERT ON Exercise_frecuency_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_ins_Exerc_X_Person
       BEFORE INSERT ON Exercise_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_ins_Eye_color_X_Person
       BEFORE INSERT ON Eye_color_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_ins_Hair_color_X_Person
       BEFORE INSERT ON Hair_color_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_ins_Hobbie_X_Person
       BEFORE INSERT ON Hobbie_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_ins_Language_X_Person
       BEFORE INSERT ON Language_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_ins_Life_style_X_Person
       BEFORE INSERT ON Life_style_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_ins_Marit_status_X_Person
       BEFORE INSERT ON Marital_status_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_ins_Partn_Type_X_Person
       BEFORE INSERT ON Partner_Type_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_ins_Religion_X_Person
       BEFORE INSERT ON Religion_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_ins_Salary_range_X_Person
       BEFORE INSERT ON Salary_range_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_ins_Skin_color_X_Person
       BEFORE INSERT ON Skin_color_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Body_type
       BEFORE INSERT ON Body_type
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Drinker
       BEFORE INSERT ON Drinker
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Drinker_X_Person
       BEFORE INSERT ON Drinker_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Education_level
       BEFORE INSERT ON Education_level
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_E_mail
       BEFORE INSERT ON E_mail
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Event
       BEFORE INSERT ON Event
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Exercise
       BEFORE INSERT ON Exercise
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Exercise_frec
       BEFORE INSERT ON Exercise_frecuency
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Eye_color
       BEFORE INSERT ON Eye_color
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Hair_color
       BEFORE INSERT ON Hair_color
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Hobbie
       BEFORE INSERT ON Hobbie
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_imagen
       BEFORE INSERT ON BTAB
       FOR EACH ROW
       
BEGIN
         :new.idimagen:=ids_imagenes.nextval;
END;
CREATE OR REPLACE TRIGGER before_insert_Language
       BEFORE INSERT ON Language
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Life_style
       BEFORE INSERT ON Life_style
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Marital_status
       BEFORE INSERT ON Marital_status
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_My_user
       BEFORE INSERT ON My_user
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Ocupation
       BEFORE INSERT ON Ocupation
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Parameter
       BEFORE INSERT ON Parameter
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Partner_Type
       BEFORE INSERT ON Partner_Type
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_person
       BEFORE INSERT ON Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Person_X_Event
       BEFORE INSERT ON Person_X_Event
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Religion
       BEFORE INSERT ON Religion
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Salary_range
       BEFORE INSERT ON Salary_range
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Skin_color
       BEFORE INSERT ON Skin_color
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_User_rol
       BEFORE INSERT ON User_rol
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_User_X_Person
       BEFORE INSERT ON User_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Visit
       BEFORE INSERT ON Visit
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_insert_Wink
       BEFORE INSERT ON Wink
       FOR EACH ROW
       
BEGIN
         :new.fec_creacion:=SYSDATE;
         :new.creado_por:=user;
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Body_type
       BEFORE UPDATE ON Body_type
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Drinker
       BEFORE UPDATE ON Drinker
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Drinker_X_Person
       BEFORE UPDATE ON Drinker_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Education_level
       BEFORE UPDATE ON Education_level
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_E_mail
       BEFORE UPDATE ON E_mail
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Event
       BEFORE UPDATE ON Event
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Exercise
       BEFORE UPDATE ON Exercise
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Exercise_frec
       BEFORE UPDATE ON Exercise_frecuency
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Eye_color
       BEFORE UPDATE ON Eye_color
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Hair_color
       BEFORE UPDATE ON Hair_color
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Hobbie
       BEFORE UPDATE ON Hobbie
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Language
       BEFORE UPDATE ON Language
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Life_style
       BEFORE UPDATE ON Life_style
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Marital_status
       BEFORE UPDATE ON Marital_status
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_My_user
       BEFORE UPDATE ON My_user
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Ocupation
       BEFORE UPDATE ON Ocupation
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Parameter
       BEFORE UPDATE ON Parameter
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Partner_Type
       BEFORE UPDATE ON Partner_Type
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Person_X_Event
       BEFORE UPDATE ON Person_X_Event
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Religion
       BEFORE UPDATE ON Religion
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Salary_range
       BEFORE UPDATE ON Salary_range
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Skin_color
       BEFORE UPDATE ON Skin_color
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_User_rol
       BEFORE UPDATE ON User_rol
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_User_X_Person
       BEFORE UPDATE ON User_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Visit
       BEFORE UPDATE ON Visit
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER before_update_Wink
       BEFORE UPDATE ON Wink
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_upd_Body_type_X_Person
       BEFORE UPDATE ON Body_type_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_upd_Educat_level_X_Person
       BEFORE UPDATE ON Education_level_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_upd_Exerc_frec_X_Person
       BEFORE UPDATE ON Exercise_frecuency_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_upd_Exerc_X_Person
       BEFORE UPDATE ON Exercise_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_upd_Eye_color_X_Person
       BEFORE UPDATE ON Eye_color_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_upd_Hair_color_X_Person
       BEFORE UPDATE ON Hair_color_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_upd_Hobbie_X_Person
       BEFORE UPDATE ON Hobbie_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_upd_Language_X_Person
       BEFORE UPDATE ON Language_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_upd_Life_style_X_Person
       BEFORE UPDATE ON Life_style_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_upd_Marit_status_X_Person
       BEFORE UPDATE ON Marital_status_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_upd_Part_Type_X_Person
       BEFORE UPDATE ON Partner_Type_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_upd_Religion_X_Person
       BEFORE UPDATE ON Religion_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_upd_Salary_range_X_Person
       BEFORE UPDATE ON Salary_range_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
CREATE OR REPLACE TRIGGER bef_upd_Skin_color_X_Person
       BEFORE UPDATE ON Skin_color_X_Person
       FOR EACH ROW
       
BEGIN
         :new.fec_ultima_mod:=SYSDATE;
         :new.user_ultima_mod:=user;
       END;
