# Host: 204.48.19.227  (Version 5.7.26-0ubuntu0.18.04.1)
# Date: 2019-07-03 11:33:02
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "dim_cor_cutis"
#

CREATE TABLE `dim_cor_cutis` (
  `id_dim_cor_cutis` int(11) NOT NULL AUTO_INCREMENT,
  `cod_cor_cutis` int(11) DEFAULT NULL,
  `cor_cutis` text,
  `version` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  PRIMARY KEY (`id_dim_cor_cutis`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Structure for table "dim_Localizacao"
#

CREATE TABLE `dim_Localizacao` (
  `id_dim_Localizacao` int(11) NOT NULL AUTO_INCREMENT,
  `cod_Localizacao` int(11) DEFAULT NULL,
  `nome_municipio` text,
  `LATITUDE` varchar(500) DEFAULT NULL,
  `LONGITUDE` varchar(500) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  PRIMARY KEY (`id_dim_Localizacao`)
) ENGINE=InnoDB AUTO_INCREMENT=6262 DEFAULT CHARSET=latin1;

#
# Structure for table "dim_ocorrencia"
#

CREATE TABLE `dim_ocorrencia` (
  `id_dim_ocorrencia` int(11) NOT NULL AUTO_INCREMENT,
  `cod_rubrica` int(11) DEFAULT NULL,
  `rubrica` text,
  `version` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  PRIMARY KEY (`id_dim_ocorrencia`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

#
# Structure for table "dim_periodo"
#

CREATE TABLE `dim_periodo` (
  `id_dim_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_periodo` int(11) DEFAULT NULL,
  `periodo` text,
  `version` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  PRIMARY KEY (`id_dim_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Structure for table "dim_Populacional"
#

CREATE TABLE `dim_Populacional` (
  `id_dim_Populacional` int(11) NOT NULL AUTO_INCREMENT,
  `cod_populacional` int(11) DEFAULT NULL,
  `LABEL` text,
  `version` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  PRIMARY KEY (`id_dim_Populacional`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Structure for table "dim_sexo"
#

CREATE TABLE `dim_sexo` (
  `id_dim_sexo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_sexo` int(11) DEFAULT NULL,
  `sexo_pessoa` text,
  `version` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  PRIMARY KEY (`id_dim_sexo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Structure for table "dim_tempo"
#

CREATE TABLE `dim_tempo` (
  `id_dim_tempo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_ID_TEMPO` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `DIA_MES` int(11) DEFAULT NULL,
  `MES_NUMERO` int(11) DEFAULT NULL,
  `MES_NOME` varchar(20) DEFAULT NULL,
  `DIA_SEMANA_NUMERO` int(11) DEFAULT NULL,
  `DIA_SEMANA_NOME` varchar(20) DEFAULT NULL,
  `SEMANA_ANO` int(11) DEFAULT NULL,
  `DIA_ANO` int(11) DEFAULT NULL,
  `ANO` int(11) DEFAULT NULL,
  `HORA` int(11) DEFAULT NULL,
  `MINUTOS` int(11) DEFAULT NULL,
  `SEGUNDOS` int(11) DEFAULT NULL,
  `HORA_COMPLETA` time DEFAULT NULL,
  `PERIODO` varchar(50) DEFAULT NULL,
  `TRIMESTRE_NUMERO` int(11) DEFAULT NULL,
  `TRIMESTRE_NOME` varchar(20) DEFAULT NULL,
  `SEMESTRE_NUMERO` int(11) DEFAULT NULL,
  `SEMESTRE_NOME` varchar(20) DEFAULT NULL,
  `DATA_BR` varchar(20) DEFAULT NULL,
  `TIMESTAMP` datetime DEFAULT NULL,
  PRIMARY KEY (`id_dim_tempo`)
) ENGINE=InnoDB AUTO_INCREMENT=6263 DEFAULT CHARSET=latin1;

#
# Structure for table "dim_zona"
#

CREATE TABLE `dim_zona` (
  `id_dim_zona` int(11) NOT NULL AUTO_INCREMENT,
  `cod_zona` int(11) DEFAULT NULL,
  `tipo_zona` text,
  `version` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  PRIMARY KEY (`id_dim_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Structure for table "fato_crime"
#

CREATE TABLE `fato_crime` (
  `total_crime` bigint(20) DEFAULT NULL,
  `dim_sexo_id_dim_sexo` int(11) NOT NULL,
  `dim_tempo_id_dim_tempo` int(11) NOT NULL,
  `dim_periodo_id_dim_periodo` int(11) NOT NULL,
  `dim_ocorrencia_id_dim_ocorrencia` int(11) NOT NULL,
  `dim_Localizacao_id_dim_Localizacao` int(11) NOT NULL,
  `dim_Populacional_id_dim_Populacional` int(11) NOT NULL,
  `dim_zona_id_dim_zona` int(11) NOT NULL,
  `dim_cor_cutis_id_dim_cor_cutis` int(11) NOT NULL,
  PRIMARY KEY (`dim_sexo_id_dim_sexo`,`dim_tempo_id_dim_tempo`,`dim_periodo_id_dim_periodo`,`dim_ocorrencia_id_dim_ocorrencia`,`dim_Localizacao_id_dim_Localizacao`,`dim_Populacional_id_dim_Populacional`,`dim_zona_id_dim_zona`,`dim_cor_cutis_id_dim_cor_cutis`),
  KEY `fk_fato_crime_area_escola_dim_sexo1` (`dim_sexo_id_dim_sexo`),
  KEY `fk_fato_crime_area_escola_id_dim_tempo1` (`dim_tempo_id_dim_tempo`),
  KEY `fk_fato_crime_area_escola_dim_periodo` (`dim_periodo_id_dim_periodo`),
  KEY `fk_fato_crime_area_escola_dim_ocorrencia1` (`dim_ocorrencia_id_dim_ocorrencia`),
  KEY `fk_fato_crime_area_escola_dim_Populacional` (`dim_Populacional_id_dim_Populacional`),
  KEY `fk_fato_crime_area_escola_dim_Localizacao1` (`dim_Localizacao_id_dim_Localizacao`),
  KEY `fk_fato_crime_area_escola_dim_zona1` (`dim_zona_id_dim_zona`),
  KEY `fk_fato_crime_area_escola_dim_cor_cutis1` (`dim_cor_cutis_id_dim_cor_cutis`),
  CONSTRAINT `fk_fato_crime_area_escola_dim_Localizacao1` FOREIGN KEY (`dim_Localizacao_id_dim_Localizacao`) REFERENCES `dim_Localizacao` (`id_dim_Localizacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fato_crime_area_escola_dim_Populacional` FOREIGN KEY (`dim_Populacional_id_dim_Populacional`) REFERENCES `dim_Populacional` (`id_dim_Populacional`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fato_crime_area_escola_dim_cor_cutis1` FOREIGN KEY (`dim_cor_cutis_id_dim_cor_cutis`) REFERENCES `dim_cor_cutis` (`id_dim_cor_cutis`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fato_crime_area_escola_dim_ocorrencia1` FOREIGN KEY (`dim_ocorrencia_id_dim_ocorrencia`) REFERENCES `dim_ocorrencia` (`id_dim_ocorrencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fato_crime_area_escola_dim_periodo` FOREIGN KEY (`dim_periodo_id_dim_periodo`) REFERENCES `dim_periodo` (`id_dim_periodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fato_crime_area_escola_dim_sexo1` FOREIGN KEY (`dim_sexo_id_dim_sexo`) REFERENCES `dim_sexo` (`id_dim_sexo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fato_crime_area_escola_dim_zona1` FOREIGN KEY (`dim_zona_id_dim_zona`) REFERENCES `dim_zona` (`id_dim_zona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fato_crime_area_escola_id_dim_tempo1` FOREIGN KEY (`dim_tempo_id_dim_tempo`) REFERENCES `dim_tempo` (`id_dim_tempo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
