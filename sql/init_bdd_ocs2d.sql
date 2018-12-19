
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
    ('CS3.2.1','Estuaires'),           
    ('CS3.2.2','Mer'),           
    ('CS4.0.0','Formations arborescentes'),           
    ('CS4.1.0','Feuillus'),           
    ('CS4.1.1','Feuillus sur dunes'),           
    ('CS4.1.2','Feuillus'),           
    ('CS4.1.3','Boisements humides'),           
    ('CS4.2.0','Conifères'), 
    ('CS4.2.1','Conifères sur dunes'), 
    ('CS4.2.2','Conifères'), 
    ('CS4.3.0','Peuplements mixtes'), 
    ('CS4.3.1','Peuplements mixtes sur dunes'), 
    ('CS4.3.2','Peuplements mixtes ou indéterminés'), 
    ('CS4.4.0','Vergers et petits fruits'), 
    ('CS5.0.0','Formations arbustives et sous-arbrisseaux'), 
    ('CS5.1.0','Fourrés et broussailles'), 
    ('CS5.1.1','Fourrés et broussailles'), 
    ('CS5.1.2','Fourrés humides'), 
    ('CS5.1.3','Végétations arbustives sur dunes'), 
    ('CS5.2.0','Landes'), 
    ('CS5.2.1','Landes sèches'), 
    ('CS5.2.2','Landes humides'), 
    ('CS6.0.0','Formations herbacées ou basses'), 
    ('CS6.1.0','Prairies'), 
    ('CS6.1.1','Prairies mésophiles'), 
    ('CS6.1.2','Prairies humides'), 
    ('CS6.2.0','Pelouses naturelles'), 
    ('CS6.3.0','Terres arables'), 
    ('CS6.4.0','Formations herbacées humides'), 
    ('CS6.4.1','Formations herbacées humides continentales'), 
    ('CS6.4.2','Formations herbacées humides maritimes'), 
    ('CS6.5.0','Formations herbacées sur dunes'), 
    ('CS6.6.0','Autres Formations herbacées'); 
    
 

