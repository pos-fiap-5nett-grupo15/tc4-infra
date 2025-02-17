CREATE DATABASE tech_1;
GO

USE tech_1;
GO

CREATE LOGIN svc_con_mngt
WITH PASSWORD = '${SVC_PASS}';
GO

CREATE USER svc_con_mngt
FOR LOGIN svc_con_mngt;
GO

USE tech_1;
GO

EXEC sp_addrolemember 'db_datareader', 'svc_con_mngt';
GO
EXEC sp_addrolemember 'db_datawriter', 'svc_con_mngt';
GO

CREATE SCHEMA ContactsManagement;
GO

CREATE TABLE ContactsManagement.Contact (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	Nome varchar(255) NOT NULL,
	Email varchar(255) NOT NULL,
	Ddd int,
	Telefone int
);
GO

IF EXISTS (SELECT name FROM sys.indexes  
            WHERE name = N'Contact_Ddd')   
    DROP INDEX IX_Contact_Ddd ON ContactsManagement.Contact;
GO

CREATE NONCLUSTERED INDEX IX_Contact_Ddd   
    ON ContactsManagement.Contact (Ddd);   
GO  

INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Mr. Kelli Robel',N'Trinity.Morissette38@gmail.com',51,82855853),
	 (N'Sonya OConnell',N'Lisette_OConner@hotmail.com',97,51006137),
	 (N'Toby Terry',N'Josiane2@yahoo.com',72,69708345),
	 (N'Dolores Watsica',N'Lesley72@hotmail.com',87,65352134),
	 (N'Sheri Bradtke IV',N'Shanelle.Boehm83@hotmail.com',93,68573890),
	 (N'Lori Effertz',N'Julio_OConnell@yahoo.com',62,67064397),
	 (N'Wilma Abernathy',N'Ignacio.Barrows@hotmail.com',68,44782172),
	 (N'Dianne Little',N'Eduardo_OKon@gmail.com',32,66138510),
	 (N'Whitney Dare',N'Osborne_Bergstrom66@hotmail.com',66,17675741),
	 (N'Ms. Jan Quigley PhD',N'Angeline28@hotmail.com',41,79192554);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Belinda Greenfelder',N'Ruben33@gmail.com',76,18818067),
	 (N'Ed Bruen',N'Vivian.Lubowitz97@yahoo.com',15,60968555),
	 (N'Dorothy Hudson I',N'Guy74@hotmail.com',40,65142078),
	 (N'Marianne Lesch',N'Alden.Reinger@gmail.com',13,64992087),
	 (N'Ms. Olga White',N'Maria.Bernier@hotmail.com',19,39786113),
	 (N'Sophia Pacocha',N'Angeline_Denesik@gmail.com',70,94837656),
	 (N'Beth Kohler',N'Orland.DAmore58@hotmail.com',46,66890965),
	 (N'Esther Crooks',N'Marilyne.Herman34@hotmail.com',31,49867592),
	 (N'Owen Watsica',N'Shad_Orn@yahoo.com',91,93383746),
	 (N'Aubrey Kunde',N'Eliezer_Quitzon23@hotmail.com',17,63230001);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Christina McKenzie',N'Adeline52@hotmail.com',20,69848249),
	 (N'Paulette Rolfson',N'Chyna.Gottlieb@hotmail.com',51,8583420),
	 (N'Drew Rogahn',N'Aaliyah.Kiehn62@hotmail.com',33,92535150),
	 (N'Sherry Smith',N'Broderick.Upton52@yahoo.com',94,38608924),
	 (N'Lynda Harber',N'Heber.Boyle@hotmail.com',17,49985910),
	 (N'Lena Runolfsson',N'Elroy_Denesik14@gmail.com',81,30216943),
	 (N'Vickie Hagenes',N'Kristofer43@hotmail.com',58,78137988),
	 (N'Lula Schuster',N'Pearl25@yahoo.com',23,83405873),
	 (N'Vicki Yost',N'Dylan.Reilly@yahoo.com',11,24464037),
	 (N'Angelo Monahan',N'Josianne.Macejkovic97@gmail.com',30,92336048);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Myra Nader',N'Mathew.Rippin97@yahoo.com',81,74826255),
	 (N'Mr. Luz Gerlach',N'Arch54@yahoo.com',50,94328942),
	 (N'Pauline Gulgowski',N'Jerald_Bednar@gmail.com',98,25358030),
	 (N'Mr. Harvey Kautzer',N'Lyric_Watsica@hotmail.com',45,88321750),
	 (N'Samantha McGlynn',N'Vinnie17@yahoo.com',48,55885997),
	 (N'Theresa Lindgren',N'Oswald64@hotmail.com',48,6034551),
	 (N'David Marvin',N'Onie.Cassin@hotmail.com',86,61482364),
	 (N'Sheryl Champlin',N'Laura_Hahn@gmail.com',38,6739058),
	 (N'Kristen Greenfelder',N'Lucile_McGlynn@hotmail.com',15,21928127),
	 (N'Ismael Hegmann',N'Carole_Ziemann7@yahoo.com',37,48066034);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Natasha Breitenberg',N'Kurt39@gmail.com',65,25729797),
	 (N'Jim Hintz',N'Pearl_Schoen28@hotmail.com',71,95295643),
	 (N'Melba Sanford',N'Ethelyn.Quigley@gmail.com',20,58340292),
	 (N'Angie Hackett',N'Peyton_Kirlin95@yahoo.com',33,47572198),
	 (N'Sherman Johns',N'Dina.Lindgren59@hotmail.com',15,34221661),
	 (N'Samuel Balistreri',N'Susanna.Pacocha33@gmail.com',95,98294227),
	 (N'Carlton Mraz',N'Lucious94@yahoo.com',10,60795097),
	 (N'Richard Rice',N'Nathaniel_Johnson95@gmail.com',42,61178457),
	 (N'Ryan Runte',N'Willa_Green@gmail.com',46,4342914),
	 (N'Ms. Steven Sawayn',N'Merl.Marquardt@yahoo.com',14,40339293);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Orville Johns',N'Lester.Stamm97@hotmail.com',94,33801048),
	 (N'Leah Lowe',N'Brooklyn_Shields18@gmail.com',16,59390862),
	 (N'Janie OKeefe II',N'Lorna_Bins19@gmail.com',58,3919307),
	 (N'Terrell Cummings',N'Scottie.Barrows25@hotmail.com',56,13113651),
	 (N'Iris Legros',N'Loma_Hickle67@yahoo.com',58,68754448),
	 (N'Dianne Wiza',N'Israel.Casper23@gmail.com',85,26411477),
	 (N'Annette McGlynn',N'Kristoffer_Boehm@yahoo.com',30,41104750),
	 (N'Mrs. Preston Jakubowski',N'Elda_Lakin@yahoo.com',81,40601194),
	 (N'Bonnie Nader',N'Royal87@hotmail.com',72,79921750),
	 (N'Kay Heaney',N'Kayden8@hotmail.com',64,85317496);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Miss Cecelia Anderson',N'Felipe_Torphy@yahoo.com',94,10512888),
	 (N'Gladys Muller',N'Conner.Herman@yahoo.com',85,75785728),
	 (N'Emily Hermann',N'Eladio.Denesik@gmail.com',54,90138620),
	 (N'Christina McGlynn',N'Bernice_Goyette@hotmail.com',55,93687891),
	 (N'David Bins',N'Carley_Vandervort69@gmail.com',10,4154837),
	 (N'Bert Fisher DVM',N'Evans_Beatty@yahoo.com',64,41422757),
	 (N'Mrs. Carmen Sauer',N'Kayden95@gmail.com',51,25790266),
	 (N'Sammy Altenwerth',N'Name.Barrows@yahoo.com',43,2391467),
	 (N'Erma Morissette',N'Fae48@hotmail.com',31,86814293),
	 (N'Olivia Block II',N'Amir30@gmail.com',99,76915050);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Becky Konopelski',N'Rowan56@gmail.com',97,90254575),
	 (N'Beatrice Mills',N'Krystina_Schowalter@yahoo.com',71,99668620),
	 (N'Julius Jaskolski',N'Vida.Bogisich72@gmail.com',27,80301332),
	 (N'Nelson Wuckert',N'Ryder.Beatty48@yahoo.com',51,69947467),
	 (N'Mrs. Billy Wuckert',N'Frederick.Gulgowski86@hotmail.com',97,90765787),
	 (N'Johnny Little',N'Cory_Frami44@yahoo.com',17,83750816),
	 (N'Wade Crona',N'Mathilde_Collier@yahoo.com',78,94106829),
	 (N'Louis Schinner',N'Jaime.Hills34@hotmail.com',34,72981802),
	 (N'Viola Hand',N'Joyce_King57@hotmail.com',95,20632465),
	 (N'Alex Roberts II',N'Lewis46@yahoo.com',34,94237611);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Lila Kub III',N'Janice45@yahoo.com',24,5945090),
	 (N'Eunice Wyman',N'Corrine.Kemmer@yahoo.com',85,45456014),
	 (N'Desiree Schuster',N'Susanna56@hotmail.com',34,53485080),
	 (N'Becky Rice DDS',N'Violette16@hotmail.com',19,19125709),
	 (N'Tasha Mayert',N'Gabe_Mayert29@gmail.com',68,50441723),
	 (N'Delores Mertz',N'Olen_VonRueden@yahoo.com',60,10279620),
	 (N'Mrs. Gerard Flatley',N'Tobin_Satterfield50@yahoo.com',54,22202480),
	 (N'Claude Schimmel DVM',N'Mitchell.Luettgen@yahoo.com',37,73573640),
	 (N'Jennie Gorczany',N'Jeramie3@hotmail.com',83,51804791),
	 (N'Edna Williamson',N'Izaiah_OConnell45@hotmail.com',33,54165543);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Cristina McDermott',N'Adriel.Trantow68@gmail.com',11,57007929),
	 (N'Van Sawayn V',N'Mollie61@hotmail.com',25,94879606),
	 (N'Ray Kozey',N'Eleazar.Pfannerstill@hotmail.com',90,54500882),
	 (N'Heidi Bradtke',N'Amani_Goodwin8@yahoo.com',41,17891811),
	 (N'Olivia Zulauf',N'Mariana_Beer82@hotmail.com',56,82094943),
	 (N'Audrey Torp',N'Rozella_Lueilwitz88@gmail.com',81,94657019),
	 (N'Miss Lora Mann',N'Irma_Greenfelder@yahoo.com',39,72381326),
	 (N'Elaine Crona I',N'Marilyne.Yost40@gmail.com',67,55370840),
	 (N'Aaron Will',N'Alessia.Ernser8@hotmail.com',36,56372815),
	 (N'Nelson Macejkovic',N'Dave67@yahoo.com',69,68048382);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Claude Robel',N'Andreane14@hotmail.com',69,318905),
	 (N'Muriel Rice',N'Loraine20@yahoo.com',87,40995347),
	 (N'Ms. Samantha Jacobi',N'Edmond.Schneider@yahoo.com',25,97855230),
	 (N'Viola Dibbert',N'Orpha_West16@gmail.com',98,52303286),
	 (N'Ron Pfeffer',N'Rey6@gmail.com',33,18539466),
	 (N'Barry Moen',N'Mark_Swift56@hotmail.com',45,73090675),
	 (N'Israel Haag',N'Justen_Kuphal@hotmail.com',63,45615803),
	 (N'Evelyn Blick',N'Karl.Gislason24@hotmail.com',77,76685771),
	 (N'Ms. Bennie Waters',N'Aylin_Cormier9@gmail.com',55,20476686),
	 (N'Elsa Hagenes',N'Cole_Hammes57@gmail.com',61,440141);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Beulah Hickle PhD',N'Earline.Dooley@yahoo.com',77,80938675),
	 (N'Ross Howe',N'Summer28@yahoo.com',21,53182625),
	 (N'Jerald Wintheiser DVM',N'Jada_Parker@yahoo.com',16,9006568),
	 (N'Tami Ward',N'Lonie68@yahoo.com',23,67190132),
	 (N'Jonathan Lowe',N'Xander21@hotmail.com',19,91711781),
	 (N'Bernice Kihn',N'Dean30@yahoo.com',82,76587393),
	 (N'Karla Schinner',N'Gene_Hackett@hotmail.com',92,73755204),
	 (N'Jennie Kilback',N'Reid_Kautzer52@yahoo.com',23,46836796),
	 (N'Mr. Gretchen Gulgowski',N'Dana63@gmail.com',37,30522329),
	 (N'Mrs. Melinda Dickens',N'Cleora_Hickle22@yahoo.com',78,44248648);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Sara Sanford',N'Matilda_Heathcote@yahoo.com',23,36577541),
	 (N'Dale Langosh',N'Alta36@hotmail.com',76,83459616),
	 (N'Lola Kris',N'Retta.Jenkins54@yahoo.com',71,5150883),
	 (N'Beth Huels',N'Quentin_Wiegand55@gmail.com',64,20656641),
	 (N'Priscilla Hayes',N'Dayton97@hotmail.com',86,43310370),
	 (N'Darrell Moore',N'Janis76@gmail.com',48,32323468),
	 (N'Gregg Langworth',N'Barton98@hotmail.com',54,7365492),
	 (N'Bradley Dare',N'Marcos78@gmail.com',69,33109173),
	 (N'Sonia Dooley',N'Lindsey95@yahoo.com',83,73179650),
	 (N'Jeffery Satterfield',N'Dillan_Hoeger24@gmail.com',11,96921980);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Ricardo Sauer',N'Marcellus.Tillman87@hotmail.com',29,55176102),
	 (N'Ebony Oberbrunner',N'Kelsie.Corkery5@hotmail.com',10,71145284),
	 (N'Mr. Toby Huels',N'Katheryn_Stamm@gmail.com',47,75195142),
	 (N'Laura Schultz DVM',N'Makenzie.Ryan@yahoo.com',59,14083010),
	 (N'Nancy Franey',N'Winnifred4@hotmail.com',69,71417296),
	 (N'Seth Reynolds I',N'Monserrat43@gmail.com',83,10913819),
	 (N'Marta Langworth',N'Berry_Legros17@hotmail.com',59,63859988),
	 (N'Barbara Krajcik IV',N'Lemuel_Swaniawski@yahoo.com',37,5395947),
	 (N'Lillian McCullough',N'Aurelio.Langworth@hotmail.com',98,26867921),
	 (N'Alfred Runolfsson',N'Luella_Roberts10@yahoo.com',47,62314808);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Marlene Waters',N'Buford.Flatley15@yahoo.com',77,90970039),
	 (N'Phyllis Klein',N'Frederick56@hotmail.com',61,48863654),
	 (N'Sammy Romaguera DDS',N'Keagan.Kirlin@hotmail.com',39,96170268),
	 (N'Theresa Wehner Sr.',N'Gabriella67@hotmail.com',62,58166735),
	 (N'Glenda Terry',N'Mariana_Barton33@hotmail.com',67,73288583),
	 (N'Dr. Darlene McClure',N'Waldo6@hotmail.com',58,3007677),
	 (N'Paula Wiza',N'Lorenzo.Tillman@hotmail.com',99,42312788),
	 (N'Bennie Padberg',N'Ellis.Berge44@hotmail.com',91,74306945),
	 (N'Scott Little',N'Javier.Emmerich@gmail.com',69,76778387),
	 (N'Wallace Ernser',N'Uriah.Robel39@yahoo.com',88,43423953);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Casey Ankunding',N'Corine_Reynolds0@gmail.com',34,79000414),
	 (N'Craig McLaughlin',N'Abdul.Bashirian@hotmail.com',30,66733890),
	 (N'Johnnie Wintheiser',N'Thora_Dooley57@gmail.com',75,13699270),
	 (N'Joshua Pfannerstill',N'Theodore35@hotmail.com',21,36758097),
	 (N'Henrietta Erdman',N'Lily_Gulgowski@gmail.com',87,3788305),
	 (N'Sheldon Nienow',N'Shemar5@hotmail.com',12,43896638),
	 (N'Miss Roger Stracke',N'Lorenzo_Barrows97@gmail.com',35,55357736),
	 (N'Billy Collier',N'Lolita_Bins4@yahoo.com',76,6692990),
	 (N'Evan Davis PhD',N'Leonel_Hermiston84@yahoo.com',81,26655265),
	 (N'Austin Russel',N'Dock46@yahoo.com',52,791457);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Mabel Schamberger',N'Barney_Rempel22@gmail.com',62,58863295),
	 (N'Dr. Derrick Schumm',N'Iva_Mante@gmail.com',64,88740878),
	 (N'Miss Natalie Skiles',N'Eliseo_Greenfelder@gmail.com',99,32659404),
	 (N'Kenny Friesen',N'Kaitlyn_VonRueden91@gmail.com',19,68337258),
	 (N'Lewis Bins',N'Austin.Bergstrom16@yahoo.com',55,31534332),
	 (N'Sally Huels',N'Sigmund_Gutmann@gmail.com',50,54529033),
	 (N'Derek Dicki',N'Dorothea.Sporer25@hotmail.com',82,21362357),
	 (N'Susie Mohr',N'Americo.Wolff84@yahoo.com',19,73317395),
	 (N'Harvey Kuhic',N'Eusebio.Heller34@yahoo.com',90,21297501),
	 (N'Gilbert Lynch',N'Felipa_Hane@gmail.com',83,78822028);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Diane Vandervort',N'Jillian26@hotmail.com',95,79381827),
	 (N'Jared Farrell',N'Onie.Jerde@hotmail.com',21,95258149),
	 (N'Wilfred Kutch',N'Janet.Hartmann62@hotmail.com',56,68029261),
	 (N'Calvin Lindgren',N'Angus.Oberbrunner51@hotmail.com',26,31720618),
	 (N'Gary Fahey',N'Rossie_Schroeder@yahoo.com',21,22798039),
	 (N'Bobby Will',N'Ford19@hotmail.com',83,96947335),
	 (N'Jon Walker I',N'Wilford25@yahoo.com',84,47948873),
	 (N'Ron McDermott DDS',N'Laisha.OKeefe8@gmail.com',53,11909614),
	 (N'Erik Olson',N'Jacques_Hauck95@gmail.com',98,85672700),
	 (N'Regina Dooley',N'Orpha51@yahoo.com',69,3844774);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Mrs. Kirk Schimmel',N'Kyle_Balistreri@yahoo.com',13,59334218),
	 (N'Kevin Gleichner',N'Bud_Brakus70@gmail.com',52,55346386),
	 (N'Mr. Dora Ruecker',N'Lonnie.Schinner3@yahoo.com',15,28548096),
	 (N'Spencer Murazik',N'Adolphus74@hotmail.com',19,95340880),
	 (N'Arthur Will',N'Norris_Abshire98@hotmail.com',71,86964814),
	 (N'Terrence Frami V',N'Travis_Gottlieb@yahoo.com',88,44043640),
	 (N'Mrs. Nathaniel Hickle',N'Porter_Batz@yahoo.com',92,88680174),
	 (N'Alfredo Parisian',N'Zane93@hotmail.com',95,97520680),
	 (N'Lucille Vandervort',N'Gretchen12@gmail.com',63,43748351),
	 (N'Woodrow Anderson',N'Miller.Bergstrom@yahoo.com',29,17413570);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Saul Nolan',N'Kayla.Nitzsche@hotmail.com',13,25630595),
	 (N'Eunice Zulauf',N'Dolly46@yahoo.com',97,6646722),
	 (N'Michael Champlin',N'Gilbert.Lynch@hotmail.com',42,77909885),
	 (N'Joann Hudson',N'Maxime_Morar85@gmail.com',31,41052942),
	 (N'Felicia Jacobi',N'Helga.Rath37@yahoo.com',39,79265022),
	 (N'Mr. Grace Hettinger',N'Sophie87@hotmail.com',52,24854912),
	 (N'Mrs. Jasmine Schmitt',N'Kristina.Mueller@gmail.com',68,4425817),
	 (N'Jared Pagac',N'Pablo.Pfeffer@yahoo.com',99,195188),
	 (N'Miranda Weimann',N'Adriel.Morissette1@hotmail.com',38,97944667),
	 (N'Raymond Nicolas I',N'Tessie_Spencer32@yahoo.com',55,96563992);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Patrick Leannon',N'Eva52@gmail.com',26,64098661),
	 (N'Ivan Rohan',N'Russ94@yahoo.com',46,95375815),
	 (N'Tina Konopelski',N'Theron.Kilback98@hotmail.com',67,85160750),
	 (N'Sherman Hahn',N'Letha41@gmail.com',30,39184619),
	 (N'Kenny Spinka',N'Maribel77@hotmail.com',39,21423463),
	 (N'Jimmie Keebler Sr.',N'Name.Prohaska@gmail.com',72,15709863),
	 (N'Terrell Hamill',N'Julie_Parker@yahoo.com',32,6690071),
	 (N'Timothy Hickle',N'Antonia.Mann@hotmail.com',24,36793010),
	 (N'Wayne Legros',N'Lauriane88@gmail.com',34,51287220),
	 (N'Jamie Cummerata II',N'Marvin.Jakubowski@hotmail.com',59,24008127);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Georgia Smith',N'Eugene22@gmail.com',37,42412444),
	 (N'Doreen Franey',N'Deondre.Leannon85@yahoo.com',71,17689647),
	 (N'Erma Smitham',N'Buster.Gorczany78@hotmail.com',89,13468990),
	 (N'Daniel Legros',N'Elmer.Casper16@hotmail.com',53,16408397),
	 (N'Judy Lubowitz',N'Maudie29@hotmail.com',88,41318440),
	 (N'Eunice Hermiston',N'Jessie_Streich@yahoo.com',33,48961091),
	 (N'Roland Schimmel',N'Oleta_Gleichner@gmail.com',82,48810556),
	 (N'Mae Barton',N'Jayde35@yahoo.com',40,85498331),
	 (N'Naomi Cormier',N'Gloria_Schinner@hotmail.com',85,60519885),
	 (N'Matthew Dickinson',N'Percival4@hotmail.com',42,62421598);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Adrienne Spinka',N'Jonatan_Okuneva@hotmail.com',79,2581062),
	 (N'Samantha Abbott',N'Tamia.Olson@hotmail.com',80,21940716),
	 (N'Earl Stracke',N'Aileen_DAmore56@hotmail.com',74,84036903),
	 (N'Freddie Davis',N'Bianka_Leannon9@hotmail.com',58,22738248),
	 (N'David Grant',N'Kyler82@hotmail.com',48,17558418),
	 (N'Louis Kulas',N'Alaina20@gmail.com',58,58333236),
	 (N'Rachael Konopelski',N'Nelle.Nolan27@gmail.com',50,7698571),
	 (N'Rosemarie Smitham',N'Pedro.Toy@hotmail.com',20,85534533),
	 (N'Phil Cummerata',N'Bernadine_Bayer74@hotmail.com',17,27121580),
	 (N'Jamie Dickinson',N'Daija.Larkin7@yahoo.com',36,9740453);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Victor Kerluke',N'Kale_Langworth@gmail.com',34,60450056),
	 (N'Essie Braun',N'Axel.Johns52@yahoo.com',34,83516790),
	 (N'Patricia Swift',N'Paul.Collins22@yahoo.com',36,50673443),
	 (N'Milton Nitzsche',N'Jeromy1@gmail.com',88,28263888),
	 (N'Salvatore McClure',N'Eloy33@gmail.com',20,40396298),
	 (N'Luke Kohler',N'Genoveva.McCullough5@gmail.com',15,41892345),
	 (N'Timothy Towne',N'Rod84@gmail.com',44,51925674),
	 (N'Crystal Dietrich',N'Darby.Upton88@gmail.com',55,39587288),
	 (N'Wanda Durgan',N'Mohammad.Schaden@gmail.com',34,65339443),
	 (N'Micheal McKenzie',N'Marty_Ziemann32@hotmail.com',26,46159139);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Earl Wintheiser',N'Freddy_Gottlieb32@gmail.com',93,70254790),
	 (N'Leslie Halvorson',N'Yadira.Zemlak@gmail.com',44,15208393),
	 (N'Ms. Kristy Lowe',N'Gerda81@hotmail.com',99,14980466),
	 (N'Thomas Legros PhD',N'Aglae.Cole@yahoo.com',42,20229217),
	 (N'Veronica Turcotte',N'Alize3@yahoo.com',31,98344251),
	 (N'Guy Morar',N'Kellen.Beer@yahoo.com',99,46394359),
	 (N'Diana Strosin',N'Jonatan95@hotmail.com',58,36313875),
	 (N'Eugene Hickle Sr.',N'Dan.Hintz@hotmail.com',19,22919399),
	 (N'Debbie Rosenbaum',N'Sigrid76@gmail.com',81,80301588),
	 (N'Bradley Price I',N'Quinten49@gmail.com',30,63317870);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Ruth Gusikowski',N'Jules14@gmail.com',21,18767961),
	 (N'Lila White',N'Damien50@yahoo.com',38,84726017),
	 (N'Tonya Haley',N'Cassidy.Christiansen43@hotmail.com',99,26251454),
	 (N'Pamela Lind',N'Ramiro27@hotmail.com',54,44397381),
	 (N'Raul Predovic',N'Cierra_Boyer@yahoo.com',44,43690626),
	 (N'Kathy Morar',N'Karen.Abshire@hotmail.com',79,38617856),
	 (N'Angelo Swaniawski',N'Providenci.Koepp3@hotmail.com',92,21367337),
	 (N'Shawn Bauch',N'Ruby_Legros12@yahoo.com',31,36349590),
	 (N'Kay Greenholt',N'Fritz.Green@hotmail.com',30,16399089),
	 (N'Ms. Janet Mann',N'Kenneth.Funk5@gmail.com',52,12659243);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Ms. Ben Dach',N'Dee.Howe21@gmail.com',44,797577),
	 (N'Stewart Beatty',N'Jeanette12@gmail.com',78,41660621),
	 (N'Alejandro Howell PhD',N'Orval.Lesch98@hotmail.com',85,8305697),
	 (N'Grace Prohaska MD',N'Trent.OKeefe@gmail.com',30,76997956),
	 (N'Juana MacGyver',N'Ayden_Rice@gmail.com',31,65667766),
	 (N'Ronnie Hauck',N'Darien.Konopelski10@gmail.com',98,7568622),
	 (N'Mr. Casey Nikolaus',N'Van77@yahoo.com',19,32585903),
	 (N'Inez OKeefe',N'Estell_Beer77@hotmail.com',77,69605295),
	 (N'Dora Bergnaum Sr.',N'Dillan_Kub@hotmail.com',60,92154632),
	 (N'Lionel Sauer',N'Leonor72@gmail.com',36,53612065);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Shelly Bechtelar',N'Dedric29@gmail.com',87,81115687),
	 (N'April Kozey IV',N'Hal_Ratke78@hotmail.com',83,6339568),
	 (N'Bobby McLaughlin',N'Thalia_Romaguera@gmail.com',81,7270167),
	 (N'Dr. Levi Turcotte',N'Shawn71@gmail.com',67,15912557),
	 (N'Estelle Bayer',N'Amalia.Hilpert28@gmail.com',34,65102501),
	 (N'Mrs. Deborah Lang',N'Soledad12@yahoo.com',47,87429012),
	 (N'Patty Mayer',N'Janae.Hermiston5@hotmail.com',78,61144237),
	 (N'Viola Rolfson',N'Kurtis86@gmail.com',25,23909873),
	 (N'Ignacio Spinka',N'Madge52@yahoo.com',34,67494235),
	 (N'Clifton Beahan PhD',N'Lindsey_Stiedemann@hotmail.com',93,62704635);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Bobby Tremblay',N'Chyna_Satterfield@yahoo.com',42,98315506),
	 (N'Brett Waelchi',N'Leonard.Nolan67@yahoo.com',62,62481339),
	 (N'Israel Abernathy',N'Odie_Senger35@gmail.com',59,98259144),
	 (N'Miss Lois Kertzmann',N'Grant.Nitzsche@yahoo.com',29,5344744),
	 (N'Pamela Stark DDS',N'Bernard_Stark82@gmail.com',52,41266325),
	 (N'Krystal Morissette',N'Estella77@yahoo.com',27,69193773),
	 (N'Michael Thiel',N'Oleta20@hotmail.com',95,78971236),
	 (N'Sylvester Gibson',N'Eldora_Turcotte@gmail.com',47,84247051),
	 (N'Dan Stiedemann',N'Sigmund_Schmidt75@gmail.com',10,67258856),
	 (N'Elsie Hegmann PhD',N'Fabian_Friesen@hotmail.com',90,34644056);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Juanita Boyle',N'Aaliyah18@hotmail.com',96,17149966),
	 (N'Laverne Kautzer',N'Blaise.Dickens51@hotmail.com',51,36231662),
	 (N'Glen Heller',N'Marietta25@hotmail.com',76,81023497),
	 (N'Mr. Hugh Crist',N'Damion.Murray@hotmail.com',95,35104431),
	 (N'Mercedes Kirlin',N'Olen.Bogisich@yahoo.com',44,46050208),
	 (N'Marianne Metz',N'Nicholaus17@yahoo.com',40,29206616),
	 (N'Judy Mills',N'Emelie_Torphy74@gmail.com',10,40696066),
	 (N'Marion Koss',N'Susan.Zieme83@hotmail.com',10,9321636),
	 (N'Dianne Stanton',N'Loma.Flatley26@gmail.com',79,39653966),
	 (N'Ken Hintz',N'Connor_Deckow38@gmail.com',99,20824054);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Ruben Mayert',N'Eladio_Mraz11@gmail.com',51,62961869),
	 (N'Stephanie Carroll',N'Elissa46@yahoo.com',43,20322487),
	 (N'Patti White',N'Jamarcus_Nolan@gmail.com',66,61916923),
	 (N'Caroline Crist DDS',N'Irving18@yahoo.com',89,93487315),
	 (N'Wendell Wisozk',N'Elisabeth40@gmail.com',93,69791050),
	 (N'Mrs. Benny OReilly I',N'Claudine_Gutmann@hotmail.com',36,36616960),
	 (N'Dustin Baumbach Sr.',N'Arlene_Kuvalis90@hotmail.com',34,23964832),
	 (N'Gregg McClure',N'Alek.Ritchie@hotmail.com',88,59097125),
	 (N'Ms. Katrina Lubowitz',N'Albertha.Leffler36@yahoo.com',65,61075813),
	 (N'Meredith Ziemann PhD',N'Louie.Durgan@hotmail.com',22,46636471);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Wendell Koepp',N'Baylee.Runolfsdottir@hotmail.com',63,57426096),
	 (N'Mr. Alejandro Parisian',N'Kari_Gulgowski@gmail.com',90,26153030),
	 (N'Angelo Haley',N'Darryl_Kuhic@hotmail.com',61,83446663),
	 (N'Angelina Legros DVM',N'Isadore_Herzog5@hotmail.com',33,77707566),
	 (N'Eva Hettinger',N'Reva_Beahan54@yahoo.com',58,49845462),
	 (N'Tim Nader',N'Jaeden56@yahoo.com',91,18547369),
	 (N'Andrea Leannon Jr.',N'Fay.Brekke@hotmail.com',25,75078887),
	 (N'Marty Fisher',N'Ceasar.Schaden@yahoo.com',64,91771485),
	 (N'Felipe Rolfson',N'Adrien.Jacobi@yahoo.com',30,45579448),
	 (N'Ethel Farrell',N'Muhammad47@yahoo.com',27,35256416);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Casey Upton',N'Marguerite.Hilpert52@yahoo.com',96,3379926),
	 (N'Lynne Mosciski',N'Timothy.Hartmann@hotmail.com',14,32945794),
	 (N'Dr. Kelly Bednar',N'Shane_Shanahan@hotmail.com',92,91411628),
	 (N'Russell Turcotte',N'Abby2@yahoo.com',66,97558862),
	 (N'Mrs. Wesley Schmeler',N'Woodrow_Koepp@hotmail.com',48,32822127),
	 (N'Ms. Ross Daugherty',N'Mose_Flatley72@gmail.com',86,43950423),
	 (N'Jesus Kuhlman',N'Hubert_Kunde@yahoo.com',15,69829071),
	 (N'Jeffrey Heathcote',N'Antonietta12@hotmail.com',95,67952601),
	 (N'Maureen Raynor',N'Leif98@gmail.com',62,93523091),
	 (N'Hugh Gulgowski',N'Mittie_Schiller@hotmail.com',16,75586110);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Debbie Grant II',N'Kallie_Jones@yahoo.com',94,6048025),
	 (N'Melvin Leuschke',N'Maye70@hotmail.com',72,92767240),
	 (N'Cory Haley IV',N'Bianka80@gmail.com',52,36166069),
	 (N'Neil Hodkiewicz',N'Nora.Schinner@hotmail.com',42,92906076),
	 (N'Kelvin Schinner',N'Kellen83@hotmail.com',22,79927005),
	 (N'Mrs. Josefina West',N'Sigrid_Anderson54@gmail.com',47,3799406),
	 (N'Dr. Calvin Lakin Jr.',N'Gino67@gmail.com',94,34654002),
	 (N'Andrew Gorczany',N'Marilie30@gmail.com',20,76522860),
	 (N'Ronnie Huels',N'Marco_Kshlerin70@hotmail.com',16,98274094),
	 (N'Pat Reichert',N'Laurine_Reinger@yahoo.com',54,76074779);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Aaron Schroeder',N'Marie.Wiza58@yahoo.com',92,51481286),
	 (N'Miss Stanley Abshire',N'Trudie.Donnelly38@hotmail.com',86,44409720),
	 (N'Mrs. Henry Johns',N'Herminia6@yahoo.com',83,8667463),
	 (N'Jackie Zulauf',N'Jeremie.Klein36@yahoo.com',93,86793457),
	 (N'Mrs. Gwen Quitzon',N'Lorena_Altenwerth@gmail.com',15,55073919),
	 (N'Duane Schulist',N'Cristian_Stehr@gmail.com',49,88637456),
	 (N'Geneva Hegmann',N'Barry_Simonis@hotmail.com',11,32051170),
	 (N'Wilma Gibson',N'Darrel_Harris87@yahoo.com',91,63466061),
	 (N'Karl Harvey',N'Aric_Halvorson@hotmail.com',73,79775647),
	 (N'Kelly Feeney',N'Ezequiel.Predovic@gmail.com',40,21977440);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Chris Bayer',N'Mandy.Hamill45@yahoo.com',58,57986847),
	 (N'Corey Greenfelder MD',N'Jairo.Rau@hotmail.com',15,23591573),
	 (N'Silvia Kunde',N'Kraig_Koepp@hotmail.com',56,92137117),
	 (N'Rita Bailey',N'Lacey89@yahoo.com',18,38905519),
	 (N'Randal Stroman',N'Darren_White35@yahoo.com',72,90661801),
	 (N'Ms. Carlos Durgan',N'Hudson0@yahoo.com',77,83421019),
	 (N'Isaac Walker',N'Bernardo.Orn@yahoo.com',20,82778058),
	 (N'Margarita Schowalter',N'Palma78@gmail.com',30,53823927),
	 (N'Dr. Ted Carroll',N'Audie82@gmail.com',91,12405657),
	 (N'Ashley Murphy I',N'Johann48@gmail.com',67,71415232);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Beatrice Corwin',N'Roman_Kris78@gmail.com',16,49590438),
	 (N'Bridget Labadie',N'Imogene87@yahoo.com',13,93463648),
	 (N'Bill Beatty',N'Lenny.Luettgen54@hotmail.com',49,33962369),
	 (N'Roxanne Schinner',N'Angeline72@gmail.com',33,35112901),
	 (N'Annie Torp IV',N'Verdie.Rowe93@gmail.com',51,32732108),
	 (N'Bernard Terry',N'Milan.Moen@yahoo.com',10,88784776),
	 (N'Marc Sanford Jr.',N'Fay43@gmail.com',96,74490514),
	 (N'Donald Daugherty',N'Bridie_McKenzie@hotmail.com',87,99779643),
	 (N'Enrique Tremblay',N'Harley.Mohr80@gmail.com',70,91700399),
	 (N'Laura Treutel',N'Aimee86@yahoo.com',75,41738927);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Marjorie Kozey',N'Jerrold_Williamson@gmail.com',83,3368731),
	 (N'Terrence Zulauf',N'Helen.Hodkiewicz71@hotmail.com',85,47096555),
	 (N'Donna Jaskolski',N'Raul.Koelpin86@gmail.com',61,65780320),
	 (N'Martin Ondricka',N'Cole_Davis@hotmail.com',87,24972466),
	 (N'Marcos Tromp',N'Royce.Schamberger4@yahoo.com',76,52834674),
	 (N'Donald Russel',N'Idella84@hotmail.com',65,70693268),
	 (N'Kelvin Grady',N'Margarett65@yahoo.com',70,32824140),
	 (N'Ms. Alberta Mann',N'Austen89@hotmail.com',76,94585712),
	 (N'Daryl Brakus',N'Dominic.Green@yahoo.com',74,85419364),
	 (N'Miss Caroline Fay',N'Aron44@yahoo.com',90,79364569);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Carl Oberbrunner',N'Everett.Ernser75@yahoo.com',36,95962197),
	 (N'Joe Franey',N'Bryon.Hills@hotmail.com',20,50020162),
	 (N'Mr. Sonia Franecki Sr.',N'Taryn.Hilll20@hotmail.com',80,89734864),
	 (N'Becky Schamberger',N'Colt79@yahoo.com',75,83750581),
	 (N'Alma Stokes',N'Samantha.Klein@yahoo.com',36,72282299),
	 (N'Mitchell Klocko',N'Eloise_Hahn@gmail.com',73,16259112),
	 (N'Ernestine Hamill',N'Oliver_Pacocha68@yahoo.com',63,89960070),
	 (N'Darla MacGyver',N'Alfredo_Koelpin36@hotmail.com',63,66671422),
	 (N'Sue Kuhic V',N'Morton_Bruen@yahoo.com',15,97859468),
	 (N'Matthew Graham',N'Novella_Torp@hotmail.com',34,41657993);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Edith Rogahn',N'Lew_Johns54@yahoo.com',55,33149109),
	 (N'Elmer Gulgowski',N'Roxane17@yahoo.com',70,76753656),
	 (N'Laura Ondricka',N'Lionel.Grant78@hotmail.com',11,57909846),
	 (N'Tyler Zulauf',N'Alexander_Price13@hotmail.com',16,93435699),
	 (N'Alma Yundt',N'Albertha.Ondricka@hotmail.com',66,73970903),
	 (N'Herbert Wolf',N'Piper38@gmail.com',69,14686030),
	 (N'Lindsey Mills',N'Isabel3@yahoo.com',93,9448763),
	 (N'Kurt Marks',N'Katrine23@gmail.com',69,47232448),
	 (N'Pete Dickinson',N'Madie_Hackett96@gmail.com',76,45707357),
	 (N'Mae Ryan',N'Carlos.Krajcik@yahoo.com',96,15280719);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Laverne Bruen',N'Constance.Champlin56@yahoo.com',31,30040206),
	 (N'Harold Mitchell',N'Dayna.Howe@yahoo.com',60,86129439),
	 (N'Erma Lehner',N'Janice.Schultz@hotmail.com',39,87491798),
	 (N'Angelo Watsica',N'Rhett.Bogan@gmail.com',64,56662617),
	 (N'Christy Hansen',N'Leanne_Rutherford57@hotmail.com',19,54985026),
	 (N'Jeanne Stroman',N'Chaya_Dicki48@gmail.com',97,65677056),
	 (N'Mrs. Shannon Jakubowski',N'Adrian.Bogisich@yahoo.com',36,17515346),
	 (N'Charlie Ullrich',N'Dell.Ziemann65@yahoo.com',21,77939312),
	 (N'Mrs. Miranda Gleichner',N'Kenna_Erdman57@yahoo.com',23,82588696),
	 (N'Jody Deckow',N'Olin25@yahoo.com',37,32443737);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Karl Jaskolski',N'Priscilla.Shanahan52@gmail.com',25,68140902),
	 (N'Ernesto Nikolaus',N'Vivian.Russel@gmail.com',74,34323400),
	 (N'Elvira Cartwright',N'Rolando.Bernhard@yahoo.com',41,13479143),
	 (N'Dr. Annette Ledner',N'Saige_Okuneva@yahoo.com',35,46096800),
	 (N'Miss Lee Gottlieb',N'Abraham.Mayer@yahoo.com',67,24244370),
	 (N'Miss Lloyd Wolff',N'Mustafa.Balistreri@gmail.com',42,85987381),
	 (N'Wilbur Mills',N'Laurianne_Cole31@yahoo.com',22,95841014),
	 (N'Cristina Streich',N'Mireille_Haag@yahoo.com',22,71901740),
	 (N'Katrina Kilback Jr.',N'Bill61@yahoo.com',27,40506),
	 (N'Candace Powlowski I',N'Josie_Maggio@hotmail.com',59,19927214);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Marian Schowalter',N'Susana.Brakus@gmail.com',87,66146254),
	 (N'Darrel Stoltenberg',N'Arnulfo.Davis@gmail.com',19,99212140),
	 (N'Anna Stark',N'Evelyn51@hotmail.com',25,70568846),
	 (N'Connie Hilpert',N'Jovani.Glover@hotmail.com',52,72555907),
	 (N'Tabitha Fahey',N'Dane.Purdy67@gmail.com',61,51485865),
	 (N'Gwen Wisozk III',N'Everette_Von91@hotmail.com',46,34142276),
	 (N'Julia Prosacco',N'Rigoberto.Satterfield@yahoo.com',75,8493850),
	 (N'Annie Towne',N'Camden79@hotmail.com',93,80059717),
	 (N'Arnold Conroy',N'Kellen10@yahoo.com',83,1614787),
	 (N'Ms. Noah Hamill',N'Lura61@yahoo.com',86,43626915);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Mr. Antoinette Veum',N'Tyrel65@gmail.com',73,55692046),
	 (N'Genevieve Paucek Jr.',N'Cindy15@hotmail.com',73,72368193),
	 (N'Joanne Cremin',N'June95@gmail.com',75,65126355),
	 (N'Darin Barton',N'Naomi79@yahoo.com',21,63602467),
	 (N'Miss Joyce Hilll',N'Matilde_Johns@hotmail.com',61,17165559),
	 (N'Jan Goldner I',N'Demario71@hotmail.com',45,92958922),
	 (N'Jon Rolfson IV',N'Royal23@yahoo.com',20,93472627),
	 (N'Ruben King',N'Gerard.Schaden50@hotmail.com',84,72182777),
	 (N'Colleen Heaney',N'Andreanne_Braun86@gmail.com',10,11449295),
	 (N'Shari Emmerich',N'Howell_Franecki@hotmail.com',24,24995710);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Francis Torp',N'Stacey_Feil62@hotmail.com',30,51672148),
	 (N'Ernesto Labadie',N'Alice_Emard@gmail.com',15,42385509),
	 (N'Luke Runolfsdottir',N'Esperanza_Rosenbaum99@hotmail.com',45,33717375),
	 (N'Willie Murray DVM',N'Susan_Stroman@gmail.com',11,27368020),
	 (N'Winston Cronin',N'Garret.Ryan@gmail.com',20,21402659),
	 (N'Miss Florence Jast',N'Eliezer.Von74@hotmail.com',72,82093974),
	 (N'Charlene Predovic',N'Edna92@gmail.com',21,79097131),
	 (N'Max Mayer',N'Braeden.Armstrong@hotmail.com',79,64936614),
	 (N'Bryan Williamson',N'Miguel.Hammes@hotmail.com',50,105577),
	 (N'Roberta Gutkowski',N'Etha.Hahn@gmail.com',14,27998407);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Monique Powlowski',N'Marcelina64@yahoo.com',89,9395708),
	 (N'Miriam Borer',N'Velva_Conn48@gmail.com',17,73725330),
	 (N'Ismael Hirthe',N'Horace.Jones53@hotmail.com',19,91161695),
	 (N'Roger Cruickshank',N'Pearlie72@hotmail.com',17,13318683),
	 (N'Stuart Marvin',N'Sylvester_Hoppe@yahoo.com',41,53193218),
	 (N'Dr. Cameron Runolfsson',N'Annamae_OReilly58@hotmail.com',15,97921110),
	 (N'Lauren Robel',N'Matilde.Ernser@gmail.com',72,67511019),
	 (N'Sherry Gibson',N'Colin.Emard@yahoo.com',38,33799302),
	 (N'Lindsay Satterfield',N'Fritz32@yahoo.com',99,10732528),
	 (N'Mrs. Ellis Upton',N'Josefa_Feest@yahoo.com',35,32929879);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Mr. Lindsay Langosh',N'Kiley33@gmail.com',26,39139530),
	 (N'Mrs. Cary Christiansen',N'Isac10@gmail.com',27,77449726),
	 (N'Lora Quigley',N'Mozell_Tremblay@gmail.com',83,95713319),
	 (N'Kelley Labadie',N'Zita45@hotmail.com',61,61263045),
	 (N'Sarah Cormier',N'Bernadette_Ruecker@hotmail.com',83,80239292),
	 (N'Ms. Lula Lesch',N'Casey_Fahey@gmail.com',38,15044668),
	 (N'Bryan Reynolds',N'Meta_Sauer44@hotmail.com',18,46438984),
	 (N'Mike Tillman',N'Vicky_Kshlerin69@hotmail.com',33,99017435),
	 (N'Charlene Ebert',N'Eugenia_Heidenreich6@yahoo.com',13,19706),
	 (N'Marc McKenzie',N'Aida96@gmail.com',51,70924);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Eugene Buckridge',N'Antonetta.Okuneva@yahoo.com',96,31253752),
	 (N'Nancy DAmore',N'Stefan.Glover@yahoo.com',87,78046784),
	 (N'Miss Cornelius Rutherford Jr.',N'Marcelo.Schuster@yahoo.com',15,18044137),
	 (N'Kayla Kiehn',N'Arne50@gmail.com',69,3126027),
	 (N'Marguerite Torp',N'Clark_Purdy66@gmail.com',14,40868874),
	 (N'Alejandro Lakin',N'Pamela.Reinger@hotmail.com',28,48218723),
	 (N'Raul Tromp',N'Susanna_Buckridge@gmail.com',11,51113695),
	 (N'Lena Herman',N'Jaylon39@hotmail.com',31,98169397),
	 (N'Dr. Hubert Hermiston Sr.',N'Krystal_Lind0@hotmail.com',35,42179977),
	 (N'Theodore Stamm',N'Josh72@hotmail.com',36,84157774);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Bobby Wolff',N'Kasandra_Brown32@gmail.com',16,9498926),
	 (N'Ernestine Sporer',N'Mohammed_Koepp@hotmail.com',47,99178962),
	 (N'Julian Mohr DDS',N'Jaqueline_Veum11@gmail.com',94,69203988),
	 (N'Ramona Zieme',N'Eldridge0@hotmail.com',45,38425102),
	 (N'Carol Sawayn',N'Eli.Collier@gmail.com',26,55735124),
	 (N'Rogelio Johnston',N'Amos27@gmail.com',78,74593418),
	 (N'Elijah Parisian',N'Wallace61@yahoo.com',59,18664520),
	 (N'Jean Koepp',N'Greta_Effertz@yahoo.com',31,71192714),
	 (N'Mr. Kerry King',N'Vesta.Crona39@gmail.com',29,20256493),
	 (N'Nora Predovic',N'Michel.Schaden81@hotmail.com',21,14033169);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Christopher Langosh',N'Rosalia_Gutmann@hotmail.com',94,87590881),
	 (N'Gretchen Schmitt',N'Roslyn_Goodwin54@gmail.com',12,15055277),
	 (N'Dr. Marshall Larkin MD',N'Jaquan_Turcotte10@yahoo.com',78,96212546),
	 (N'Jeremiah Schowalter',N'Arjun_Cole8@hotmail.com',32,30919337),
	 (N'Patrick Bogan DDS',N'Abbie72@gmail.com',64,1087154),
	 (N'Trevor Greenholt',N'Elroy.Jerde@yahoo.com',28,14892176),
	 (N'Bennie Green',N'Delpha86@yahoo.com',17,58539995),
	 (N'Oscar Bernier',N'Roel_OReilly94@hotmail.com',20,26493154),
	 (N'Pauline Champlin',N'Willie_Crooks@yahoo.com',59,88519465),
	 (N'Arnold Satterfield',N'Hilma66@gmail.com',26,89065507);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Ray Graham',N'Julie44@yahoo.com',32,16768933),
	 (N'Carla Lebsack Jr.',N'Lucas.Orn34@gmail.com',87,33955494),
	 (N'Clifton Becker',N'Regan_Medhurst@gmail.com',79,98127181),
	 (N'Sara Hettinger',N'Aubrey33@hotmail.com',83,52131025),
	 (N'Darrin Walsh',N'Monte_Parker@gmail.com',31,56862044),
	 (N'Marcos Berge',N'Elta.Hauck@gmail.com',81,26517162),
	 (N'Ruby Walker',N'Bonnie44@gmail.com',34,84733436),
	 (N'Mrs. Cesar Kshlerin IV',N'Alanis_Morar7@hotmail.com',73,35473899),
	 (N'Lois Von',N'Neva.Tremblay@gmail.com',76,10978095),
	 (N'Florence Fritsch',N'Hannah98@gmail.com',64,47238639);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Mitchell Heidenreich',N'Lauryn22@yahoo.com',97,32850903),
	 (N'Gilbert Kautzer',N'Genevieve.Herman@gmail.com',54,32790369),
	 (N'Erin Franecki',N'Alex75@yahoo.com',94,23035814),
	 (N'Dr. Ellen Bernhard',N'Ari37@hotmail.com',40,45971841),
	 (N'Elvira Beier',N'Shyann_Hane29@hotmail.com',87,15253368),
	 (N'Mr. Arlene Ward',N'Brennan_Hagenes@hotmail.com',23,6234586),
	 (N'Glenn Price DVM',N'Cristobal9@yahoo.com',25,73161343),
	 (N'Stephanie McLaughlin',N'Zackery43@gmail.com',86,28025097),
	 (N'Leland Gusikowski',N'Kristy_Homenick@hotmail.com',60,37217457),
	 (N'Tommie Torphy',N'Walter26@gmail.com',27,15413252);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Henry Howe DVM',N'Trey_Sporer97@hotmail.com',92,66066966),
	 (N'Felicia Stehr',N'Wava87@yahoo.com',65,66668915),
	 (N'Jose Schimmel',N'Verla19@yahoo.com',63,4167009),
	 (N'Daisy Ryan',N'Jonas.Monahan83@hotmail.com',79,46091264),
	 (N'Charlene Carter',N'Kariane.Feil@gmail.com',11,56961421),
	 (N'Delia Boyle',N'Edyth15@yahoo.com',94,6938167),
	 (N'Lola Cassin',N'Jamel58@gmail.com',29,61368661),
	 (N'Dr. Seth Bashirian',N'Heather_Collins50@gmail.com',43,81620731),
	 (N'Ginger Sipes',N'Brock.Heaney@gmail.com',36,91916519),
	 (N'Virgil Hoppe',N'Oceane.Beatty@hotmail.com',39,37212495);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Angel Goldner',N'Princess.Bruen@yahoo.com',30,44270815),
	 (N'Shannon Kilback',N'Krystal.Hilpert@yahoo.com',18,9409948),
	 (N'Javier Marks',N'Ray51@yahoo.com',15,44614850),
	 (N'Woodrow Price Sr.',N'Bethany16@hotmail.com',19,30681576),
	 (N'Jamie Nolan',N'Elizabeth_Funk60@yahoo.com',49,22269980),
	 (N'Oscar OKon PhD',N'Keshaun73@yahoo.com',69,65464722),
	 (N'Desiree Hauck V',N'Magdalen_Cruickshank@hotmail.com',76,89817027),
	 (N'Joanna Cormier',N'Aditya1@yahoo.com',42,80185955),
	 (N'Santos Kuhlman',N'Gracie.Goodwin93@yahoo.com',56,56892449),
	 (N'Cheryl Sipes',N'Verona_Bernier@gmail.com',74,69404775);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Ana Huel',N'Susan_Lemke@gmail.com',97,41783067),
	 (N'Sue Gibson',N'Abbie_Franey2@gmail.com',53,39103261),
	 (N'Jaime Champlin',N'Keshaun3@yahoo.com',95,48088243),
	 (N'Mrs. Lance Fisher',N'Humberto73@hotmail.com',81,84777140),
	 (N'Howard Little',N'Joe_Swaniawski@hotmail.com',35,39573465),
	 (N'Katrina Hyatt',N'Brandy.Maggio@yahoo.com',59,95333299),
	 (N'Harold Bartoletti',N'Garrison_Turcotte@gmail.com',74,32899548),
	 (N'Ruben Dooley',N'Ophelia56@yahoo.com',76,36642922),
	 (N'Kelly Erdman',N'Adrian63@gmail.com',22,86757284),
	 (N'Desiree Hauck',N'Jefferey10@gmail.com',84,82777781);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Janet McDermott',N'Jolie_Skiles92@gmail.com',72,91070773),
	 (N'Lloyd Goldner',N'Alberta_Schaden26@hotmail.com',41,54230315),
	 (N'Marjorie Cartwright',N'Benedict12@gmail.com',33,45569106),
	 (N'Erik Lesch',N'Michale_Paucek@hotmail.com',81,12523684),
	 (N'Aaron Abernathy',N'Javonte17@hotmail.com',77,25689580),
	 (N'Fred Hegmann PhD',N'Armand.Boehm10@hotmail.com',20,91433442),
	 (N'Tommie Shields',N'Lorna_Ullrich@gmail.com',14,21435250),
	 (N'Elsie Schinner',N'Bryana_Rowe92@gmail.com',89,84504051),
	 (N'Nathaniel Gorczany',N'Jena_Weimann@hotmail.com',32,86983593),
	 (N'Miss Judith Vandervort',N'Wilmer.Collier97@gmail.com',54,12277520);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Gail Mosciski',N'Alivia_Senger77@hotmail.com',57,3881940),
	 (N'Ms. Bradley Hayes',N'Akeem.Quitzon61@hotmail.com',63,53565576),
	 (N'Judy Dach',N'Mattie39@gmail.com',16,78386912),
	 (N'Willie Hackett',N'Newell.Powlowski15@yahoo.com',29,75896060),
	 (N'Mindy Roberts II',N'Karine69@hotmail.com',34,61027295),
	 (N'Jonathan Stokes',N'Isabel_Fay@yahoo.com',12,65720054),
	 (N'Angelo Metz',N'Alek.Daugherty69@yahoo.com',40,44273138),
	 (N'Brian Ward MD',N'Jorge61@hotmail.com',16,64731790),
	 (N'Jon Ledner',N'Drake.Rutherford@hotmail.com',90,77026969),
	 (N'Lynne Donnelly',N'Janae.Russel0@gmail.com',71,88960052);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Laverne Connelly',N'Israel6@hotmail.com',97,43970024),
	 (N'Mandy Beahan MD',N'Jacinthe.Crist95@yahoo.com',22,17525380),
	 (N'Roberta Lehner',N'Anika.Haley@hotmail.com',87,61324536),
	 (N'Boyd Wiegand',N'Roscoe76@hotmail.com',72,12927224),
	 (N'Jordan Stamm',N'Kellen_Ebert@hotmail.com',12,17701181),
	 (N'Lucille Cruickshank',N'Myra.Harris@gmail.com',45,5588920),
	 (N'Stanley Doyle',N'Wyman.Kreiger5@hotmail.com',91,95062879),
	 (N'Hugh Ebert',N'Ike_Stracke@hotmail.com',76,22094140),
	 (N'Elsa Marks',N'Breanne.Ernser@gmail.com',54,93852400),
	 (N'Mrs. Andres OKeefe',N'Dario42@hotmail.com',92,1024589);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Minnie Ratke',N'Elwin.Hessel@hotmail.com',27,34248755),
	 (N'Neil Becker',N'Rosie77@yahoo.com',63,77631656),
	 (N'Barbara Gerhold',N'Noelia28@gmail.com',36,9828379),
	 (N'Mrs. Billy Carter Sr.',N'Jody.Blick37@hotmail.com',97,26292673),
	 (N'Carolyn Spinka',N'Kris.Roob@gmail.com',56,96760479),
	 (N'Cesar Ebert Jr.',N'Pierce_Fahey81@gmail.com',54,24979438),
	 (N'Freda Gottlieb',N'Celine.Wolf35@gmail.com',51,743614),
	 (N'Elias Collins',N'Dudley.Shanahan@gmail.com',12,83253039),
	 (N'George Heller',N'Isaiah.Feil@gmail.com',75,38710734),
	 (N'Tracy Block',N'Valerie.Schoen@gmail.com',56,19890264);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Tiffany Lesch',N'Grayce37@hotmail.com',59,86062651),
	 (N'Lorene Jakubowski',N'Jude_Baumbach91@gmail.com',76,50113238),
	 (N'Felix Kreiger',N'Jaqueline_Schinner15@gmail.com',43,14715153),
	 (N'Lucy Gottlieb',N'Maybell_Spinka@hotmail.com',85,9616471),
	 (N'Camille Sawayn',N'Buford17@gmail.com',18,66730118),
	 (N'Julius Windler',N'Mekhi_Casper0@gmail.com',67,85314287),
	 (N'Heidi Schneider',N'Sophie_Lynch@yahoo.com',22,78858455),
	 (N'Kristine Kohler',N'Jamal.Lemke@yahoo.com',20,86236414),
	 (N'Jan Lind',N'Kyler.OHara@yahoo.com',27,40738990),
	 (N'Judith Glover IV',N'Francesco81@gmail.com',72,96613563);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Albert Bins',N'Gunner.Hettinger@yahoo.com',34,82568920),
	 (N'Antonio Cruickshank',N'Stevie0@yahoo.com',12,85768101),
	 (N'Wesley Runte',N'Erna.Stark33@yahoo.com',20,8920157),
	 (N'Ervin Mosciski',N'Wyman40@gmail.com',21,52242204),
	 (N'Joyce Cremin',N'Hayden.Sawayn58@yahoo.com',83,6354292),
	 (N'Nathan Feest',N'Gia_Becker@hotmail.com',74,82923036),
	 (N'Hope Lind MD',N'Griffin82@gmail.com',64,79255488),
	 (N'Lynne Roob',N'Maximillian.Koepp93@yahoo.com',72,79358050),
	 (N'Lorraine Vandervort',N'Connie_Herzog@gmail.com',98,24538345),
	 (N'Natalie Braun',N'Sylvia89@yahoo.com',95,88678105);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Beth Cassin',N'Jarrett.Gulgowski68@gmail.com',85,30234598),
	 (N'Nick Stehr Sr.',N'Fredrick.Halvorson99@gmail.com',68,7361628),
	 (N'Kelli Upton',N'Brenden.Hilpert@yahoo.com',33,58063940),
	 (N'Maryann Gottlieb',N'Maximilian_Padberg@hotmail.com',79,48800910),
	 (N'Jerald Welch',N'Micah_Borer@gmail.com',87,15790558),
	 (N'Ignacio Rosenbaum',N'Brooke88@gmail.com',58,56559646),
	 (N'Dr. Saul Fay',N'Pearl71@yahoo.com',14,19546425),
	 (N'Craig Ullrich',N'Tessie24@gmail.com',41,63166405),
	 (N'Jimmy Reichel',N'Antonina77@gmail.com',43,95554909),
	 (N'Rudy Satterfield',N'Eveline_Hermann0@gmail.com',44,51068584);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Brett Hilll',N'Everette.Grady99@gmail.com',85,79997099),
	 (N'Ms. Lisa Reilly',N'Nolan_Dicki36@hotmail.com',42,51986941),
	 (N'Matt Kuhic',N'Rahul36@hotmail.com',70,34256874),
	 (N'Beatrice Wolff',N'Meagan_Leannon99@gmail.com',82,61497501),
	 (N'Aaron Schaden',N'Aric_Conn@gmail.com',77,73209168),
	 (N'Kelvin Nikolaus',N'Cade45@hotmail.com',32,76809213),
	 (N'Raymond Predovic',N'Jadon_Strosin@hotmail.com',48,96940768),
	 (N'Donna DAmore',N'Brain38@yahoo.com',95,38939620),
	 (N'Kellie Grady',N'Eve59@yahoo.com',35,45057547),
	 (N'Francisco OKeefe',N'Bernice.Lubowitz@hotmail.com',20,67552286);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Steve White',N'Jerrod68@hotmail.com',72,62109081),
	 (N'Kerry Mante MD',N'Misael.Rodriguez26@gmail.com',56,3001952),
	 (N'Guillermo Gislason',N'Tracy_Corkery4@hotmail.com',39,68648092),
	 (N'Omar Kohler',N'Roy.Kemmer@gmail.com',43,80364960),
	 (N'Dr. Rosie Haley DDS',N'Autumn_Morar@gmail.com',83,75900571),
	 (N'Sidney McClure',N'Cade36@yahoo.com',33,68351763),
	 (N'Miss Elijah Kling',N'Cristal83@gmail.com',95,13999781),
	 (N'Paula Friesen',N'Ebba.Mohr46@hotmail.com',13,30731146),
	 (N'Vera Kling',N'Francisca43@gmail.com',92,44238826),
	 (N'Priscilla Mante Jr.',N'Shaina_Terry42@gmail.com',48,71448945);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Corey Cassin',N'Vilma_Robel84@yahoo.com',65,57382357),
	 (N'Miss Gilberto Hudson',N'Tristian68@gmail.com',46,78201401),
	 (N'Henry Sipes',N'Brooks.Kovacek74@gmail.com',94,20958442),
	 (N'Ivan Runte',N'Glennie.Keebler@yahoo.com',48,12702788),
	 (N'Joy Spencer',N'Weldon.Swift13@gmail.com',24,73490079),
	 (N'Ruben Mraz',N'Bridie_Lebsack@hotmail.com',77,12290820),
	 (N'Kelly Mraz',N'Antonia.Spinka@hotmail.com',68,93799376),
	 (N'Peter Schmidt',N'Brando_Kovacek@hotmail.com',17,99831192),
	 (N'Irvin Kuhn',N'Dorris.Kertzmann47@hotmail.com',95,30182345),
	 (N'Ian Cruickshank',N'Ole_Ledner@yahoo.com',49,81234940);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Danielle Grant',N'Rylee.Hayes@gmail.com',42,77003370),
	 (N'Virgil Botsford',N'Demarco_Rutherford75@hotmail.com',42,74331506),
	 (N'Dr. Tim Orn IV',N'Mitchell_Parisian@hotmail.com',91,27701732),
	 (N'Jessie Grady Jr.',N'Nelson.Erdman@yahoo.com',24,7676854),
	 (N'Mr. Gregg Thiel',N'Franz89@gmail.com',26,52825726),
	 (N'Earl Waelchi',N'Bobby41@hotmail.com',91,17531010),
	 (N'April Kihn DVM',N'Gwen.Stehr@hotmail.com',30,8254639),
	 (N'Felicia Bernier',N'Ariel_Stehr@gmail.com',13,87709716),
	 (N'Alice Crist',N'Carmine.Emmerich@gmail.com',96,53710982),
	 (N'Stuart Rohan',N'Nya_Kilback@gmail.com',18,32218002);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Ms. Tony Pagac',N'Wendy_Zieme@gmail.com',71,77729531),
	 (N'Mandy Murray',N'Willard_Schultz80@gmail.com',12,64308861),
	 (N'Belinda Towne',N'Bennett.Parker@gmail.com',24,68736609),
	 (N'Essie Volkman',N'Arden_McCullough@hotmail.com',77,14629796),
	 (N'Mrs. Vernon Hyatt',N'Jesse.Wiegand26@gmail.com',33,26522181),
	 (N'Mark Schowalter',N'Tyson_Gerlach@yahoo.com',92,98520494),
	 (N'Tamara Miller',N'Carrie.Morissette@hotmail.com',72,7750624),
	 (N'Tomas Kuhn',N'Kirstin25@hotmail.com',37,77193578),
	 (N'Shirley Senger DVM',N'Ansley_Harris@yahoo.com',49,66372920),
	 (N'Glenn Abernathy',N'Dariana_Stark@gmail.com',26,69792009);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Gabriel Wyman',N'Lavina56@gmail.com',58,81569265),
	 (N'Guadalupe Donnelly',N'Aliya.Maggio@gmail.com',32,47813914),
	 (N'Dr. Ronnie Schroeder',N'Jeanne6@hotmail.com',99,45167313),
	 (N'Charlene Lueilwitz',N'Maia_Haag0@gmail.com',42,72991880),
	 (N'Dr. Sheldon Collins',N'Adelle96@gmail.com',55,55252536),
	 (N'Shirley Harber',N'Kimberly_Koss48@hotmail.com',25,71816225),
	 (N'Toni Bashirian',N'Kenneth88@yahoo.com',87,81452860),
	 (N'Ruth Becker',N'Ryann.Lubowitz@gmail.com',47,55676660),
	 (N'Sabrina DAmore',N'Tanya70@gmail.com',18,30373575),
	 (N'Mrs. Guadalupe Wilderman',N'Mavis_Raynor71@yahoo.com',34,66125365);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Elsie Kovacek',N'Eloisa94@yahoo.com',39,72076433),
	 (N'Kent Williamson',N'Cullen_Dibbert@gmail.com',41,37747783),
	 (N'Angel Koss II',N'Tess_OKon47@gmail.com',89,13905814),
	 (N'Barbara Larkin',N'Murray78@yahoo.com',28,20139196),
	 (N'Clifton Zieme',N'Petra_Greenfelder@yahoo.com',26,39905989),
	 (N'Ben Schaefer',N'Neva_Huels@gmail.com',96,61246914),
	 (N'Blanche Turcotte',N'Gerhard_Borer80@yahoo.com',22,74440421),
	 (N'Jerald Marquardt',N'Ervin_Wyman@hotmail.com',63,25207508),
	 (N'Sharon Morar',N'Jovan.Wolff73@gmail.com',18,18136724),
	 (N'Jacob Turner',N'Carolina.Blick86@gmail.com',17,13138023);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Alvin Hoppe',N'Lucious_King1@gmail.com',50,6790184),
	 (N'Sue Rath',N'Ole.Kautzer90@yahoo.com',23,48575450),
	 (N'Theresa Fisher',N'Zetta.Wehner@yahoo.com',73,45443368),
	 (N'Lois Sipes',N'Franco_Murray22@hotmail.com',32,69829926),
	 (N'Natalie Zemlak',N'Aglae_White12@hotmail.com',50,59418389),
	 (N'Mrs. Naomi Weimann',N'Alisa.Mayer@hotmail.com',91,4750180),
	 (N'Kristy Mayer',N'Kiel.Pouros@hotmail.com',88,71740546),
	 (N'Dallas Waelchi',N'Alysson33@gmail.com',41,81391459),
	 (N'Jeffery Ebert',N'Willie.Auer40@yahoo.com',27,18078282),
	 (N'Jamie Hayes',N'Lucile_Nikolaus@hotmail.com',78,4743725);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Luis Wyman V',N'Fernando.Fahey3@yahoo.com',83,56310719),
	 (N'Wilson Frami',N'Jessie46@gmail.com',86,14392002),
	 (N'Edward Breitenberg',N'Rosalee_Bashirian72@gmail.com',56,3386572),
	 (N'Joanne Lindgren',N'Carson_Breitenberg@yahoo.com',65,13939766),
	 (N'Ms. Fannie Harber',N'Clemens_Cronin79@yahoo.com',76,61736180),
	 (N'Angelo Mayert',N'Meaghan_Mills@hotmail.com',35,59468095),
	 (N'Ted Mitchell Jr.',N'Saul.Borer@hotmail.com',44,37033680),
	 (N'Ethel Doyle MD',N'Kim_Ebert@yahoo.com',86,87140210),
	 (N'Kelly McClure',N'Myrtie80@hotmail.com',10,75318440),
	 (N'Vanessa Price',N'Robb.Reilly@hotmail.com',93,6892287);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Fredrick Bergnaum',N'Casimer_Lakin@yahoo.com',60,28662164),
	 (N'Maryann Lind',N'Jewell.Breitenberg@gmail.com',56,47749825),
	 (N'Archie Hudson',N'Frank_Cummings@yahoo.com',41,85047449),
	 (N'Pedro Bergstrom V',N'Carmen52@yahoo.com',57,4715993),
	 (N'Raquel Williamson',N'Aryanna_Lebsack@yahoo.com',90,78370702),
	 (N'Sadie Carter',N'Benton_Beatty99@yahoo.com',36,82880805),
	 (N'Elbert Langworth',N'Felipa.Lind@hotmail.com',61,81135252),
	 (N'Hope Kohler',N'Nola79@gmail.com',64,78999627),
	 (N'Sam Dibbert',N'Valentine_Rippin12@gmail.com',63,68011400),
	 (N'Randall Corwin',N'Paula.Hirthe@gmail.com',85,72973624);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Carolyn Bins',N'Lavern52@hotmail.com',65,21514895),
	 (N'Bernice Schamberger MD',N'Annette41@yahoo.com',57,5209878),
	 (N'Mrs. Gerard Koch',N'Vicente40@yahoo.com',12,40834194),
	 (N'Gayle Windler',N'Malinda.Daugherty@gmail.com',52,43972335),
	 (N'Gertrude Feest',N'Aylin.Dach62@gmail.com',71,81481879),
	 (N'June Buckridge',N'Leslie_Leffler80@gmail.com',16,52900421),
	 (N'Olga Lebsack',N'Clay57@yahoo.com',70,30615457),
	 (N'Vera Shanahan',N'Trey.Doyle@gmail.com',93,72636086),
	 (N'Renee Lebsack',N'Donna2@gmail.com',96,41644515),
	 (N'Dr. Julius Schmeler',N'Minerva_Murazik@gmail.com',37,22885578);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Carlos Predovic DVM',N'Rogers77@gmail.com',50,31048994),
	 (N'Penny Rowe',N'Germaine93@hotmail.com',99,40135006),
	 (N'Jack Haag',N'Amanda12@gmail.com',87,96393972),
	 (N'Betty Kessler',N'Joshua.Ruecker27@hotmail.com',19,64740633),
	 (N'Sarah Skiles',N'Tony_Lakin@gmail.com',93,19563403),
	 (N'Kent Boyle',N'Jarrod.Nader@gmail.com',67,42932567),
	 (N'Clint Herzog Jr.',N'Isai87@gmail.com',32,34458239),
	 (N'Theodore Bednar Jr.',N'Kathryne_Parker@gmail.com',75,93829914),
	 (N'Ms. Cary OConner',N'Emelia95@hotmail.com',60,50651975),
	 (N'Billie Sauer',N'Keenan_Schumm@yahoo.com',65,49789977);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Hazel Jacobi',N'Whitney36@hotmail.com',44,55091759),
	 (N'Ashley Parker',N'Stephen_Cremin@hotmail.com',27,49561960),
	 (N'Randy McCullough',N'Iliana.Davis@yahoo.com',47,75585546),
	 (N'Shawna Goyette',N'Audreanne_Feeney49@yahoo.com',32,77209209),
	 (N'Monique Hickle',N'Hassie47@gmail.com',84,92157840),
	 (N'Jesse Cronin',N'Ansley_Larson9@hotmail.com',92,62107501),
	 (N'Karla Gorczany',N'Nora_Funk13@hotmail.com',67,14009012),
	 (N'Edwin Steuber',N'Jed.Brown@hotmail.com',60,7489658),
	 (N'Traci Miller',N'Darian.Dach@hotmail.com',14,89673263),
	 (N'Dawn Parisian',N'Maddison.Schaefer@hotmail.com',43,49324982);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Wendy Nolan',N'Allison80@hotmail.com',51,85297062),
	 (N'Miss Tom Jaskolski',N'Emile32@yahoo.com',49,33231955),
	 (N'Daisy Harvey',N'Elna57@yahoo.com',16,53834570),
	 (N'Sophie Schiller',N'Hassan_Spinka63@hotmail.com',51,90708759),
	 (N'Amos Spinka',N'Wiley53@hotmail.com',26,92345795),
	 (N'Benjamin Schamberger',N'Caterina_Armstrong@hotmail.com',62,64252629),
	 (N'Miss Sandra Hudson',N'Clementine_Hauck6@gmail.com',85,13812357),
	 (N'Dr. Lionel Labadie',N'Garfield.Mitchell16@gmail.com',74,90545011),
	 (N'Ernestine Kunze',N'Emelia_Heller@gmail.com',58,66296257),
	 (N'Harold Stiedemann',N'Arno1@hotmail.com',74,4538753);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Mr. Roberto Bernier',N'Nella.Wisozk14@gmail.com',94,96502997),
	 (N'Jodi Mante Sr.',N'Jayce_Wehner@yahoo.com',89,86571924),
	 (N'Hugh Kuhn',N'Loyal_McClure92@yahoo.com',20,96576591),
	 (N'Raul Roob',N'Rocky.Bashirian1@yahoo.com',10,66242549),
	 (N'Abel Nader',N'Kolby_Powlowski@gmail.com',84,44578813),
	 (N'Lydia Schaefer',N'Devin89@hotmail.com',40,91509165),
	 (N'Winifred Halvorson IV',N'Camila6@gmail.com',26,95607985),
	 (N'Marta Collins',N'Laurence50@gmail.com',44,25854619),
	 (N'Timmy Bogisich',N'Elinore62@yahoo.com',32,87245904),
	 (N'Brendan Willms',N'Dashawn_Greenfelder88@yahoo.com',41,60402292);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Annie Frami',N'Gretchen_Tillman48@yahoo.com',12,56181667),
	 (N'Estelle Beahan',N'Devan_Tremblay@yahoo.com',64,8993441),
	 (N'Christie Roob Jr.',N'Loy.Block69@gmail.com',40,63298460),
	 (N'Billie Haag',N'Jocelyn.Sawayn@gmail.com',13,70139104),
	 (N'Danielle Corkery',N'Gonzalo4@hotmail.com',55,99102086),
	 (N'Kristopher Gibson',N'Eloy.Boyle11@yahoo.com',95,33201282),
	 (N'Frank Cummings',N'Edmond38@hotmail.com',85,51035841),
	 (N'Elisa Christiansen',N'Lucile_Metz@hotmail.com',51,31946410),
	 (N'Samantha Altenwerth',N'Jennings39@yahoo.com',66,52524315),
	 (N'Fernando Kozey',N'Maxwell.Wiegand82@gmail.com',96,8161219);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Miss Gregg Robel',N'Patsy11@gmail.com',50,4639830),
	 (N'Dr. Gayle Rippin',N'Edwardo.Hyatt@yahoo.com',78,32982923),
	 (N'Terrance Thompson',N'Annamae15@hotmail.com',21,26295886),
	 (N'Lowell Hettinger DVM',N'Roslyn_Kub@gmail.com',19,16215990),
	 (N'Joseph Quigley',N'Paolo4@yahoo.com',70,48351681),
	 (N'Mrs. Becky Kautzer Sr.',N'Robin_Stark@hotmail.com',94,57289925),
	 (N'Mr. Stephanie Jacobs',N'Candido92@hotmail.com',17,91306259),
	 (N'Harold Lebsack IV',N'Alexandro.Lynch92@gmail.com',45,86399859),
	 (N'Willard Gottlieb',N'Claudine.Fadel17@yahoo.com',23,72720211),
	 (N'Wayne Abbott Jr.',N'Enrique.Nicolas@yahoo.com',36,84954948);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Greg Jaskolski',N'Eveline_Glover49@yahoo.com',74,61403168),
	 (N'Mr. Pete Swift MD',N'Eugene_Conn31@gmail.com',21,74324932),
	 (N'Patricia Rohan',N'Annabell.Fay@hotmail.com',35,52253883),
	 (N'Edgar Bergnaum',N'Gerardo.Deckow@gmail.com',12,64864309),
	 (N'Harold Kunde',N'Roxanne59@gmail.com',99,79878559),
	 (N'Allen Hamill',N'Timmothy.Dare2@yahoo.com',85,57999459),
	 (N'Desiree Roberts V',N'Zachary85@gmail.com',11,81094958),
	 (N'Archie Russel',N'Evans.Aufderhar@gmail.com',23,12317811),
	 (N'Julie Kuhic',N'Juliana32@hotmail.com',51,42019916),
	 (N'Ms. Holly Wolf',N'Karianne.Herman72@yahoo.com',48,51582097);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Sandra Hamill',N'Candido_Dach92@hotmail.com',98,51598376),
	 (N'Ms. Beverly Miller I',N'Jeffry.Adams82@hotmail.com',82,37615285),
	 (N'Pam Tremblay',N'Felix.Purdy@gmail.com',50,64381783),
	 (N'Kellie Fahey',N'Idella.Kozey16@gmail.com',43,37218151),
	 (N'Jacqueline Breitenberg',N'Nathen85@yahoo.com',79,47689737),
	 (N'Herbert Ullrich',N'Bethany.Haley@hotmail.com',30,27275850),
	 (N'Luther Jast',N'Koby3@hotmail.com',36,43295640),
	 (N'Myron Kohler',N'Kiera.Wolf53@hotmail.com',15,32063426),
	 (N'Mr. Wilson Monahan',N'Deontae.Zboncak@hotmail.com',94,39313409),
	 (N'Terrell Skiles DVM',N'Alvera_Cronin54@gmail.com',79,46964387);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Ellen Bogan',N'Skylar.Boyer@yahoo.com',91,67388905),
	 (N'Earl OKon',N'Deanna_Green@yahoo.com',87,28733647),
	 (N'Mrs. Ignacio Maggio',N'Gene30@yahoo.com',29,56083129),
	 (N'Neal Murazik',N'Nikolas5@yahoo.com',91,11635255),
	 (N'Forrest Rodriguez',N'Minerva.Koch83@hotmail.com',68,92438460),
	 (N'Erin Wilkinson',N'Robin.Cruickshank56@hotmail.com',70,47827609),
	 (N'Sonja Will',N'Karl_Morissette42@gmail.com',87,51506653),
	 (N'Isabel Wisoky',N'Blaze_Lueilwitz17@yahoo.com',14,64789127),
	 (N'Robin Turner',N'Gustave.Ebert16@hotmail.com',42,7037041),
	 (N'Todd Kerluke',N'Javon_Crona36@gmail.com',77,19052420);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Jasmine Thompson',N'Selina.Cole@hotmail.com',41,76027303),
	 (N'Ralph Langworth',N'Carolyne.Stanton26@hotmail.com',57,98423280),
	 (N'Jermaine Walker',N'Stan_Walter69@yahoo.com',90,26962068),
	 (N'Elena Bode',N'Josefina_Weissnat16@yahoo.com',64,78518469),
	 (N'Misty Monahan',N'Patience28@hotmail.com',36,26243828),
	 (N'Sherman Carroll',N'Amaya.Abernathy@hotmail.com',24,37454061),
	 (N'Marsha Leuschke',N'Jaylin_Kunze99@yahoo.com',44,11831406),
	 (N'Sabrina Greenholt',N'Beryl.Collier@hotmail.com',83,29912671),
	 (N'Bernard Kovacek',N'Chad44@gmail.com',29,36667559),
	 (N'Traci Hilll',N'Kareem88@gmail.com',17,65306550);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Cheryl Gibson',N'Kylie_Runolfsdottir@yahoo.com',99,63473826),
	 (N'Nancy Crist',N'Corene5@gmail.com',26,279126),
	 (N'Gilberto Konopelski',N'Whitney86@hotmail.com',76,271562),
	 (N'Hope Dietrich',N'Ben57@yahoo.com',11,87019162),
	 (N'Daryl Blick',N'Amelia31@gmail.com',47,60332743),
	 (N'Pauline Walsh',N'Jany_Bradtke@yahoo.com',14,72604316),
	 (N'Flora Olson',N'Litzy92@hotmail.com',15,69300348),
	 (N'Sylvester Bins',N'Ray.Aufderhar@gmail.com',98,65273651),
	 (N'Ignacio Wisoky',N'Christina_Brown@yahoo.com',31,97984293),
	 (N'Lyle Bogan',N'Graham_Hermiston9@yahoo.com',90,87455820);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Anita Collier',N'Ulices.Macejkovic@hotmail.com',74,36581935),
	 (N'Perry Lynch',N'Nathaniel69@gmail.com',70,11232864),
	 (N'Ms. Carla Jacobs',N'Ocie.Kessler19@gmail.com',68,61331367),
	 (N'Kara Lockman',N'Lauryn25@gmail.com',88,26679551),
	 (N'Max Mertz',N'Jacques.Crist@yahoo.com',24,85017175),
	 (N'Meredith Smith',N'Onie.Kshlerin@gmail.com',60,54839817),
	 (N'Nicole Mann III',N'Merle.Rogahn83@gmail.com',67,94384665),
	 (N'Kristopher Goyette II',N'Gilberto.OConnell@hotmail.com',53,77649277),
	 (N'Diane Wiza',N'Bryana.Wehner@yahoo.com',27,17963794),
	 (N'Sylvester Kilback PhD',N'Edythe.Satterfield42@yahoo.com',64,20896246);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Estelle Strosin',N'Willa48@yahoo.com',90,7336885),
	 (N'Bethany Raynor MD',N'Rhoda.Bergstrom@hotmail.com',39,3864290),
	 (N'Alexis Mills',N'Juvenal56@hotmail.com',48,28981018),
	 (N'Celia Langosh',N'Christ_Moore76@hotmail.com',37,33514273),
	 (N'Belinda Howell',N'Cordelia.Emmerich@hotmail.com',94,81839184),
	 (N'Moses Metz',N'Sigmund_Lind10@yahoo.com',66,43945292),
	 (N'Christie Kerluke',N'Lonzo.Douglas@gmail.com',85,37942151),
	 (N'Ms. Emily Schmitt',N'Bonita14@yahoo.com',29,24204534),
	 (N'Dr. Olive OConnell DVM',N'Trace_Volkman@hotmail.com',47,48333551),
	 (N'Ernesto Douglas',N'Murphy_Kertzmann@gmail.com',15,81304657);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Louise Abshire',N'Madaline57@yahoo.com',99,96568023),
	 (N'Neil Haley IV',N'Philip.Braun48@hotmail.com',76,78628263),
	 (N'Conrad Stoltenberg',N'Jacey91@gmail.com',70,44405216),
	 (N'Loren Kerluke',N'Beaulah29@hotmail.com',36,56643067),
	 (N'Joyce Littel IV',N'Adalberto66@gmail.com',70,79743225),
	 (N'Diana Mayer',N'Quinn.Buckridge@gmail.com',79,17021601),
	 (N'Terrence Walker',N'Rylan.Hills46@hotmail.com',29,63785050),
	 (N'Emily Prosacco',N'Elroy34@yahoo.com',29,2406640),
	 (N'Jeannie Collier',N'Davonte.Wiza@hotmail.com',77,44866457),
	 (N'Jeff Emmerich',N'Britney.Renner@yahoo.com',46,79748703);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Phil Legros',N'Abigayle31@gmail.com',78,12796625),
	 (N'Kim Sporer',N'Clovis.Harris45@yahoo.com',37,34756649),
	 (N'Dana Schuppe',N'Scarlett.Spinka81@yahoo.com',53,49850818),
	 (N'Cristina Bergnaum',N'Shanny55@hotmail.com',62,52686401),
	 (N'Lucy Rogahn',N'Jedidiah38@gmail.com',21,66294477),
	 (N'Pedro Kerluke',N'Erik9@gmail.com',81,84005277),
	 (N'Louise Connelly',N'Trevor83@hotmail.com',57,80301112),
	 (N'Ernest Hermiston',N'Era_Moen22@gmail.com',35,54183634),
	 (N'Natasha Reynolds IV',N'Fern_Mosciski23@gmail.com',94,88014810),
	 (N'Tara Mayert III',N'Lauretta.Robel6@yahoo.com',82,40786707);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Jodi Batz',N'Jayda30@hotmail.com',16,38443927),
	 (N'Lowell McKenzie',N'Angelita27@yahoo.com',37,73813648),
	 (N'Sheri Hodkiewicz',N'Aliyah_Huels@yahoo.com',13,43948432),
	 (N'Mrs. Gregg Williamson',N'Jesse.Treutel35@yahoo.com',73,65534989),
	 (N'Jacqueline Beier',N'Alana_Morissette@hotmail.com',21,58297273),
	 (N'Jane Kuphal',N'Pearlie.Aufderhar20@gmail.com',63,94979474),
	 (N'Terri Pacocha MD',N'Casey.Krajcik@gmail.com',93,73263494),
	 (N'Mitchell Trantow',N'Antwon17@gmail.com',50,899329),
	 (N'Veronica Bergstrom',N'Gabriel.Zemlak@gmail.com',99,99922323),
	 (N'Alton OKeefe MD',N'Hollis6@hotmail.com',96,71914574);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Virginia Fisher',N'Joanne.Keebler@gmail.com',64,4516068),
	 (N'Willie Toy',N'Shakira.Haag@gmail.com',96,40992424),
	 (N'Ada Reinger',N'Barry_Rice@gmail.com',95,16331330),
	 (N'Sally Bruen Jr.',N'Lucas.Kassulke40@gmail.com',38,88352941),
	 (N'Alonzo OKeefe DDS',N'Leila_Ledner70@yahoo.com',31,3034967),
	 (N'Andres Crooks',N'Buster52@gmail.com',68,38135174),
	 (N'Joanne Cormier',N'Payton.Kuvalis@gmail.com',31,94534360),
	 (N'Harvey Trantow',N'Joesph_Renner@hotmail.com',19,89379829),
	 (N'April Daniel',N'Cleveland.Lemke@hotmail.com',55,16057704),
	 (N'Kari Smith',N'Boris76@gmail.com',88,84140708);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Jack Wilkinson',N'Gabriel_Macejkovic43@gmail.com',61,66491685),
	 (N'Yvette Moore III',N'Jaron_Romaguera@hotmail.com',26,3536489),
	 (N'Rachael Swaniawski',N'Otha14@hotmail.com',11,62926528),
	 (N'Jared Terry',N'Sydni68@yahoo.com',70,61164581),
	 (N'Louise Bartoletti',N'Greta.Hahn14@hotmail.com',70,9820760),
	 (N'Jacqueline Anderson',N'Hunter22@hotmail.com',60,88791347),
	 (N'Dr. Paul Boyle',N'Joany_Walsh62@yahoo.com',67,989992),
	 (N'Grant Stanton',N'Aletha_Champlin@gmail.com',46,98776632),
	 (N'Julius Johnston',N'Kara73@yahoo.com',62,49574045),
	 (N'Jerome Huels',N'Emelie.Quigley28@gmail.com',49,74020372);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Nancy Kozey',N'Pierce35@gmail.com',71,932598),
	 (N'Audrey Russel',N'Cathryn_Swift79@gmail.com',34,68806919),
	 (N'Hugh Legros',N'Leo.Farrell@gmail.com',96,78092033),
	 (N'Sharon Murazik',N'Tito15@yahoo.com',47,44087722),
	 (N'Norman Toy',N'Robb60@yahoo.com',25,6432789),
	 (N'Elsie Sipes',N'Dina95@yahoo.com',65,37798730),
	 (N'Edwin Ruecker',N'Crystel_Green@hotmail.com',89,87992996),
	 (N'Mr. Carlton Walter',N'Jessica.Herzog@yahoo.com',59,32588416),
	 (N'Beth Larson Sr.',N'Elizabeth98@hotmail.com',67,71869119),
	 (N'Trevor Kassulke',N'Irving.Ziemann@hotmail.com',44,44244907);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Ann Zulauf',N'Howard.Turcotte@gmail.com',88,98153639),
	 (N'Betty Hessel',N'Dana.Simonis33@yahoo.com',91,95141748),
	 (N'Fannie Nicolas V',N'Shemar_Willms@yahoo.com',77,8194068),
	 (N'Mrs. Rhonda Walker',N'Armand_Witting@gmail.com',88,68529043),
	 (N'Teresa Miller',N'Lorine.Borer@gmail.com',84,51977363),
	 (N'Angel Maggio',N'Leslie1@gmail.com',46,70793759),
	 (N'Sheila Kovacek',N'Lacey.Kuphal96@gmail.com',90,88117515),
	 (N'Maggie Towne',N'Yazmin_Gerlach21@gmail.com',96,43321402),
	 (N'Mrs. Gustavo Cormier',N'Delta_Turner70@hotmail.com',92,36135656),
	 (N'Darin Wiza',N'Grayce_Braun11@gmail.com',30,98189784);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Gene Goodwin',N'Sherman17@hotmail.com',50,56993300),
	 (N'Janet Mohr',N'Donavon_Langworth@gmail.com',31,47662460),
	 (N'Evelyn Tillman',N'Princess.Lind@hotmail.com',29,25793974),
	 (N'Jesus Schamberger',N'Wyatt_Schaden@yahoo.com',57,28493240),
	 (N'Gail Harber',N'Camron_Smith59@yahoo.com',30,64572002),
	 (N'Ken Muller',N'Sincere.Yundt@gmail.com',13,75898259),
	 (N'Faye Rolfson',N'Vivianne47@yahoo.com',51,43017890),
	 (N'Edwin Bogan',N'Lavina_Trantow@gmail.com',16,74165612),
	 (N'Benny MacGyver',N'Mara_Carroll3@hotmail.com',53,84306006),
	 (N'Joey Russel',N'Maximilian_Prosacco@gmail.com',93,58601227);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Shannon Rohan',N'Moshe75@yahoo.com',13,88896878),
	 (N'Stacey Reichel',N'Vita_Breitenberg@hotmail.com',62,62284259),
	 (N'Harvey Hammes',N'Zita_Kiehn@yahoo.com',47,47761949),
	 (N'Ms. Maureen OReilly',N'Camylle49@gmail.com',79,99389279),
	 (N'Denise Kovacek',N'Alana61@gmail.com',74,96714818),
	 (N'Darla Carroll',N'Kirsten.Christiansen@hotmail.com',28,48807506),
	 (N'Alonzo Lebsack',N'Betty62@hotmail.com',64,97539626),
	 (N'Marion Schroeder',N'Salvatore.Prosacco@gmail.com',78,38367591),
	 (N'Clay Cartwright',N'Donato.Larson@yahoo.com',21,50776706),
	 (N'Elsa Harvey',N'Tierra.Macejkovic87@gmail.com',28,57241447);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Olivia Wuckert',N'Pauline_Zulauf50@gmail.com',31,98354527),
	 (N'Joey Schulist',N'Bettie84@gmail.com',87,36388174),
	 (N'Amber Brakus',N'Alexie.Abbott@hotmail.com',67,11842230),
	 (N'Nettie Lubowitz V',N'Lue45@hotmail.com',88,45912416),
	 (N'Gilbert Abernathy',N'Francesco.Wiza15@gmail.com',44,88263825),
	 (N'Jonathon Orn',N'Lucious.Cronin@hotmail.com',41,22896812),
	 (N'Rosa Tromp',N'Casper31@hotmail.com',50,31913461),
	 (N'Natalie Reynolds',N'Andrew_Wyman9@gmail.com',40,37189153),
	 (N'Dr. Priscilla Padberg',N'Shirley93@hotmail.com',65,80965584),
	 (N'Ms. Estelle Gorczany',N'Lukas58@yahoo.com',79,51920856);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Tanya Bashirian',N'Shawna58@gmail.com',26,60631731),
	 (N'Donnie Marks',N'Nyah.Russel3@hotmail.com',81,11943443),
	 (N'Gwendolyn Trantow',N'Braeden5@hotmail.com',53,98278092),
	 (N'Terrell Schultz',N'Frankie33@gmail.com',16,93473995),
	 (N'Ronnie Leffler',N'Raymond_Larson61@gmail.com',33,91879162),
	 (N'Carolyn Thompson',N'Flavie31@yahoo.com',24,39882173),
	 (N'Ken Marks',N'Linwood_Bartell98@yahoo.com',18,70787952),
	 (N'Antonio Lebsack',N'Clement_Auer29@gmail.com',32,93017123),
	 (N'Michele Jast',N'Janet.Gislason38@hotmail.com',75,60559871),
	 (N'Juana Dickinson',N'Eulah_Bogan29@gmail.com',77,93966986);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Colleen Mertz',N'Amara_Rodriguez@gmail.com',92,93617541),
	 (N'Dr. Jane Zboncak',N'Theron_Howe@hotmail.com',93,56991400),
	 (N'Daryl Haag',N'Jason_Thompson@hotmail.com',12,62434016),
	 (N'Kate Hermiston',N'Lindsey64@yahoo.com',79,30276281),
	 (N'Dr. Christine Senger',N'Filomena.Tillman22@yahoo.com',28,51437157),
	 (N'Winifred Schmeler',N'Norris9@yahoo.com',73,78922058),
	 (N'Ramona OReilly',N'Paolo_McKenzie@hotmail.com',37,55906757),
	 (N'Mrs. Celia Balistreri',N'Newell71@hotmail.com',19,52617116),
	 (N'Julie Pfannerstill Sr.',N'Annie.Lowe@gmail.com',23,99293572),
	 (N'Bryant Tremblay',N'Jeanette20@gmail.com',55,54594486);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Wilson Baumbach',N'Melyssa83@yahoo.com',35,63058814),
	 (N'Candice Christiansen',N'Deon.Hyatt67@yahoo.com',40,25162377),
	 (N'Gene Brown',N'Joannie_Hahn@hotmail.com',41,8974979),
	 (N'Casey Gulgowski',N'Nedra.Jacobs@gmail.com',94,60522219),
	 (N'Roy DuBuque',N'Nicholas_Kovacek33@gmail.com',63,81900049),
	 (N'Mrs. Philip Murray',N'Lenna66@hotmail.com',76,28500573),
	 (N'Jennie Harber',N'Jayden24@yahoo.com',19,29576424),
	 (N'Lorena Hand',N'Cora45@hotmail.com',99,68745878),
	 (N'Adam Barrows',N'Nannie22@gmail.com',76,29347189),
	 (N'Johanna Gulgowski',N'Marilyne_Lubowitz73@hotmail.com',75,91578551);
INSERT INTO tech_1.ContactsManagement.Contact (Nome,Email,Ddd,Telefone) VALUES
	 (N'Lola Rolfson',N'Drew.Wuckert@gmail.com',37,70431348),
	 (N'Ramiro Grimes',N'Jaron_Hoppe@yahoo.com',63,22807286),
	 (N'Jan Macejkovic',N'Minerva.Abshire@yahoo.com',57,17672407),
	 (N'Patti Hammes',N'Maryse39@hotmail.com',21,53378215),
	 (N'Tyler Marvin',N'Eloisa_Barrows@gmail.com',91,58087890),
	 (N'Hazel Waters',N'Korbin_Kling18@hotmail.com',48,52742333),
	 (N'Morris Stamm Sr.',N'Myrl_Sauer@hotmail.com',68,66044422),
	 (N'Shelly Gusikowski',N'Estel7@yahoo.com',23,57908802),
	 (N'Karen Barton',N'Turner.Mills23@gmail.com',95,58981183),
	 (N'Lucas Nienow',N'Erling47@hotmail.com',83,17280281);

CREATE TABLE ContactsManagement.UserType(
	Id int IDENTITY(1, 1) PRIMARY KEY,
	Description varchar(255) UNIQUE NOT NULL
);
GO

CREATE TABLE ContactsManagement.ApiUser (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	Username varchar(255) NOT NULL,
	Password varchar(255) NOT NULL,
	UserType int NOT NULL REFERENCES ContactsManagement.UserType(Id),
);
GO

INSERT INTO ContactsManagement.UserType(Description) VALUES('Common');
INSERT INTO ContactsManagement.UserType(Description) VALUES('Administrator');
INSERT INTO ContactsManagement.ApiUser (Username, Password, UserType) VALUES('Admin', 'AQAAAAIAAYagAAAAEAhqL3a26EnFvTX/QOCvf3r1Ni1yqCSzm7WXV2qgWdGivHohZJVeJj857UHaQJ/otQ==', 2);
INSERT INTO ContactsManagement.ApiUser (Username, Password, UserType) VALUES('User', 'AQAAAAIAAYagAAAAEO5Av+AjYV5oMcMvglugM5K/yXPuH6Kx5A2D2rcgzbUDO1V23gciSOk5hvK48cbjdg==', 1);
