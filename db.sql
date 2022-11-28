CREATE TABLE IF NOT EXISTS django_migrations (
	id	int NOT NULL AUTO_INCREMENT,
	app	varchar(255) NOT NULL,
	name	varchar(255) NOT NULL,
	applied	datetime NOT NULL,
	PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS django_content_type (
	id	int NOT NULL AUTO_INCREMENT,
	app_label	varchar(100) NOT NULL,
	model	varchar(100) NOT NULL,
	PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS auth_permission (
	id	int NOT NULL AUTO_INCREMENT,
	content_type_id	int NOT NULL,
	codename	varchar(100) NOT NULL,
	name	varchar(255) NOT NULL,
	CONSTRAINT auth_permission_django_content_type_fk FOREIGN KEY(content_type_id) REFERENCES django_content_type(id) ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS auth_group (
	id	int NOT NULL AUTO_INCREMENT,
	name	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS books_book (
	id	int NOT NULL AUTO_INCREMENT,
	title	varchar(200) NOT NULL,
	author	varchar(200) NOT NULL,
	description	varchar(500) NOT NULL,
	price	real,
	image_url	varchar(2083) NOT NULL,
	follow_author	varchar(2083) NOT NULL,
	book_available	boolean NOT NULL,
	PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS books_order (
	id	int NOT NULL AUTO_INCREMENT,
	created	datetime NOT NULL,
	product_id	int,
	PRIMARY KEY(id),
	CONSTRAINT books_order_books_book_fk FOREIGN KEY(product_id) REFERENCES books_book(id) ON DELETE RESTRICT ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS django_session (
	session_key	varchar(40) NOT NULL,
	session_data	text NOT NULL,
	expire_date	datetime NOT NULL,
	PRIMARY KEY(session_key)
);
CREATE TABLE IF NOT EXISTS auth_user (
	id	int NOT NULL AUTO_INCREMENT,
	password	varchar(128) NOT NULL,
	last_login	datetime,
	is_superuser	boolean NOT NULL,
	username	varchar(150) NOT NULL UNIQUE,
	last_name	varchar(150) NOT NULL,
	email	varchar(254) NOT NULL,
	is_staff	boolean NOT NULL,
	is_active	boolean NOT NULL,
	date_joined	datetime NOT NULL,
	first_name	varchar(150) NOT NULL,
	PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS auth_group_permissions (
	id	int NOT NULL AUTO_INCREMENT ,
	group_id	int NOT NULL,
	permission_id	int NOT NULL,
	CONSTRAINT auth_group_permissions_auth_group_fk FOREIGN KEY(group_id) REFERENCES auth_group(id) 
	ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT auth_group_permissions_auth_permission_fk FOREIGN KEY(permission_id) REFERENCES auth_permission(id) 
	ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS auth_user_groups (
	id	int NOT NULL AUTO_INCREMENT,
	user_id	int NOT NULL,
	group_id	int NOT NULL,
	CONSTRAINT auth_user_groups_auth_user_fk FOREIGN KEY(user_id) REFERENCES auth_user(id) 
	ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT auth_user_groups_auth_group_fk FOREIGN KEY(group_id) REFERENCES auth_group(id) 
	ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS auth_user_user_permissions (
	id	int NOT NULL AUTO_INCREMENT,
	user_id	int NOT NULL,
	permission_id	int NOT NULL,
	CONSTRAINT auth_user_user_permissions_auth_user_fk FOREIGN KEY(user_id) REFERENCES auth_user(id) 
	ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT auth_user_user_permissions_auth_permission_fk FOREIGN KEY(permission_id) REFERENCES auth_permission(id) 
	ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS django_admin_log (
	id	int NOT NULL AUTO_INCREMENT,
	action_time	datetime NOT NULL,
	object_id	text,
	object_repr	varchar(200) NOT NULL,
	change_message	text NOT NULL,
	content_type_id	integer,
	user_id	int NOT NULL,
	action_flag	int unsigned NOT NULL,
	CONSTRAINT django_admin_log_auth_user_fk FOREIGN KEY(user_id) REFERENCES auth_user(id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT django_admin_log_django_content_type_fk FOREIGN KEY(content_type_id) REFERENCES django_content_type(id) ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY(id)
);
INSERT INTO django_migrations (id,app,name,applied) VALUES (1,'contenttypes','0001_initial','2020-05-31 12:53:59.711299'),
 (2,'auth','0001_initial','2020-05-31 12:53:59.891526'),
 (3,'admin','0001_initial','2020-05-31 12:54:00.101121'),
 (4,'admin','0002_logentry_remove_auto_add','2020-05-31 12:54:00.282908'),
 (5,'admin','0003_logentry_add_action_flag_choices','2020-05-31 12:54:00.399458'),
 (6,'contenttypes','0002_remove_content_type_name','2020-05-31 12:54:00.507781'),
 (7,'auth','0002_alter_permission_name_max_length','2020-05-31 12:54:00.610827'),
 (8,'auth','0003_alter_user_email_max_length','2020-05-31 12:54:00.714422'),
 (9,'auth','0004_alter_user_username_opts','2020-05-31 12:54:00.846483'),
 (10,'auth','0005_alter_user_last_login_null','2020-05-31 12:54:00.947960'),
 (11,'auth','0006_require_contenttypes_0002','2020-05-31 12:54:01.026112'),
 (12,'auth','0007_alter_validators_add_error_messages','2020-05-31 12:54:01.127805'),
 (13,'auth','0008_alter_user_username_max_length','2020-05-31 12:54:01.241699'),
 (14,'auth','0009_alter_user_last_name_max_length','2020-05-31 12:54:01.333537'),
 (15,'auth','0010_alter_group_name_max_length','2020-05-31 12:54:01.424245'),
 (16,'auth','0011_update_proxy_permissions','2020-05-31 12:54:01.513912'),
 (17,'books','0001_initial','2020-05-31 12:54:01.606863'),
 (18,'sessions','0001_initial','2020-05-31 12:54:01.717289'),
 (19,'auth','0012_alter_user_first_name_max_length','2022-11-28 16:26:38.580875');
INSERT INTO django_admin_log (id,action_time,object_id,object_repr,change_message,content_type_id,user_id,action_flag) VALUES (1,'2020-05-31 13:00:54.732498','1','Django for Beginners: Build websites with Python and Django','[{"added": {}}]',7,1,1),
 (2,'2020-05-31 13:01:25.943916','2','Django Rest Api','[{"added": {}}]',7,1,1),
 (3,'2020-05-31 13:01:44.682401','3','Django For Professionals','[{"added": {}}]',7,1,1),
 (4,'2020-05-31 13:02:18.546291','1','Django for Beginners: Build websites with Python and Django','[{"changed": {"fields": ["Description", "Price"]}}]',7,1,2),
 (5,'2020-05-31 13:02:26.661793','2','Django for APIs: Build web APIs with Python and Django','[{"changed": {"fields": ["Title"]}}]',7,1,2),
 (6,'2020-05-31 13:02:30.980536','3','Django for Professionals: Production websites with Python & Django','[{"changed": {"fields": ["Title"]}}]',7,1,2),
 (7,'2020-05-31 13:03:06.990914','4','Python Crash Course, 2nd Edition: A Hands-On, Project-Based Introduction to Programming','[{"added": {}}]',7,1,1),
 (8,'2020-05-31 13:03:40.823838','5','Automate the Boring Stuff with Python, 2nd Edition: Practical Programming for Total Beginners','[{"added": {}}]',7,1,1),
 (9,'2020-05-31 13:04:57.515805','6','Two Scoops of Django 1.11: Best Practices for the Django Web','[{"added": {}}]',7,1,1),
 (10,'2020-05-31 13:07:04.950293','7','Test-Driven Development with Python: Obey the Testing Goat: Using Django, Selenium, and Java Script','[{"added": {}}]',7,1,1),
 (11,'2020-05-31 13:08:13.925334','8','Eloquent JavaScript, 3rd Edition: A Modern Introduction to Programming','[{"added": {}}]',7,1,1),
 (12,'2020-05-31 13:08:58.995771','8','Eloquent JavaScript, 3rd Edition: A Modern Introduction to Programming','[{"changed": {"fields": ["Image url", "Book available"]}}]',7,1,2),
 (13,'2020-05-31 13:09:29.865517','1','Django for Beginners: Build websites with Python and Django','[{"changed": {"fields": ["Image url"]}}]',7,1,2),
 (14,'2020-05-31 13:09:55.545918','3','Django for Professionals: Production websites with Python & Django','[{"changed": {"fields": ["Image url"]}}]',7,1,2),
 (15,'2020-05-31 13:10:25.638249','2','Django for APIs: Build web APIs with Python and Django','[{"changed": {"fields": ["Image url"]}}]',7,1,2),
 (16,'2020-05-31 13:11:00.171822','4','Python Crash Course, 2nd Edition: A Hands-On, Project-Based Introduction to Programming','[{"changed": {"fields": ["Image url"]}}]',7,1,2),
 (17,'2020-05-31 13:11:35.996252','5','Automate the Boring Stuff with Python, 2nd Edition: Practical Programming for Total Beginners','[{"changed": {"fields": ["Image url"]}}]',7,1,2),
 (18,'2020-05-31 13:12:03.267784','6','Two Scoops of Django 1.11: Best Practices for the Django Web','[{"changed": {"fields": ["Image url"]}}]',7,1,2),
 (19,'2020-05-31 13:12:28.852242','5','Automate the Boring Stuff with Python, 2nd Edition: Practical Programming for Total Beginners','[]',7,1,2),
 (20,'2020-05-31 13:13:21.757260','7','Test-Driven Development with Python: Obey the Testing Goat: Using Django, Selenium, and Java Script','[{"changed": {"fields": ["Image url"]}}]',7,1,2),
 (21,'2020-05-31 13:13:58.887142','7','Test-Driven Development with Python: Obey the Testing Goat: Using Django, Selenium, and Java Script','[{"changed": {"fields": ["Image url"]}}]',7,1,2),
 (22,'2020-05-31 13:14:40.567277','5','Automate the Boring Stuff with Python, 2nd Edition: Practical Programming for Total Beginners','[{"changed": {"fields": ["Image url"]}}]',7,1,2),
 (23,'2020-05-31 13:15:24.905917','5','Automate the Boring Stuff with Python, 2nd Edition: Practical Programming for Total Beginners','[{"changed": {"fields": ["Image url"]}}]',7,1,2),
 (24,'2020-05-31 13:16:07.735189','1','Django for Beginners: Build websites with Python and Django','[{"changed": {"fields": ["Image url"]}}]',7,1,2),
 (25,'2020-05-31 13:16:50.562832','3','Django for Professionals: Production websites with Python & Django','[{"changed": {"fields": ["Image url"]}}]',7,1,2),
 (26,'2020-05-31 13:17:45.025524','4','Python Crash Course, 2nd Edition: A Hands-On, Project-Based Introduction to Programming','[{"changed": {"fields": ["Image url"]}}]',7,1,2),
 (27,'2020-05-31 13:19:05.456135','6','Two Scoops of Django 1.11: Best Practices for the Django Web','[{"changed": {"fields": ["Description"]}}]',7,1,2),
 (28,'2020-05-31 13:19:13.676508','8','Eloquent JavaScript, 3rd Edition: A Modern Introduction to Programming','[]',7,1,2),
 (29,'2020-05-31 13:24:04.613459','6','Two Scoops of Django 1.11: Best Practices for the Django Web','[{"changed": {"fields": ["Image url"]}}]',7,1,2),
 (30,'2020-05-31 13:25:00.527343','6','Two Scoops of Django 1.11: Best Practices for the Django Web','[{"changed": {"fields": ["Image url"]}}]',7,1,2);
INSERT INTO django_content_type (id,app_label,model) VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'books','book'),
 (8,'books','order');
INSERT INTO auth_permission (id,content_type_id,codename,name) VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,7,'add_book','Can add book'),
 (26,7,'change_book','Can change book'),
 (27,7,'delete_book','Can delete book'),
 (28,7,'view_book','Can view book'),
 (29,8,'add_order','Can add order'),
 (30,8,'change_order','Can change order'),
 (31,8,'delete_order','Can delete order'),
 (32,8,'view_order','Can view order');
INSERT INTO books_book (id,title,author,description,price,image_url,follow_author,book_available) VALUES (1,'Django for Beginners: Build websites with Python and Django','WS Vincent','A step-by-step guide to building web applications with Python and Django 3.0.  Create, test, and deploy 5 progressively more complex websites including a Message Board app, a Blog app with user accounts, and a robust Newspaper app with reader comments and a complete user registration flow.  Along the way you''ll learn core Django features and best practices around models, views, templates, urls, custom user models, permissions, authorizations, user registration, testing, and deployment.',30.99,'https://d2sofvawe08yqg.cloudfront.net/djangoforbeginners/medium2x?1587411572','https://twitter.com/wsv3000?lang=en',1),
 (2,'Django for APIs: Build web APIs with Python and Django','WS Vincent','Take a modern API-first approach to creating 3 different Django back-ends: a Library API, Todo API, and a Blog API with user authentication, permissions, proper documentation, and more. You''ll even learn how to connect them to a React front-end for a truly full-stack web application.',30.5,'https://images-na.ssl-images-amazon.com/images/I/41-bFTJlrSL._SX384_BO1,204,203,200_.jpg','https://twitter.com/wsv3000?lang=en',0),
 (3,'Django for Professionals: Production websites with Python & Django','WS Vincent','This book covers in-depth how professional Django programmers do their job and build real-world web applications. Topics covered include Docker, environment variables, payments, search, permissions, file/image uploads, testing, security, performance, and deployment.',40.0,'https://images-na.ssl-images-amazon.com/images/I/61yEnH2STSL.jpg','https://twitter.com/wsv3000?lang=en',1),
 (4,'Python Crash Course, 2nd Edition: A Hands-On, Project-Based Introduction to Programming','Eric Matthes','Python Crash Course is the world''s best-selling guide to the Python programming language. This fast-paced, thorough introduction to programming with Python will have you writing programs, solving problems, and making things that work in no time.  In the first half of the book, you''ll learn basic programming concepts, such as variables, lists, classes, and loops, and practice writing clean code with exercises for each topic. You''ll also learn how to make your programs interactive.',15.99,'https://images-na.ssl-images-amazon.com/images/I/81f8XACISAL.jpg','https://twitter.com/ehmatthes?lang=en',0),
 (5,'Automate the Boring Stuff with Python, 2nd Edition: Practical Programming for Total Beginners','Al Sweigart','In this fully revised second edition of the best-selling classic Automate the Boring Stuff with Python, you''ll learn how to use Python to write programs that do in minutes what would take you hours to do by hand--no prior programming experience required. You''ll learn the basics of Python and explore Python''s rich library of modules for performing specific tasks, like scraping data off websites, reading PDF and Word documents, and automating clicking and typing tasks.',15.0,'https://automatetheboringstuff.com/images/automate_2e_cover.png','https://twitter.com/alsweigart?lang=en',1),
 (6,'Two Scoops of Django 1.11: Best Practices for the Django Web','Daniel Roy Greenfeld','In this book we introduce you to the various tips, tricks, patterns, code snippets, and techniques that we''ve picked up over the years. We have put thousands of hours into the fourth edition of the book, writing and revising its material to include significant improvements and new material based on feedback from previous editions.',12.99,'https://images-na.ssl-images-amazon.com/images/I/51bRZotr5FL.jpg','',1),
 (7,'Test-Driven Development with Python: Obey the Testing Goat: Using Django, Selenium, and Java Script','Harry J.W Percival','By taking you through the development of a real web application from beginning to end, the second edition of this hands-on guide demonstrates the practical advantages of test-driven development (TDD) with Python. You’ll learn how to write and run tests before building each part of your app, and then develop the minimum amount of code required to pass those tests. The result? Clean code that works.',25.0,'https://m.media-amazon.com/images/I/51KewhyBeML.jpg','',1),
 (8,'Eloquent JavaScript, 3rd Edition: A Modern Introduction to Programming','Marijn Haverbeke','As with previous editions, Haverbeke continues to teach through extensive examples and immerses you in code from the start, while exercises and full-chapter projects give you hands-on experience with writing your own programs. You start by learning the basic structure of the JavaScript language as well as control structures, functions, and data structures to help you write basic programs. Then you''ll learn about error handling and bug fixing, modularity, etc.',24.0,'https://images-na.ssl-images-amazon.com/images/I/51MSWCvCmcL._SX377_BO1,204,203,200_.jpg','',0);
INSERT INTO books_order (id,created,product_id) VALUES (1,'2020-05-31 13:29:59.782821',3),
 (2,'2020-07-19 15:36:02.741878',1);
INSERT INTO django_session (session_key,session_data,expire_date) VALUES ('7ys37ntg2yufxnqv0d1tkm9qwt2i6aiw','MjAzODJlZDQ0YTg2ZTBhNTAyZjIzNTIwMWQ1MTAyMzAwNWE5NzhjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OTE1NWIxYjZhMTJlODdlNWFkNTg0MjljYzJmNWMxZmM3MTQ1MDc5In0=','2020-06-14 13:28:51.614326'),
 ('b91nkl7urbyc9ocoyitghhh4n7kxw2yz','MjAzODJlZDQ0YTg2ZTBhNTAyZjIzNTIwMWQ1MTAyMzAwNWE5NzhjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OTE1NWIxYjZhMTJlODdlNWFkNTg0MjljYzJmNWMxZmM3MTQ1MDc5In0=','2020-08-02 15:35:10.177611');
INSERT INTO auth_user (id,password,last_login,is_superuser,username,last_name,email,is_staff,is_active,date_joined,first_name) VALUES (1,'pbkdf2_sha256$180000$bYpmT0Yhspy4$olXBcjvVN7+kQapVw8fci6kez7mfvBqjxRzWsbqow5s=','2020-07-19 15:35:10.034307',1,'yash','','yashmarmat08@gmail.com',1,1,'2020-05-31 12:54:46.807870',''),
 (2,'pbkdf2_sha256$180000$0ucgLuQruUxp$UgbFMmP5k8snfpYLaCvdWKLMF7HCjf7kHiBu04kIXBw=','2020-05-31 13:28:42.359874',0,'testuser','','',0,1,'2020-05-31 13:28:17.246867','');
CREATE UNIQUE INDEX IF NOT EXISTS auth_group_permissions_group_id_permission_id_0cd325b0_uniq ON auth_group_permissions (
	group_id,
	permission_id
);
CREATE INDEX IF NOT EXISTS auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions (
	group_id
);
CREATE INDEX IF NOT EXISTS auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions (
	permission_id
);
CREATE UNIQUE INDEX IF NOT EXISTS auth_user_groups_user_id_group_id_94350c0c_uniq ON auth_user_groups (
	user_id,
	group_id
);
CREATE INDEX IF NOT EXISTS auth_user_groups_user_id_6a12ed8b ON auth_user_groups (
	user_id
);
CREATE INDEX IF NOT EXISTS auth_user_groups_group_id_97559544 ON auth_user_groups (
	group_id
);
CREATE UNIQUE INDEX IF NOT EXISTS auth_user_user_permissions_user_id_permission_id_14a6b632_uniq ON auth_user_user_permissions (
	user_id,
	permission_id
);
CREATE INDEX IF NOT EXISTS auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions (
	user_id
);
CREATE INDEX IF NOT EXISTS auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions (
	permission_id
);
CREATE INDEX IF NOT EXISTS django_admin_log_content_type_id_c4bce8eb ON django_admin_log (
	content_type_id
);
CREATE INDEX IF NOT EXISTS django_admin_log_user_id_c564eba6 ON django_admin_log (
	user_id
);
CREATE UNIQUE INDEX IF NOT EXISTS django_content_type_app_label_model_76bd3d3b_uniq ON django_content_type (
	app_label,
	model
);
CREATE UNIQUE INDEX IF NOT EXISTS auth_permission_content_type_id_codename_01ab375a_uniq ON auth_permission (
	content_type_id,
	codename
);
CREATE INDEX IF NOT EXISTS auth_permission_content_type_id_2f476e4b ON auth_permission (
	content_type_id
);
CREATE INDEX IF NOT EXISTS books_order_product_id_2a4d5cce ON books_order (
	product_id
);
CREATE INDEX IF NOT EXISTS django_session_expire_date_a5c62663 ON django_session (
	expire_date
);

