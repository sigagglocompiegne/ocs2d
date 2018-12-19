
-- ################################################################# Domaine valeur - lt_ocs2d_cs  ###############################################

-- Table: r_ocs2d_test.lt_ocs2d_cs

-- DROP TABLE r_ocs2d_test.lt_ocs2d_cs;

CREATE TABLE r_ocs2d_test.lt_ocs2d_cs
(
  code character varying(7) NOT NULL,
  valeur character varying(254) NOT NULL,
  CONSTRAINT lt_ocs2d_cs_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE r_ocs2d_test.lt_ocs2d_cs
  IS 'Code permettant de décrire le type de couvert du sol';
COMMENT ON COLUMN r_ocs2d_test.lt_ocs2d_cs.code IS 'Code de la liste énumérée relative au type de couvert du sol';
COMMENT ON COLUMN r_ocs2d_test.lt_ocs2d_cs.valeur IS 'Valeur de la liste énumérée relative au type de couvert du sol';

INSERT INTO r_ocs2d_test.lt_ocs2d_cs(
            code, valeur)
    VALUES
    ('CS0.0.0','Non renseigné'),
    ('CS1.0.0','Surfaces revêtues ou stabilisées'),
    ('CS1.1.0','Surfaces imperméables'),      
    ('CS1.1.1','Surfaces bâties'),
    ('CS1.1.2','Surfaces non bâties'),
    ('CS1.2.0','Surfaces perméables'),
    ('CS1.2.1','Surfaces à matériaux minéraux - pierre - terre'),   
    ('CS1.2.2','Surfaces composées d''autres matériaux'),   
    ('CS2.0.0','Sols nus'),
    ('CS2.1.0','Sable, dunes, limons'),       
    ('CS2.1.1','Sable, estran'), 
    ('CS2.1.2','Dunes'),
    ('CS2.2.0','Pierres, rochers, falaises'),
    ('CS3.0.0','Surfaces en eau'),           
    ('CS3.1.0','Eaux continentales'),           
    ('CS3.1.1','Plans d''eau'),           
    ('CS3.1.2','Cours d''eau'),           
    ('CS3.2.0','Eaux maritimes'),           
