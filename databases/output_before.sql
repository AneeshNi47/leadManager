PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "auth_user"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "first_name" CHAR(128),
    "last_name" CHAR(128),
    "email" CHAR(512),
    "password" CHAR(512),
    "registration_key" CHAR(512),
    "reset_password_key" CHAR(512),
    "registration_id" CHAR(512)
);
INSERT INTO "auth_user" VALUES(1,'Aneesh ','Bharath','dr2633@gmail.com','pbkdf2(1000,20,sha512)$8157ce38bba4c3dd$1edaa47c8a34911a5f799fab133f4c7343ad540d','','','');
INSERT INTO "auth_user" VALUES(2,'Akhil','George','akhilgeorge442@gmail.com','pbkdf2(1000,20,sha512)$b546a337df21648d$50e2ecf1f707336ba723cd0a42c09a42b997291a','','','');
INSERT INTO "auth_user" VALUES(3,'Marketing','Staff 1','xyz@abcd.com','pbkdf2(1000,20,sha512)$b427108a968e0c0e$39964758810015c4ad7a42dbdeb2a407cbf7d156','','','');
CREATE TABLE "auth_group"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "role" CHAR(512),
    "description" TEXT
);
INSERT INTO "auth_group" VALUES(1,'Marketing','Marketing level access group');
INSERT INTO "auth_group" VALUES(2,'Admin','Administrator');
INSERT INTO "auth_group" VALUES(3,'Creator','Lead Creator Level');
INSERT INTO "auth_group" VALUES(4,'user_3','Group uniquely assigned to user 3');
CREATE TABLE "auth_membership"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER REFERENCES "auth_user" ("id") ON DELETE CASCADE  ,
    "group_id" INTEGER REFERENCES "auth_group" ("id") ON DELETE CASCADE  
);
INSERT INTO "auth_membership" VALUES(1,1,2);
INSERT INTO "auth_membership" VALUES(2,2,3);
INSERT INTO "auth_membership" VALUES(3,3,4);
CREATE TABLE "auth_permission"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "group_id" INTEGER REFERENCES "auth_group" ("id") ON DELETE CASCADE  ,
    "name" CHAR(512),
    "table_name" CHAR(512),
    "record_id" INTEGER
);
CREATE TABLE "auth_event"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "time_stamp" TIMESTAMP,
    "client_ip" CHAR(512),
    "user_id" INTEGER REFERENCES "auth_user" ("id") ON DELETE CASCADE  ,
    "origin" CHAR(512),
    "description" TEXT
);
INSERT INTO "auth_event" VALUES(1,'2019-11-18 13:06:17','49.15.140.221',NULL,'auth','Group 1 created');
INSERT INTO "auth_event" VALUES(2,'2019-11-18 13:06:17','49.15.140.221',1,'auth','User 1 Registered');
INSERT INTO "auth_event" VALUES(3,'2019-11-18 13:07:00','49.15.140.221',1,'auth','User 1 Profile updated');
INSERT INTO "auth_event" VALUES(4,'2019-11-18 13:08:39','49.15.140.221',1,'auth','User 1 Logged-out');
INSERT INTO "auth_event" VALUES(5,'2019-11-18 13:09:05','49.15.140.221',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(6,'2019-11-18 13:13:41','49.15.140.221',1,'auth','User 1 Logged-out');
INSERT INTO "auth_event" VALUES(7,'2019-11-18 13:13:53','49.15.140.221',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(8,'2019-11-18 13:14:21','83.110.100.155',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(9,'2019-11-18 15:41:50','49.15.140.221',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(10,'2019-11-19 03:33:10','49.15.133.234',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(11,'2019-11-19 08:32:58','83.110.139.79',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(12,'2019-11-19 13:41:23','27.97.211.95',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(13,'2019-11-21 08:00:29','49.15.80.142',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(14,'2019-11-22 06:24:21','27.97.167.164',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(15,'2019-11-22 13:22:29','49.15.216.224',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(16,'2019-11-23 06:03:58','27.97.170.56',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(17,'2019-11-24 13:15:28','83.110.100.206',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(18,'2019-11-24 13:58:00','83.110.100.206',1,'auth','User 1 Logged-out');
INSERT INTO "auth_event" VALUES(19,'2019-11-24 13:58:11','83.110.100.206',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(20,'2019-11-24 14:11:12','49.15.207.52',NULL,'auth','Group 3 created');
INSERT INTO "auth_event" VALUES(21,'2019-11-24 14:11:12','49.15.207.52',2,'auth','User 2 Registered');
INSERT INTO "auth_event" VALUES(22,'2019-11-24 17:51:50','27.97.220.217',2,'auth','User 2 Logged-out');
INSERT INTO "auth_event" VALUES(23,'2019-11-24 17:51:55','27.97.220.217',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(24,'2019-11-25 05:25:03','27.97.223.253',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(25,'2019-11-25 06:39:41','27.97.223.253',1,'auth','User 1 Logged-out');
INSERT INTO "auth_event" VALUES(26,'2019-11-25 06:40:07','27.97.223.253',2,'auth','User 2 Logged-in');
INSERT INTO "auth_event" VALUES(27,'2019-11-25 06:41:36','27.97.223.253',2,'auth','User 2 Logged-out');
INSERT INTO "auth_event" VALUES(28,'2019-11-25 06:41:40','27.97.223.253',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(29,'2019-11-25 07:02:43','27.97.223.253',1,'auth','User 1 Logged-out');
INSERT INTO "auth_event" VALUES(30,'2019-11-25 07:03:25','27.97.223.253',2,'auth','User 2 Logged-in');
INSERT INTO "auth_event" VALUES(31,'2019-11-25 07:03:44','27.97.223.253',2,'auth','User 2 Logged-out');
INSERT INTO "auth_event" VALUES(32,'2019-11-25 07:04:22','27.97.223.253',NULL,'auth','Group 4 created');
INSERT INTO "auth_event" VALUES(33,'2019-11-25 07:04:22','27.97.223.253',3,'auth','User 3 Registered');
INSERT INTO "auth_event" VALUES(34,'2019-11-25 07:07:39','27.97.223.253',3,'auth','User 3 Logged-out');
INSERT INTO "auth_event" VALUES(35,'2019-11-25 07:07:47','27.97.223.253',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(36,'2019-11-25 12:16:11','49.15.205.83',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(37,'2019-11-25 12:51:49','83.110.100.206',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(38,'2019-11-25 12:52:35','49.15.205.83',1,'auth','User 1 Logged-out');
INSERT INTO "auth_event" VALUES(39,'2019-11-25 13:28:04','49.15.205.83',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(40,'2019-11-25 17:51:30','49.15.211.52',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(41,'2019-11-26 04:29:37','136.22.79.165',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(42,'2019-11-26 04:32:51','27.97.218.219',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(43,'2019-11-26 05:44:16','27.97.218.219',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(44,'2019-11-26 06:52:02','27.97.218.219',1,'auth','User 1 Logged-out');
INSERT INTO "auth_event" VALUES(45,'2019-11-26 07:18:50','27.97.218.219',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(46,'2019-11-26 08:14:42','83.110.100.206',3,'auth','User 3 Logged-in');
INSERT INTO "auth_event" VALUES(47,'2019-11-26 08:15:40','83.110.100.206',3,'auth','User 3 Logged-out');
INSERT INTO "auth_event" VALUES(48,'2019-11-26 08:16:00','83.110.100.206',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(49,'2019-11-27 11:28:45','49.15.215.111',2,'auth','User 2 Logged-in');
INSERT INTO "auth_event" VALUES(50,'2019-11-27 14:40:49','27.97.216.68',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(51,'2019-11-27 16:02:14','27.97.216.68',1,'auth','User 1 Logged-out');
INSERT INTO "auth_event" VALUES(52,'2019-11-27 16:02:22','27.97.216.68',3,'auth','User 3 Logged-in');
INSERT INTO "auth_event" VALUES(53,'2019-11-27 16:05:11','27.97.216.68',3,'auth','User 3 Logged-out');
INSERT INTO "auth_event" VALUES(54,'2019-11-27 16:05:38','27.97.216.68',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(55,'2019-11-28 05:12:58','27.97.213.85',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(56,'2019-11-28 09:14:11','83.110.77.150',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(57,'2019-11-28 12:17:39','49.15.215.58',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(58,'2019-11-29 05:41:25','49.15.203.51',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(59,'2019-11-29 13:45:19','49.15.200.232',1,'auth','User 1 Logged-in');
INSERT INTO "auth_event" VALUES(60,'2019-11-30 03:32:00','27.97.219.110',1,'auth','User 1 Logged-in');
CREATE TABLE "auth_cas"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER REFERENCES "auth_user" ("id") ON DELETE CASCADE  ,
    "created_on" TIMESTAMP,
    "service" CHAR(512),
    "ticket" CHAR(512),
    "renew" CHAR(1)
);
CREATE TABLE "Fb_leads"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "In_id" CHAR(512),
    "Lead_Date" DATE,
    "campaign_id" CHAR(512),
    "campaign_name" CHAR(512),
    "is_organic" CHAR(1),
    "Course" CHAR(512),
    "platform" CHAR(512),
    "email" CHAR(512),
    "full_name" CHAR(512),
    "phone_number" CHAR(512),
    "country" CHAR(512)
, "Assigned_to" INTEGER REFERENCES "auth_user" ("id") ON DELETE CASCADE);
INSERT INTO "Fb_leads" VALUES(19,'324123353451','2008-02-05','2341235535231','Pamila Pringle','T','MBA','Website','macecoce@example.com','Jamey Lafountain','(726) 821-6076','BS',NULL);
INSERT INTO "Fb_leads" VALUES(20,'15443264512542','2008-03-11','123442542351362','Donte Thurton','F','CEO','Call','cedadudu@example.com','Merri Uitz','(540) 498-0197','AE',NULL);
INSERT INTO "Fb_leads" VALUES(127,'test',NULL,NULL,NULL,'F',NULL,'Facebook',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Fb_leads" VALUES(128,'4ytrh',NULL,NULL,NULL,'F',NULL,'Facebook',NULL,NULL,NULL,'BS',NULL);
INSERT INTO "Fb_leads" VALUES(129,'2.17E+14','2008-10-21','56','Racheal Stika','T','MBA','LinkedIn','mocomadu@example.com','Cherly Whittlesey','(165) 938-4036','AE',NULL);
INSERT INTO "Fb_leads" VALUES(130,'4.14E+14','2008-08-02','565','Normand Ryther','T','MCA','Others','cotopodu@example.com','Mia Hanify','(895) 072-2248','IN',NULL);
INSERT INTO "Fb_leads" VALUES(131,'541321543','2008-09-18','3236','Joni Franch','T','MSC','LinkedIn','ducetaco@example.com','Damian Mckellip','(021) 016-2660','IN',NULL);
INSERT INTO "Fb_leads" VALUES(132,'5465461321','2008-08-25','3236','Natalia Champney','T','CEO','Whatsapp','pocoduda@example.com','Chung Stranger','(994) 511-4740','IN',NULL);
INSERT INTO "Fb_leads" VALUES(133,'testtesttest','2008-11-12','3265','Stacey Losiewski','F','MBA','Call','tomaduce@example.com','Tamie Ibey','(059) 470-6840','US',NULL);
INSERT INTO "Fb_leads" VALUES(134,'4376576','2019-11-04','test','test','F','MBA','Others','dhgdf@gjfhgfj.com','asdfg','+98767545332','BE',NULL);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('auth_user',3);
INSERT INTO "sqlite_sequence" VALUES('auth_group',4);
INSERT INTO "sqlite_sequence" VALUES('auth_event',60);
INSERT INTO "sqlite_sequence" VALUES('auth_membership',3);
INSERT INTO "sqlite_sequence" VALUES('Fb_leads',134);
COMMIT;
