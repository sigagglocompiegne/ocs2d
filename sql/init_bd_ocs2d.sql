/*
#################################################################### SUIVI CODE SQL ####################################################################
2018-12-19 : FV / initialisation du code
2019-01-04 : FV / ajout info du niveau de nomenclature de les listes couvert et usage
*/

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        DROP                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- fkey
ALTER TABLE IF EXISTS r_ocs2d_test.geo_ocs2d DROP CONSTRAINT IF EXISTS lt_ocs2d_cs_fkey;
ALTER TABLE IF EXISTS r_ocs2d_test.geo_ocs2d DROP CONSTRAINT IF EXISTS lt_ocs2d_us_fkey;
ALTER TABLE IF EXISTS r_ocs2d_test.geo_ocs2d DROP CONSTRAINT IF EXISTS lt_pei_src_geom_fkey;
-- classe
DROP TABLE IF EXISTS r_ocs2d_test.geo_ocs2d;
-- domaine de valeur
DROP TABLE IF EXISTS r_ocs2d_test.lt_ocs2d_cs;
DROP TABLE IF EXISTS r_ocs2d_test.lt_ocs2d_us;
-- sequence
DROP SEQUENCE IF EXISTS r_ocs2d_test.geo_ocs2d_id_seq;



/*

-- #################################################################### SCHEMA  ####################################################################

-- Schema: r_ocs2d_test

-- DROP SCHEMA r_ocs2d_test;

CREATE SCHEMA r_ocs2d_test
  AUTHORIZATION sig_create;

GRANT USAGE ON SCHEMA r_ocs2d_test TO edit_sig;
GRANT ALL ON SCHEMA r_ocs2d_test TO sig_create;
GRANT ALL ON SCHEMA r_ocs2d_test TO create_sig;
GRANT USAGE ON SCHEMA r_ocs2d_test TO read_sig;
ALTER DEFAULT PRIVILEGES IN SCHEMA r_ocs2d_test
GRANT ALL ON TABLES TO create_sig;
ALTER DEFAULT PRIVILEGES IN SCHEMA r_ocs2d_test
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES TO edit_sig;
ALTER DEFAULT PRIVILEGES IN SCHEMA r_ocs2d_test
GRANT SELECT ON TABLES TO read_sig;

COMMENT ON SCHEMA r_ocs2d_test
  IS 'Test OCS2D';


*/


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINES DE VALEURS                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################



-- ################################################################# Domaine valeur - lt_ocs2d_cs  ###############################################

-- Table: r_ocs2d_test.lt_ocs2d_cs

-- DROP TABLE r_ocs2d_test.lt_ocs2d_cs;

CREATE TABLE r_ocs2d_test.lt_ocs2d_cs
(
  code character varying(7) NOT NULL,
  valeur character varying(254) NOT NULL,
  affich character varying(254) NOT NULL,
  niv character varying(1) NOT NULL,
  CONSTRAINT lt_ocs2d_cs_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE r_ocs2d_test.lt_ocs2d_cs
  OWNER TO sig_create;
GRANT SELECT ON TABLE r_ocs2d_test.lt_ocs2d_cs TO read_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE r_ocs2d_test.lt_ocs2d_cs TO edit_sig;
GRANT ALL ON TABLE r_ocs2d_test.lt_ocs2d_cs TO create_sig;

COMMENT ON TABLE r_ocs2d_test.lt_ocs2d_cs
  IS 'Code permettant de décrire le type de couvert du sol';
COMMENT ON COLUMN r_ocs2d_test.lt_ocs2d_cs.code IS 'Code de la liste énumérée relative au type de couvert du sol';
COMMENT ON COLUMN r_ocs2d_test.lt_ocs2d_cs.valeur IS 'Valeur de la liste énumérée relative au type de couvert du sol';
COMMENT ON COLUMN r_ocs2d_test.lt_ocs2d_cs.affich IS 'Affichage de la liste énumérée relative au type de couvert du sol';
COMMENT ON COLUMN r_ocs2d_test.lt_ocs2d_cs.niv IS 'Niveau dans la nomenclature du type de couvert du sol';

INSERT INTO r_ocs2d_test.lt_ocs2d_cs(
            code, valeur, affich, niv)
    VALUES
    ('CS0.0.0','Non renseigné', 'CS0.0.0 - Non renseigné','0'),
    ('CS1.0.0','Surfaces revêtues ou stabilisées','CS1.0.0 - Surfaces revêtues ou stabilisées','1'),
    ('CS1.1.0','Surfaces imperméables','CS1.1.0 - Surfaces imperméables','2'),      
    ('CS1.1.1','Surfaces bâties','CS1.1.1 - Surfaces bâties','3'),
    ('CS1.1.2','Surfaces non bâties','CS1.1.2 - Surfaces non bâties','3'),
    ('CS1.2.0','Surfaces perméables','CS1.2.0 - Surfaces perméables','2'),
    ('CS1.2.1','Surfaces à matériaux minéraux - pierre - terre','CS1.2.1 - Surfaces à matériaux minéraux - pierre - terre','3'),   
    ('CS1.2.2','Surfaces composées d''autres matériaux','CS1.2.2 - Surfaces composées d''autres matériaux','3'),   
    ('CS2.0.0','Sols nus','CS2.0.0 - Sols nus','1'),
    ('CS2.1.0','Sable, dunes, limons','CS2.1.0 - Sable, dunes, limons','2'),       
    ('CS2.1.1','Sable, estran','CS2.1.1 - Sable, estran','3'), 
    ('CS2.1.2','Dunes','CS2.1.2 - Dunes','3'),
    ('CS2.2.0','Pierres, rochers, falaises','CS2.2.0 - Pierres, rochers, falaises','3'),
    ('CS3.0.0','Surfaces en eau','CS3.0.0 - Surfaces en eau','1'),           
    ('CS3.1.0','Eaux continentales','CS3.1.0 - Eaux continentales','2'),           
    ('CS3.1.1','Plans d''eau','CS3.1.1 - Plans d''eau','3'),           
    ('CS3.1.2','Cours d''eau','CS3.1.2 - Cours d''eau','3'),           
    ('CS3.2.0','Eaux maritimes','CS3.2.0 - Eaux maritimes','2'),           
    ('CS3.2.1','Estuaires','CS3.2.1 - Estuaires','3'),           
    ('CS3.2.2','Mer','CS3.2.2 - Mer','3'),           
    ('CS4.0.0','Formations arborescentes','CS4.0.0 - Formations arborescentes','1'),           
    ('CS4.1.0','Feuillus','CS4.1.0 - Feuillus','2'),           
    ('CS4.1.1','Feuillus sur dunes','CS4.1.1 - Feuillus sur dunes','3'),           
    ('CS4.1.2','Feuillus','CS4.1.2 - Feuillus','3'),           
    ('CS4.1.3','Boisements humides','CS4.1.3 - Boisements humides','3'),           
    ('CS4.2.0','Conifères','CS4.2.0 - Conifères','2'), 
    ('CS4.2.1','Conifères sur dunes','CS4.2.1 - Conifères sur dunes','3'), 
    ('CS4.2.2','Conifères','CS4.2.2 - Conifères','3'), 
    ('CS4.3.0','Peuplements mixtes','CS4.3.0 - Peuplements mixtes','2'), 
    ('CS4.3.1','Peuplements mixtes sur dunes','CS4.3.1 - Peuplements mixtes sur dunes','3'), 
    ('CS4.3.2','Peuplements mixtes ou indéterminés','CS4.3.2 - Peuplements mixtes ou indéterminés','3'), 
    ('CS4.4.0','Vergers et petits fruits','CS4.4.0 - Vergers et petits fruits','3'), 
    ('CS5.0.0','Formations arbustives et sous-arbrisseaux','CS5.0.0 - Formations arbustives et sous-arbrisseaux','1'), 
    ('CS5.1.0','Fourrés et broussailles','CS5.1.0 - Fourrés et broussailles','2'), 
    ('CS5.1.1','Fourrés et broussailles','CS5.1.1 - Fourrés et broussailles','3'), 
    ('CS5.1.2','Fourrés humides','CS5.1.2 - Fourrés humides','3'), 
    ('CS5.1.3','Végétations arbustives sur dunes','CS5.1.3 - Végétations arbustives sur dunes','3'), 
    ('CS5.2.0','Landes','CS5.2.0 - Landes','2'), 
    ('CS5.2.1','Landes sèches','CS5.2.1 - Landes sèches','3'), 
    ('CS5.2.2','Landes humides','CS5.2.2 - Landes humides','3'), 
    ('CS6.0.0','Formations herbacées ou basses','CS6.0.0 - Formations herbacées ou basses','1'), 
    ('CS6.1.0','Prairies','CS6.1.0 - Prairies','2'), 
    ('CS6.1.1','Prairies mésophiles','CS6.1.1 - Prairies mésophiles','3'), 
    ('CS6.1.2','Prairies humides','CS6.1.2 - Prairies humides','3'), 
    ('CS6.2.0','Pelouses naturelles','CS6.2.0 - Pelouses naturelles','3'), 
    ('CS6.3.0','Terres arables','CS6.3.0 - Terres arables','3'), 
    ('CS6.4.0','Formations herbacées humides','CS6.4.0 - Formations herbacées humides','2'), 
    ('CS6.4.1','Formations herbacées humides continentales','CS6.4.1 - Formations herbacées humides continentales','3'), 
    ('CS6.4.2','Formations herbacées humides maritimes','CS6.4.2 - Formations herbacées humides maritimes','3'), 
    ('CS6.5.0','Formations herbacées sur dunes','CS6.5.0 - Formations herbacées sur dunes','3'), 
    ('CS6.6.0','Autres Formations herbacées','CS6.6.0 - Autres Formations herbacées','3'); 
    
 


-- ################################################################# Domaine valeur - lt_ocs2d_us  ###############################################

-- Table: r_ocs2d_test.lt_ocs2d_us

-- DROP TABLE r_ocs2d_test.lt_ocs2d_us;

CREATE TABLE r_ocs2d_test.lt_ocs2d_us
(
  code character varying(7) NOT NULL,
  valeur character varying(254) NOT NULL,
  affich character varying(254) NOT NULL,
  niv character varying(1) NOT NULL,
  CONSTRAINT lt_ocs2d_us_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE r_ocs2d_test.lt_ocs2d_us
  OWNER TO sig_create;
GRANT SELECT ON TABLE r_ocs2d_test.lt_ocs2d_us TO read_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE r_ocs2d_test.lt_ocs2d_us TO edit_sig;
GRANT ALL ON TABLE r_ocs2d_test.lt_ocs2d_us TO create_sig;


COMMENT ON TABLE r_ocs2d_test.lt_ocs2d_us
  IS 'Code permettant de décrire le type d''usage du sol';
COMMENT ON COLUMN r_ocs2d_test.lt_ocs2d_us.code IS 'Code de la liste énumérée relative au type d''usage du sol';
COMMENT ON COLUMN r_ocs2d_test.lt_ocs2d_us.valeur IS 'Valeur de la liste énumérée relative au type d''usage du sol';
COMMENT ON COLUMN r_ocs2d_test.lt_ocs2d_us.affich IS 'Affichage de la liste énumérée relative au type d''usage du sol';
COMMENT ON COLUMN r_ocs2d_test.lt_ocs2d_us.niv IS 'Niveau dans la nomenclature du type d''usage du sol';

INSERT INTO r_ocs2d_test.lt_ocs2d_us(
            code, valeur, affich, niv)
    VALUES
    ('US0.0.0','Non renseigné','US0.0.0 - Non renseigné','0'),
    ('US1.0.0','Production primaire','US1.0.0 - Production primaire','1'),
    ('US1.1.0','Agriculture','US1.1.0 - Agriculture','2'),      
    ('US1.1.1','Prairies','US1.1.1 - Prairies','3'),
    ('US1.1.2','Bandes enherbées','US1.1.2 - Bandes enherbées','3'),
    ('US1.1.3','Cultures annuelles','US1.1.3 - Cultures annuelles','3'),
    ('US1.1.4','Horticulture','US1.1.4 - Horticulture','3'),
    ('US1.1.5','Cultures permanentes','US1.1.5 - Cultures permanentes','3'),
    ('US1.1.6','Autoconsommation','US1.1.6 - Autoconsommation','3'),
    ('US1.1.7','Infrastructures agricoles','US1.1.7 - Infrastructures agricoles','3'),
    ('US1.2.0','Sylviculture','US1.2.0 - Sylviculture','2'),
    ('US1.2.1','Zones de coupes','US1.2.1 - Zones de coupes','3'),   
    ('US1.2.2','Peupleraies','US1.2.2 - Peupleraies','3'),
    ('US1.2.3','Plantations récentes','US1.2.3 - Plantations récentes','3'),
    ('US1.2.4','A vocation sylvicole ou usage indéterminé','US1.2.4 - A vocation sylvicole ou usage indéterminé','3'),
    ('US1.3.0','Activités d''extraction','US1.3.0 - Activités d''extraction','2'),
    ('US1.3.1','Carrières, mines','US1.3.1 - Carrières, mines','3'),
    ('US1.3.2','Terrils en exploitation','US1.3.2 - Terrils en exploitation','3'),
    ('US1.4.0','Aquaculture, pisciculture','US1.4.0 - Aquaculture, pisciculture','3'),     
    ('US2.0.0','Activités économiques secondaires et tertiaires','US2.0.0 - Activités économiques secondaires et tertiaires','1'),
    ('US2.1.0','Zones industrielles et d''activités économiques','US2.1.0 - Zones industrielles et d''activités économiques','2'),       
    ('US2.1.1','Zones industrielles et d''activités économiques','US2.1.1 - Zones industrielles et d''activités économiques','3'), 
    ('US2.1.2','Zones de stockage gaz et hydrocarbures','US2.1.2 - Zones de stockage gaz et hydrocarbures','3'),
    ('US2.2.0','Zones commerciales','US2.2.0 - Zones commerciales','3'),
    ('US3.0.0','Services et usages collectifs','US3.0.0 - Services et usages collectifs','1'),           
    ('US3.1.0','Services publics, administratifs et collectifs','US3.1.0 - Services publics, administratifs et collectifs','2'),           
    ('US3.1.1','Emprises scolaires / universitaires','US3.1.1 - Emprises scolaires / universitaires','3'),           
    ('US3.1.2','Emprises hospitalières','US3.1.2 - Emprises hospitalières','3'),           
    ('US3.1.3','Cimetières et lieux de culte','US3.1.3 - Cimetières et lieux de culte','3'),           
    ('US3.1.4','Parkings et places','US3.1.4 - Parkings et places','3'),           
    ('US3.1.5','Déchetteries et décharges publiques','US3.1.5 - Déchetteries et décharges publiques','3'),           
    ('US3.1.6','Autres emprises collectives','US3.1.6 - Autres emprises collectives','3'),           
    ('US3.2.0','Loisirs et services culturels','US3.2.0 - Loisirs et services culturels','2'),           
    ('US3.2.1','Parcs et Espaces verts paysagers','US3.2.1 - Parcs et Espaces verts paysagers','3'),           
    ('US3.2.2','Complexes sportifs et terrains de sports','US3.2.2 - Complexes sportifs et terrains de sports','3'),           
    ('US3.2.3','Golfs','US3.2.3 - Golfs','3'),           
    ('US3.2.4','Campings','US3.2.4 - Campings','3'),           
    ('US3.2.5','Complexes culturels et de loisirs','US3.2.5 - Complexes culturels et de loisirs','3'),           
    ('US4.0.0','Réseaux de transports, logistiques et infrastructures','US4.0.0 - Réseaux de transports, logistiques et infrastructures','1'),           
    ('US4.1.0','Routier','US4.1.0 - Routier','2'),           
    ('US4.1.1','Routier principal','US4.1.1 - Routier principal','3'),           
    ('US4.1.2','Routier secondaire','US4.1.2 - Routier secondaire','3'),                     
    ('US4.2.0','Ferré','US4.2.0 - Ferré','2'), 
    ('US4.2.1','Ferré principal','US4.2.1 - Ferré principal','3'), 
    ('US4.2.2','Ferré secondaire','US4.2.2 - Ferré secondaire','3'), 
    ('US4.3.0','Aérien','US4.3.0 - Aérien','3'), 
    ('US4.4.0','Fluvial et maritime','US4.4.0 - Fluvial et maritime','3'), 
    ('US4.5.0','Espaces associés aux réseaux de transport','US4.5.0 - Espaces associés aux réseaux de transport','3'), 
    ('US5.0.0','Habitat','US5.0.0 - Habitat','1'), 
    ('US5.1.0','Tissu urbain continu','US5.1.0 - Tissu urbain continu','2'), 
    ('US5.1.1','Habitat continu fortement compact','US5.1.1 - Habitat continu fortement compact','3'), 
    ('US5.1.2','Habitat continu moyennement compact','US5.1.2 - Habitat continu moyennement compact','3'), 
    ('US5.1.3','Habitat continu faiblement compact','US5.1.3 - Habitat continu faiblement compact','3'), 
    ('US5.2.0','Tissu urbain discontinu','US5.2.0 - Tissu urbain discontinu','2'), 
    ('US5.2.1','Habitat discontinu fortement compact','US5.2.1 - Habitat discontinu fortement compact','3'), 
    ('US5.2.2','Habitat discontinu moyennement compact','US5.2.2 - Habitat discontinu moyennement compact','3'),
    ('US5.2.3','Habitat discontinu faiblement compact','US5.2.3 - Habitat discontinu faiblement compact','3'),     
    ('US5.3.0','Ensembles collectifs','US5.3.0 - Ensembles collectifs','2'),   
    ('US5.3.1','Grands ensembles collectifs','US5.3.1 - Grands ensembles collectifs','3'),   
    ('US5.3.2','Collectifs','US5.3.2 - Collectifs','3'),   
    ('US5.4.0','Habitat isolé','US5.4.0 - Habitat isolé','3'),   
    ('US6.0.0','Usages temporaires','US6.0.0 - Usages temporaires','1'), 
    ('US6.1.0','Zones en mutation','US6.1.0 - Zones en mutation','2'), 
    ('US6.1.1','Chantiers','US6.1.1 - Chantiers','3'), 
    ('US6.1.2','Extraction de matériaux en mutation','US6.1.2 - Extraction de matériaux en mutation','3'), 
    ('US6.2.0','Zones délaissées','US6.2.0 - Zones délaissées','2'), 
    ('US6.2.1','Friches d''activités économiques','US6.2.1 - Friches d''activités économiques','3'), 
    ('US6.2.2','Délaissés urbains','US6.2.2 - Délaissés urbains','3'), 
    ('US6.2.3','Espaces agricoles non exploités','US6.2.3 - Espaces agricoles non exploités','3'), 
    ('US7.0.0','Usages indéterminés','US7.0.0 - Usages indéterminés','3'); 
    



-- ################################################################# Domaine valeur - src_geom  ###############################################

-- Type d'énumération urbanisé et présent dans le schéma r_objet
-- Voir table r_objet.lt_src_geom


    
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                      CLASSES                                                                 ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################



-- #################################################################### Occupation du sol ####################################################  
  
-- Table: r_ocs2d_test.geo_ocs2d

-- DROP TABLE r_ocs2d_test.geo_ocs2d;

CREATE TABLE r_ocs2d_test.geo_ocs2d
(
  id_ocs2d bigint NOT NULL,
  cs18 character varying(7) NOT NULL DEFAULT 'CS7.0.0' ::bpchar, 
  us18 character varying(7) NOT NULL DEFAULT 'US7.0.0' ::bpchar,
  indice18 character varying(1) NOT NULL DEFAULT '0' ::bpchar,
  observ character varying(254),
  src_geom character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  src_date character varying(4) NOT NULL DEFAULT '0000' ::bpchar,
  ope_sai character varying(254),
  date_sai timestamp without time zone NOT NULL DEFAULT now(),  
  date_maj timestamp without time zone,
  sup_m2 integer, 
  geom geometry(MultiPolygon,2154),

  CONSTRAINT geo_ocs2d_pkey PRIMARY KEY (id_ocs2d)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE r_ocs2d_test.geo_ocs2d
  OWNER TO sig_create;
GRANT SELECT ON TABLE r_ocs2d_test.geo_ocs2d TO read_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE r_ocs2d_test.geo_ocs2d TO edit_sig;
GRANT ALL ON TABLE r_ocs2d_test.geo_ocs2d TO create_sig;

COMMENT ON TABLE r_ocs2d_test.geo_ocs2d
  IS 'Occupation du sol en 2 dimensions';
COMMENT ON COLUMN r_ocs2d_test.geo_ocs2d.id_ocs2d IS 'Identifiant unique';
COMMENT ON COLUMN r_ocs2d_test.geo_ocs2d.cs18 IS 'Couvert du sol en 2018';
COMMENT ON COLUMN r_ocs2d_test.geo_ocs2d.cs18 IS 'Usage du sol en 2018';
COMMENT ON COLUMN r_ocs2d_test.geo_ocs2d.indice18 IS 'Indice de qualité de l''interprétation en 2018';
COMMENT ON COLUMN r_ocs2d_test.geo_ocs2d.observ IS 'Observations';
COMMENT ON COLUMN r_ocs2d_test.geo_ocs2d.src_geom IS 'Référentiel de saisie';
COMMENT ON COLUMN r_ocs2d_test.geo_ocs2d.src_date IS 'Année du millésime du référentiel de saisie';
COMMENT ON COLUMN r_ocs2d_test.geo_ocs2d.ope_sai IS 'Opérateur de la dernière saisie en base de l''objet';
COMMENT ON COLUMN r_ocs2d_test.geo_ocs2d.date_sai IS 'Horodatage de l''intégration en base de l''objet';
COMMENT ON COLUMN r_ocs2d_test.geo_ocs2d.date_maj IS 'Horodatage de la mise à jour en base de l''objet';
COMMENT ON COLUMN r_ocs2d_test.geo_ocs2d.sup_m2 IS 'Superficie en m² de l''objet';
COMMENT ON COLUMN r_ocs2d_test.geo_ocs2d.geom IS 'Géométrie surfacique de l''objet';

-- Index: r_ocs2d_test.geo_ocs2d_geom

-- DROP INDEX r_ocs2d_test.geo_ocs2d_geom;

CREATE INDEX sidx_geo_ocs2d_geom
  ON r_ocs2d_test.geo_ocs2d
  USING gist
  (geom);


-- Sequence: r_ocs2d_test.geo_ocs2d_id_seq

-- DROP SEQUENCE r_ocs2d_test.geo_ocs2d_id_seq;

CREATE SEQUENCE r_ocs2d_test.geo_ocs2d_id_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE r_ocs2d_test.geo_ocs2d_id_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE r_ocs2d_test.geo_ocs2d_id_seq TO sig_create;
GRANT SELECT, USAGE ON SEQUENCE r_ocs2d_test.geo_ocs2d_id_seq TO public;

ALTER TABLE r_ocs2d_test.geo_ocs2d ALTER COLUMN id_ocs2d SET DEFAULT nextval('r_ocs2d_test.geo_ocs2d_id_seq'::regclass);


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        FKEY                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- Foreign Key: r_ocs2d_test.lt_ocs2d_cs_fkey

-- ALTER TABLE r_ocs2d_test.geo_ocs2d DROP CONSTRAINT lt_ocs2d_cs_fkey;

ALTER TABLE r_ocs2d_test.geo_ocs2d
  ADD CONSTRAINT lt_ocs2d_cs_fkey FOREIGN KEY (cs18)
      REFERENCES r_ocs2d_test.lt_ocs2d_cs (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

-- Foreign Key: r_ocs2d_test.lt_ocs2d_us_fkey

-- ALTER TABLE r_ocs2d_test.geo_ocs2d DROP CONSTRAINT lt_ocs2d_us_fkey;

ALTER TABLE r_ocs2d_test.geo_ocs2d
  ADD CONSTRAINT lt_ocs2d_us_fkey FOREIGN KEY (us18)
      REFERENCES r_ocs2d_test.lt_ocs2d_us (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;


-- Foreign Key: r_ocs2d_test.lt_pei_src_geom_fkey

-- ALTER TABLE r_ocs2d_test.geo_ocs2d DROP CONSTRAINT lt_pei_src_geom_fkey;

ALTER TABLE r_ocs2d_test.geo_ocs2d
  ADD CONSTRAINT lt_pei_src_geom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
      

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                      TRIGGER                                                                 ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- #################################################################### TRIGGER - SUP_M2  ###################################################

-- Function: r_ocs2d_test.ft_geo_ocs2d()

-- DROP FUNCTION r_ocs2d_test.ft_geo_ocs2d();

CREATE OR REPLACE FUNCTION r_ocs2d_test.ft_geo_ocs2d()
  RETURNS trigger AS
$BODY$BEGIN

-- INSERT
IF (TG_OP = 'INSERT') THEN

NEW.cs18 = CASE WHEN NEW.cs18 = NULL THEN 'CS0.0.0' ELSE NEW.cs18 END;
NEW.us18 = CASE WHEN NEW.us18 = NULL THEN 'CS0.0.0' ELSE NEW.us18 END;
NEW.date_maj = NULL;
NEW.sup_m2=round(cast(st_area(new.geom) as numeric),0);
RETURN NEW;

-- UPDATE
ELSIF (TG_OP = 'UPDATE') THEN

NEW.cs18 = CASE WHEN NEW.cs18 = NULL THEN 'CS0.0.0' ELSE NEW.cs18 END;
NEW.us18 = CASE WHEN NEW.us18 = NULL THEN 'CS0.0.0' ELSE NEW.us18 END;
NEW.date_maj=current_timestamp;
NEW.sup_m2=round(cast(st_area(new.geom) as numeric),0);
RETURN NEW;

END IF;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION r_ocs2d_test.ft_geo_ocs2d()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION r_ocs2d_test.ft_geo_ocs2d() TO public;
GRANT EXECUTE ON FUNCTION r_ocs2d_test.ft_geo_ocs2d() TO sig_create;
GRANT EXECUTE ON FUNCTION r_ocs2d_test.ft_geo_ocs2d() TO create_sig;
COMMENT ON FUNCTION r_ocs2d_test.ft_geo_ocs2d() IS 'Fonction dont l''objet est de mettre à jour la superficie en m2 de la géométrie de type polygone et la date de mise à jour';


-- Trigger: t_geo_ocs2d on r_ocs2d_test.geo_ocs2d

-- DROP TRIGGER t_geo_ocs2d ON r_ocs2d_test.geo_ocs2d;

CREATE TRIGGER t_geo_ocs2d
  BEFORE INSERT OR UPDATE
  ON r_ocs2d_test.geo_ocs2d
  FOR EACH ROW
  EXECUTE PROCEDURE r_ocs2d_test.ft_geo_ocs2d();
     
