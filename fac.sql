CREATE SCHEMA IF NOT EXISTS "public";

CREATE SEQUENCE "public".actualite_id_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".actualite_media_id_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".appartenance_id_appartenance_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".bac_id_bac_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".categorie_actualite_id_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".cofac_id_cofac_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".doyen_et_vice_id_doyen_et_vice_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".ecole_doctorale_id_ecole_doctorale_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".faculte_id_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".fonction_id_fonction_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".grade_id_grade_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".labo_media_id_labo_media_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".laboratoire_id_labo_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".media_id_media_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".mention_id_mention_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".mention_id_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".mention_responsable_id_respo_mention_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".paiement_id_paiement_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".parcours_id_parcours_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".parcours_id_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".pat_id_pat_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".personne_id_personne_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".personne_id_titre_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".poste_affectation_id_post_affectation_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".preinscription_id_preinscription_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".professeur_id_professeur_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".respo_labo_id_respo_labo_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".responsabilité_id_responsabilite_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".role_id_role_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".role_utilisateur_id_role_utilisateur_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".sms_id_sms_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".specialite_id_specialite_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".titre_professeur_id_titre_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".utilisateurs_id_utilisateur_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE TYPE type_formation AS ENUM ('Professionnalisante','Académique');

CREATE TYPE type_media AS ENUM ('Image','vidéo');

CREATE TYPE type_mode_preinscription AS ENUM ('en ligne','poste','sms','presentielle');

CREATE TYPE type_niveau AS ENUM ('L1','L2','L3','M1','M2','D1','D2');

CREATE TYPE type_sexe AS ENUM ('M','F');

CREATE  TABLE "public".appartenance ( 
	id_appartenance      serial  NOT NULL  ,
	nom_appartenance     text  NOT NULL  ,
	CONSTRAINT pk_appartenance PRIMARY KEY ( id_appartenance )
 );

CREATE  TABLE "public".bac ( 
	id_bac               serial  NOT NULL  ,
	annee_bacc           integer  NOT NULL  ,
	num_bacc             integer  NOT NULL  ,
	doc_bac              text    ,
	est_malagasy         boolean DEFAULT true   ,
	CONSTRAINT bac_pkey PRIMARY KEY ( id_bac ),
	CONSTRAINT unique_anne_num UNIQUE ( annee_bacc, num_bacc ) 
 );

CREATE  TABLE "public".categorie_actualite ( 
	id                   serial  NOT NULL  ,
	nom                  varchar(255)  NOT NULL  ,
	CONSTRAINT categorie_actualite_pkey PRIMARY KEY ( id )
 );

CREATE  TABLE "public".ecole_doctorale ( 
	id_ecole_doctorale   serial  NOT NULL  ,
	nom_ecole_doctorale  varchar(250)    ,
	CONSTRAINT pk_ecole_doctorale PRIMARY KEY ( id_ecole_doctorale )
 );

CREATE  TABLE "public".fonction ( 
	id_fonction          serial  NOT NULL  ,
	nom_fonction         text  NOT NULL  ,
	CONSTRAINT pk_fonction PRIMARY KEY ( id_fonction )
 );

CREATE  TABLE "public".grade ( 
	id_grade             serial  NOT NULL  ,
	nom_grade            text  NOT NULL  ,
	CONSTRAINT pk_grade PRIMARY KEY ( id_grade )
 );

CREATE  TABLE "public".media ( 
	chemin               text  NOT NULL  ,
	mimetype             "public".type_media  NOT NULL  ,
	media                integer    ,
	id_media             serial  NOT NULL  ,
	CONSTRAINT pk_media PRIMARY KEY ( id_media )
 );

CREATE  TABLE "public".mention ( 
	id_mention           serial  NOT NULL  ,
	nom_mention          varchar(100)    ,
	abbreviation         varchar(10)  NOT NULL  ,
	description_mention  text    ,
	logo_path            text    ,
	CONSTRAINT mention_pkey PRIMARY KEY ( id_mention )
 );

CREATE  TABLE "public".niveau ( 
	id_niveau            serial  NOT NULL  ,
	nom_niveau           varchar(10)    ,
	CONSTRAINT pk_niveau PRIMARY KEY ( id_niveau )
 );

CREATE  TABLE "public".parcours ( 
	id_parcours          serial  NOT NULL  ,
	nom_parcours         varchar(100)    ,
	formation_type       "public".type_formation  NOT NULL  ,
	description_parcours text    ,
	CONSTRAINT parcours_pkey PRIMARY KEY ( id_parcours )
 );

CREATE  TABLE "public".personne ( 
	id_personne          serial  NOT NULL  ,
	nom                  text  NOT NULL  ,
	email                text    ,
	tel                  varchar(20)    ,
	prenom               text    ,
	date_insertion       timestamp DEFAULT CURRENT_TIMESTAMP   ,
	id_titre             serial  NOT NULL  ,
	sexe                 "public".type_sexe    ,
	id_labo              integer    ,
	CONSTRAINT pk_personne PRIMARY KEY ( id_personne )
 );

CREATE  TABLE "public".poste_affectation ( 
	id_post_affectation  serial  NOT NULL  ,
	nom_post             text  NOT NULL  ,
	CONSTRAINT pk_post_affectation PRIMARY KEY ( id_post_affectation )
 );

CREATE  TABLE "public".responsabilite ( 
	id_responsabilite    integer DEFAULT nextval('"responsabilité_id_responsabilite_seq"'::regclass) NOT NULL  ,
	nom_responsabilite   text  NOT NULL  ,
	CONSTRAINT pk_responsabilité PRIMARY KEY ( id_responsabilite )
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

CREATE  TABLE "public".titre_professeur ( 
	id_titre             serial  NOT NULL  ,
	nom_titre            varchar(250)    ,
	CONSTRAINT pk_titre_professeur PRIMARY KEY ( id_titre )
 );

CREATE  TABLE "public".utilisateurs ( 
	id_utilisateur       serial  NOT NULL  ,
	identifiant          varchar(200)  NOT NULL  ,
	mot_de_passe         varchar(200)  NOT NULL  ,
	CONSTRAINT utilisateurs_pkey PRIMARY KEY ( id_utilisateur )
 );

CREATE  TABLE "public".actualite ( 
	id_actualite         integer DEFAULT nextval('actualite_id_seq'::regclass) NOT NULL  ,
	titre                varchar(255)  NOT NULL  ,
	id_categorie         integer  NOT NULL  ,
	description          text    ,
	contenu              text    ,
	date_creation        timestamp DEFAULT CURRENT_TIMESTAMP   ,
	date_mise_a_jour     timestamp DEFAULT CURRENT_TIMESTAMP   ,
	date_commencement    timestamp    ,
	date_fin             timestamp    ,
	lieu                 varchar(255)    ,
	CONSTRAINT actualite_pkey PRIMARY KEY ( id_actualite ),
	CONSTRAINT fk_categorie FOREIGN KEY ( id_categorie ) REFERENCES "public".categorie_actualite( id ) ON DELETE CASCADE  
 );

CREATE  TABLE "public".actualite_media ( 
	id                   serial  NOT NULL  ,
	id_actualite         integer  NOT NULL  ,
	id_media             integer  NOT NULL  ,
	CONSTRAINT actualite_media_pkey PRIMARY KEY ( id ),
	CONSTRAINT fk_media FOREIGN KEY ( id_media ) REFERENCES "public".media( id_media ) ON DELETE SET NULL  ,
	CONSTRAINT fk_actualite FOREIGN KEY ( id_actualite ) REFERENCES "public".actualite( id_actualite ) ON DELETE SET NULL  
 );

CREATE  TABLE "public".cofac ( 
	id_cofac             serial  NOT NULL  ,
	personne_id          integer  NOT NULL  ,
	appartenance_id      integer  NOT NULL  ,
	date_creation        date DEFAULT CURRENT_DATE   ,
	CONSTRAINT pk_cofac PRIMARY KEY ( id_cofac ),
	CONSTRAINT fk_cofac_personne FOREIGN KEY ( personne_id ) REFERENCES "public".personne( id_personne ) ON DELETE SET NULL ON UPDATE SET NULL ,
	CONSTRAINT fk_cofac_appartenance FOREIGN KEY ( appartenance_id ) REFERENCES "public".appartenance( id_appartenance ) ON DELETE SET NULL ON UPDATE SET NULL 
 );

CREATE  TABLE "public".doyen_et_vice ( 
	id_doyen_et_vice     serial  NOT NULL  ,
	personne_id          integer  NOT NULL  ,
	id_responsablilite   integer  NOT NULL  ,
	date_creation        date DEFAULT CURRENT_DATE   ,
	CONSTRAINT pk_doyen_et_vice PRIMARY KEY ( id_doyen_et_vice ),
	CONSTRAINT fk_doyen_et_vice_personne FOREIGN KEY ( personne_id ) REFERENCES "public".personne( id_personne ) ON DELETE SET NULL ON UPDATE SET NULL ,
	CONSTRAINT fk_doyen_et_vice FOREIGN KEY ( id_responsablilite ) REFERENCES "public".responsabilite( id_responsabilite ) ON DELETE SET NULL ON UPDATE SET NULL 
 );

CREATE  TABLE "public".laboratoire ( 
	nom_labo             text  NOT NULL  ,
	mention_rattachement integer    ,
	description          jsonb    ,
	id_labo              serial  NOT NULL  ,
	ecole_doctorale_rattachement integer    ,
	abbreviation         varchar(20)    ,
	CONSTRAINT pk_laboratoire PRIMARY KEY ( id_labo ),
	CONSTRAINT fk_laboratoire_ecole_doctorale FOREIGN KEY ( ecole_doctorale_rattachement ) REFERENCES "public".ecole_doctorale( id_ecole_doctorale ) ON DELETE SET NULL ON UPDATE SET NULL ,
	CONSTRAINT fk_laboratoire_mention FOREIGN KEY ( mention_rattachement ) REFERENCES "public".mention( id_mention ) ON DELETE CASCADE ON UPDATE CASCADE 
 );

CREATE  TABLE "public".mention_niveau_parcours ( 
	id_mnp               serial  NOT NULL  ,
	id_parcours          integer  NOT NULL  ,
	id_mention           integer  NOT NULL  ,
	id_niveau            integer  NOT NULL  ,
	CONSTRAINT pk_mention_niveau_parcours PRIMARY KEY ( id_mnp ),
	CONSTRAINT fk_mention_niveau_parcours FOREIGN KEY ( id_parcours ) REFERENCES "public".parcours( id_parcours )   ,
	CONSTRAINT fk_mnp_mention FOREIGN KEY ( id_mention ) REFERENCES "public".mention( id_mention )   ,
	CONSTRAINT fk_mnp_niveau FOREIGN KEY ( id_niveau ) REFERENCES "public".niveau( id_niveau )   
 );

CREATE  TABLE "public".mention_responsable ( 
	id_respo_mention     serial  NOT NULL  ,
	id_mention           integer  NOT NULL  ,
	id_personne          integer  NOT NULL  ,
	date_debut           date DEFAULT CURRENT_DATE   ,
	date_fin             date    ,
	CONSTRAINT pk_mention_responsable PRIMARY KEY ( id_respo_mention ),
	CONSTRAINT fk_mention_responsable FOREIGN KEY ( id_personne ) REFERENCES "public".personne( id_personne ) ON DELETE SET NULL ON UPDATE SET NULL ,
	CONSTRAINT fk_mention_responsable_mention FOREIGN KEY ( id_mention ) REFERENCES "public".mention( id_mention ) ON DELETE SET NULL ON UPDATE SET NULL 
 );

CREATE  TABLE "public".pat ( 
	id_pat               serial  NOT NULL  ,
	id_personne          integer  NOT NULL  ,
	id_post_affectation  integer  NOT NULL  ,
	id_grade             integer  NOT NULL  ,
	id_fonction          integer  NOT NULL  ,
	CONSTRAINT pk_pat PRIMARY KEY ( id_pat ),
	CONSTRAINT fk_pat_personne FOREIGN KEY ( id_personne ) REFERENCES "public".personne( id_personne ) ON DELETE SET NULL ON UPDATE SET NULL ,
	CONSTRAINT fk_pat_fonction FOREIGN KEY ( id_fonction ) REFERENCES "public".fonction( id_fonction ) ON DELETE SET NULL ON UPDATE SET NULL ,
	CONSTRAINT fk_pat_grade FOREIGN KEY ( id_grade ) REFERENCES "public".grade( id_grade ) ON DELETE SET NULL ON UPDATE SET NULL ,
	CONSTRAINT fk_pat_poste_affectation FOREIGN KEY ( id_post_affectation ) REFERENCES "public".poste_affectation( id_post_affectation ) ON DELETE SET NULL ON UPDATE SET NULL 
 );

CREATE  TABLE "public".preinscription ( 
	id_preinscription    serial  NOT NULL  ,
	email                text    ,
	tel                  varchar(100)    ,
	ref_bancaire         varchar(100)  NOT NULL  ,
	agence               varchar(200)  NOT NULL  ,
	date_paiement        timestamp  NOT NULL  ,
	date_preinscription  timestamp DEFAULT CURRENT_TIMESTAMP   ,
	date_validation      timestamp    ,
	est_selectionner     boolean DEFAULT false   ,
	id_mention           integer    ,
	date_selection       date    ,
	est_valide           boolean DEFAULT false   ,
	admin_validation     integer    ,
	id_bac               integer    ,
	mode_inscription     "public".type_mode_preinscription    ,
	CONSTRAINT preinscription_pkey PRIMARY KEY ( id_preinscription ),
	CONSTRAINT unique_ref_date_agence UNIQUE ( agence, date_paiement, ref_bancaire ) ,
	CONSTRAINT fk_preinscription_mention FOREIGN KEY ( id_mention ) REFERENCES "public".mention( id_mention ) ON DELETE SET NULL ON UPDATE SET NULL ,
	CONSTRAINT preinscription_admin_validation_fkey FOREIGN KEY ( admin_validation ) REFERENCES "public".utilisateurs( id_utilisateur )   ,
	CONSTRAINT preinscription_id_bac_fkey FOREIGN KEY ( id_bac ) REFERENCES "public".bac( id_bac )   
 );

ALTER TABLE "public".preinscription ADD CONSTRAINT preinscription_email_check CHECK ( email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'::text );

CREATE  TABLE "public".professeur ( 
	id_professeur        serial  NOT NULL  ,
	personne             integer  NOT NULL  ,
	titre                integer  NOT NULL  ,
	CONSTRAINT pk_professeur PRIMARY KEY ( id_professeur ),
	CONSTRAINT fk_professeur_titre_professeur FOREIGN KEY ( titre ) REFERENCES "public".titre_professeur( id_titre ) ON DELETE SET NULL ON UPDATE SET NULL ,
	CONSTRAINT fk_professeur_personne FOREIGN KEY ( personne ) REFERENCES "public".personne( id_personne ) ON DELETE SET NULL ON UPDATE SET NULL 
 );

CREATE  TABLE "public".respo_labo ( 
	id_respo_labo        serial  NOT NULL  ,
	responsable          integer    ,
	date_debut           timestamp DEFAULT CURRENT_TIMESTAMP   ,
	date_fin             timestamp    ,
	id_labo              integer    ,
	CONSTRAINT pk_respo_labo PRIMARY KEY ( id_respo_labo ),
	CONSTRAINT fk_respo_labo_personne FOREIGN KEY ( responsable ) REFERENCES "public".personne( id_personne ) ON DELETE SET NULL ON UPDATE SET NULL ,
	CONSTRAINT fk_respo_labo_laboratoire FOREIGN KEY ( id_labo ) REFERENCES "public".laboratoire( id_labo ) ON DELETE SET NULL ON UPDATE SET NULL 
 );

CREATE  TABLE "public".role_utilisateur ( 
	id_role_utilisateur  serial  NOT NULL  ,
	id_role              integer  NOT NULL  ,
	id_utilisateur       integer  NOT NULL  ,
	CONSTRAINT role_utilisateur_pkey PRIMARY KEY ( id_role_utilisateur ),
	CONSTRAINT role_utilisateur_id_utilisateur_fkey FOREIGN KEY ( id_utilisateur ) REFERENCES "public".utilisateurs( id_utilisateur )   ,
	CONSTRAINT role_utilisateur_id_role_fkey FOREIGN KEY ( id_role ) REFERENCES "public"."role"( id_role )   
 );

CREATE  TABLE "public".specialite ( 
	id_specialite        serial  NOT NULL  ,
	nom_specilaite       varchar(200)  NOT NULL  ,
	id_mnp               integer  NOT NULL  ,
	CONSTRAINT specialite_pkey PRIMARY KEY ( id_specialite ),
	CONSTRAINT fk_specialite_actualite FOREIGN KEY ( id_mnp ) REFERENCES "public".mention_niveau_parcours( id_mnp )   
 );

CREATE  TABLE "public".labo_media ( 
	media                integer  NOT NULL  ,
	labo                 integer  NOT NULL  ,
	id_labo_media        serial  NOT NULL  ,
	CONSTRAINT pk_labo_media PRIMARY KEY ( id_labo_media ),
	CONSTRAINT fk_labo_media_media FOREIGN KEY ( media ) REFERENCES "public".media( id_media ) ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_labo_media_laboratoire FOREIGN KEY ( labo ) REFERENCES "public".laboratoire( id_labo ) ON DELETE CASCADE ON UPDATE CASCADE 
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
	CONSTRAINT paiement_id_utilisateur_fkey FOREIGN KEY ( id_utilisateur ) REFERENCES "public".utilisateurs( id_utilisateur )   ,
	CONSTRAINT paiement_id_preinscription_fkey FOREIGN KEY ( id_preinscription ) REFERENCES "public".preinscription( id_preinscription )   
 );

CREATE TRIGGER trg_check_personne_before_insert BEFORE INSERT ON public.personne FOR EACH ROW EXECUTE FUNCTION check_personne_before_insert();

CREATE TRIGGER trigger_est_valide AFTER UPDATE OF est_valide ON public.preinscription FOR EACH ROW EXECUTE FUNCTION est_valide_true();

CREATE OR REPLACE FUNCTION public.check_personne_before_insert()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    -- Vérifie si une personne existe déjà avec le même nom et prénom
    IF EXISTS (
        SELECT 1 FROM personne
        WHERE nom = NEW.nom AND prenom = NEW.prenom
    ) THEN
        -- Met à jour son id_labo avec la nouvelle valeur
        UPDATE personne
        SET id_labo = NEW.id_labo
        WHERE nom = NEW.nom AND prenom = NEW.prenom;
        -- Annule l’insertion (car on a déjà fait le travail)
        RETURN NULL;
    ELSE
        -- Sinon on continue l’insertion normalement
        RETURN NEW;
    END IF;
END;
$function$
;

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

INSERT INTO "public".appartenance( id_appartenance, nom_appartenance ) VALUES ( 1, 'Responsable mention');
INSERT INTO "public".appartenance( id_appartenance, nom_appartenance ) VALUES ( 2, 'Membre exterieur');
INSERT INTO "public".appartenance( id_appartenance, nom_appartenance ) VALUES ( 3, 'Representant enseignant');
INSERT INTO "public".appartenance( id_appartenance, nom_appartenance ) VALUES ( 4, 'Representant PAT');
INSERT INTO "public".appartenance( id_appartenance, nom_appartenance ) VALUES ( 6, 'Representant doctorant');
INSERT INTO "public".appartenance( id_appartenance, nom_appartenance ) VALUES ( 5, 'Representant etudiant');
INSERT INTO "public".ecole_doctorale( id_ecole_doctorale, nom_ecole_doctorale ) VALUES ( 1, 'Ecole doctorale physique et applications');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 1, 'Secrétaire pricipal');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 2, 'Aide ferronier');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 3, 'Femme de ménage');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 4, 'Secrétaire du doyen');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 5, 'Gens de maison');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 6, 'Depositaire comptable');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 7, 'Souffleur');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 8, 'Planton');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 9, 'Secrétaire');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 10, 'Aide technicien');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 11, 'Juill');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 12, 'Secr comptable/coursier');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 13, 'Bibliothécaire');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 14, 'Informaticien');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 15, 'Aide informaticien');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 16, 'Technicien');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 17, 'Chef de service');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 18, 'Comptable');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 19, 'Polycopiste');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 20, 'Garçon d''amphi');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 21, 'Chauffeur');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 22, 'Gardien');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 23, 'Jardinier');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 24, 'Adjoint au chef');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 25, 'Maçon');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 26, 'Magasinier');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 27, 'Agent payeur');
INSERT INTO "public".fonction( id_fonction, nom_fonction ) VALUES ( 28, 'Secretaire comptable');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 1, 'Attaché adm');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 2, 'Concepteur');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 3, 'Techn.sup.');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 4, 'Adjoint de service');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 5, 'Encadreur');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 6, 'Réalisateur');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 7, 'Réali/adj.');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 8, 'Opérateur');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 9, 'Ouvr prof 2è cat.');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 10, 'Employé/sce');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 11, 'Sous opérateur');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 12, 'Ouvrier ordin');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 13, 'Manœuvre sp');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 14, 'Preparateur de labo');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 15, 'Attac.2 plan');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 16, 'Femme de ch');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 17, 'Planton s l/e');
INSERT INTO "public".grade( id_grade, nom_grade ) VALUES ( 18, 'Assistant/sce');
INSERT INTO "public".mention( id_mention, nom_mention, abbreviation, description_mention, logo_path ) VALUES ( 1, 'ANTHROPOBIOLOGIE ET DEVELOPPEMENT DURABLE', 'ADD', null, null);
INSERT INTO "public".mention( id_mention, nom_mention, abbreviation, description_mention, logo_path ) VALUES ( 2, 'BIOLOGIE ET ECOLOGIE VEGETALES', 'BEV', null, null);
INSERT INTO "public".mention( id_mention, nom_mention, abbreviation, description_mention, logo_path ) VALUES ( 3, 'BIOCHIMIE FONDAMENTALE ET APPLIQUEE', 'BFA', null, null);
INSERT INTO "public".mention( id_mention, nom_mention, abbreviation, description_mention, logo_path ) VALUES ( 5, 'CHIMIE', 'CHI', null, null);
INSERT INTO "public".mention( id_mention, nom_mention, abbreviation, description_mention, logo_path ) VALUES ( 6, 'ENTOMOLOGIE – CULTURE – ELEVAGE - SANTE', 'ECES', null, null);
INSERT INTO "public".mention( id_mention, nom_mention, abbreviation, description_mention, logo_path ) VALUES ( 7, 'MATHEMATIQUES ET INFORMATIQUES', 'MI', null, null);
INSERT INTO "public".mention( id_mention, nom_mention, abbreviation, description_mention, logo_path ) VALUES ( 8, 'PHYSIQUES ET APPLICATIONS', 'PAP', null, null);
INSERT INTO "public".mention( id_mention, nom_mention, abbreviation, description_mention, logo_path ) VALUES ( 9, 'PHYSIOLOGIE ANIMALE – PHARMACOLOGIE – COSMETOLOGIE', 'PPC', null, null);
INSERT INTO "public".mention( id_mention, nom_mention, abbreviation, description_mention, logo_path ) VALUES ( 10, 'PROCEDES ET ECOLOGIE INDUSTRIELLE', 'PEI', null, null);
INSERT INTO "public".mention( id_mention, nom_mention, abbreviation, description_mention, logo_path ) VALUES ( 11, 'SCIENCES DE LA TERRE ET D’EVOLUTION', 'STE', null, null);
INSERT INTO "public".mention( id_mention, nom_mention, abbreviation, description_mention, logo_path ) VALUES ( 12, 'ZOOLOGIE ET BIODIVERSITE ANIMALE', 'ZBA', null, null);
INSERT INTO "public".mention( id_mention, nom_mention, abbreviation, description_mention, logo_path ) VALUES ( 13, 'INFORMATIQUE TECHNOLOGIE', 'IT', null, null);
INSERT INTO "public".mention( id_mention, nom_mention, abbreviation, description_mention, logo_path ) VALUES ( 14, 'GEOLOGIE APPLIQUEE AU DEVELOPPEMENT', 'GEODE', null, null);
INSERT INTO "public".mention( id_mention, nom_mention, abbreviation, description_mention, logo_path ) VALUES ( 4, 'BASSIN SEDIMENTAIRE – EVOLUTION - CONSERVATION', 'BEC', null, null);
INSERT INTO "public".niveau( id_niveau, nom_niveau ) VALUES ( 1, 'L1');
INSERT INTO "public".niveau( id_niveau, nom_niveau ) VALUES ( 2, 'L2');
INSERT INTO "public".niveau( id_niveau, nom_niveau ) VALUES ( 3, 'L3');
INSERT INTO "public".niveau( id_niveau, nom_niveau ) VALUES ( 4, 'M1');
INSERT INTO "public".niveau( id_niveau, nom_niveau ) VALUES ( 5, 'M2');
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 5, 'RABEHARISOA', 'rabearisoaolivier@gmail.com', '0387711016', 'Olivier', '2025-09-06 03:47:02 pm', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 6, 'RAKOTONANAHARY', 'tahirintsoa4hasina@gmail.com', '0341001646', 'Jacquis Hasina Tahirintsoa', '2025-09-06 03:47:02 pm', 5, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 7, 'RAKOTONANAHARY', 'mbolatiana.rakotonanahary@univ-antananarivo.mg', '0343614661', 'Mbolatiana', '2025-09-06 03:47:02 pm', 6, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 9, 'FIDINARIVO', 'toma.fidinarivo@univ-antananarivo.mg', '0381867375', 'Thomas', '2025-09-06 03:47:02 pm', 7, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 10, 'RAKOTOMAVO', 'rakotomavotantelinirina2@gmail.com', '0341053582', 'Tantelinirina', '2025-09-06 03:47:02 pm', 8, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 8, 'RATSIMBARISON', null, '0344697690', 'Rivoson', '2025-09-06 03:47:02 pm', 23, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 26, 'ANDRIANARIMISA', 'aristide.andrianarimisa@univ-antananarivo.mg', null, 'Aristide', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 27, 'ANDRIANTSOA', 'esther.andriantsoa@univ-antananarivo.mg', null, 'Nirifenohanitra Esther', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 28, 'HARISON', 'victor.harison@univ-antananarivo.mg', null, 'Victor Andrianaivo', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 29, 'RABESIAKA', 'hanitrala.rabesiaka@univ-antananarivo.mg', null, 'Mihasina Hanitr''Ala Jean', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 30, 'RABESIRANANA', 'naivo.rabesiranana@univ-antananarivo.mg', null, 'Naivo', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 31, 'RABOANARY', 'roland.raboanary@univ-antananarivo.mg', null, 'Rolland', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 32, 'RAFARASOA', 'lala.rafarasoa@univ-antananarivo.mg', null, 'Lala Sahondra ép. ANDRIANANTENAINA', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 33, 'RAHARIMALALA', null, null, 'Laurence Eliane', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 34, 'RAHERIMANDIMBY', 'marson.raherimandimby@univ-antananarivo.mg', null, 'Marson', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 35, 'RAJOELINA', 'michel.rajoelina@univ-antananarivo.mg', null, 'Michel Martin', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 36, 'RAKOTOARIMANANA', 'vonjison.rakotoarimanana@univ-antananarivo.mg', null, 'Vonjison', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 37, 'RAKOTOARIMANGA', 'jv.rakotoarimanga@univ-antananarivo.mg', null, 'Jeannot Victor', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 38, 'RAKOTOMALALA', 'minoson2002@yahoo.fr', null, 'Minoson Sendrahasina', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 39, 'RAKOTOMALALA', 'hasinanirina.randrianaly@univ-antananarivo.mg', null, 'née RANDRIANALY Hasina Nirina', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 40, 'RAKOTOMANANA', 'hajanirina.rakotomanana@univ-antananarivo.mg', null, 'Hajanirina Fanomezantsoa', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 41, 'RAKOTONDRAMIARANA', 'herytiana.rakotondramiarana@univ-antananarivo.mg', null, 'Hery Tiana', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 42, 'RAKOTONIAINA', 'solofoarisoa.rakotoniaina@univ-antananarivo.mg', null, 'Solofoarisoa', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 43, 'RAMANAMPAMONJY', 'nivohanintsoa.ramanampamonjy@univ-antananarivo.mg', null, 'née RAVONIARISON Nivohanintsoa', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 44, 'RAMANANDRAIBE', 'voahangy.vestalys@univ-antananarivo.mg', null, 'Voahangy', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 45, 'RAMASIARINORO', 'voahanginirina.ramasiarinoro@univ-antananarivo.mg', null, 'Voahanginirina Jeanine', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 46, 'RANDRIAMANANTANY', 'zely.randriamanantany@univ-antananarivo.mg', null, 'Zely Arivelo', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 47, 'RANDRIANARIVO', 'ranjana.randrianarivo@univ-antananarivo.mg', null, 'Hanitra Ranjàna', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 48, 'RANDRIANARIVONY', 'arthur.randrianarivony@gmail.com', null, 'Arthur', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 49, 'RANDRIANASOLO', 'rivoarison.randrianasolo@univ-antananarivo.mg', null, 'Rivoarison', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 51, 'RANOROMALALA', 'aurore-doll.rakoto@univ-antananarivo.mg', null, 'Danielle Aurore Doll', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 52, 'RASELIMANANA', 'achille.raselimanana@univ-antananarivo.mg', null, 'Achille Philippe', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 53, 'RASOANAIVO', 'lea.rasoanaivo@univ-antananarivo.mg', null, 'Herilala Léa', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 54, 'RAVAOMANARIVO', 'lala.ravaomanarivo@univ-antananarivo.mg', null, 'Lala Harivelo', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 55, 'RAVELONANDRO', 'phravelona@yahoo.com', null, 'Pierre Hervé', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 56, 'RAVELONIRINA', 'hanitriniaina.ravelonirina@univ-antananarivo.mg', null, 'Hanitriniaina Sammy Grégoire', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 57, 'RAZAFIMBELO', 'rachel.razafimbelo@univ-antananarivo.mg', null, 'Marie Rachel', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 58, 'SPIRAL', 'germain.spiral@univ-antananarivo.mg', null, 'Germain Jules', '2025-09-08 10:31:48 am', 1, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 59, 'ANDRIAMBININTSOA RANAIVOSON', 'tojonirina.andriambinintsoa@univ-antananarivo.mg', null, 'Tojonirina', '2025-09-08 10:31:48 am', 2, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 60, 'HANITRIARIVO', 'rakotoson.hanitriarivo@univ-antananarivo.mg', null, 'Rakotoson', '2025-09-08 10:31:48 am', 2, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 62, 'RABETAFIKA', 'lydia.rabetafika@univ-antananarivo.mg', null, 'née RAVONISOARIMALALA Lydia Laurence', '2025-09-08 10:31:48 am', 2, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 63, 'RAKOTO', 'heritiana.rakoto@univ-antananarivo.mg', null, 'Heritiana Andriamananjara', '2025-09-08 10:31:48 am', 2, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 65, 'RAKOTONDRAJAO', 'fanja.rakotondrajao@univ-antananarivo.mg', null, 'Fanja Rondro Tiana', '2025-09-08 10:31:48 am', 2, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 66, 'RAKOTONDRAMANANA', 'hery-tiana.rakotondramanana@univ-antananarivo.mg', null, 'Hery Tiana', '2025-09-08 10:31:48 am', 2, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 67, 'RANDRIAMBOLOLONDRANTOMALALA', 'princy.randriambololondrantomalala@univ-antananarivo.mg', null, 'Princy', '2025-09-08 10:31:48 am', 2, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 68, 'RASAMIRAVAKA', 'tsiry.rasamiravaka@univ-antananarivo.mg', null, 'Tsiry', '2025-09-08 10:31:48 am', 2, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 15, 'RAZAKARIVONY', 'andrianambinina.razakarivony@univ-antananarivo.mg', null, 'Andriamarolahy Andrianambinina', '2025-09-06 04:24:03 pm', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 20, 'ANDRIAMIADAMANANA', 'christian.andriamiadamanana@univ-antananarivo.mg', null, 'Mavintana Dangerfield Christian', '2025-09-06 04:24:03 pm', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 14, 'RAKOTONIMANANA', 'rivoniaina.rakotonimanana@univ-antananarivo.mg', null, 'Rivoniaina Michel Jese', '2025-09-06 04:24:03 pm', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 69, 'RASOLOFONIRINA', 'mamiseheno.rasolofonirina@univ-antananarivo.mg', null, 'Mamiseheno', '2025-09-08 10:31:48 am', 2, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 71, 'RAVELOMANANTSOA', 'solofonirina.ravelomanantsoa@univ-antananarivo.mg', null, 'Solofonirina Dieudonné', '2025-09-08 10:31:48 am', 2, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 72, 'TSIRINIRINDRAVO', 'herisetra.tsirinirindravo@univ-antananarivo.mg', null, 'Herisetra Lalaina', '2025-09-08 10:31:48 am', 2, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 73, 'ANDRIAMALALA', 'solofoniaina_g.andriamalala@univ-antananarivo.mg', null, 'Solofoniaina Gabriel', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 74, 'ANDRIAMALAZA', 'sahondralaza@univ-antananarivo.mg', null, 'Sahondra', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 75, 'ANDRIAMAMONJY', 'alfred.andriamamonjy@univ-antananarivo.mg', null, 'Solofomampiely Alfred', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 19, 'ANDRIAMAMPIANINA', 'tianarilalaina.andriamampianina@univ-antananarivo.mg', null, 'Tianarilalaina Tantely', '2025-09-06 04:24:03 pm', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 77, 'ANDRIAMAMPIONONA', 'livasoa.andriamampionona@univ-antananarivo.mg', null, 'Livasoa', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 61, 'RABEHARISOA', 'jeanmarc.rabeharisoa@univ-antananarivo.mg', null, 'Jean Marc', '2025-09-08 10:31:48 am', 178, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 78, 'ANDRIAMANAMISATA', 'valerielalao.razafindratovo@univ-antananarivo.mg', null, 'née RAZAFINDRATOVO Valérie Lalao', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 79, 'ANDRIAMARONDRANTO', 'ranaivo.andriamarondranto@univ-antananarivo.mg', null, 'Ranaivo Jean Victor', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 23, 'ANDRIAMAROZAKANIAINA', 'tahiry.andriamarozakaniaina@univ-antananarivo.mg', null, 'Tahiry Zaka Filamatra', '2025-09-06 04:24:03 pm', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 81, 'ANDRIAMBAHOAKA', 'zedidia.andriambahoaka@univ-antananarivo.mg', null, 'Zedidia', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 83, 'ANDRIAMIFIDISOA', 'ramamonjy.andriamifidisoa@univ-antananarivo.mg', null, 'Ramamonjy', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 84, 'ANDRIAMPANARIVO', 'haingo.andriampanarivo@univ-antananarivo.mg', null, 'Haingo Laza Herinandrasana', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 86, 'ANDRIANARANJANAKA', 'voahangy.andrianaranjaka@univ-antananarivo.mg', null, 'Voahangy Hanitriniaina Isabelle', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 87, 'ANDRIATAHINY', 'harinaivo.andriatahiny@univ-antananarivo.mg', null, 'Harinaivo', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 88, 'FALINIAINA', 'lucien.faliniaina@univ-antananarivo.mg', null, 'Lucien', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 89, 'GARO JOELSON', 'sebille.garo@univ-antananarivo.mg', null, 'Sebille', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 90, 'HARIMALALA ANDRIAMBELO', 'nirina.harimalala@univ-antananarivo.mg', null, 'Nirina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 91, 'HERIARIVONY', 'sheriarivony.cl@gmail.com', null, 'Soanirina Claudeline', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 17, 'LALAHARISON', 'hanjarivo.lalaharison@univ-antananarivo.mg', null, 'Hanjarivo', '2025-09-06 04:24:03 pm', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 93, 'LANTOVOLOLONA', 'jeanne.lantovololona@univ-antananarivo.mg', null, 'Jeanne Eliane Roger', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 94, 'MADISON RAZANATSEHENO', 'madisonraza@univ-antananarivo.mg', null, 'Marie Olga', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 95, 'MANAGNEO', 'maxlubin.managneo@univ-antananarivo.mg', null, 'Max Lubin', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 96, 'NDRIANAIVO', 'nnjara@univ-antananarivo.mg', null, 'Elia Njara', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 97, 'OLIARINONY', 'ranalison.oliarinony@univ-antananarivo.mg', null, 'Ranalison', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 98, 'RABARISON', 'prabarison@gmail.com', null, 'Fanomezantsoa Patrick', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 99, 'RABARISON', 'harison.rabarison@univ-antananarivo.mg', null, 'Harison', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 100, 'RABEFIHAVANANA', 'luc.rabefihavanana@univ-antananarivo.mg', null, 'Fanomezana Zanahary Tsaratanisoa Luc', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 101, 'RABEMANANJARA', 'andry.rabemananjara@univ-antananarivo.mg', null, 'Andry Christian', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 102, 'RABEMANANJARA', 'patrice.rabemananjara@univ-antananarivo.mg', null, 'Patrice', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 103, 'RABENDRINA', 'antoine.rabendrina@univ-antananarivo.mg', null, 'Antoine', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 105, 'RAFANJANIRINA', 'eulalie.rafanjanirina@univ-antananarivo.mg', null, 'Eulalie Odilette', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 106, 'RAFIDISON', 'verohanitra.rafidison@univ-antananarivo.mg', null, 'Verohanitra Miarivelomalala', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 107, 'RAHANITRARIVONY', 'veronirina.rahanitrarivony@univ-antananarivo.mg', null, 'Veronirina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 108, 'RAHANTARISOA', 'lydia.rahantarisoa@univ-antananarivo.mg', null, 'Lydia Jeanne', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 109, 'RAHARINIRINA', 'domohina.raharinirina@univ-antananarivo.mg', null, 'Domohina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 110, 'RAHARIVOLOLONA', 'brigitte.raharivololona@univ-antananarivo.mg', null, 'Brigitte Marie', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 111, 'RAHERILALAO', 'jeanne.raherilalao@univ-antananarivo.mg', null, 'Marie Jeanne', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 112, 'RAHOBISOA', 'jacques.rahobisoa@univ-antananarivo.mg', null, 'Jean Jacques', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 113, 'RAJAOARISOA', 'andriamanjato.rajaoarisoa@univ-antananarivo.mg', null, 'Andriamanjato', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 114, 'RAJAONA RAFIHAVANANA', 'andrianaivoravelona.rajaona@univ-antananarivo.mg', null, 'Andrianaivoravelona', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 115, 'RAKOTO', 'jean_jolly.rakoto@univ-antananarivo.mg', null, 'Jean Jolly', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 116, 'RAKOTO JOSEPH ONIMIHAMINA', 'onimihamina.rakoto@univ-antananarivo.mg', null, 'Ravaosolo  Harivelo', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 117, 'RAKOTO', 'nelly.rakoto@univ-antananarivo.mg', null, 'Nelly Ghislaine', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 118, 'RAKOTOAMBOA', 'jean_louis.rakotoamboa@univ-antananarivo.mg', null, 'Jean Louis', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 119, 'RAKOTOARIMANANA', 'graffin.rakotoarimanana@univ-antananarivo.mg', null, 'Liva  Graffin', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 121, 'RAKOTOARISON', 'olivier.rakotoarison@univ-antananarivo.mg', null, 'Olivier', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 122, 'RAKOTOARISON', 'solohery.rakotoarison@univ-antananarivo.mg', null, 'Solohery Hajanirina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 123, 'RAKOTOMALALA', 'jeanyves.rakotomalala@univ-antananarivo.mg', null, 'Jean Yves', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 124, 'RAKOTOMALALA', 'harimisa.rakotomalala@univ-antananarivo.mg', null, 'née RAVAOMANARIVO Harimisa', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 125, 'RAKOTOMALALA', 'zafimahery.rakotomalala@univ-antananarivo.mg', null, 'Zafimahery', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 126, 'RAKOTONASY', 'solonjaka.rakotonasy@univ-antananarivo.mg', null, 'Solonjaka Hiarintsoa', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 127, 'RAKOTONDRALAMBO', 'joseph.rakotondralambo@univ-antananarivo.mg', null, 'Joseph', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 128, 'RAKOTONDRAMANGA', 'maonja.rakotondramanga@univ-antananarivo.mg', null, 'Maonja Finaritra Sitrakiniavo', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 129, 'RAKOTONDRAMASY', 'lovasoa.rakotondramasy@univ-antananarivo.mg', null, 'Lovasoa Nandrandraina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 130, 'RAKOTONDRAPARANY', 'felix.rakotondraparany@univ-antananarivo.mg', null, 'Félix', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 131, 'RAKOTONDRAZAFY', 'jennie.rakotondrazafy@univ-antananarivo.mg', null, 'Jennie Irma Norosoa', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 132, 'RAKOTONDRAZAFY', 'toussaint.rakotondrazafy@univ-antananarivo.mg', null, 'Toussaint', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 21, 'RAKOTOSAMIZANANY', 'saholyrakoto@univ-antananarivo.mg', null, 'Saholy', '2025-09-06 04:24:03 pm', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 2, 'RAKOTOVAO', 'niry.rakotovao@univ-antananarivo.mg', '0341015151', 'Niry Arinavalona', '2025-09-06 03:47:02 pm', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 137, 'RALAIARISOA', 'haritiana.ralaiarisoa@univ-antananarivo.mg', null, 'Haritiana Luciette', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 138, 'RALAMBO', 'alain.ralambo@univ-antananarivo.mg', null, 'Alain Narcisse', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 139, 'RALAMBOMANANA', 'dimbyandrianina.ralambomanana@univ-antananarivo.mg', null, 'Dimby Andrianina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 140, 'RAMAHANDRISOA', 'tsirilalaina.ramahandrisoa@univ-antananarivo.mg', null, 'Tsirilalaina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 141, 'RAMAHAZOSOA', 'irrish.ramahazosoa@univ-antananarivo.mg', null, 'Irrish Parker', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 142, 'RAMAMONJISOA', 'armand.ramamonjisoa@gmail.com', null, 'Armand', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 143, 'RAMANANTSOA', 'ravo.ramanantsoa@univ-antananarivo.mg', null, 'Ravo Parany Gabriel', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 144, 'RAMAROMILANTO', 'borome.ramaromilanto@univ-antananarivo.mg', null, 'Boromé', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 145, 'RAMAROSANDRATANA', 'arovonjy.ramarosandratana@univ-antananarivo.mg', null, 'Ndriana Aro Vonjy Honoré', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 146, 'RAMAROSON', 'roseline.ramaroson@univ-antananarivo.mg', null, 'Roseline Vololoniaina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 147, 'RAMAROSON', 'voahirana.ramaroson@univ-antananarivo.mg', null, 'Voahirana', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 148, 'RAMAROTAFIKA', 'hery.ramarotafika@univ-antananarivo.mg', null, 'Hery Andriatsitohaina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 149, 'RAMAROVELO', 'lydia_maria.ramarovelo@univ-antananarivo.mg', null, 'Lydia Maria', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 24, 'RAMIANDRISOA', 'njara.ramiandrisoa@univ-antananarivo.mg', null, 'Njararivelo Louisa', '2025-09-06 04:24:03 pm', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 151, 'RANAIVOARISOA', 'jean_freddy.ranaivoarisoa@univ-antananarivo.mg', null, 'Jean Freddy', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 152, 'RANAIVOSOA', 'rnvoaj@univ-antananarivo.mg', null, 'Voajanahary', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 153, 'RANAIVOSOLO', 'ravomiarana.ranaivosolo@univ-antananarivo.mg', null, 'Ravomiarana Andrianaivo', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 154, 'RANDRIAMAHALEO', 'fanilo.randriamahaleo@univ-antananarivo.mg', null, 'Fanilo Rajaofetra', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 155, 'RANDRIAMALALA', 'rrandriamalala@basetoliara.mg', null, 'Réné Paul', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 156, 'RANDRIAMAMPANDRY', 'soloherymampionona@gmail.com', null, 'Solohery Mampionona', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 158, 'RANDRIANALIMANGA', 'nombana.raharivelo@univ-antananarivo.mg', null, 'née RAHARIVELO Nombana', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 159, 'RANDRIANANDRAINA', 'hery_zo.randrianandraina@univ-antananarivo.mg', null, 'Hery Zo', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 160, 'RANDRIANANTOANDRO', 'tahina.randrianantoandro@univ-antananarivo.mg', null, 'Tahina Lalaina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 163, 'RANIVO', null, null, 'Julie Christie', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 164, 'RAOBIARIMIADANA', 'ando_lalaniaina.randrianierenana@univ-antananarivo.mg', null, 'Ando Lalaniaina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 165, 'RASOAMALALA', 'vololonirina.rasoamalala@univ-antananarivo.mg', null, 'Vololonirina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 166, 'RASOAZANANY', 'elise.rasoazanany@univ-antananarivo.mg', null, 'Elise Octavie', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 167, 'RASOLOARIJAONA', 'mamy.rasoloarijaona@univ-antananarivo.mg', null, 'Mamy Nirina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 168, 'RASOLOARIVONY', 'rodolphe.rasoloarivony@univ-antananarivo.mg', null, 'Rodolphe', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 170, 'RASOLONJATOVO ANDRIAMIHAMINA', null, null, 'Harisoa Danielle', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 171, 'RATOVONJANAHARY', 'franck.ratovonjanahary@univ-antananarivo.mg', null, 'Andriamihantasolonirina Justinien Frank', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 172, 'RATRIMO', 'voahangy.rambolamanana@univ-antananarivo.mg', null, 'Voahangy', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 173, 'RATSIMBA', 'angela.ratsimba@univ-antananarivo.mg', null, 'Angela Irène', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 174, 'RATSIMIEBO', null, null, 'Maholy Pricille', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 22, 'RATSOAVINA', 'fano.ratsoavina@univ-antananarivo.mg', null, 'Fanomezana Mihaja', '2025-09-06 04:24:03 pm', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 176, 'RAVAOARISOA', 'elisabeth.ravaoarisoa@univ-antananarivo.mg', null, 'Elisabeth', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 177, 'RAVELOMANANA', 'andrianjaka.ravelomanana@univ-antananarivo.mg', null, 'Andrianjaka', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 178, 'RAZAFIARIMANGA', 'zara.razafiarimanga@univ-antananarivo.mg', null, 'Zara Nomentsoa', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 179, 'RAZAFIARISON', 'zolalaina.razafiarison@univ-antananarivo.mg', null, 'Zo Lalaina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 180, 'RAZAFIMAHATRATRA', 'andrianaivo.razafimahatratra@univ-antananarivo.mg', null, 'Andrianaivo Dominique', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 181, 'RAZAFIMAMONJY', 'nivoalisoa.razafimamonjy@univ-antananarivo.mg', null, 'Nivo Alisoa Nirina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 182, 'RAZAFIMANANTSOA', 'gerard.razafimanantsoa@univ-antananarivo.mg', null, 'Gérard', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 183, 'RAZAFINDRAIBE', 'hanta.razafindraibe@univ-antananarivo.mg', null, 'Hanta Nirina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 184, 'RAZAFINDRALEVA', 'herisolo.razafindraleva@univ-antananarivo.mg', null, 'Herisolo Andrianiaina', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 185, 'RAZAFINDRAMAHATSIARO', 'christalin@univ-antananarivo.mg', null, 'Tovondrainy Christalin', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 186, 'RAZAFINDRAMANANA', 'josia.razafindramanana@univ-antananarivo.mg', null, 'Josia', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 187, 'RAZAFINDRANAIVO', null, null, 'Lady Mireille', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 189, 'RAZAFINDRASOA', 'alitina02@yahoo.fr', null, 'Mbolatiana Alinà', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 190, 'RAZAFINDRATIANA', 'eleonore.razafindratiana@univ-antananarivo.mg', null, 'Eléonore', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 191, 'RAZAFINDRAZAKA', 'vonimanitra.razafindrazaka@univ-antananarivo.mg', null, 'Razanajafy Vonimanitra Lalao', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 193, 'RAZANAMANAMPISOA', 'harimalala.razanamanampisoa@univ-antananarivo.mg', null, 'Harimalala', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 194, 'RAZANAMEHARIZAKA', 'juvet.razanameharizaka@univ-antananarivo.mg', null, 'Juvet Henrinet Herinainasoa', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 195, 'RAZANATSEHENO', 'mihaja.razanatseheno@univ-antananarivo.mg', null, 'Mihajasoa Stella', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 196, 'RIM FARASOA', 'lalanirina.rim@univ-antananarivo.mg', null, 'Helga', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 197, 'ROBINSON', 'olivier.robinson@univ-antananarivo.mg', null, 'Olivier', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 198, 'ROGE', 'patrick.roge@univ-antananarivo.mg', null, 'Tina Patrick', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 199, 'ROGER', 'edmond.roger@univ-antananarivo.mg', null, 'Edmond', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 200, 'SAHOA', 'sfrankelliot@univ-antananarivo.mg', null, 'Franck Elliot', '2025-09-08 10:31:48 am', 3, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 201, 'ANDRIANAHARISON', 'fumiko.andrianaharison@univ-antananarivo.mg', null, 'Fumiko', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 202, 'ANDRIANANTENAINA', 'harison.andrianantenaina@univ-antananarivo.mg', null, 'Harison Dany', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 203, 'ANDRIANANTENAINARINORO', 'tsilavina.andrianantenainarinoro@univ-antananarivo.mg', null, 'Tsilavina Ravo Hasina', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 204, 'ANDRIANIANTEHERANA', 'andrianarison.andrianianteherana@univ-antananarivo.mg', null, 'Andrianarison Marcellin', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 205, 'ANDRIANIRINA', 'jeanodilon.andrianirina@univ-antananarivo.mg', null, 'Jean Odilon', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 206, 'ANDRIANTSOA', 'sandrataniaina.andriantsoa@univ-antananarivo.mg', null, 'Sandrataniaina Rajaonarison', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 169, 'RASOLOFOTIANA', null, null, 'Edmond', '2025-09-08 10:31:48 am', 179, null, 3);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 207, 'ANDRIATAHINA HAJANIAINA', 'jocelyn.andriatahina@univ-antananarivo.mg', null, 'Jocelyn', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 208, 'BERNARDIN', 'hagamalala.bernardin@univ-antananarivo.mg', null, 'Hagamalala Santatra', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 209, 'HERIMIAH RAKOTONDRANJA', 'arsene.herimiah@univ-antananarivo.mg', null, 'Solo Arsène', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 210, 'HERINANTENAINA', 'roddy.herinantenaina@univ-antananarivo.mg', null, 'Roddy Stanislas', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 211, 'LANTONIRINA', 'laurence.lantonirina@univ-antananarivo.mg', null, 'Sendrasoa Laurence', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 212, 'MAHALEO', 'tahiry.mahaleo@univ-antananarivo.mg', null, 'Tahirimanankasina Betoraka', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 213, 'RABARIVELOARIJAONA', null, null, 'Soanjafinasy Zelindravaka', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 214, 'RAFALIMANANA', 'laingo.rafalimanana@univ-antananarivo.mg', null, 'Laingo Barisoa', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 215, 'RAHANTAHARIVAO', 'noromamy.rahantaharivao@univ-antananarivo.mg', null, 'Noromamy Joséphine', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 216, 'RAHANTARIMANANA', 'fanjavola@yahoo.fr', null, 'Fanjavola', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 217, 'RAHARIVOLOLONIAINA', 'liliane.raharivololoniaina@univ-antananarivo.mg', null, 'Liliane', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 218, 'RAINIBE', 'hery.rainibe@univ-antananarivo.mg', null, 'Hery', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 219, 'RAJAONERA', 'aimee.rajaonera@univ-antananarivo.mg', null, 'née RASOANIAINA Aimée', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 220, 'RAKOTOARISOA', 'ravo_benja.rakotoarisoa@univ-antananarivo.mg', null, 'Ravo Notahiana Benjamina', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 221, 'RAKOTOARIVELO', null, null, 'Onialisoa Mirana', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 222, 'RAKOTONDRAIBE', 'verotiana.rakotondraibe@univ-antananarivo.mg', null, 'Harimalala Verotiana', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 223, 'RAKOTONDRAMANANA', 'haingotiana.rakotondramanana@univ-antananarivo.mg', null, 'Haingotiana Lalaina Maminiriana', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 3, 'RAKOTONDRAMAVONIRINA', 'joseph.rakotondramavonirina@univ-antananarivo.mg', '0343625508', 'Joseph', '2025-09-06 03:47:02 pm', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 225, 'RAKOTONIRINA', 'dina_miora.rakotonirina@univ-antananarivo.mg', null, 'Dina Miora', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 11, 'RALISON LAINGOHARIMIADANA', 'laingoharimiadana.ralison@univ-antananarivo.mg', null, 'Marie Nambinina', '2025-09-06 04:24:03 pm', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 227, 'RAMAHAZOMANANA', 'alhison.ramahazomanana@univ-antananarivo.mg', null, 'Alhison', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 228, 'RAMALANJAONA', 'maminiaina.ramalanjaona@univ-antananarivo.mg', null, 'Maminiaina Andriantsoa', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 229, 'RAMANANA', 'hasinarivo@univ-antananarivo.mg', null, 'Hasinarivo Marie de Berthis', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 231, 'RANAIVOSON', 'adrien.ranaivoson@univ-antananarivo.mg', null, 'Petera Adrien', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 232, 'RANDRIA', 'eurelclem@yahoo.fr', null, 'José Narcisse', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 233, 'RANDRIAMIARAMISAINA', 'r_raly@univ-antananarivo.mg', null, 'Ralinandrianina', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 234, 'RANDRIAMIARAMPANAHY', 'jean_jacques.randriamiarampanahy@univ-antananarivo.mg', null, 'Jean Jacques Ferdinand', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 235, 'RANDRIAMIARISOANDRAIBE', 'heritiana.randriamiarisoandraibe@univ-antananarivo.mg', null, 'Heritiana', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 236, 'RANDRIANANDRASANA', 'jacques.randrianandrasana@univ-antananarivo.mg', null, 'Jacques', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 237, 'RANDRIANINDRINA', 'renceaimee.randrianindrina@univ-antananarivo.mg', null, 'Veloarivony Rence Aimée', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 238, 'RANDRIANOMENJANAHARY', 'rado.abraham.randrianomenjanahary@univ-antananarivo.mg', null, 'Rado Abraham', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 239, 'RASOANAIVO', 'r.andry.rasoanaivo@gmail.com', null, 'Andry Andrianarivo Pascal', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 240, 'RASOLOFONIAINA', 'rolland.rasolofoniaina@univ-antananarivo.mg', null, 'Rolland', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 241, 'RATSIMBAZAFY', 'veroarisinina.ratsimbazafy@univ-antananarivo.mg', null, 'Veroarisinina', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 242, 'RATSIMISATA', 'heritiana.ratsimisata@univ-antananarivo.mg', null, 'Heritiana', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 243, 'RAVELOMANANTSOA', 'irene.ravelomanantsoa@univ-antananarivo.mg', null, 'Irène Vololomampianina', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 244, 'RAVELONA', 'andryjudy.ravelona@univ-antananarivo.mg', null, 'Andry Judicaël', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 245, 'RAVELOSON', 'ricca.raveloson@univ-antananarivo.mg', null, 'Ricca', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 246, 'RAZAFINDRATSIMA', 'lalainarivony.razafindratsima@univ-antananarivo.mg', null, 'Lalainarivony Clément', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 247, 'SOULEMAN IBRAHIM', 'andriamandimby.souleman@univ-antananarivo.mg', null, 'Andriamandimby', '2025-09-08 10:31:48 am', 4, null, null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 248, 'RABEHARISOA', 'rijarabeharisoa@gmail.com', '0320503972', 'Rija', '2025-09-08 11:15:05 am', 24, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 249, 'RASAMOELA', 'hentsrasamy@gmail.com', null, 'Henintsoa', '2025-09-08 11:16:31 am', 25, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 250, 'RANDRIANARIVELO', 'mamyfetra@gmail.com', '0340518508', 'Mamy Fetra', '2025-09-08 11:17:41 am', 26, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 251, 'RANDRIANARIJAONA', null, null, 'Tsilavina Ny Aina Zo', '2025-09-08 12:10:36 pm', 27, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 252, 'RASOAVOLOLONA', null, null, 'Fenonirina', '2025-09-08 12:10:36 pm', 28, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 253, 'RAZANAKOTO', null, null, 'Felaniaina Danielle', '2025-09-08 12:10:36 pm', 29, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 254, 'RAZAFINDRAMBOA', null, null, 'Voniarisolo', '2025-09-08 12:10:36 pm', 30, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 255, 'RAZAFIMBELO', null, null, 'Vololoniaina Sylvia', '2025-09-08 12:10:36 pm', 31, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 256, 'RAKOTOVAO', null, null, 'Tsimiamboholahy Rivo', '2025-09-08 12:10:36 pm', 32, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 257, 'RASOAHARIJAONA', null, null, 'Ny Haja', '2025-09-08 12:10:36 pm', 33, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 258, 'RANDRIAMANOLOSON', null, null, 'Gabriel', '2025-09-08 12:10:36 pm', 34, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 259, 'ANDRIANARINIVO', null, null, 'Herinirina Gabrielle', '2025-09-08 12:10:36 pm', 35, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 260, 'RAHARIMANANA', null, null, 'Onisoa Felaniaina', '2025-09-08 12:10:36 pm', 36, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 261, 'RAVALISON', null, null, 'Bako Lalaina', '2025-09-08 12:10:36 pm', 37, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 262, 'RAVELOJAONA', null, null, 'Lantonirina', '2025-09-08 12:10:36 pm', 38, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 263, 'RAZAIARIMINO', null, null, 'Ranja', '2025-09-08 12:10:36 pm', 39, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 264, 'RAKOTONANAHARY', null, null, 'Tahirintsoa H Jackie', '2025-09-08 12:10:36 pm', 40, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 265, 'RAKOTOMALALA', null, null, 'Niriharivony Soanandrianina', '2025-09-08 12:10:36 pm', 41, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 266, 'RAZAFINIRINA', null, null, 'Hanta Bakoly', '2025-09-08 12:10:36 pm', 42, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 267, 'RABEARILAFY', null, null, 'Tsioriniaina Marko', '2025-09-08 12:10:36 pm', 43, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 268, 'ANDRIAMAMPIRODO', null, null, 'François Xavier Hajasoa', '2025-09-08 12:10:36 pm', 44, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 269, 'RAKOTOVAO HERITIANA', null, null, null, '2025-09-08 12:10:36 pm', 45, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 270, 'RAZAFIARISON', null, null, 'Holiniaina Eva', '2025-09-08 12:10:36 pm', 46, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 271, 'RANDRIANJAKA', null, null, 'Adolphe', '2025-09-08 12:10:36 pm', 47, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 272, 'RAJAONARISON ANJARAFATIANA', null, null, 'Miora', '2025-09-08 12:10:36 pm', 48, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 273, 'RAJAONARIVELO', null, null, 'Heriniaina Innocent Alphonse', '2025-09-08 12:10:36 pm', 49, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 274, 'RAKOTOMAMPIANINA', null, null, 'Andriantahina  Josué', '2025-09-08 12:10:36 pm', 50, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 275, 'RAKOTONANAHARY', null, null, 'Mbolatiana Genevieve', '2025-09-08 12:10:36 pm', 51, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 276, 'ROBSON', null, null, 'Lucien Herinantenaina', '2025-09-08 12:10:36 pm', 52, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 277, 'RAMPARAOELINA', null, null, 'Miora Onjasoa', '2025-09-08 12:10:36 pm', 53, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 278, 'RAVELOARISON', null, null, 'Heritiana Patrick', '2025-09-08 12:10:36 pm', 54, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 279, 'RAMAROLAHY', null, null, 'Naina Elie Jacquot', '2025-09-08 12:10:36 pm', 55, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 280, 'RAKOTONANDRASANA', null, null, 'Norosoa Yvette', '2025-09-08 12:10:36 pm', 56, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 281, 'RAHAJAMALALA', null, null, 'Cathérine Olivia', '2025-09-08 12:10:36 pm', 57, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 282, 'RAJAONERA', null, null, 'Tahina Ernest', '2025-09-08 12:10:36 pm', 58, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 283, 'ANDRIANANTOANDRO', null, null, 'Aina', '2025-09-08 12:10:36 pm', 59, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 284, 'RAHALINARIVO', null, null, 'Vololonirina', '2025-09-08 12:10:36 pm', 60, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 285, 'RAZAFIMAHATRATRA', null, null, 'Davidson  Michaël', '2025-09-08 12:10:36 pm', 61, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 286, 'RASOANANTENAINA', null, null, 'Marie Perline', '2025-09-08 12:10:36 pm', 62, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 287, 'NIRISOA', null, null, 'Micheline Rakotondrajaona', '2025-09-08 12:10:36 pm', 63, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 288, 'RAKOTOARISOA', null, null, 'Tantelinirina Lovaniaina', '2025-09-08 12:10:36 pm', 64, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 289, 'RAKOTOZANANY', null, null, 'Andrianambinitsoa Sylvio', '2025-09-08 12:10:36 pm', 65, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 290, 'RABEARISOA', null, null, 'Andriamihaja Olivier', '2025-09-08 12:10:36 pm', 66, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 291, 'RAKOTONDRAMARINA RAMIARA', null, null, 'Miora Voahanginiaina', '2025-09-08 12:10:36 pm', 67, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 292, 'LIVA HARIVELO', null, null, 'Jonas', '2025-09-08 12:10:36 pm', 68, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 293, 'RAKOTOANTOANDRO', null, null, 'Nomenjanahary Hajasoa', '2025-09-08 12:10:36 pm', 69, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 294, 'RAJAONARISON', null, null, 'Rija Zoé Pascal', '2025-09-08 12:10:36 pm', 70, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 295, 'RALITERA', null, null, 'Soahajaina Vololomalala', '2025-09-08 12:10:36 pm', 71, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 296, 'RAKOTOMALALA', null, null, 'Faniry Ely', '2025-09-08 12:10:36 pm', 72, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 297, 'ANDRIAMISAINA', null, null, 'Harilala', '2025-09-08 12:10:36 pm', 73, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 298, 'RASOLONIALITIANA', null, null, 'Jean François Régis', '2025-09-08 12:10:36 pm', 74, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 299, 'RAHANTAMALALA', null, null, 'Felaniaina Miora', '2025-09-08 12:10:36 pm', 75, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 300, 'RANDRIANALISON', null, null, 'Onilalaina Ange Francia', '2025-09-08 12:10:36 pm', 76, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 301, 'RAFANOMEZANA', null, null, 'Haja', '2025-09-08 12:10:36 pm', 77, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 302, 'RAKOTONIRINA', null, null, 'Mihoby Valisoa D', '2025-09-08 12:10:36 pm', 78, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 303, 'RAZAFIZANAKA', null, null, 'Giannot Albert', '2025-09-08 12:10:36 pm', 79, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 304, 'RAZAKANAIVO', null, null, 'Liva Andriamanana', '2025-09-08 12:10:36 pm', 80, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 305, 'RAKOTOMALALA', null, null, 'Mirindra Pierrot', '2025-09-08 12:10:36 pm', 81, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 306, 'RAZAFINDRAHOVA', null, null, 'Fy Harilala', '2025-09-08 12:10:36 pm', 82, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 307, 'FIDINARIVO', null, null, 'Fihery Toma', '2025-09-08 12:10:36 pm', 83, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 308, 'RAZAFIMAHATRATRA', null, null, 'Harimalala Sedera', '2025-09-08 12:10:36 pm', 84, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 309, 'NASOAVINARIVO', null, null, 'Nasaina Fandresena', '2025-09-08 12:10:36 pm', 85, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 310, 'RAKOTOMALALA', null, null, 'Annie Régina', '2025-09-08 12:10:36 pm', 86, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 311, 'RANAIVO', null, null, 'Hasimbonjitiana Faniriana', '2025-09-08 12:10:36 pm', 87, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 312, 'RAKOTOARISOA', null, null, 'Lova Landry', '2025-09-08 12:10:36 pm', 88, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 313, 'RAZANADRABAO', null, null, 'Salime', '2025-09-08 12:10:36 pm', 89, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 314, 'RASOAMANARIVO', null, null, 'Fanjanirina', '2025-09-08 12:10:36 pm', 90, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 315, 'RANOROHARIMINA', null, null, 'Lantoniaina Nicaise', '2025-09-08 12:10:36 pm', 91, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 316, 'RAKOTOSOLOFO', null, null, 'Hasina Guy Pascal', '2025-09-08 12:10:36 pm', 92, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 317, 'RAHARISON', null, null, 'Felaniriana Holiarivelo', '2025-09-08 12:10:36 pm', 93, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 318, 'RAKOTOMALALA', null, null, 'Hajaniaina Hyacinthe', '2025-09-08 12:10:36 pm', 94, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 319, 'RANDRIANAIVO', null, null, 'Jeanne Marie Louisette', '2025-09-08 12:10:36 pm', 95, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 320, 'RAKOTOARINOSY', null, null, 'Livaharintsoa', '2025-09-08 12:10:36 pm', 96, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 321, 'RANDRIANJATOVO', null, null, 'Narivelo Tsitoniaina', '2025-09-08 12:10:36 pm', 97, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 322, 'MANANDAZA', null, null, 'Mbehofantae', '2025-09-08 12:10:36 pm', 98, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 323, 'RANDRIANAIVO', null, null, 'Laurence Lydia', '2025-09-08 12:10:36 pm', 99, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 324, 'FANJARIZAKA', null, null, 'Hilaria Cléo', '2025-09-08 12:10:36 pm', 100, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 325, 'RASOLOARISON', null, null, 'Naivotiana Holdin', '2025-09-08 12:10:36 pm', 101, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 326, 'ANDRIANJAKA', null, null, 'Solofoherimanana', '2025-09-08 12:10:36 pm', 102, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 327, 'RANDRIANTSOA', null, null, 'Nary Solo', '2025-09-08 12:10:36 pm', 103, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 328, 'MAHERISOA', null, null, 'Tantely Narindra', '2025-09-08 12:10:36 pm', 104, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 329, 'TAHINA', null, null, 'Odilon Elison', '2025-09-08 12:10:36 pm', 105, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 330, 'RATSITOHAINA', null, null, 'Mamisoa Pochard', '2025-09-08 12:10:36 pm', 106, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 331, 'RAKOTONANDRASANA', null, null, 'Ihoby Lalao Mamisoa', '2025-09-08 12:10:36 pm', 107, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 332, 'RAKOTONDRAZAFY', null, null, 'Haingo Nirina', '2025-09-08 12:10:36 pm', 108, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 333, 'RAZAFIARIMANANA', null, null, 'Célestine', '2025-09-08 12:10:36 pm', 109, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 334, 'NIRINAHARIMALALA', null, null, 'Marie Léa Hélène', '2025-09-08 12:10:36 pm', 110, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 335, 'RAVOAVISON', null, null, 'Solo Ni-Tiana Mahefa Ninà', '2025-09-08 12:10:36 pm', 111, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 336, 'RANAIVOMANANA', null, null, 'Mamy Tiana', '2025-09-08 12:10:36 pm', 112, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 337, 'RAKOTOARISOA', null, null, 'Jacques Francky', '2025-09-08 12:10:36 pm', 113, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 338, 'BOTOSOAMANANA', null, null, 'Lalaina Elisa', '2025-09-08 12:10:36 pm', 114, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 339, 'ANDRIATIANA', null, null, 'Hajavola Lova Jacquelin', '2025-09-08 12:10:36 pm', 115, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 340, 'RAVAOHARIMANANA', null, null, 'Andréa Saholy', '2025-09-08 12:10:36 pm', 116, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 341, 'JEAN', null, null, 'Noël', '2025-09-08 12:10:36 pm', 117, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 342, 'RATSIMBARISON', null, null, 'Rivosoa', '2025-09-08 12:10:36 pm', 118, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 343, 'RAFITOARISOA', null, null, 'Lin Venant', '2025-09-08 12:10:36 pm', 119, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 344, 'NDRIANASOLO', null, null, 'Briand Joachim', '2025-09-08 12:10:36 pm', 120, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 345, 'KOTO RAKOTONIRINA', null, null, 'Jean Cyrille', '2025-09-08 12:10:36 pm', 121, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 346, 'RABETOKOTANY', null, null, 'Aina Marino', '2025-09-08 12:10:36 pm', 122, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 347, 'RANDRIAMIANDRISOA', null, null, 'Gabriel', '2025-09-08 12:10:36 pm', 123, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 348, 'RAVOLOLOARIMANGA', null, null, 'Malalatiana Oméga', '2025-09-08 12:10:36 pm', 124, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 349, 'NANTENAINA', null, null, 'Hery', '2025-09-08 12:10:36 pm', 125, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 350, 'RAVELOMANANTSOA', null, null, 'Andrianiaina Ludger', '2025-09-08 12:10:36 pm', 126, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 351, 'RAHERIMANJATO', null, null, 'Hajanirina M.Célestin Rodolphe', '2025-09-08 12:10:36 pm', 127, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 352, 'RAVELOJAONA', null, null, 'Emmanuel', '2025-09-08 12:10:36 pm', 128, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 353, 'RASAMISON', null, null, 'Roger', '2025-09-08 12:10:36 pm', 129, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 354, 'RANAIVOSON', null, null, 'Jean Charles', '2025-09-08 12:10:36 pm', 130, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 355, 'RAMBELOMANANA', null, null, 'Hery Lindenberg', '2025-09-08 12:10:36 pm', 131, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 356, 'RAJAONA', null, null, 'Jean Charles', '2025-09-08 12:10:36 pm', 132, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 357, 'RABEARIMANANA', null, null, 'Richard', '2025-09-08 12:10:36 pm', 133, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 358, 'RAMADIMANANA', null, null, 'Jean Louis', '2025-09-08 12:10:36 pm', 134, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 359, 'RAVELOMANANA', null, null, 'Njaka', '2025-09-08 12:10:36 pm', 135, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 360, 'RAFIDISON', null, null, 'Ny Riana Fenosoa', '2025-09-08 12:10:36 pm', 136, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 361, 'RAMANANTENASOA', null, null, 'Lucile Marie Henriette', '2025-09-08 12:10:36 pm', 137, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 362, 'RASOARILALA', null, null, 'Hanitriniaina Marie Marovavy', '2025-09-08 12:10:36 pm', 138, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 363, 'RAZAFIMAHEFA', null, null, 'Edmond', '2025-09-08 12:10:36 pm', 139, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 364, 'RASAMOELINIRINA', null, null, 'Heriniaina Hugues Ange', '2025-09-08 12:10:36 pm', 140, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 365, 'RAKOTONIRINA', null, null, 'Clavie', '2025-09-08 12:10:36 pm', 141, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 366, 'RAKOTOARIMALALA', null, null, 'Toky Arthur', '2025-09-08 12:10:36 pm', 142, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 367, 'ANDRIAMADY', null, null, 'Hasinarimanana Hanitriniaina', '2025-09-08 12:10:36 pm', 143, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 368, 'LOVANANTENAINA', null, null, 'Nirilanto Vololona', '2025-09-08 12:10:36 pm', 144, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 410, 'RAJERISON', null, null, null, '2025-09-08 05:38:13 pm', 243, null, 30);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 369, 'RAKOTOARISOA', null, null, 'Andimalala Rian''ny Aina', '2025-09-08 12:10:36 pm', 145, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 370, 'FELANA MPANARIVO', null, null, 'Michel Rodrigue', '2025-09-08 12:10:36 pm', 146, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 371, 'RAZAKANIRINA', null, null, 'Noroharilala Viviane', '2025-09-08 12:10:36 pm', 147, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 372, 'RAZOARIMALALA', null, null, 'Nivoarisoa', '2025-09-08 12:10:36 pm', 148, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 373, 'RANDRIANJANAHARY', null, null, 'Harimina', '2025-09-08 12:10:36 pm', 149, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 374, 'ANDRIAMANANONY', null, null, 'Hantsamalala Vololontsalama', '2025-09-08 12:10:36 pm', 150, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 375, 'ANDRIANARY', null, null, 'Andréa', '2025-09-08 12:10:36 pm', 151, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 376, 'RALAIDOSY', null, null, 'Rado Harinjaka', '2025-09-08 12:10:36 pm', 152, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 377, 'RAHELINIRINA', null, null, 'Malalatiana', '2025-09-08 12:10:36 pm', 153, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 378, 'OLITAHIANA', null, null, 'Alphonsine', '2025-09-08 12:10:36 pm', 154, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 379, 'RAZAFINDRAKOTO', null, null, 'Hanitriniaina Mamisoa', '2025-09-08 12:10:36 pm', 155, 'F', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 380, 'ANDRIANOARAMAHERY', 'herverolinho@gmail.com', null, 'Hervé', '2025-09-08 12:28:08 pm', 176, 'M', null);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 50, 'RANDRIANAVONY', null, null, 'Patricia', '2025-09-08 10:31:48 am', 210, null, 34);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 18, 'RANDRIANASOLOHARISOA', null, null, 'Dimbimalala', '2025-09-06 04:24:03 pm', 214, null, 38);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 384, 'RANDRIANALY', null, null, 'Hasina Nirina', '2025-09-08 05:38:13 pm', 217, null, 4);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 13, 'RANDRIAMAMPIANINA', null, null, 'Lovarintsoa Judicaël', '2025-09-06 04:24:03 pm', 181, null, 5);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 386, 'VERONIRINA', null, null, 'Rahanitrarivony', '2025-09-08 05:38:13 pm', 219, null, 6);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 387, 'RAZAFIARIMANGA', null, null, 'Zara', '2025-09-08 05:38:13 pm', 220, null, 7);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 64, 'RAKOTOARISOA', null, null, 'Noronirina Victorine', '2025-09-08 10:31:48 am', 184, null, 8);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 12, 'RAKOTOARINIVO', null, null, 'Mijoro', '2025-09-06 04:24:03 pm', 185, null, 9);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 162, 'RANIRISON', null, null, 'Patrick', '2025-09-08 10:31:48 am', 186, null, 10);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 391, 'RAMAROSANDRATANA', null, null, 'Aro Vonjy', '2025-09-08 05:38:13 pm', 224, null, 11);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 392, 'RAFIDISON', null, null, 'Varohanitra', '2025-09-08 05:38:13 pm', 225, null, 12);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 70, 'RAVAOMANALINA', null, null, 'Bako Harisoa', '2025-09-08 10:31:48 am', 189, null, 13);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 104, 'RADANIELINA', null, null, 'Tendro', '2025-09-08 10:31:48 am', 191, null, 15);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 396, 'VESTALYS RAMANANDRAIBE', null, null, 'Voahangy', '2025-09-08 05:38:13 pm', 229, null, 16);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 230, 'RAMIARISON', null, null, 'Hariliva', '2025-09-08 10:31:48 am', 193, null, 17);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 398, 'RAZAKARIVONY', null, null, 'Andrianambinina A.', '2025-09-08 05:38:13 pm', 231, null, 18);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 399, 'RAKOTONDRAMANGA', null, null, 'Maonja Finaritra', '2025-09-08 05:38:13 pm', 232, null, 19);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 400, 'RABESIAKA', null, null, 'Mihasina', '2025-09-08 05:38:13 pm', 233, null, 21);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 402, 'RANAIVOSON', null, null, 'Andriambinintsoa Tojonirina', '2025-09-08 05:38:13 pm', 235, null, 22);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 403, 'RANDRIANARISOLO', null, null, 'Rivoarison', '2025-09-08 05:38:13 pm', 236, null, 23);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 16, 'RAKOTONIRINA', null, null, 'Jean Claude', '2025-09-06 04:24:03 pm', 200, null, 24);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 405, 'RAZAFINDRALEVA', null, null, 'Herisolo', '2025-09-08 05:38:13 pm', 238, null, 25);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 1, 'RAZAFINDRANAIVO', null, '0343641354', 'Victor', '2025-09-06 03:47:02 pm', 202, null, 26);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 408, 'RAVELONANDRO', null, null, 'Pierre', '2025-09-08 05:38:13 pm', 241, null, 28);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 407, 'RAMIANDRISOA', null, null, 'Louisa Njara', '2025-09-08 05:38:13 pm', 240, null, 39);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 85, 'ANDRIANAINARIVELO', null, null, 'Mahandrimanana', '2025-09-08 10:31:48 am', 205, null, 29);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 411, 'RAKOTOMANGA', null, null, 'Jeannot', '2025-09-08 05:38:13 pm', 244, null, 31);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 412, 'RANDRIANANTOANDRO', null, null, 'Tahiana', '2025-09-08 05:38:13 pm', 245, null, 32);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 413, 'ANDRIAMIADAMANANA', null, null, 'Dangerfield Christian', '2025-09-08 05:38:13 pm', 246, null, 33);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 415, 'RAKOTONDRAZAFY', null, null, 'Jenny', '2025-09-08 05:38:13 pm', 248, null, 35);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 416, 'RATOVONJANAHARY', null, null, 'Franck', '2025-09-08 05:38:13 pm', 249, null, 36);
INSERT INTO "public".personne( id_personne, nom, email, tel, prenom, date_insertion, id_titre, sexe, id_labo ) VALUES ( 417, 'RAKOTOARIMANANA', null, null, 'Graffin', '2025-09-08 05:38:13 pm', 250, null, 37);
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 1, 'BEC');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 2, 'PEI');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 3, 'COMPTA');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 4, 'SCOL');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 5, 'ENTOMO');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 6, 'PERS');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 7, 'SP');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 8, 'STE');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 9, 'IT');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 10, 'INFO');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 11, 'PHYS');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 12, 'BEV');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 13, 'CH');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 14, 'MI');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 15, 'ZBA');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 16, 'AG');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 17, 'BFA');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 18, 'ADD');
INSERT INTO "public".poste_affectation( id_post_affectation, nom_post ) VALUES ( 19, 'PAP');
INSERT INTO "public".titre_professeur( id_titre, nom_titre ) VALUES ( 1, 'Professeur titulaire');
INSERT INTO "public".titre_professeur( id_titre, nom_titre ) VALUES ( 2, 'Assistant');
INSERT INTO "public".titre_professeur( id_titre, nom_titre ) VALUES ( 3, 'Maitre de conférence');
INSERT INTO "public".titre_professeur( id_titre, nom_titre ) VALUES ( 4, 'Assistant');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 1, 11, 1, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 2, 12, 1, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 3, 13, 1, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 4, 14, 1, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 5, 15, 1, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 6, 16, 1, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 7, 17, 1, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 8, 18, 1, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 9, 19, 1, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 10, 20, 1, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 11, 21, 1, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 12, 22, 1, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 13, 23, 1, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 14, 24, 1, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 15, 248, 2, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 16, 249, 2, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 17, 250, 2, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 18, 90, 3, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 19, 128, 3, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 20, 370, 4, '2025-09-08');
INSERT INTO "public".cofac( id_cofac, personne_id, appartenance_id, date_creation ) VALUES ( 21, 300, 4, '2025-09-08');
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Dynamique de l’atmosphère, du climat et des océans', null, null, 2, 1, 'DyACO');
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de micropaléontologie et de paléobotanique', 4, null, 3, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de paléontologie, biostratigraphie, géotourisme, géorisques', 4, null, 4, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de biochimie appliquée aux sciences médicales', 3, null, 5, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire biochimie appliquée aux sciences de l’alimentation et à la nutrition', 3, null, 6, null, 'LABASAN');
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire d''immunologie', 3, null, 7, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de l’unité biotechnologie et amélioration des plantes', 2, null, 8, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de palynologie', 2, null, 9, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire d’ecologie végétale', 2, null, 10, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de technologies forestières', 2, null, 11, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de systématique et valorisation de la diversité végétale', 2, null, 12, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire d''anatomie des plantes', 2, null, 13, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de biologie moléculaire des plantes', 2, null, 14, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Mutual learning lab', 2, null, 15, null, 'MLL');
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire international associé', 5, null, 16, null, 'LIA');
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire des produits naturels et biotechnologie', 5, null, 17, null, 'LPNB');
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de chimie appliquée aux substances naturelles', 5, null, 18, null, 'LACASN');
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de chimie organique – substances marines', 5, null, 19, null, 'LCO-SM');
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire chimie minérale', 5, null, 20, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire chimie minérale et chimie industrielle', 5, null, 21, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de chimie moléculaire et de l’environnement', 5, null, 22, null, 'LCME');
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de chimie analytique et de formulation', 5, null, 23, null, 'LCAF');
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de biodiversité et systématique des arthropodes', 6, null, 24, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire d''entomologie agricole et forestière', 6, null, 25, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire d''entomologie médicale', 6, null, 26, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire gestion des ressources minérales et géo-environnement', 14, null, 27, null, 'G2RE');
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Centre de recherche et d’études en génie de l’eau et de l’environnement :', 10, null, 28, null, 'CREG2E');
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Chimie minérale et chimie appliquée', 10, null, 29, null, 'CMCA');
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de chimie physique des macromolecules', 10, null, 30, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de chimie structurale', 10, null, 31, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de chimie de l''environnement', 10, null, 32, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de chimie physique appliquee', 10, null, 33, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de pharmacologie générale, de pharmacocinétique et de cosmétologie', 9, null, 34, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de physiologie animale  - nutrition', 9, null, 35, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de physique nucléaire et physique de l’environnement', 8, null, 36, null, 'LPNPE');
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire thermique thermodynamique et combustion', 8, null, 37, null, 'LTTC');
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de physique de la matière et du rayonnement', 8, null, 38, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de pétrologie, hydrogéologie et géotechnique', 11, null, 39, null, null);
INSERT INTO "public".laboratoire( nom_labo, mention_rattachement, description, id_labo, ecole_doctorale_rattachement, abbreviation ) VALUES ( 'Laboratoire de physique des solides et physique expérimentale', null, null, 1, 1, 'LPSPE');
INSERT INTO "public".mention_responsable( id_respo_mention, id_mention, id_personne, date_debut, date_fin ) VALUES ( 1, 1, 11, '2025-09-06', null);
INSERT INTO "public".mention_responsable( id_respo_mention, id_mention, id_personne, date_debut, date_fin ) VALUES ( 2, 2, 12, '2025-09-06', null);
INSERT INTO "public".mention_responsable( id_respo_mention, id_mention, id_personne, date_debut, date_fin ) VALUES ( 3, 3, 13, '2025-09-06', null);
INSERT INTO "public".mention_responsable( id_respo_mention, id_mention, id_personne, date_debut, date_fin ) VALUES ( 4, 4, 14, '2025-09-06', null);
INSERT INTO "public".mention_responsable( id_respo_mention, id_mention, id_personne, date_debut, date_fin ) VALUES ( 5, 5, 15, '2025-09-06', null);
INSERT INTO "public".mention_responsable( id_respo_mention, id_mention, id_personne, date_debut, date_fin ) VALUES ( 6, 6, 16, '2025-09-06', null);
INSERT INTO "public".mention_responsable( id_respo_mention, id_mention, id_personne, date_debut, date_fin ) VALUES ( 7, 7, 17, '2025-09-06', null);
INSERT INTO "public".mention_responsable( id_respo_mention, id_mention, id_personne, date_debut, date_fin ) VALUES ( 8, 8, 18, '2025-09-06', null);
INSERT INTO "public".mention_responsable( id_respo_mention, id_mention, id_personne, date_debut, date_fin ) VALUES ( 9, 9, 19, '2025-09-06', null);
INSERT INTO "public".mention_responsable( id_respo_mention, id_mention, id_personne, date_debut, date_fin ) VALUES ( 10, 10, 20, '2025-09-06', null);
INSERT INTO "public".mention_responsable( id_respo_mention, id_mention, id_personne, date_debut, date_fin ) VALUES ( 11, 11, 21, '2025-09-06', null);
INSERT INTO "public".mention_responsable( id_respo_mention, id_mention, id_personne, date_debut, date_fin ) VALUES ( 12, 12, 22, '2025-09-06', null);
INSERT INTO "public".mention_responsable( id_respo_mention, id_mention, id_personne, date_debut, date_fin ) VALUES ( 13, 13, 23, '2025-09-06', null);
INSERT INTO "public".mention_responsable( id_respo_mention, id_mention, id_personne, date_debut, date_fin ) VALUES ( 14, 14, 24, '2025-09-06', null);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 1, 251, 1, 3, 18);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 2, 252, 1, 16, 3);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 3, 253, 2, 7, 18);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 4, 254, 2, 5, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 5, 255, 2, 5, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 6, 256, 2, 4, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 7, 257, 2, 5, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 8, 258, 2, 5, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 9, 259, 2, 18, 10);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 10, 260, 2, 18, 3);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 11, 261, 2, 9, 10);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 12, 262, 2, 14, 10);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 13, 263, 3, 2, 28);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 14, 264, 3, 2, 17);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 15, 265, 3, 3, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 16, 266, 3, 5, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 17, 267, 3, 5, 27);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 18, 268, 3, 8, 28);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 19, 269, 4, 15, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 20, 270, 4, 7, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 21, 271, 4, 7, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 22, 272, 4, 7, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 23, 273, 4, 4, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 24, 274, 4, 5, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 25, 275, 4, 5, 17);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 26, 276, 4, 5, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 27, 277, 4, 5, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 28, 278, 4, 8, 24);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 29, 279, 4, 8, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 30, 280, 4, 11, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 31, 281, 4, 17, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 32, 282, 5, 2, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 33, 283, 5, 2, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 34, 284, 5, 2, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 35, 285, 5, 9, 10);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 36, 286, 5, 10, 3);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 37, 287, 6, 3, 28);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 38, 288, 6, 5, 24);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 39, 289, 6, 11, 19);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 40, 290, 7, 2, 1);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 41, 291, 7, 6, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 42, 292, 7, 7, 6);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 43, 293, 7, 5, 21);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 44, 294, 7, 5, 26);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 45, 295, 7, 5, 4);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 46, 296, 7, 4, 11);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 47, 297, 7, 5, 26);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 48, 298, 7, 18, 8);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 49, 299, 8, 7, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 50, 300, 8, 8, 13);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 51, 301, 8, 18, 3);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 52, 302, 8, 9, 10);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 53, 303, 9, 2, 13);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 54, 304, 9, 8, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 55, 305, 10, 2, 14);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 56, 306, 10, 7, 14);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 57, 307, 10, 3, 17);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 58, 308, 10, 5, 14);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 59, 309, 10, 8, 15);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 60, 310, 11, 2, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 61, 311, 11, 2, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 62, 312, 11, 2, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 63, 313, 11, 15, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 64, 314, 11, 5, 28);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 65, 315, 11, 5, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 66, 316, 11, 5, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 67, 317, 11, 18, 3);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 68, 318, 11, 18, 8);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 69, 319, 11, 18, 3);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 70, 320, 12, 1, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 71, 321, 12, 5, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 72, 322, 12, 5, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 73, 323, 12, 18, 3);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 74, 324, 12, 18, 10);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 75, 325, 12, 11, 23);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 76, 326, 13, 2, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 77, 327, 13, 2, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 78, 328, 13, 7, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 79, 329, 13, 3, 12);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 80, 330, 13, 5, 7);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 81, 331, 13, 5, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 82, 332, 13, 11, 10);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 83, 333, 13, 16, 3);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 84, 334, 14, 2, 13);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 85, 335, 14, 3, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 86, 336, 14, 16, 3);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 87, 337, 15, 5, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 88, 338, 15, 5, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 89, 339, 15, 5, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 90, 340, 15, 18, 3);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 91, 341, 15, 14, 10);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 92, 342, 16, 5, 17);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 93, 343, 16, 5, 22);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 94, 344, 16, 5, 22);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 95, 345, 16, 4, 22);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 96, 346, 16, 5, 23);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 97, 347, 16, 8, 24);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 98, 348, 16, 18, 3);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 99, 349, 16, 18, 8);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 100, 350, 16, 10, 23);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 101, 351, 16, 11, 20);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 102, 352, 16, 10, 22);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 103, 353, 16, 10, 22);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 104, 354, 16, 10, 22);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 105, 355, 16, 10, 2);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 106, 356, 16, 10, 22);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 107, 357, 16, 10, 23);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 108, 358, 16, 10, 23);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 109, 359, 16, 10, 22);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 110, 360, 16, 10, 22);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 111, 361, 16, 10, 3);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 112, 362, 16, 16, 5);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 113, 363, 16, 12, 25);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 114, 364, 16, 12, 22);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 115, 365, 16, 13, 5);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 116, 366, 16, 17, 23);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 117, 367, 17, 2, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 118, 368, 17, 7, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 119, 369, 17, 3, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 120, 370, 17, 5, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 121, 371, 17, 5, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 122, 372, 17, 18, 3);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 123, 373, 18, 5, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 124, 374, 18, 5, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 125, 375, 18, 11, 9);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 126, 376, 18, 10, 8);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 127, 377, 19, 2, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 128, 378, 19, 7, 16);
INSERT INTO "public".pat( id_pat, id_personne, id_post_affectation, id_grade, id_fonction ) VALUES ( 129, 379, 19, 10, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 232, 5, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 233, 26, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 234, 27, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 235, 28, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 236, 29, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 237, 30, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 238, 31, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 239, 32, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 240, 33, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 241, 34, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 242, 35, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 243, 36, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 244, 37, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 245, 38, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 246, 39, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 247, 40, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 248, 41, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 249, 42, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 250, 43, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 251, 44, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 252, 45, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 253, 46, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 254, 47, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 255, 48, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 256, 49, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 257, 50, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 258, 51, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 259, 52, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 260, 53, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 261, 54, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 262, 55, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 263, 56, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 264, 57, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 265, 58, 1);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 266, 59, 2);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 267, 60, 2);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 268, 61, 2);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 269, 62, 2);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 270, 63, 2);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 271, 64, 2);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 272, 65, 2);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 273, 66, 2);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 274, 67, 2);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 275, 68, 2);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 276, 15, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 277, 20, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 278, 14, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 279, 69, 2);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 280, 70, 2);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 281, 71, 2);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 282, 72, 2);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 283, 73, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 284, 74, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 285, 75, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 286, 19, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 287, 77, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 288, 78, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 289, 79, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 290, 23, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 291, 81, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 292, 83, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 293, 84, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 294, 85, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 295, 86, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 296, 87, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 297, 88, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 298, 89, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 299, 90, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 300, 91, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 301, 17, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 302, 93, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 303, 94, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 304, 95, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 305, 96, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 306, 97, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 307, 98, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 308, 99, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 309, 100, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 310, 101, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 311, 102, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 312, 103, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 313, 104, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 314, 105, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 315, 106, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 316, 107, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 317, 108, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 318, 109, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 319, 110, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 320, 111, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 321, 112, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 322, 113, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 323, 114, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 324, 115, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 325, 116, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 326, 117, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 327, 118, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 328, 119, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 329, 12, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 330, 121, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 331, 122, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 332, 123, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 333, 124, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 334, 125, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 335, 126, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 336, 127, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 337, 128, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 338, 129, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 339, 130, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 340, 131, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 341, 132, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 342, 16, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 343, 21, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 344, 2, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 345, 137, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 346, 138, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 347, 139, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 348, 140, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 349, 141, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 350, 142, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 351, 143, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 352, 144, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 353, 145, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 354, 146, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 355, 147, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 356, 148, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 357, 149, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 358, 24, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 359, 151, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 360, 152, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 361, 153, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 362, 154, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 363, 155, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 364, 156, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 365, 13, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 366, 158, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 367, 159, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 368, 160, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 369, 18, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 370, 162, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 371, 163, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 372, 164, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 373, 165, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 374, 166, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 375, 167, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 376, 168, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 377, 169, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 378, 170, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 379, 171, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 380, 172, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 381, 173, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 382, 174, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 383, 22, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 384, 176, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 385, 177, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 386, 178, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 387, 179, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 388, 180, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 389, 181, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 390, 182, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 391, 183, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 392, 184, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 393, 185, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 394, 186, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 395, 187, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 396, 1, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 397, 189, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 398, 190, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 399, 191, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 400, 193, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 401, 194, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 402, 195, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 403, 196, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 404, 197, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 405, 198, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 406, 199, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 407, 200, 3);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 408, 201, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 409, 202, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 410, 203, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 411, 204, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 412, 205, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 413, 206, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 414, 207, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 415, 208, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 416, 209, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 417, 210, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 418, 211, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 419, 212, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 420, 213, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 421, 214, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 422, 215, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 423, 216, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 424, 217, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 425, 218, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 426, 219, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 427, 220, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 428, 221, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 429, 222, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 430, 223, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 431, 3, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 432, 225, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 433, 11, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 434, 227, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 435, 228, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 436, 229, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 437, 230, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 438, 231, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 439, 232, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 440, 233, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 441, 234, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 442, 235, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 443, 236, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 444, 237, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 445, 238, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 446, 239, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 447, 240, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 448, 241, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 449, 242, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 450, 243, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 451, 244, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 452, 245, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 453, 246, 4);
INSERT INTO "public".professeur( id_professeur, personne, titre ) VALUES ( 454, 247, 4);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 1, 198, '2025-09-08 05:26:20 pm', null, 1);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 2, 61, '2025-09-08 05:26:34 pm', null, 2);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 3, 169, '2025-09-08 05:51:16 pm', null, 3);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 4, 410, '2025-09-08 05:51:16 pm', null, 30);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 5, 50, '2025-09-08 05:51:16 pm', null, 34);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 6, 18, '2025-09-08 05:51:16 pm', null, 38);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 7, 384, '2025-09-08 05:51:16 pm', null, 4);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 8, 13, '2025-09-08 05:51:16 pm', null, 5);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 9, 386, '2025-09-08 05:51:16 pm', null, 6);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 10, 387, '2025-09-08 05:51:16 pm', null, 7);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 11, 64, '2025-09-08 05:51:16 pm', null, 8);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 12, 12, '2025-09-08 05:51:16 pm', null, 9);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 13, 162, '2025-09-08 05:51:16 pm', null, 10);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 14, 391, '2025-09-08 05:51:16 pm', null, 11);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 15, 392, '2025-09-08 05:51:16 pm', null, 12);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 16, 70, '2025-09-08 05:51:16 pm', null, 13);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 17, 104, '2025-09-08 05:51:16 pm', null, 15);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 18, 396, '2025-09-08 05:51:16 pm', null, 16);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 19, 230, '2025-09-08 05:51:16 pm', null, 17);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 20, 398, '2025-09-08 05:51:16 pm', null, 18);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 21, 399, '2025-09-08 05:51:16 pm', null, 19);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 22, 400, '2025-09-08 05:51:16 pm', null, 21);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 23, 402, '2025-09-08 05:51:16 pm', null, 22);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 24, 403, '2025-09-08 05:51:16 pm', null, 23);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 25, 16, '2025-09-08 05:51:16 pm', null, 24);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 26, 405, '2025-09-08 05:51:16 pm', null, 25);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 27, 1, '2025-09-08 05:51:16 pm', null, 26);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 28, 408, '2025-09-08 05:51:16 pm', null, 28);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 29, 407, '2025-09-08 05:51:16 pm', null, 39);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 30, 85, '2025-09-08 05:51:16 pm', null, 29);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 31, 411, '2025-09-08 05:51:16 pm', null, 31);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 32, 412, '2025-09-08 05:51:16 pm', null, 32);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 33, 413, '2025-09-08 05:51:16 pm', null, 33);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 34, 415, '2025-09-08 05:51:16 pm', null, 35);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 35, 416, '2025-09-08 05:51:16 pm', null, 36);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 36, 417, '2025-09-08 05:51:16 pm', null, 37);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 37, 104, '2025-09-08 05:55:50 pm', null, 14);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 38, 400, '2025-09-08 05:56:56 pm', null, 20);
INSERT INTO "public".respo_labo( id_respo_labo, responsable, date_debut, date_fin, id_labo ) VALUES ( 39, 407, '2025-09-08 06:00:21 pm', null, 27);
