BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"first_name"	varchar(30) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"last_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "blog_post" (
	"id"	integer NOT NULL,
	"title"	varchar(255) NOT NULL,
	"content"	text NOT NULL,
	"date_posted"	datetime NOT NULL,
	"author_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("author_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "users_profile" (
	"id"	integer NOT NULL,
	"image"	varchar(100) NOT NULL,
	"user_id"	integer NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "vaccine_vaccine" (
	"id"	integer NOT NULL,
	"date"	datetime NOT NULL,
	"created_by_id"	integer,
	"patient_id"	integer,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("patient_id") REFERENCES "Patients_patient"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("created_by_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "location_municipio" (
	"id"	integer NOT NULL,
	"name"	varchar(255) NOT NULL,
	"provincia_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("provincia_id") REFERENCES "location_provincia"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "Patients_patient" (
	"id"	integer NOT NULL,
	"first_name"	varchar(255) NOT NULL,
	"last_name"	varchar(255) NOT NULL,
	"email"	varchar(255) NOT NULL,
	"date_posted"	datetime NOT NULL,
	"created_by_id"	integer,
	"location_id"	integer,
	"state_id"	integer,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("created_by_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("state_id") REFERENCES "location_provincia"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("location_id") REFERENCES "location_municipio"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "location_provincia" (
	"id"	integer NOT NULL,
	"name"	varchar(255) NOT NULL,
	"location_m"	varchar(255),
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2020-07-16 23:38:09.274613');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2020-07-16 23:38:09.293916');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2020-07-16 23:38:09.308209');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2020-07-16 23:38:09.324609');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2020-07-16 23:38:09.340769');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2020-07-16 23:38:09.383800');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2020-07-16 23:38:09.394222');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2020-07-16 23:38:09.407657');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2020-07-16 23:38:09.419820');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2020-07-16 23:38:09.435980');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2020-07-16 23:38:09.440173');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2020-07-16 23:38:09.452902');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2020-07-16 23:38:09.467428');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2020-07-16 23:38:09.479997');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2020-07-16 23:38:09.495050');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2020-07-16 23:38:09.508400');
INSERT INTO "django_migrations" VALUES (17,'sessions','0001_initial','2020-07-16 23:38:09.513280');
INSERT INTO "django_migrations" VALUES (18,'blog','0001_initial','2020-07-16 23:52:22.544113');
INSERT INTO "django_migrations" VALUES (19,'blog','0002_auto_20200717_0003','2020-07-17 00:04:03.003958');
INSERT INTO "django_migrations" VALUES (20,'users','0001_initial','2020-07-27 23:29:08.171333');
INSERT INTO "django_migrations" VALUES (21,'users','0002_auto_20200727_2343','2020-07-27 23:43:20.900440');
INSERT INTO "django_migrations" VALUES (22,'Patients','0001_initial','2020-11-14 15:02:52.621853');
INSERT INTO "django_migrations" VALUES (24,'vaccine','0001_initial','2020-11-14 16:04:18.743612');
INSERT INTO "django_migrations" VALUES (25,'location','0001_initial','2020-11-14 17:40:37.810323');
INSERT INTO "django_migrations" VALUES (26,'Patients','0002_patient_location','2020-11-14 17:48:44.702589');
INSERT INTO "django_migrations" VALUES (27,'Patients','0003_patient_state','2020-11-22 17:14:49.011889');
INSERT INTO "django_migrations" VALUES (28,'location','0002_provincia_location','2020-11-25 14:29:38.459830');
INSERT INTO "django_migrations" VALUES (29,'location','0003_remove_provincia_location','2020-11-25 19:50:00.500455');
INSERT INTO "django_migrations" VALUES (30,'location','0004_maplocation','2020-11-25 19:50:48.594740');
INSERT INTO "django_migrations" VALUES (31,'location','0005_delete_maplocation','2020-11-25 19:52:03.515938');
INSERT INTO "django_migrations" VALUES (32,'location','0006_provincia_location_f','2020-11-25 20:16:15.782988');
INSERT INTO "django_migrations" VALUES (33,'location','0007_auto_20201125_2034','2020-11-25 20:34:40.209638');
INSERT INTO "django_admin_log" VALUES (1,'2020-07-16 23:40:46.388001','1','jeanfondeur','[{"changed": {"fields": ["First name", "Last name"]}}]',4,1,2);
INSERT INTO "django_admin_log" VALUES (2,'2020-07-17 00:05:10.747089','1','Post object (1)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (3,'2020-07-17 00:05:20.613631','2','Post object (2)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2020-07-17 00:05:35.095797','3','Post object (3)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (5,'2020-07-25 00:21:47.781220','2','jfondeur','[{"changed": {"fields": ["password"]}}]',4,1,2);
INSERT INTO "django_admin_log" VALUES (6,'2020-07-25 00:22:50.204346','1','jeanfondeur','[{"changed": {"fields": ["password"]}}]',4,1,2);
INSERT INTO "django_admin_log" VALUES (7,'2020-07-27 23:39:49.410509','1','Profile object (1)','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (8,'2020-07-27 23:55:59.172266','1','elea','',8,1,3);
INSERT INTO "django_admin_log" VALUES (9,'2020-07-27 23:57:21.055571','2','elea','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (10,'2020-07-28 00:09:54.081343','2','elea','[{"changed": {"fields": ["Image"]}}]',8,1,2);
INSERT INTO "django_admin_log" VALUES (11,'2020-07-28 00:26:24.220298','4','elea','[{"changed": {"fields": ["First name", "Last name"]}}]',4,1,2);
INSERT INTO "django_admin_log" VALUES (12,'2020-07-28 00:45:41.523846','5','david','',4,1,3);
INSERT INTO "django_admin_log" VALUES (13,'2020-07-28 00:45:41.527085','2','jfondeur','',4,1,3);
INSERT INTO "django_admin_log" VALUES (14,'2020-07-28 00:45:41.529493','6','patricia','',4,1,3);
INSERT INTO "django_admin_log" VALUES (15,'2020-07-28 00:45:41.531759','3','turalocommg','',4,1,3);
INSERT INTO "django_admin_log" VALUES (16,'2020-09-11 00:20:24.304816','8','jeanfondeur','[{"added": {}}]',8,9,1);
INSERT INTO "django_admin_log" VALUES (17,'2020-09-11 00:20:50.270295','1','jeanfondeur','[{"changed": {"fields": ["password"]}}]',4,9,2);
INSERT INTO "django_admin_log" VALUES (18,'2020-11-12 12:19:47.661595','4','elea','',4,1,3);
INSERT INTO "django_admin_log" VALUES (19,'2020-11-12 12:19:47.665134','8','jean','',4,1,3);
INSERT INTO "django_admin_log" VALUES (20,'2020-11-12 12:19:47.667385','7','patricia','',4,1,3);
INSERT INTO "django_admin_log" VALUES (21,'2020-11-14 15:28:50.437575','1','Patient object (1)','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (22,'2020-11-14 16:04:48.265847','1','Vaccine object (1)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (23,'2020-11-14 16:24:38.349365','10','use','[{"changed": {"fields": ["First name", "Last name"]}}]',4,1,2);
INSERT INTO "django_admin_log" VALUES (24,'2020-11-14 17:11:55.434424','2','Bruno Diaz','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (25,'2020-11-14 17:40:58.898900','1','Provincia object (1)','[{"added": {}}]',12,1,1);
INSERT INTO "django_admin_log" VALUES (26,'2020-11-14 17:41:37.455040','1','Municipio object (1)','[{"added": {}}]',11,1,1);
INSERT INTO "django_admin_log" VALUES (27,'2020-11-14 17:49:01.268733','2','Bruno Diaz','[{"changed": {"fields": ["Location"]}}]',9,1,2);
INSERT INTO "django_admin_log" VALUES (28,'2020-11-14 17:49:10.054908','1','Jose Canseco','[{"changed": {"fields": ["Location"]}}]',9,1,2);
INSERT INTO "django_admin_log" VALUES (29,'2020-11-16 13:29:41.360038','5','Jean Carlo Fondeur BM-119682','',9,1,3);
INSERT INTO "django_admin_log" VALUES (30,'2020-11-16 13:29:41.369417','4','Jean BM-119682','',9,1,3);
INSERT INTO "django_admin_log" VALUES (31,'2020-11-16 13:29:41.374380','3','Bruno Maquejode','',9,1,3);
INSERT INTO "django_admin_log" VALUES (32,'2020-11-16 13:50:22.065572','12','Jean Carlo Fondeur BM-119682','',9,1,3);
INSERT INTO "django_admin_log" VALUES (33,'2020-11-16 13:50:22.069182','11','Jean Carlo Fondeur BM-119682','',9,1,3);
INSERT INTO "django_admin_log" VALUES (34,'2020-11-16 13:50:22.072438','10','Jean Carlo Fondeur BM-119682','',9,1,3);
INSERT INTO "django_admin_log" VALUES (35,'2020-11-16 13:50:22.076414','9','Jean Carlo Fondeur BM-119682','',9,1,3);
INSERT INTO "django_admin_log" VALUES (36,'2020-11-16 13:50:22.080052','8','Jean Carlo Fondeur BM-119682','',9,1,3);
INSERT INTO "django_admin_log" VALUES (37,'2020-11-16 13:50:22.085028','7','Jean Carlo Fondeur BM-119682','',9,1,3);
INSERT INTO "django_admin_log" VALUES (38,'2020-11-22 17:16:46.952139','2','Santo Domingo','[{"added": {}}]',12,1,1);
INSERT INTO "django_admin_log" VALUES (39,'2020-11-22 17:17:04.139928','2','Santo Domingo Este','[{"added": {}}]',11,1,1);
INSERT INTO "django_admin_log" VALUES (40,'2020-11-24 23:09:48.346029','16','Danilo Medina','',9,1,3);
INSERT INTO "django_admin_log" VALUES (41,'2020-11-24 23:09:48.370818','15','Milkeya Kalaf','',9,1,3);
INSERT INTO "django_admin_log" VALUES (42,'2020-11-24 23:09:48.373348','14','david canceco','',9,1,3);
INSERT INTO "django_admin_log" VALUES (43,'2020-11-24 23:09:48.375819','13','Caro lina','',9,1,3);
INSERT INTO "django_admin_log" VALUES (44,'2020-11-24 23:09:48.378415','6','Josefina Lalala','',9,1,3);
INSERT INTO "django_admin_log" VALUES (45,'2020-11-24 23:09:48.382296','2','Bruno Diaz','',9,1,3);
INSERT INTO "django_admin_log" VALUES (46,'2020-11-24 23:09:48.385117','1','Jose Canseco','',9,1,3);
INSERT INTO "django_admin_log" VALUES (47,'2020-11-24 23:10:05.652799','2','Santo Domingo Este','',11,1,3);
INSERT INTO "django_admin_log" VALUES (48,'2020-11-24 23:10:05.656415','1','Veron - Punta Cana - Macao','',11,1,3);
INSERT INTO "django_admin_log" VALUES (49,'2020-11-24 23:10:18.547752','2','Santo Domingo','',12,1,3);
INSERT INTO "django_admin_log" VALUES (50,'2020-11-24 23:10:18.551338','1','La Altagracia','',12,1,3);
INSERT INTO "django_admin_log" VALUES (51,'2020-11-24 23:12:55.034968','1','Azua','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (52,'2020-11-24 23:12:55.038549','2','Bahoruco','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (53,'2020-11-24 23:12:55.041117','3','Barahona','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (54,'2020-11-24 23:12:55.044212','4','Dajabón','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (55,'2020-11-24 23:12:55.047487','5','Distrito Nacional','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (56,'2020-11-24 23:12:55.049737','6','Duarte','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (57,'2020-11-24 23:12:55.052610','7','Elías Piña','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (58,'2020-11-24 23:12:55.055023','8','El Seibo','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (59,'2020-11-24 23:12:55.057527','9','Espaillat','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (60,'2020-11-24 23:12:55.064073','10','Hato Mayor','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (61,'2020-11-24 23:12:55.069606','11','Hermanas Mirabal','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (62,'2020-11-24 23:12:55.072332','12','Independencia','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (63,'2020-11-24 23:12:55.074803','13','La Altagracia','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (64,'2020-11-24 23:12:55.082339','14','La Romana','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (65,'2020-11-24 23:12:55.085721','15','La Vega','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (66,'2020-11-24 23:12:55.088194','16','María Trinidad Sánchez','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (67,'2020-11-24 23:12:55.090852','17','Monseñor Nouel','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (68,'2020-11-24 23:12:55.095330','18','Monte Cristi','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (69,'2020-11-24 23:12:55.098256','19','Monte Plata','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (70,'2020-11-24 23:12:55.100748','20','Pedernales','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (71,'2020-11-24 23:12:55.103713','21','Peravia','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (72,'2020-11-24 23:12:55.106026','22','Puerto Plata','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (73,'2020-11-24 23:12:55.108327','23','Samaná','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (74,'2020-11-24 23:12:55.111835','24','Sánchez Ramírez','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (75,'2020-11-24 23:12:55.115165','25','San Cristóbal','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (76,'2020-11-24 23:12:55.118022','26','San José de Ocoa','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (77,'2020-11-24 23:12:55.122856','27','San Juan','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (78,'2020-11-24 23:12:55.126522','28','San Pedro de Macorís','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (79,'2020-11-24 23:12:55.129497','29','Santiago','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (80,'2020-11-24 23:12:55.132215','30','Santiago Rodríguez','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (81,'2020-11-24 23:12:55.134655','31','Santo Domingo','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (82,'2020-11-24 23:12:55.137358','32','Valverde','new through import_export',12,1,1);
INSERT INTO "django_admin_log" VALUES (83,'2020-11-24 23:26:53.735575','3','Azua de Compostela','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (84,'2020-11-24 23:26:53.740014','4','Estebanía','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (85,'2020-11-24 23:26:53.742741','5','Guayabal','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (86,'2020-11-24 23:26:53.748953','6','Las Charcas','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (87,'2020-11-24 23:26:53.769396','7','Las Yayas de Viajama','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (88,'2020-11-24 23:26:53.773946','8','Padre Las Casas','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (89,'2020-11-24 23:26:53.777917','9','Peralta','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (90,'2020-11-24 23:26:53.784646','10','Pueblo Viejo','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (91,'2020-11-24 23:26:53.788705','11','Sabana Yegua','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (92,'2020-11-24 23:26:53.791931','12','Tábara Arriba','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (93,'2020-11-24 23:26:53.797247','13','Neiba','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (94,'2020-11-24 23:26:53.803544','14','Galván','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (95,'2020-11-24 23:26:53.819289','15','Los Ríos','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (96,'2020-11-24 23:26:53.831678','16','Tamayo','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (97,'2020-11-24 23:26:53.841687','17','Villa Jaragua','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (98,'2020-11-24 23:26:53.881215','18','Barahona','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (99,'2020-11-24 23:26:53.884821','19','Cabral','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (100,'2020-11-24 23:26:53.889559','20','El Peñón','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (101,'2020-11-24 23:26:53.898124','21','Enriquillo','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (102,'2020-11-24 23:26:53.902279','22','Fundación','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (103,'2020-11-24 23:26:53.907381','23','Jaquimeyes','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (104,'2020-11-24 23:26:53.913387','24','La Ciénaga','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (105,'2020-11-24 23:26:53.917391','25','Las Salinas','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (106,'2020-11-24 23:26:53.922624','26','Paraíso','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (107,'2020-11-24 23:26:53.926194','27','Polo','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (108,'2020-11-24 23:26:53.930142','28','Vicente Noble','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (109,'2020-11-24 23:26:53.936903','29','Dajabón','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (110,'2020-11-24 23:26:53.941389','30','El Pino','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (111,'2020-11-24 23:26:53.946824','31','Loma de Cabrera','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (112,'2020-11-24 23:26:53.951580','32','Partido','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (113,'2020-11-24 23:26:53.956392','33','Restauración','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (114,'2020-11-24 23:26:53.960567','34','Distrito Nacional','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (115,'2020-11-24 23:26:53.964728','35','San Francisco de Macorís','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (116,'2020-11-24 23:26:53.968551','36','Arenoso','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (117,'2020-11-24 23:26:53.972792','37','Castillo','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (118,'2020-11-24 23:26:53.976780','38','Eugenio María de Hostos','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (119,'2020-11-24 23:26:53.980332','39','Las Guáranas','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (120,'2020-11-24 23:26:53.983705','40','Pimentel','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (121,'2020-11-24 23:26:53.986794','41','Villa Riva','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (122,'2020-11-24 23:26:53.990373','42','Comendador','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (123,'2020-11-24 23:26:53.994838','43','Bánica','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (124,'2020-11-24 23:26:53.998435','44','El Llano','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (125,'2020-11-24 23:26:54.004457','45','Hondo Valle','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (126,'2020-11-24 23:26:54.012255','46','Juan Santiago','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (127,'2020-11-24 23:26:54.017228','47','Pedro Santana','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (128,'2020-11-24 23:26:54.021674','48','El Seibo','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (129,'2020-11-24 23:26:54.024953','49','Miches','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (130,'2020-11-24 23:26:54.027906','50','Moca','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (131,'2020-11-24 23:26:54.031829','51','Cayetano Germosén','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (132,'2020-11-24 23:26:54.035754','52','Gaspar Hernández','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (133,'2020-11-24 23:26:54.040226','53','Jamao al Norte','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (134,'2020-11-24 23:26:54.043244','54','Hato Mayor del Rey','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (135,'2020-11-24 23:26:54.052231','55','El Valle','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (136,'2020-11-24 23:26:54.063692','56','Sabana de la Mar','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (137,'2020-11-24 23:26:54.066996','57','Salcedo','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (138,'2020-11-24 23:26:54.071197','58','Tenares','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (139,'2020-11-24 23:26:54.076250','59','Villa Tapia','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (140,'2020-11-24 23:26:54.079491','60','Jimaní','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (141,'2020-11-24 23:26:54.084497','61','Cristóbal','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (142,'2020-11-24 23:26:54.088062','62','Duvergé','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (143,'2020-11-24 23:26:54.090705','63','La Descubierta','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (144,'2020-11-24 23:26:54.094958','64','Mella','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (145,'2020-11-24 23:26:54.098555','65','Postrer Río','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (146,'2020-11-24 23:26:54.102866','66','Higüey','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (147,'2020-11-24 23:26:54.107078','67','San Rafael del Yuma','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (148,'2020-11-24 23:26:54.113042','68','La Romana','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (149,'2020-11-24 23:26:54.116908','69','Guaymate','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (150,'2020-11-24 23:26:54.121484','70','Villa Hermosa','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (151,'2020-11-24 23:26:54.125584','71','La Concepción de La Vega','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (152,'2020-11-24 23:26:54.130478','72','Constanza','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (153,'2020-11-24 23:26:54.134407','73','Jarabacoa','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (154,'2020-11-24 23:26:54.138926','74','Jima Abajo','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (155,'2020-11-24 23:26:54.142842','75','Nagua','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (156,'2020-11-24 23:26:54.146685','76','Cabrera','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (157,'2020-11-24 23:26:54.156258','77','El Factor','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (158,'2020-11-24 23:26:54.160600','78','Río San Juan','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (159,'2020-11-24 23:26:54.164340','79','Bonao','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (160,'2020-11-24 23:26:54.167742','80','Maimón','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (161,'2020-11-24 23:26:54.171382','81','Piedra Blanca','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (162,'2020-11-24 23:26:54.175432','82','Montecristi','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (163,'2020-11-24 23:26:54.178768','83','Castañuela','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (164,'2020-11-24 23:26:54.182265','84','Guayubín','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (165,'2020-11-24 23:26:54.187960','85','Las Matas de Santa Cruz','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (166,'2020-11-24 23:26:54.192395','86','Pepillo Salcedo','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (167,'2020-11-24 23:26:54.197239','87','Villa Vásquez','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (168,'2020-11-24 23:26:54.201717','88','Monte Plata','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (169,'2020-11-24 23:26:54.206832','89','Bayaguana','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (170,'2020-11-24 23:26:54.213071','90','Peralvillo','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (171,'2020-11-24 23:26:54.216774','91','Sabana Grande de Boyá','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (172,'2020-11-24 23:26:54.222059','92','Yamasá','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (173,'2020-11-24 23:26:54.225828','93','Pedernales','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (174,'2020-11-24 23:26:54.229051','94','Oviedo','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (175,'2020-11-24 23:26:54.233132','95','Baní','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (176,'2020-11-24 23:26:54.237351','96','Nizao','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (177,'2020-11-24 23:26:54.241305','97','Puerto Plata','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (178,'2020-11-24 23:26:54.246797','98','Altamira','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (179,'2020-11-24 23:26:54.261140','99','Guananico','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (180,'2020-11-24 23:26:54.264633','100','Imbert','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (181,'2020-11-24 23:26:54.269095','101','Los Hidalgos','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (182,'2020-11-24 23:26:54.273873','102','Luperón','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (183,'2020-11-24 23:26:54.276968','103','Sosúa','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (184,'2020-11-24 23:26:54.281537','104','Villa Isabela','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (185,'2020-11-24 23:26:54.285636','105','Villa Montellano','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (186,'2020-11-24 23:26:54.289188','106','Samaná','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (187,'2020-11-24 23:26:54.291925','107','Las Terrenas','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (188,'2020-11-24 23:26:54.295109','108','Sánchez','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (189,'2020-11-24 23:26:54.298573','109','Cotuí','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (190,'2020-11-24 23:26:54.303070','110','Cevicos','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (191,'2020-11-24 23:26:54.308544','111','Fantino','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (192,'2020-11-24 23:26:54.316061','112','La Mata','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (193,'2020-11-24 23:26:54.320724','113','San Cristóbal','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (194,'2020-11-24 23:26:54.324599','114','Bajos de Haina','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (195,'2020-11-24 23:26:54.328468','115','Cambita Garabito','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (196,'2020-11-24 23:26:54.332229','116','Los Cacaos','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (197,'2020-11-24 23:26:54.335389','117','Sabana Grande de Palenque','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (198,'2020-11-24 23:26:54.338664','118','San Gregorio de Nigua','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (199,'2020-11-24 23:26:54.342378','119','Villa Altagracia','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (200,'2020-11-24 23:26:54.345203','120','Yaguate','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (201,'2020-11-24 23:26:54.354699','121','San José de Ocoa','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (202,'2020-11-24 23:26:54.361219','122','Rancho Arriba','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (203,'2020-11-24 23:26:54.364389','123','Sabana Larga','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (204,'2020-11-24 23:26:54.367202','124','San Juan de la Maguana','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (205,'2020-11-24 23:26:54.370257','125','Bohechío','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (206,'2020-11-24 23:26:54.373244','126','El Cercado','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (207,'2020-11-24 23:26:54.376236','127','Juan de Herrera','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (208,'2020-11-24 23:26:54.379002','128','Las Matas de Farfán','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (209,'2020-11-24 23:26:54.382980','129','Vallejuelo','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (210,'2020-11-24 23:26:54.385850','130','San Pedro de Macorís','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (211,'2020-11-24 23:26:54.388471','131','Consuelo','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (212,'2020-11-24 23:26:54.390993','132','Guayacanes','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (213,'2020-11-24 23:26:54.393758','133','Quisqueya','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (214,'2020-11-24 23:26:54.396465','134','Ramón Santana','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (215,'2020-11-24 23:26:54.400234','135','San José de Los Llanos','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (216,'2020-11-24 23:26:54.405151','136','Santiago','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (217,'2020-11-24 23:26:54.409357','137','Bisonó','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (218,'2020-11-24 23:26:54.412749','138','Jánico','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (219,'2020-11-24 23:26:54.415565','139','Licey al Medio','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (220,'2020-11-24 23:26:54.419074','140','Puñal','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (221,'2020-11-24 23:26:54.422840','141','Sabana Iglesia','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (222,'2020-11-24 23:26:54.426076','142','San José de las Matas','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (223,'2020-11-24 23:26:54.429588','143','Tamboril','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (224,'2020-11-24 23:26:54.433678','144','Villa González','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (225,'2020-11-24 23:26:54.437053','145','San Ignacio de Sabaneta','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (226,'2020-11-24 23:26:54.439904','146','Los Almácigos','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (227,'2020-11-24 23:26:54.443436','147','Monción','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (228,'2020-11-24 23:26:54.450966','148','Santo Domingo Este','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (229,'2020-11-24 23:26:54.454831','149','Boca Chica','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (230,'2020-11-24 23:26:54.457958','150','Los Alcarrizos','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (231,'2020-11-24 23:26:54.461099','151','Pedro Brand','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (232,'2020-11-24 23:26:54.463779','152','San Antonio de Guerra','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (233,'2020-11-24 23:26:54.467263','153','Santo Domingo Norte','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (234,'2020-11-24 23:26:54.469744','154','Santo Domingo Oeste','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (235,'2020-11-24 23:26:54.473437','155','Mao','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (236,'2020-11-24 23:26:54.476521','156','Esperanza','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (237,'2020-11-24 23:26:54.479711','157','Laguna Salada','new through import_export',11,1,1);
INSERT INTO "django_admin_log" VALUES (238,'2020-11-25 20:17:11.086794','31','Santo Domingo','[{"changed": {"fields": ["Location f"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (239,'2020-11-25 20:17:19.546026','31','Santo Domingo','[{"changed": {"fields": ["Location f"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (240,'2020-11-25 20:24:14.315201','29','Santiago','[{"changed": {"fields": ["Location f"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (241,'2020-11-25 20:35:28.237633','31','Santo Domingo','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (242,'2020-11-25 20:35:38.629382','31','Santo Domingo','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (243,'2020-11-25 20:37:36.120566','31','Santo Domingo','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (244,'2020-11-25 20:37:58.448199','29','Santiago','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (245,'2020-11-25 22:20:05.738278','28','San Pedro de Macorís','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (246,'2020-11-25 22:43:21.363800','30','Santiago Rodríguez','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (247,'2020-11-25 22:43:34.284740','32','Valverde','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (248,'2020-11-25 22:43:57.615079','27','San Juan','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (249,'2020-11-25 22:44:07.506859','26','San José de Ocoa','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (250,'2020-11-25 22:44:24.194650','25','San Cristóbal','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (251,'2020-11-25 22:44:38.351537','24','Sánchez Ramírez','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (252,'2020-11-25 22:44:50.904680','23','Samaná','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (253,'2020-11-25 22:45:00.584788','22','Puerto Plata','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (254,'2020-11-25 22:45:09.121312','21','Peravia','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (255,'2020-11-25 22:45:22.721343','20','Pedernales','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (256,'2020-11-25 22:45:32.996925','19','Monte Plata','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_admin_log" VALUES (257,'2020-11-25 22:45:42.381026','18','Monte Cristi','[{"changed": {"fields": ["Location m"]}}]',12,1,2);
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'blog','post');
INSERT INTO "django_content_type" VALUES (8,'users','profile');
INSERT INTO "django_content_type" VALUES (9,'Patients','patient');
INSERT INTO "django_content_type" VALUES (10,'vaccine','vaccine');
INSERT INTO "django_content_type" VALUES (11,'location','municipio');
INSERT INTO "django_content_type" VALUES (12,'location','provincia');
INSERT INTO "django_content_type" VALUES (13,'location','maplocation');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_posts','Can add posts');
INSERT INTO "auth_permission" VALUES (26,7,'change_posts','Can change posts');
INSERT INTO "auth_permission" VALUES (27,7,'delete_posts','Can delete posts');
INSERT INTO "auth_permission" VALUES (28,7,'view_posts','Can view posts');
INSERT INTO "auth_permission" VALUES (29,7,'add_post','Can add post');
INSERT INTO "auth_permission" VALUES (30,7,'change_post','Can change post');
INSERT INTO "auth_permission" VALUES (31,7,'delete_post','Can delete post');
INSERT INTO "auth_permission" VALUES (32,7,'view_post','Can view post');
INSERT INTO "auth_permission" VALUES (33,8,'add_profile','Can add profile');
INSERT INTO "auth_permission" VALUES (34,8,'change_profile','Can change profile');
INSERT INTO "auth_permission" VALUES (35,8,'delete_profile','Can delete profile');
INSERT INTO "auth_permission" VALUES (36,8,'view_profile','Can view profile');
INSERT INTO "auth_permission" VALUES (37,9,'add_patient','Can add patient');
INSERT INTO "auth_permission" VALUES (38,9,'change_patient','Can change patient');
INSERT INTO "auth_permission" VALUES (39,9,'delete_patient','Can delete patient');
INSERT INTO "auth_permission" VALUES (40,9,'view_patient','Can view patient');
INSERT INTO "auth_permission" VALUES (41,10,'add_vaccine','Can add vaccine');
INSERT INTO "auth_permission" VALUES (42,10,'change_vaccine','Can change vaccine');
INSERT INTO "auth_permission" VALUES (43,10,'delete_vaccine','Can delete vaccine');
INSERT INTO "auth_permission" VALUES (44,10,'view_vaccine','Can view vaccine');
INSERT INTO "auth_permission" VALUES (45,11,'add_municipio','Can add municipio');
INSERT INTO "auth_permission" VALUES (46,11,'change_municipio','Can change municipio');
INSERT INTO "auth_permission" VALUES (47,11,'delete_municipio','Can delete municipio');
INSERT INTO "auth_permission" VALUES (48,11,'view_municipio','Can view municipio');
INSERT INTO "auth_permission" VALUES (49,12,'add_provincia','Can add provincia');
INSERT INTO "auth_permission" VALUES (50,12,'change_provincia','Can change provincia');
INSERT INTO "auth_permission" VALUES (51,12,'delete_provincia','Can delete provincia');
INSERT INTO "auth_permission" VALUES (52,12,'view_provincia','Can view provincia');
INSERT INTO "auth_permission" VALUES (53,13,'add_maplocation','Can add map location');
INSERT INTO "auth_permission" VALUES (54,13,'change_maplocation','Can change map location');
INSERT INTO "auth_permission" VALUES (55,13,'delete_maplocation','Can delete map location');
INSERT INTO "auth_permission" VALUES (56,13,'view_maplocation','Can view map location');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$180000$Mvx3uVbfosNl$geieyyxf+GxFuXqpgHhYefFOacJCBcruyN+sR3PJWUo=','2020-11-26 13:18:50.110857',1,'jeanfondeur','Jean','jean@fondeurs.com',1,1,'2020-07-16 23:38:45','Fondeur');
INSERT INTO "auth_user" VALUES (9,'pbkdf2_sha256$180000$TeKg0nfbwMwe$s3yTOeWPtxDo4ITqy9fY0XvpCJ6sxxYqKeReOHY5G6Q=','2020-09-11 00:19:11.362623',1,'odsadmin','','jean@beachpixels.com',1,1,'2020-09-11 00:18:50.986795','');
INSERT INTO "auth_user" VALUES (10,'pbkdf2_sha256$180000$bwR7OqRLrEii$7Oehug74LW6IMUxMAQxYowsGRbT0pfOtmIl4pE22tZM=','2020-11-16 13:20:50.884511',0,'use','Elea','jfondeur@gmail.com',0,1,'2020-11-12 12:36:52','Fondeur');
INSERT INTO "auth_user" VALUES (11,'pbkdf2_sha256$180000$R1vI2RdR3bsh$bFGahQcTue23Mt2GlssIMTelffYqntqp37P7Gt5Q4WE=','2020-11-16 14:04:49.801218',0,'jose','Jose','cana@gmail.com',0,1,'2020-11-16 14:04:40.297403','Canseco');
INSERT INTO "auth_user" VALUES (12,'pbkdf2_sha256$180000$2mPq51sIev3n$D7oFq0zzuIGozY7pBTpielOdUJkjkBAaPhDTAJlDpUA=','2020-11-24 23:30:33.708516',0,'bruno','Bruno','bruno@gmail.com',0,1,'2020-11-24 23:30:19.513588','Diaz');
INSERT INTO "django_session" VALUES ('jfjcjea7iqw8a8w594nj0hp5h2rpfvtu','ZGNjNDQ0N2Q0ZTMwNzUwZjJmMzVhYTFkNGM0NzhiNjE4NTE0YjM4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NDFjNWVkMmJkYWY3ZTRlMmQwNGJjZDcyODM2MmMzYmViYzRjYTUwIn0=','2020-08-08 00:22:50.213997');
INSERT INTO "django_session" VALUES ('ypm7h9c14j695n8uqqi2wvnxaehwwck9','NWEyNDU5NmY2MTYzNjRlOWViYWZmMGQ4OTA1NmNhNGVlZjQwY2Q2Njp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNjgyZTNjYzU3OGJhY2ZkZDM0YTM4MDYyMTJlMmY4NmI3ODJkNzVjIn0=','2020-09-25 00:20:50.284801');
INSERT INTO "django_session" VALUES ('4a37adqgl2hjj1h0fjp3anfwgpdkfbtq','N2E3MjlhMmY4MWY1N2Y3ZjA4MWRhZTZiMzRkMDlmMzg2YmRhNDc0OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NzBlNGQ0MDRiMGQ0MTdjMWQwMTZkNDQ4M2JiOGRhOTNiM2IxZDI1In0=','2020-09-25 00:53:30.881659');
INSERT INTO "django_session" VALUES ('dqrjz4nbwcslbuk0ss6nw1asv4dicog2','YzU2Zjg3OWIwMjcyOGViN2VlZWM3YWVhOTkwOGMxMDE1Y2QyZTJiYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjU4NzBiMDU0NzBkMDgxMGJjZmFlODU3NjEzMzc0YWNiMWI0M2E4In0=','2020-11-26 12:19:10.072356');
INSERT INTO "django_session" VALUES ('tfn7wq47ldxvckszdg5mhxbpzaqpg5d5','MzhjM2FjYTE4MjI2OWZkYWM1NTI2OGJlNTNlYTgwYTZjM2FlMjA5Yzp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWJmODIwMWI1NTUyNDIzZjlkZjcwNThjNjhhYmY3Yjk0YjEzYWQ2NiJ9','2020-12-08 23:30:33.714673');
INSERT INTO "django_session" VALUES ('o8tnbbagygmaqt6cammku0pulg2ggzs6','YzU2Zjg3OWIwMjcyOGViN2VlZWM3YWVhOTkwOGMxMDE1Y2QyZTJiYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjU4NzBiMDU0NzBkMDgxMGJjZmFlODU3NjEzMzc0YWNiMWI0M2E4In0=','2020-12-10 13:18:50.121969');
INSERT INTO "blog_post" VALUES (1,'Esto es la Prueba 1','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum','2020-07-17 00:04:24',1);
INSERT INTO "blog_post" VALUES (2,'Blog test 2','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum','2020-07-17 00:05:10',1);
INSERT INTO "blog_post" VALUES (3,'Blog test 3','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum','2020-07-17 00:05:20',1);
INSERT INTO "users_profile" VALUES (7,'default.jpg',9);
INSERT INTO "users_profile" VALUES (8,'profile_pics/holeinone-bg-mobile.jpg',1);
INSERT INTO "users_profile" VALUES (9,'default.jpg',10);
INSERT INTO "users_profile" VALUES (10,'default.jpg',11);
INSERT INTO "users_profile" VALUES (11,'default.jpg',12);
INSERT INTO "location_municipio" VALUES (3,'Azua de Compostela',1);
INSERT INTO "location_municipio" VALUES (4,'Estebanía',1);
INSERT INTO "location_municipio" VALUES (5,'Guayabal',1);
INSERT INTO "location_municipio" VALUES (6,'Las Charcas',1);
INSERT INTO "location_municipio" VALUES (7,'Las Yayas de Viajama',1);
INSERT INTO "location_municipio" VALUES (8,'Padre Las Casas',1);
INSERT INTO "location_municipio" VALUES (9,'Peralta',1);
INSERT INTO "location_municipio" VALUES (10,'Pueblo Viejo',1);
INSERT INTO "location_municipio" VALUES (11,'Sabana Yegua',1);
INSERT INTO "location_municipio" VALUES (12,'Tábara Arriba',1);
INSERT INTO "location_municipio" VALUES (13,'Neiba',2);
INSERT INTO "location_municipio" VALUES (14,'Galván',2);
INSERT INTO "location_municipio" VALUES (15,'Los Ríos',2);
INSERT INTO "location_municipio" VALUES (16,'Tamayo',2);
INSERT INTO "location_municipio" VALUES (17,'Villa Jaragua',2);
INSERT INTO "location_municipio" VALUES (18,'Barahona',3);
INSERT INTO "location_municipio" VALUES (19,'Cabral',3);
INSERT INTO "location_municipio" VALUES (20,'El Peñón',3);
INSERT INTO "location_municipio" VALUES (21,'Enriquillo',3);
INSERT INTO "location_municipio" VALUES (22,'Fundación',3);
INSERT INTO "location_municipio" VALUES (23,'Jaquimeyes',3);
INSERT INTO "location_municipio" VALUES (24,'La Ciénaga',3);
INSERT INTO "location_municipio" VALUES (25,'Las Salinas',3);
INSERT INTO "location_municipio" VALUES (26,'Paraíso',3);
INSERT INTO "location_municipio" VALUES (27,'Polo',3);
INSERT INTO "location_municipio" VALUES (28,'Vicente Noble',3);
INSERT INTO "location_municipio" VALUES (29,'Dajabón',4);
INSERT INTO "location_municipio" VALUES (30,'El Pino',4);
INSERT INTO "location_municipio" VALUES (31,'Loma de Cabrera',4);
INSERT INTO "location_municipio" VALUES (32,'Partido',4);
INSERT INTO "location_municipio" VALUES (33,'Restauración',4);
INSERT INTO "location_municipio" VALUES (34,'Distrito Nacional',5);
INSERT INTO "location_municipio" VALUES (35,'San Francisco de Macorís',6);
INSERT INTO "location_municipio" VALUES (36,'Arenoso',6);
INSERT INTO "location_municipio" VALUES (37,'Castillo',6);
INSERT INTO "location_municipio" VALUES (38,'Eugenio María de Hostos',6);
INSERT INTO "location_municipio" VALUES (39,'Las Guáranas',6);
INSERT INTO "location_municipio" VALUES (40,'Pimentel',6);
INSERT INTO "location_municipio" VALUES (41,'Villa Riva',6);
INSERT INTO "location_municipio" VALUES (42,'Comendador',7);
INSERT INTO "location_municipio" VALUES (43,'Bánica',7);
INSERT INTO "location_municipio" VALUES (44,'El Llano',7);
INSERT INTO "location_municipio" VALUES (45,'Hondo Valle',7);
INSERT INTO "location_municipio" VALUES (46,'Juan Santiago',7);
INSERT INTO "location_municipio" VALUES (47,'Pedro Santana',7);
INSERT INTO "location_municipio" VALUES (48,'El Seibo',8);
INSERT INTO "location_municipio" VALUES (49,'Miches',8);
INSERT INTO "location_municipio" VALUES (50,'Moca',9);
INSERT INTO "location_municipio" VALUES (51,'Cayetano Germosén',9);
INSERT INTO "location_municipio" VALUES (52,'Gaspar Hernández',9);
INSERT INTO "location_municipio" VALUES (53,'Jamao al Norte',9);
INSERT INTO "location_municipio" VALUES (54,'Hato Mayor del Rey',10);
INSERT INTO "location_municipio" VALUES (55,'El Valle',10);
INSERT INTO "location_municipio" VALUES (56,'Sabana de la Mar',10);
INSERT INTO "location_municipio" VALUES (57,'Salcedo',11);
INSERT INTO "location_municipio" VALUES (58,'Tenares',11);
INSERT INTO "location_municipio" VALUES (59,'Villa Tapia',11);
INSERT INTO "location_municipio" VALUES (60,'Jimaní',12);
INSERT INTO "location_municipio" VALUES (61,'Cristóbal',12);
INSERT INTO "location_municipio" VALUES (62,'Duvergé',12);
INSERT INTO "location_municipio" VALUES (63,'La Descubierta',12);
INSERT INTO "location_municipio" VALUES (64,'Mella',12);
INSERT INTO "location_municipio" VALUES (65,'Postrer Río',12);
INSERT INTO "location_municipio" VALUES (66,'Higüey',13);
INSERT INTO "location_municipio" VALUES (67,'San Rafael del Yuma',13);
INSERT INTO "location_municipio" VALUES (68,'La Romana',14);
INSERT INTO "location_municipio" VALUES (69,'Guaymate',14);
INSERT INTO "location_municipio" VALUES (70,'Villa Hermosa',14);
INSERT INTO "location_municipio" VALUES (71,'La Concepción de La Vega',15);
INSERT INTO "location_municipio" VALUES (72,'Constanza',15);
INSERT INTO "location_municipio" VALUES (73,'Jarabacoa',15);
INSERT INTO "location_municipio" VALUES (74,'Jima Abajo',15);
INSERT INTO "location_municipio" VALUES (75,'Nagua',16);
INSERT INTO "location_municipio" VALUES (76,'Cabrera',16);
INSERT INTO "location_municipio" VALUES (77,'El Factor',16);
INSERT INTO "location_municipio" VALUES (78,'Río San Juan',16);
INSERT INTO "location_municipio" VALUES (79,'Bonao',17);
INSERT INTO "location_municipio" VALUES (80,'Maimón',17);
INSERT INTO "location_municipio" VALUES (81,'Piedra Blanca',17);
INSERT INTO "location_municipio" VALUES (82,'Montecristi',18);
INSERT INTO "location_municipio" VALUES (83,'Castañuela',18);
INSERT INTO "location_municipio" VALUES (84,'Guayubín',18);
INSERT INTO "location_municipio" VALUES (85,'Las Matas de Santa Cruz',18);
INSERT INTO "location_municipio" VALUES (86,'Pepillo Salcedo',18);
INSERT INTO "location_municipio" VALUES (87,'Villa Vásquez',18);
INSERT INTO "location_municipio" VALUES (88,'Monte Plata',19);
INSERT INTO "location_municipio" VALUES (89,'Bayaguana',19);
INSERT INTO "location_municipio" VALUES (90,'Peralvillo',19);
INSERT INTO "location_municipio" VALUES (91,'Sabana Grande de Boyá',19);
INSERT INTO "location_municipio" VALUES (92,'Yamasá',19);
INSERT INTO "location_municipio" VALUES (93,'Pedernales',20);
INSERT INTO "location_municipio" VALUES (94,'Oviedo',20);
INSERT INTO "location_municipio" VALUES (95,'Baní',21);
INSERT INTO "location_municipio" VALUES (96,'Nizao',21);
INSERT INTO "location_municipio" VALUES (97,'Puerto Plata',22);
INSERT INTO "location_municipio" VALUES (98,'Altamira',22);
INSERT INTO "location_municipio" VALUES (99,'Guananico',22);
INSERT INTO "location_municipio" VALUES (100,'Imbert',22);
INSERT INTO "location_municipio" VALUES (101,'Los Hidalgos',22);
INSERT INTO "location_municipio" VALUES (102,'Luperón',22);
INSERT INTO "location_municipio" VALUES (103,'Sosúa',22);
INSERT INTO "location_municipio" VALUES (104,'Villa Isabela',22);
INSERT INTO "location_municipio" VALUES (105,'Villa Montellano',22);
INSERT INTO "location_municipio" VALUES (106,'Samaná',23);
INSERT INTO "location_municipio" VALUES (107,'Las Terrenas',23);
INSERT INTO "location_municipio" VALUES (108,'Sánchez',23);
INSERT INTO "location_municipio" VALUES (109,'Cotuí',24);
INSERT INTO "location_municipio" VALUES (110,'Cevicos',24);
INSERT INTO "location_municipio" VALUES (111,'Fantino',24);
INSERT INTO "location_municipio" VALUES (112,'La Mata',24);
INSERT INTO "location_municipio" VALUES (113,'San Cristóbal',25);
INSERT INTO "location_municipio" VALUES (114,'Bajos de Haina',25);
INSERT INTO "location_municipio" VALUES (115,'Cambita Garabito',25);
INSERT INTO "location_municipio" VALUES (116,'Los Cacaos',25);
INSERT INTO "location_municipio" VALUES (117,'Sabana Grande de Palenque',25);
INSERT INTO "location_municipio" VALUES (118,'San Gregorio de Nigua',25);
INSERT INTO "location_municipio" VALUES (119,'Villa Altagracia',25);
INSERT INTO "location_municipio" VALUES (120,'Yaguate',25);
INSERT INTO "location_municipio" VALUES (121,'San José de Ocoa',26);
INSERT INTO "location_municipio" VALUES (122,'Rancho Arriba',26);
INSERT INTO "location_municipio" VALUES (123,'Sabana Larga',26);
INSERT INTO "location_municipio" VALUES (124,'San Juan de la Maguana',27);
INSERT INTO "location_municipio" VALUES (125,'Bohechío',27);
INSERT INTO "location_municipio" VALUES (126,'El Cercado',27);
INSERT INTO "location_municipio" VALUES (127,'Juan de Herrera',27);
INSERT INTO "location_municipio" VALUES (128,'Las Matas de Farfán',27);
INSERT INTO "location_municipio" VALUES (129,'Vallejuelo',27);
INSERT INTO "location_municipio" VALUES (130,'San Pedro de Macorís',28);
INSERT INTO "location_municipio" VALUES (131,'Consuelo',28);
INSERT INTO "location_municipio" VALUES (132,'Guayacanes',28);
INSERT INTO "location_municipio" VALUES (133,'Quisqueya',28);
INSERT INTO "location_municipio" VALUES (134,'Ramón Santana',28);
INSERT INTO "location_municipio" VALUES (135,'San José de Los Llanos',28);
INSERT INTO "location_municipio" VALUES (136,'Santiago',29);
INSERT INTO "location_municipio" VALUES (137,'Bisonó',29);
INSERT INTO "location_municipio" VALUES (138,'Jánico',29);
INSERT INTO "location_municipio" VALUES (139,'Licey al Medio',29);
INSERT INTO "location_municipio" VALUES (140,'Puñal',29);
INSERT INTO "location_municipio" VALUES (141,'Sabana Iglesia',29);
INSERT INTO "location_municipio" VALUES (142,'San José de las Matas',29);
INSERT INTO "location_municipio" VALUES (143,'Tamboril',29);
INSERT INTO "location_municipio" VALUES (144,'Villa González',29);
INSERT INTO "location_municipio" VALUES (145,'San Ignacio de Sabaneta',30);
INSERT INTO "location_municipio" VALUES (146,'Los Almácigos',30);
INSERT INTO "location_municipio" VALUES (147,'Monción',30);
INSERT INTO "location_municipio" VALUES (148,'Santo Domingo Este',31);
INSERT INTO "location_municipio" VALUES (149,'Boca Chica',31);
INSERT INTO "location_municipio" VALUES (150,'Los Alcarrizos',31);
INSERT INTO "location_municipio" VALUES (151,'Pedro Brand',31);
INSERT INTO "location_municipio" VALUES (152,'San Antonio de Guerra',31);
INSERT INTO "location_municipio" VALUES (153,'Santo Domingo Norte',31);
INSERT INTO "location_municipio" VALUES (154,'Santo Domingo Oeste',31);
INSERT INTO "location_municipio" VALUES (155,'Mao',32);
INSERT INTO "location_municipio" VALUES (156,'Esperanza',32);
INSERT INTO "location_municipio" VALUES (157,'Laguna Salada',32);
INSERT INTO "Patients_patient" VALUES (17,'Jean','Fondeur','jfondeur@gmail.com','2020-11-24 23:28:17.245887',1,107,23);
INSERT INTO "Patients_patient" VALUES (18,'Carmen','Ovalles','ovalles@gmail.com','2020-11-24 23:28:59.629275',1,50,9);
INSERT INTO "Patients_patient" VALUES (19,'Milkeya','Kalaf','jala@dsasdas.com','2020-11-24 23:31:08.838646',12,66,13);
INSERT INTO "Patients_patient" VALUES (20,'Jean','Fdasdass','dasda@sdasda.com','2020-11-26 01:23:51.174115',1,4,1);
INSERT INTO "Patients_patient" VALUES (21,'papap','psdpasda','sdas@jsdadasd.com','2020-11-26 02:02:52.004057',1,3,1);
INSERT INTO "location_provincia" VALUES (1,'Azua','None');
INSERT INTO "location_provincia" VALUES (2,'Bahoruco','None');
INSERT INTO "location_provincia" VALUES (3,'Barahona','None');
INSERT INTO "location_provincia" VALUES (4,'Dajabón','None');
INSERT INTO "location_provincia" VALUES (5,'Distrito Nacional','None');
INSERT INTO "location_provincia" VALUES (6,'Duarte','None');
INSERT INTO "location_provincia" VALUES (7,'Elías Piña','None');
INSERT INTO "location_provincia" VALUES (8,'El Seibo','None');
INSERT INTO "location_provincia" VALUES (9,'Espaillat','None');
INSERT INTO "location_provincia" VALUES (10,'Hato Mayor','None');
INSERT INTO "location_provincia" VALUES (11,'Hermanas Mirabal','None');
INSERT INTO "location_provincia" VALUES (12,'Independencia','None');
INSERT INTO "location_provincia" VALUES (13,'La Altagracia','None');
INSERT INTO "location_provincia" VALUES (14,'La Romana','None');
INSERT INTO "location_provincia" VALUES (15,'La Vega','None');
INSERT INTO "location_provincia" VALUES (16,'María Trinidad Sánchez','None');
INSERT INTO "location_provincia" VALUES (17,'Monseñor Nouel','None');
INSERT INTO "location_provincia" VALUES (18,'Monte Cristi','Monte Cristi, Dominican Republic, 19.8473452, -71.6406361');
INSERT INTO "location_provincia" VALUES (19,'Monte Plata','Monte Plata, Dominican Republic, 18.8069496, -69.7852843');
INSERT INTO "location_provincia" VALUES (20,'Pedernales','Pedernales, Dominican Republic, 18.0368683, -71.7454674');
INSERT INTO "location_provincia" VALUES (21,'Peravia','Peravia, Dominican Republic, 18.2786594, -70.33358869999999');
INSERT INTO "location_provincia" VALUES (22,'Puerto Plata','Puerto Plata, Dominican Republic, 19.7807686, -70.6871091');
INSERT INTO "location_provincia" VALUES (23,'Samaná','Samana, Dominican Republic, 19.2030757, -69.3387664');
INSERT INTO "location_provincia" VALUES (24,'Sánchez Ramírez','Sánchez Ramírez, Dominican Republic, 19.052706, -70.1492264');
INSERT INTO "location_provincia" VALUES (25,'San Cristóbal','San Cristóbal, Dominican Republic, 18.4169111, -70.1072502');
INSERT INTO "location_provincia" VALUES (26,'San José de Ocoa','San Jose de Ocoa, Dominican Republic, 18.543858, -70.5041816');
INSERT INTO "location_provincia" VALUES (27,'San Juan','San Juan, Dominican Republic, 18.8096268, -71.2309935');
INSERT INTO "location_provincia" VALUES (28,'San Pedro de Macorís','San Pedro De Macoris, Dominican Republic, 18.46266, -69.3051234');
INSERT INTO "location_provincia" VALUES (29,'Santiago','Santiago De Los Caballeros, Dominican Republic, 19.4791963, -70.6930568');
INSERT INTO "location_provincia" VALUES (30,'Santiago Rodríguez','Santiago Rodríguez, Dominican Republic, 19.4713181, -71.33958009999999');
INSERT INTO "location_provincia" VALUES (31,'Santo Domingo','Santo Domingo, Dominican Republic, 18.4860575, -69.93121169999999');
INSERT INTO "location_provincia" VALUES (32,'Valverde','Valverde, Dominican Republic, 19.5881221, -70.98033099999999');
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "blog_posts_author_id_6f561d00" ON "blog_post" (
	"author_id"
);
CREATE INDEX IF NOT EXISTS "vaccine_vaccine_created_by_id_b2864dcb" ON "vaccine_vaccine" (
	"created_by_id"
);
CREATE INDEX IF NOT EXISTS "vaccine_vaccine_patient_id_41c676fd" ON "vaccine_vaccine" (
	"patient_id"
);
CREATE INDEX IF NOT EXISTS "location_municipio_provincia_id_353af6c2" ON "location_municipio" (
	"provincia_id"
);
CREATE INDEX IF NOT EXISTS "Patients_patient_created_by_id_8a2925f4" ON "Patients_patient" (
	"created_by_id"
);
CREATE INDEX IF NOT EXISTS "Patients_patient_location_id_f243bc81" ON "Patients_patient" (
	"location_id"
);
CREATE INDEX IF NOT EXISTS "Patients_patient_state_id_56abe368" ON "Patients_patient" (
	"state_id"
);
COMMIT;
