CREATE SCHEMA IF NOT EXISTS "public";

CREATE SEQUENCE "public".bac_id_bac_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".faculte_id_faculte_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".faculte_id_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".mention_id_mention_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".mention_id_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".paiement_id_paiement_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".parcours_id_parcours_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".parcours_id_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".preinscription_id_preinscription_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".role_id_role_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".role_utilisateur_id_role_utilisateur_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".sms_id_sms_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".specialite_id_specialite_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".utilisateurs_id_utilisateur_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE TYPE type_formation AS ENUM ('Professionnalisante','Académique');

CREATE TYPE type_media AS ENUM ('Image','vidéo');

CREATE TYPE type_mode_preinscription AS ENUM ('en ligne','poste','sms','presentielle');

CREATE TYPE type_niveau AS ENUM ('L1','L2','L3','M1','M2','D1','D2');

CREATE TYPE type_sex AS ENUM ('masculin','femminin');

CREATE TYPE type_titre AS ENUM ('Professeur titulaire','Professeur','Maitre de conférences','Assistant','');

CREATE  TABLE "public".bac ( 
	id_bac               serial  NOT NULL  ,
	annee_bacc           integer  NOT NULL  ,
	num_bacc             integer  NOT NULL  ,
	doc_bac              text    ,
	est_malagasy         boolean DEFAULT true   ,
	CONSTRAINT bac_pkey PRIMARY KEY ( id_bac ),
	CONSTRAINT unique_anne_num UNIQUE ( annee_bacc, num_bacc ) 
 );

CREATE  TABLE "public".faculte ( 
	id_faculte           serial  NOT NULL  ,
	nom_faculte          varchar(100)    ,
	CONSTRAINT faculte_pkey PRIMARY KEY ( id_faculte )
 );

CREATE  TABLE "public".media ( 
	chemin               text  NOT NULL  ,
	mimetype             "public".type_media  NOT NULL  ,
	media                integer    ,
	id_media             serial  NOT NULL  ,
	CONSTRAINT pk_media PRIMARY KEY ( id_media )
 );

CREATE  TABLE "public".personne ( 
	id_personne          serial  NOT NULL  ,
	nom_prenom           text  NOT NULL  ,
	email                text    ,
	tel                  varchar(10)    ,
	sex                  "public".type_sex  NOT NULL  ,
	CONSTRAINT pk_personne PRIMARY KEY ( id_personne )
 );

CREATE  TABLE "public".professeur ( 
	id_professeur        serial  NOT NULL  ,
	personne             integer  NOT NULL  ,
	titre                "public".type_titre  NOT NULL  ,
	CONSTRAINT pk_professeur PRIMARY KEY ( id_professeur ),
	CONSTRAINT fk_professeur_personne FOREIGN KEY ( personne ) REFERENCES "public".personne( id_personne ) ON DELETE SET NULL ON UPDATE SET NULL 
 );

CREATE  TABLE "public"."role" ( 
	id_role              serial  NOT NULL  ,
	nom_role             varchar(200)    ,
	CONSTRAINT role_pkey PRIMARY KEY ( id_role )
 );

CREATE  TABLE "public".sms ( 
	id_sms               serial  NOT NULL  ,
	envoyeur             varchar(15)  NOT NULL  ,
	recepteur            varchar(15)  NOT NULL  ,
	contenu              varchar(255)    ,
	date_sms             date    ,
	CONSTRAINT sms_pkey PRIMARY KEY ( id_sms )
 );

CREATE  TABLE "public".utilisateurs ( 
	id_utilisateur       serial  NOT NULL  ,
	identifiant          varchar(200)  NOT NULL  ,
	mot_de_passe         varchar(200)  NOT NULL  ,
	CONSTRAINT utilisateurs_pkey PRIMARY KEY ( id_utilisateur )
 );

CREATE  TABLE "public".mention ( 
	id_mention           serial  NOT NULL  ,
	id_faculte           integer    ,
	nom_mention          varchar(100)    ,
	responsable          integer  NOT NULL  ,
	abbreviation         varchar(10)  NOT NULL  ,
	CONSTRAINT mention_pkey PRIMARY KEY ( id_mention ),
	CONSTRAINT mention_id_faculte_fkey FOREIGN KEY ( id_faculte ) REFERENCES "public".faculte( id_faculte )   ,
	CONSTRAINT fk_mention_personne FOREIGN KEY ( responsable ) REFERENCES "public".personne( id_personne ) ON DELETE SET NULL ON UPDATE SET NULL 
 );

CREATE  TABLE "public".parcours ( 
	id_parcours          serial  NOT NULL  ,
	id_mention           integer    ,
	nom_parcours         varchar(100)    ,
	niveau_parcours      "public".type_niveau    ,
	formation            "public".type_formation  NOT NULL  ,
	CONSTRAINT parcours_pkey PRIMARY KEY ( id_parcours ),
	CONSTRAINT parcours_id_mention_fkey FOREIGN KEY ( id_mention ) REFERENCES "public".mention( id_mention )   
 );

CREATE  TABLE "public".preinscription ( 
	id_preinscription    serial  NOT NULL  ,
	email                text    ,
	tel                  varchar(100)    ,
	ref_bancaire         varchar(100)  NOT NULL  ,
	agence               varchar(200)  NOT NULL  ,
	date_paiement        date  NOT NULL  ,
	date_preinscription  date DEFAULT CURRENT_DATE   ,
	date_validation      date    ,
	est_selectionner     boolean DEFAULT false   ,
	id_parcours          integer    ,
	date_selection       date    ,
	est_valide           boolean DEFAULT false   ,
	admin_validation     integer    ,
	id_bac               integer    ,
	mode_inscription     "public".type_mode_preinscription    ,
	CONSTRAINT preinscription_pkey PRIMARY KEY ( id_preinscription ),
	CONSTRAINT unique_ref_date_agence UNIQUE ( agence, date_paiement, ref_bancaire ) ,
	CONSTRAINT preinscription_id_parcours_fkey FOREIGN KEY ( id_parcours ) REFERENCES "public".parcours( id_parcours )   ,
	CONSTRAINT preinscription_id_bac_fkey FOREIGN KEY ( id_bac ) REFERENCES "public".bac( id_bac )   ,
	CONSTRAINT preinscription_admin_validation_fkey FOREIGN KEY ( admin_validation ) REFERENCES "public".utilisateurs( id_utilisateur )   
 );

ALTER TABLE "public".preinscription ADD CONSTRAINT preinscription_email_check CHECK ( email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'::text );

CREATE  TABLE "public".role_utilisateur ( 
	id_role_utilisateur  serial  NOT NULL  ,
	id_role              integer  NOT NULL  ,
	id_utilisateur       integer  NOT NULL  ,
	CONSTRAINT role_utilisateur_pkey PRIMARY KEY ( id_role_utilisateur ),
	CONSTRAINT role_utilisateur_id_role_fkey FOREIGN KEY ( id_role ) REFERENCES "public"."role"( id_role )   ,
	CONSTRAINT role_utilisateur_id_utilisateur_fkey FOREIGN KEY ( id_utilisateur ) REFERENCES "public".utilisateurs( id_utilisateur )   
 );

CREATE  TABLE "public".specialite ( 
	id_specialite        serial  NOT NULL  ,
	nom_specilaite       varchar(200)  NOT NULL  ,
	id_parcours          integer  NOT NULL  ,
	CONSTRAINT specialite_pkey PRIMARY KEY ( id_specialite ),
	CONSTRAINT specialite_id_parcours_fkey FOREIGN KEY ( id_parcours ) REFERENCES "public".parcours( id_parcours )   
 );

CREATE  TABLE "public".laboratoire ( 
	nom_labo             text  NOT NULL  ,
	mention_rattachement integer  NOT NULL  ,
	responsable          integer  NOT NULL  ,
	description          jsonb    ,
	id_labo              serial  NOT NULL  ,
	CONSTRAINT pk_laboratoire PRIMARY KEY ( id_labo ),
	CONSTRAINT fk_laboratoire_mention FOREIGN KEY ( mention_rattachement ) REFERENCES "public".mention( id_mention ) ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_laboratoire_personne FOREIGN KEY ( responsable ) REFERENCES "public".personne( id_personne ) ON DELETE SET NULL ON UPDATE SET NULL 
 );

CREATE  TABLE "public".paiement ( 
	id_paiement          serial  NOT NULL  ,
	nom_payeur           varchar(200)    ,
	nom_beneficiaire     varchar(200)    ,
	agence               varchar(200)    ,
	ref_bancaire         varchar(100)    ,
	date_paiement        date    ,
	date_insertion       date DEFAULT CURRENT_DATE   ,
	espece               integer    ,
	id_preinscription    integer    ,
	motif_paiement       varchar(255)    ,
	id_utilisateur       integer    ,
	CONSTRAINT paiement_pkey PRIMARY KEY ( id_paiement ),
	CONSTRAINT unique_refe_date_agence UNIQUE ( agence, date_paiement, ref_bancaire ) ,
	CONSTRAINT paiement_id_preinscription_fkey FOREIGN KEY ( id_preinscription ) REFERENCES "public".preinscription( id_preinscription )   ,
	CONSTRAINT paiement_id_utilisateur_fkey FOREIGN KEY ( id_utilisateur ) REFERENCES "public".utilisateurs( id_utilisateur )   
 );

CREATE  TABLE "public".labo_media ( 
	media                integer  NOT NULL  ,
	labo                 integer  NOT NULL  ,
	id_labo_media        serial  NOT NULL  ,
	CONSTRAINT pk_labo_media PRIMARY KEY ( id_labo_media ),
	CONSTRAINT fk_labo_media_laboratoire FOREIGN KEY ( labo ) REFERENCES "public".laboratoire( id_labo ) ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_labo_media_media FOREIGN KEY ( media ) REFERENCES "public".media( id_media ) ON DELETE CASCADE ON UPDATE CASCADE 
 );

CREATE TRIGGER trigger_est_valide AFTER UPDATE OF est_valide ON public.preinscription FOR EACH ROW EXECUTE FUNCTION est_valide_true();

CREATE OR REPLACE FUNCTION public.est_valide_true()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
	IF NEW.est_valide = true THEN
		UPDATE paiement
		SET id_preinscription = NEW.id_preinscription
		WHERE paiement.ref_bancaire = NEW.ref_bancaire
		  AND paiement.date_paiement = NEW.date_paiement;
	END IF;
	RETURN NEW;
END;
$function$
;

