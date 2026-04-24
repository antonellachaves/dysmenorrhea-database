BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "CYCLE" (
	"cycle_id"	INTEGER,
	"user_id"	INTEGER NOT NULL,
	"cycle_number"	INTEGER,
	PRIMARY KEY("cycle_id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "USER"("user_id")
);
CREATE TABLE IF NOT EXISTS "CYCLE_DAY" (
	"day_id"	INTEGER,
	"cycle_id"	INTEGER NOT NULL,
	"day_number"	INTEGER,
	"period_date"	DATE,
	"pain_intensity"	INTEGER,
	"menstrual_flow"	VARCHAR(20),
	"stress"	INTEGER,
	"depression"	INTEGER,
	"diet"	VARCHAR(100),
	"alcohol_consumption"	VARCHAR(50),
	"exercise"	VARCHAR(50),
	"smoking"	BOOLEAN,
	"oral_contraceptives"	BOOLEAN,
	"drugs"	VARCHAR(100),
	"transcutaneous_stimulation"	BOOLEAN,
	"heat_therapy"	BOOLEAN,
	"acupressure"	BOOLEAN,
	"acupuncture"	BOOLEAN,
	"herbal_medicine"	VARCHAR(100),
	PRIMARY KEY("day_id" AUTOINCREMENT),
	FOREIGN KEY("cycle_id") REFERENCES "CYCLE"("cycle_id")
);
CREATE TABLE IF NOT EXISTS "USER" (
	"user_id"	INTEGER,
	"name"	VARCHAR(100),
	"age"	INTEGER,
	"weight"	DECIMAL(5, 2),
	"height"	DECIMAL(5, 2),
	"infertility"	BOOLEAN,
	"family_history"	BOOLEAN,
	"age_at_menarche"	INTEGER,
	"nulliparity"	BOOLEAN,
	PRIMARY KEY("user_id" AUTOINCREMENT)
);
INSERT INTO "CYCLE" ("cycle_id","user_id","cycle_number") VALUES (1,1,1),
 (2,2,1),
 (3,3,1),
 (4,4,1);
INSERT INTO "CYCLE_DAY" ("day_id","cycle_id","day_number","period_date","pain_intensity","menstrual_flow","stress","depression","diet","alcohol_consumption","exercise","smoking","oral_contraceptives","drugs","transcutaneous_stimulation","heat_therapy","acupressure","acupuncture","herbal_medicine") VALUES (1,1,1,'2026-04-01',8,'Heavy',7,4,'Balanced','No','Light','No',0,'Ibuprofen',0,1,0,NULL,'Chamomile'),
 (2,1,2,'2026-04-02',9,'Medium',5,3,'Balanced','No','Moderate','No',0,'Ibuprofen',1,1,1,NULL,'Chamomile'),
 (3,2,1,'2026-04-05',7,'Heavy',6,4,'Balanced','No','Light','No',0,'Ibuprofen',0,1,0,NULL,'Chamomile'),
 (4,2,2,'2026-04-06',5,'Medium',4,3,'Healthy','Yes','None','No',0,'Naproxen',1,1,0,NULL,'None'),
 (5,3,1,'2026-04-10',9,'Heavy',8,6,'Poor','Yes','None','Yes',1,'Paracetamol',0,1,1,NULL,'Mint'),
 (6,3,2,'2026-04-11',7,'Medium',6,5,'Balanced','No','Moderate','No',1,'Paracetamol',1,1,0,NULL,'Chamomile'),
 (7,4,1,'2026-04-15',6,'Light',5,2,'Balanced','No','Moderate','No',0,'None',0,1,1,NULL,'None'),
 (8,4,2,'2026-04-16',4,'Light',3,2,'Healthy','No','Moderate','No',0,'None',0,0,0,NULL,'None');
INSERT INTO "USER" ("user_id","name","age","weight","height","infertility","family_history","age_at_menarche","nulliparity") VALUES (1,'Ana Lopez',21,58,165,0,1,12,1),
 (2,'Marianna Benavides',24,58,167,0,1,13,0),
 (3,'Daniela Romoleroux',22,58,162,0,0,12,1),
 (4,'Carolina Santos',26,58,170,1,1,14,0);
COMMIT;
