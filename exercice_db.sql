-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;
-- ****************EKZER EXERCICE********************;
-- ***************************************************;

-- ************************************** "exercices"

CREATE TABLE
IF NOT EXISTS "exercices"
(
 "id"       bigserial NOT NULL,
 "type_id"  bigserial NOT NULL,
 "level_id" bigserial NOT NULL,
 "field_id" bigserial NOT NULL,
 CONSTRAINT "FK_314" FOREIGN KEY
( "type_id" ) REFERENCES "types"
( "id" ),
 CONSTRAINT "FK_317" FOREIGN KEY
( "level_id" ) REFERENCES "levels"
( "id" ),
 CONSTRAINT "FK_320" FOREIGN KEY
( "field_id" ) REFERENCES "fields"
( "id" )
);

CREATE UNIQUE INDEX "PK_exercice" ON "exercices"
(
 "id"
);

CREATE INDEX "fkIdx_314" ON "exercices"
(
 "type_id"
);

CREATE INDEX "fkIdx_317" ON "exercices"
(
 "level_id"
);

CREATE INDEX "fkIdx_320" ON "exercices"
(
 "field_id"
);

-- ************************************** "objectives"

CREATE TABLE
IF NOT EXISTS "objectives"
(
 "id"        bigserial NOT NULL,
 "objective" varchar
(50) NOT NULL

);

CREATE UNIQUE INDEX "PK_objective" ON "objectives"
(
 "id"
);

-- ************************************** "exercice_objective"

CREATE TABLE
IF NOT EXISTS "exercice_objective"
(
 "objective_id" bigserial NOT NULL,
 "exercice_id"  bigserial NOT NULL,
 CONSTRAINT "FK_259" FOREIGN KEY
( "objective_id" ) REFERENCES "objectives"
( "id" ),
 CONSTRAINT "FK_262" FOREIGN KEY
( "exercice_id" ) REFERENCES "exercice"
( "id" )
);

CREATE UNIQUE INDEX "PK_exercice_objective" ON "exercice_objective"
(
 "objective_id",
 "exercice_id"
);

CREATE INDEX "fkIdx_259" ON "exercice_objective"
(
 "objective_id"
);

CREATE INDEX "fkIdx_262" ON "exercice_objective"
(
 "exercice_id"
);

-- ************************************** "consignes"

CREATE TABLE IF NOT EXISTS "consignes"
(
 "id"          bigserial NOT NULL,
 "french"      text NOT NULL,
 "exercice_id" bigserial NOT NULL,
 CONSTRAINT "FK_13" FOREIGN KEY ( "exercice_id" ) REFERENCES "exercices" ( "id" )
);

CREATE UNIQUE INDEX "PK_consigne" ON "consignes"
(
 "id"
);

CREATE INDEX "fkIdx_13" ON "consignes"
(
 "exercice_id"
);

-- ************************************** "keywords"

CREATE TABLE
IF NOT EXISTS "keywords"
(
 "id"      bigserial NOT NULL,
 "keyword" varchar
(50) NOT NULL

);

CREATE UNIQUE INDEX "PK_exercice_keywords" ON "keywords"
(
 "id"
);

-- ************************************** "exercice_keyword"

CREATE TABLE
IF NOT EXISTS "exercice_keyword"
(
 "exercice_id" bigserial NOT NULL,
 "keyword_id"  bigserial NOT NULL,
 CONSTRAINT "FK_266" FOREIGN KEY
( "exercice_id" ) REFERENCES "exercices"
( "id" ),
 CONSTRAINT "FK_270" FOREIGN KEY
( "keyword_id" ) REFERENCES "keywords"
( "id" )
);

CREATE UNIQUE INDEX "PK_exercice_keyword" ON "exercice_keyword"
(
 "exercice_id",
 "keyword_id"
);

CREATE INDEX "fkIdx_266" ON "exercice_keyword"
(
 "exercice_id"
);

CREATE INDEX "fkIdx_270" ON "exercice_keyword"
(
 "keyword_id"
);

-- ************************************** "types"

CREATE TABLE
IF NOT EXISTS "types"
(
 "id"   bigserial NOT NULL,
 "type" varchar
(50) NOT NULL

);

CREATE UNIQUE INDEX "PK_type" ON "types"
(
 "id"
);

-- ************************************** "levels"

CREATE TABLE
IF NOT EXISTS "levels"
(
 "id"    bigserial NOT NULL,
 "level" integer NOT NULL

);

CREATE UNIQUE INDEX "PK_level" ON "levels"
(
 "id"
);

-- ************************************** "fields"

CREATE TABLE
IF NOT EXISTS "fields"
(
 "id"    bigserial NOT NULL,
 "field" varchar
(50) NOT NULL

);

CREATE UNIQUE INDEX "PK_field" ON "fields"
(
 "id"
);

-- ************************************** "associer"

CREATE TABLE
IF NOT EXISTS "associer"
(
 "id"          bigserial NOT NULL,
 "exercice_id" bigserial NOT NULL,
 CONSTRAINT "FK_93" FOREIGN KEY
( "exercice_id" ) REFERENCES "exercices"
( "id" )
);

CREATE UNIQUE INDEX "PK_associer" ON "associer"
(
 "id"
);

CREATE INDEX "fkIdx_93" ON "associer"
(
 "exercice_id"
);

-- ************************************** "associer_proposition"

CREATE TABLE
IF NOT EXISTS "associer_proposition"
(
 "id"          bigserial NOT NULL,
 "value"       text NOT NULL,
 "associer_id" bigserial NOT NULL,
 CONSTRAINT "FK_100" FOREIGN KEY
( "associer_id" ) REFERENCES "associer"
( "id" )
);

CREATE UNIQUE INDEX "PK_associer_proposition" ON "associer_proposition"
(
 "id"
);

CREATE INDEX "fkIdx_100" ON "associer_proposition"
(
 "associer_id"
);

-- ************************************** "associer_predicat"

CREATE TABLE
IF NOT EXISTS "associer_predicat"
(
 "id"             bigserial NOT NULL,
 "value"          text NOT NULL,
 "proposition_id" bigserial NOT NULL,
 "associer_id"    bigserial NOT NULL,
 CONSTRAINT "FK_108" FOREIGN KEY
( "proposition_id" ) REFERENCES "associer_proposition"
( "id" ),
 CONSTRAINT "FK_111" FOREIGN KEY
( "associer_id" ) REFERENCES "associer"
( "id" )
);

CREATE UNIQUE INDEX "PK_associer_predicat" ON "associer_predicat"
(
 "id"
);

CREATE INDEX "fkIdx_108" ON "associer_predicat"
(
 "proposition_id"
);

CREATE INDEX "fkIdx_111" ON "associer_predicat"
(
 "associer_id"
);

-- ************************************** "classer"

CREATE TABLE
IF NOT EXISTS "classer"
(
 "id"          bigserial NOT NULL,
 "nb_columns"  int NOT NULL,
 "exercice_id" bigserial NOT NULL,
 CONSTRAINT "FK_50" FOREIGN KEY
( "exercice_id" ) REFERENCES "exercices"
( "id" )
);

CREATE UNIQUE INDEX "PK_classer" ON "classer"
(
 "id"
);

CREATE INDEX "fkIdx_50" ON "classer"
(
 "exercice_id"
);

-- ************************************** "completer"

CREATE TABLE
IF NOT EXISTS "completer"
(
 "id"          bigserial NOT NULL,
 "exercice_id" bigserial NOT NULL,
 CONSTRAINT "FK_29" FOREIGN KEY
( "exercice_id" ) REFERENCES "exercices"
( "id" )
);

CREATE UNIQUE INDEX "PK_intitule" ON "completer"
(
 "id"
);

CREATE INDEX "fkIdx_29" ON "completer"
(
 "exercice_id"
);

-- ************************************** "classer_colonne"

CREATE TABLE
IF NOT EXISTS "classer_colonne"
(
 "id"         bigserial NOT NULL,
 "values"     text NOT NULL,
 "classer_id" bigserial NOT NULL,
 "name"       varchar
(50) NOT NULL,
 CONSTRAINT "FK_57" FOREIGN KEY
( "classer_id" ) REFERENCES "classer"
( "id" )
);

CREATE UNIQUE INDEX "PK_colonne" ON "classer_colonne"
(
 "id"
);

CREATE INDEX "fkIdx_57" ON "classer_colonne"
(
 "classer_id"
);

-- ************************************** "completer_partiel"

CREATE TABLE
IF NOT EXISTS "completer_partiel"
(
 "id"           bigserial NOT NULL,
 "part"         text NOT NULL,
 "completer_id" bigserial NOT NULL,
 CONSTRAINT "FK_36" FOREIGN KEY
( "completer_id" ) REFERENCES "completer"
( "id" )
);

CREATE UNIQUE INDEX "PK_partial_intitule" ON "completer_partiel"
(
 "id"
);

CREATE INDEX "fkIdx_36" ON "completer_partiel"
(
 "completer_id"
);

-- ************************************** "completer_correction"

CREATE TABLE
IF NOT EXISTS "completer_correction"
(
 "id"           bigserial NOT NULL,
 "value"        text NOT NULL,
 "completer_id" bigserial NOT NULL,
 CONSTRAINT "FK_43" FOREIGN KEY
( "completer_id" ) REFERENCES "completer"
( "id" )
);

CREATE UNIQUE INDEX "PK_correction" ON "completer_correction"
(
 "id"
);

CREATE INDEX "fkIdx_43" ON "completer_correction"
(
 "completer_id"
);

-- ************************************** "prelever"

CREATE TABLE
IF NOT EXISTS "prelever"
(
 "id"          bigserial NOT NULL,
 "exercice_id" bigserial NOT NULL,
 CONSTRAINT "FK_117" FOREIGN KEY
( "exercice_id" ) REFERENCES "exercices"
( "id" )
);

CREATE UNIQUE INDEX "PK_prelever" ON "prelever"
(
 "id"
);

CREATE INDEX "fkIdx_117" ON "prelever"
(
 "exercice_id"
);

-- ************************************** "prelever_texte"

CREATE TABLE
IF NOT EXISTS "prelever_texte"
(
 "id"          bigserial NOT NULL,
 "value"       text NOT NULL,
 "prelever_id" bigserial NOT NULL,
 CONSTRAINT "FK_124" FOREIGN KEY
( "prelever_id" ) REFERENCES "prelever"
( "id" )
);

CREATE UNIQUE INDEX "PK_prelever_texte" ON "prelever_texte"
(
 "id"
);

CREATE INDEX "fkIdx_124" ON "prelever_texte"
(
 "prelever_id"
);

-- ************************************** "prelever_correction"

CREATE TABLE
IF NOT EXISTS "prelever_correction"
(
 "id"                bigserial NOT NULL,
 "value"             text NOT NULL,
 "prelever_texte_id" bigserial NOT NULL,
 CONSTRAINT "FK_131" FOREIGN KEY
( "prelever_texte_id" ) REFERENCES "prelever_texte"
( "id" )
);

CREATE UNIQUE INDEX "PK_prelever_correction" ON "prelever_correction"
(
 "id"
);

CREATE INDEX "fkIdx_131" ON "prelever_correction"
(
 "prelever_texte_id"
);

-- ************************************** "quizz"

CREATE TABLE
IF NOT EXISTS "quizz"
(
 "id"          bigserial NOT NULL,
 "exercice_id" bigserial NOT NULL,
 CONSTRAINT "FK_64" FOREIGN KEY
( "exercice_id" ) REFERENCES "exercices"
( "id" )
);

CREATE UNIQUE INDEX "PK_quizz" ON "quizz"
(
 "id"
);

CREATE INDEX "fkIdx_64" ON "quizz"
(
 "exercice_id"
);

-- ************************************** "quizz_question"

CREATE TABLE
IF NOT EXISTS "quizz_question"
(
 "id"       bigserial NOT NULL,
 "value"    text NOT NULL,
 "quizz_id" bigserial NOT NULL,
 CONSTRAINT "FK_71" FOREIGN KEY
( "quizz_id" ) REFERENCES "quizz"
( "id" )
);

CREATE UNIQUE INDEX "PK_question" ON "quizz_question"
(
 "id"
);

CREATE INDEX "fkIdx_71" ON "quizz_question"
(
 "quizz_id"
);

-- ************************************** "quizz_proposition"

CREATE TABLE
IF NOT EXISTS "quizz_proposition"
(
 "id"                bigserial NOT NULL,
 "value"             text NOT NULL,
 "quizz_question_id" bigserial NOT NULL,
 CONSTRAINT "FK_85" FOREIGN KEY
( "quizz_question_id" ) REFERENCES "quizz_question"
( "id" )
);

CREATE UNIQUE INDEX "PK_proposition_quizz" ON "quizz_proposition"
(
 "id"
);

CREATE INDEX "fkIdx_85" ON "quizz_proposition"
(
 "quizz_question_id"
);

-- ************************************** "quizz_reponse"

CREATE TABLE
IF NOT EXISTS "quizz_reponse"
(
 "id"                bigserial NOT NULL,
 "value"             text NOT NULL,
 "quizz_question_id" bigserial NOT NULL,
 CONSTRAINT "FK_78" FOREIGN KEY
( "quizz_question_id" ) REFERENCES "quizz_question"
( "id" )
);

CREATE UNIQUE INDEX "PK_reponse_quizz" ON "quizz_reponse"
(
 "id"
);

CREATE INDEX "fkIdx_78" ON "quizz_reponse"
(
 "quizz_question_id"
);
