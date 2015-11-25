-- -------------------------------------------
SET AUTOCOMMIT=0;
START TRANSACTION;
SET SQL_QUOTE_SHOW_CREATE = 1;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- -------------------------------------------
-- -------------------------------------------
-- START BACKUP
-- -------------------------------------------
-- -------------------------------------------
-- TABLE `activerecordlog`
-- -------------------------------------------
DROP TABLE IF EXISTS `activerecordlog`;
CREATE TABLE IF NOT EXISTS `activerecordlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` text,
  `action` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `model` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `idModel` int(10) unsigned DEFAULT NULL,
  `field` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `ambito`
-- -------------------------------------------
DROP TABLE IF EXISTS `ambito`;
CREATE TABLE IF NOT EXISTS `ambito` (
  `id` int(11) NOT NULL,
  `nombre_ambito` varchar(25) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `clase`
-- -------------------------------------------
DROP TABLE IF EXISTS `clase`;
CREATE TABLE IF NOT EXISTS `clase` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_seccion` varchar(5) CHARACTER SET latin1 NOT NULL,
  `codigo_division` tinyint(4) NOT NULL,
  `codigo_grupo` tinyint(4) NOT NULL,
  `codigo_clase` tinyint(4) NOT NULL,
  `clase` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `clausuras`
-- -------------------------------------------
DROP TABLE IF EXISTS `clausuras`;
CREATE TABLE IF NOT EXISTS `clausuras` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cod_convencion` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `cod_convencion` (`cod_convencion`),
  CONSTRAINT `clausuras_ibfk_1` FOREIGN KEY (`cod_convencion`) REFERENCES `convencion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `consultor`
-- -------------------------------------------
DROP TABLE IF EXISTS `consultor`;
CREATE TABLE IF NOT EXISTS `consultor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(200) NOT NULL,
  `cedula` int(11) NOT NULL,
  `cod_convencion` bigint(20) unsigned NOT NULL,
  `cod_empresa` bigint(20) unsigned NOT NULL,
  `cod_sindicato` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `cod_convencion` (`cod_convencion`,`cod_empresa`,`cod_sindicato`),
  KEY `cod_empresa` (`cod_empresa`),
  KEY `cod_sindicato` (`cod_sindicato`),
  CONSTRAINT `consultor_ibfk_2` FOREIGN KEY (`cod_sindicato`) REFERENCES `sindicato` (`id`),
  CONSTRAINT `consultor_ibfk_1` FOREIGN KEY (`cod_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `contacto_empresa`
-- -------------------------------------------
DROP TABLE IF EXISTS `contacto_empresa`;
CREATE TABLE IF NOT EXISTS `contacto_empresa` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) CHARACTER SET latin1 NOT NULL,
  `telefono` varchar(20) CHARACTER SET latin1 NOT NULL,
  `correo` varchar(100) CHARACTER SET latin1 NOT NULL,
  `cedula` varchar(20) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `convencion`
-- -------------------------------------------
DROP TABLE IF EXISTS `convencion`;
CREATE TABLE IF NOT EXISTS `convencion` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 NOT NULL,
  `numero_expediente` varchar(20) CHARACTER SET latin1 NOT NULL,
  `inspectoria` varchar(5) CHARACTER SET latin1 NOT NULL,
  `sector` int(11) NOT NULL,
  `ambito` int(11) NOT NULL,
  `edicion` int(11) NOT NULL,
  `fecha_deposito` date NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_venc` date NOT NULL,
  `duracion_meses` int(11) NOT NULL,
  `fecha_auto_homo` date NOT NULL,
  `costo_contrato` decimal(20,4) NOT NULL,
  `costo_contrato_sin_prestaciones` decimal(20,4) NOT NULL,
  `cod_convencion` varchar(11) CHARACTER SET latin1 NOT NULL,
  `referencia` varchar(15) CHARACTER SET latin1 NOT NULL COMMENT 'Orden (padre,hija)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `inspectoria` (`inspectoria`),
  KEY `ambito` (`ambito`),
  KEY `cod_convencion` (`cod_convencion`),
  KEY `referencia` (`referencia`),
  CONSTRAINT `convencion_ibfk_1` FOREIGN KEY (`inspectoria`) REFERENCES `inspectoria` (`id`),
  CONSTRAINT `convencion_ibfk_2` FOREIGN KEY (`ambito`) REFERENCES `ambito` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `convencion_vieja`
-- -------------------------------------------
DROP TABLE IF EXISTS `convencion_vieja`;
CREATE TABLE IF NOT EXISTS `convencion_vieja` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cod_interno` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cod_convencion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cod_convencion_padre` varchar(50) CHARACTER SET latin1 NOT NULL,
  `duracion` int(11) NOT NULL,
  `inicio` date NOT NULL,
  `fin` date NOT NULL,
  `beneficios_directos` text CHARACTER SET latin1 NOT NULL,
  `beneficios_familiar` text CHARACTER SET latin1 NOT NULL,
  `beneficios_hijos` text CHARACTER SET latin1 NOT NULL,
  `beneficios_zona_trabajo` text CHARACTER SET latin1 NOT NULL,
  `beneficios_sindicato` text CHARACTER SET latin1 NOT NULL,
  `deducciones` text CHARACTER SET latin1 NOT NULL,
  `nombre_convencion` varchar(100) CHARACTER SET latin1 NOT NULL,
  `inspectoria` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `cod_interno_3` (`cod_interno`),
  KEY `cod_interno` (`cod_interno`),
  KEY `cod_interno_2` (`cod_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `cruge_authassignment`
-- -------------------------------------------
DROP TABLE IF EXISTS `cruge_authassignment`;
CREATE TABLE IF NOT EXISTS `cruge_authassignment` (
  `userid` int(11) NOT NULL,
  `bizrule` text,
  `data` text,
  `itemname` varchar(64) NOT NULL,
  PRIMARY KEY (`userid`,`itemname`),
  KEY `fk_cruge_authassignment_cruge_authitem1` (`itemname`),
  KEY `fk_cruge_authassignment_user` (`userid`),
  CONSTRAINT `fk_cruge_authassignment_cruge_authitem1` FOREIGN KEY (`itemname`) REFERENCES `cruge_authitem` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cruge_authassignment_user` FOREIGN KEY (`userid`) REFERENCES `cruge_user` (`iduser`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `cruge_authitem`
-- -------------------------------------------
DROP TABLE IF EXISTS `cruge_authitem`;
CREATE TABLE IF NOT EXISTS `cruge_authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `cruge_authitemchild`
-- -------------------------------------------
DROP TABLE IF EXISTS `cruge_authitemchild`;
CREATE TABLE IF NOT EXISTS `cruge_authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `crugeauthitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `cruge_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `crugeauthitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `cruge_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `cruge_field`
-- -------------------------------------------
DROP TABLE IF EXISTS `cruge_field`;
CREATE TABLE IF NOT EXISTS `cruge_field` (
  `idfield` int(11) NOT NULL AUTO_INCREMENT,
  `fieldname` varchar(20) NOT NULL,
  `longname` varchar(50) DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  `required` int(11) DEFAULT '0',
  `fieldtype` int(11) DEFAULT '0',
  `fieldsize` int(11) DEFAULT '20',
  `maxlength` int(11) DEFAULT '45',
  `showinreports` int(11) DEFAULT '0',
  `useregexp` varchar(512) DEFAULT NULL,
  `useregexpmsg` varchar(512) DEFAULT NULL,
  `predetvalue` mediumblob,
  PRIMARY KEY (`idfield`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `cruge_fieldvalue`
-- -------------------------------------------
DROP TABLE IF EXISTS `cruge_fieldvalue`;
CREATE TABLE IF NOT EXISTS `cruge_fieldvalue` (
  `idfieldvalue` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `idfield` int(11) NOT NULL,
  `value` blob,
  PRIMARY KEY (`idfieldvalue`),
  KEY `fk_cruge_fieldvalue_cruge_user1` (`iduser`),
  KEY `fk_cruge_fieldvalue_cruge_field1` (`idfield`),
  CONSTRAINT `fk_cruge_fieldvalue_cruge_field1` FOREIGN KEY (`idfield`) REFERENCES `cruge_field` (`idfield`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_cruge_fieldvalue_cruge_user1` FOREIGN KEY (`iduser`) REFERENCES `cruge_user` (`iduser`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `cruge_session`
-- -------------------------------------------
DROP TABLE IF EXISTS `cruge_session`;
CREATE TABLE IF NOT EXISTS `cruge_session` (
  `idsession` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `created` bigint(30) DEFAULT NULL,
  `expire` bigint(30) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `ipaddress` varchar(45) DEFAULT NULL,
  `usagecount` int(11) DEFAULT '0',
  `lastusage` bigint(30) DEFAULT NULL,
  `logoutdate` bigint(30) DEFAULT NULL,
  `ipaddressout` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsession`),
  KEY `crugesession_iduser` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `cruge_system`
-- -------------------------------------------
DROP TABLE IF EXISTS `cruge_system`;
CREATE TABLE IF NOT EXISTS `cruge_system` (
  `idsystem` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `largename` varchar(45) DEFAULT NULL,
  `sessionmaxdurationmins` int(11) DEFAULT '30',
  `sessionmaxsameipconnections` int(11) DEFAULT '10',
  `sessionreusesessions` int(11) DEFAULT '1' COMMENT '1yes 0no',
  `sessionmaxsessionsperday` int(11) DEFAULT '-1',
  `sessionmaxsessionsperuser` int(11) DEFAULT '-1',
  `systemnonewsessions` int(11) DEFAULT '0' COMMENT '1yes 0no',
  `systemdown` int(11) DEFAULT '0',
  `registerusingcaptcha` int(11) DEFAULT '0',
  `registerusingterms` int(11) DEFAULT '0',
  `terms` blob,
  `registerusingactivation` int(11) DEFAULT '1',
  `defaultroleforregistration` varchar(64) DEFAULT NULL,
  `registerusingtermslabel` varchar(100) DEFAULT NULL,
  `registrationonlogin` int(11) DEFAULT '1',
  PRIMARY KEY (`idsystem`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `cruge_user`
-- -------------------------------------------
DROP TABLE IF EXISTS `cruge_user`;
CREATE TABLE IF NOT EXISTS `cruge_user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `regdate` bigint(30) DEFAULT NULL,
  `actdate` bigint(30) DEFAULT NULL,
  `logondate` bigint(30) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL COMMENT 'Hashed password',
  `authkey` varchar(100) DEFAULT NULL COMMENT 'llave de autentificacion',
  `state` int(11) DEFAULT '0',
  `totalsessioncounter` int(11) DEFAULT '0',
  `currentsessioncounter` int(11) DEFAULT '0',
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `division`
-- -------------------------------------------
DROP TABLE IF EXISTS `division`;
CREATE TABLE IF NOT EXISTS `division` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cod_seccion` varchar(5) CHARACTER SET latin1 NOT NULL,
  `cod_division` tinyint(4) NOT NULL,
  `division` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `empresa`
-- -------------------------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(255) CHARACTER SET latin1 NOT NULL,
  `rif` varchar(20) CHARACTER SET latin1 NOT NULL,
  `identificacion_laboral` varchar(10) CHARACTER SET latin1 NOT NULL,
  `seguro_social` varchar(10) CHARACTER SET latin1 NOT NULL,
  `actividad_economica` bigint(20) unsigned NOT NULL,
  `sector` int(11) unsigned NOT NULL,
  `capital_empresa` decimal(20,2) NOT NULL,
  `nro_sucursales` smallint(6) NOT NULL,
  `direccion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `estado` int(11) NOT NULL,
  `municipio` int(11) NOT NULL,
  `parroquia` int(11) NOT NULL,
  `telefono` varchar(100) CHARACTER SET latin1 NOT NULL,
  `fax` varchar(20) CHARACTER SET latin1 NOT NULL,
  `correo` varchar(100) CHARACTER SET latin1 NOT NULL,
  `web` varchar(50) CHARACTER SET latin1 NOT NULL,
  `rnc` varchar(100) CHARACTER SET latin1 NOT NULL,
  `cod_convencion` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `cod_interno` (`cod_convencion`),
  KEY `estado` (`estado`),
  KEY `municipio` (`municipio`),
  KEY `parroquia` (`parroquia`),
  KEY `sector` (`sector`),
  KEY `sector_2` (`sector`),
  KEY `actividad_economica` (`actividad_economica`),
  CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`actividad_economica`) REFERENCES `rama` (`id`),
  CONSTRAINT `empresa_ibfk_2` FOREIGN KEY (`sector`) REFERENCES `sector` (`id`),
  CONSTRAINT `empresa_ibfk_3` FOREIGN KEY (`estado`) REFERENCES `estados` (`id_estado`),
  CONSTRAINT `empresa_ibfk_4` FOREIGN KEY (`municipio`) REFERENCES `municipios` (`id_municipio`),
  CONSTRAINT `empresa_ibfk_5` FOREIGN KEY (`parroquia`) REFERENCES `parroquias` (`id_parroquia`),
  CONSTRAINT `empresa_ibfk_6` FOREIGN KEY (`cod_convencion`) REFERENCES `convencion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `estados`
-- -------------------------------------------
DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(250) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `grupo`
-- -------------------------------------------
DROP TABLE IF EXISTS `grupo`;
CREATE TABLE IF NOT EXISTS `grupo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cod_seccion` varchar(5) CHARACTER SET latin1 NOT NULL,
  `cod_division` tinyint(4) NOT NULL,
  `codigo_grupo` tinyint(4) NOT NULL,
  `grupo` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `inspectoria`
-- -------------------------------------------
DROP TABLE IF EXISTS `inspectoria`;
CREATE TABLE IF NOT EXISTS `inspectoria` (
  `id` varchar(5) CHARACTER SET latin1 NOT NULL,
  `inspectoria` varchar(100) CHARACTER SET latin1 NOT NULL,
  `id_estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_estado` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `municipios`
-- -------------------------------------------
DROP TABLE IF EXISTS `municipios`;
CREATE TABLE IF NOT EXISTS `municipios` (
  `id_municipio` int(11) NOT NULL AUTO_INCREMENT,
  `id_estado` int(11) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  PRIMARY KEY (`id_municipio`),
  KEY `id_estado` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `nivel_educativo`
-- -------------------------------------------
DROP TABLE IF EXISTS `nivel_educativo`;
CREATE TABLE IF NOT EXISTS `nivel_educativo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cod_interno` varchar(2) CHARACTER SET latin1 NOT NULL,
  `descripcion_nivel` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`cod_interno`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `nomina`
-- -------------------------------------------
DROP TABLE IF EXISTS `nomina`;
CREATE TABLE IF NOT EXISTS `nomina` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint(20) unsigned NOT NULL,
  `nombres` varchar(200) CHARACTER SET latin1 NOT NULL COMMENT 'nombres y apellidos',
  `cedula` varchar(10) CHARACTER SET latin1 NOT NULL,
  `nacionalidad` char(1) CHARACTER SET latin1 NOT NULL COMMENT 'V=venezolano, E=Extranjero',
  `pais_origen` varchar(100) CHARACTER SET latin1 NOT NULL,
  `lugar_nacimiento` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT 'ciudad',
  `sexo` char(1) CHARACTER SET latin1 NOT NULL COMMENT 'F(femenino) M(masculino)',
  `edad` int(11) NOT NULL COMMENT 'años',
  `estado_civil` char(1) CHARACTER SET latin1 NOT NULL COMMENT 'S(soltero)C(casado),D(divorciado)V(viudo)',
  `nivel_educativo` varchar(2) CHARACTER SET latin1 NOT NULL COMMENT '01(no sabe) 02(ninguno)03(inicial-preescolar)04(primaria-1-6)05(secundaria-1-5)06(tecnico superior) 07 (universitario)',
  `grado_anio_aprobado` int(11) NOT NULL COMMENT 'años',
  `oficio_dentro_establecimiento` varchar(255) CHARACTER SET latin1 NOT NULL,
  `codigo_ocupacion` int(11) NOT NULL,
  `tiempo_serv_establecimiento_anios` int(11) NOT NULL,
  `tiempo_serv_establecimiento_meses` int(11) NOT NULL,
  `tiempo_ejerciendo_profesion_anios` int(11) NOT NULL,
  `tiempo_ejerciendo_profesion_meses` int(11) NOT NULL,
  `remuneracion_antes_contra_empleado` decimal(10,2) NOT NULL,
  `remuneracion_antes_contra_obrero` decimal(10,2) NOT NULL,
  `remuneracion_despues_contra_empleado` decimal(10,2) NOT NULL,
  `remuneracion_despues_contra_obrero` decimal(10,2) NOT NULL,
  `carga_familiar` int(11) NOT NULL,
  `cod_convencion` bigint(20) unsigned NOT NULL,
  `id_sindicato` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`,`cod_convencion`),
  KEY `cod_convencion` (`cod_convencion`),
  KEY `nivel_educativo` (`nivel_educativo`),
  KEY `cod_empresa` (`id_empresa`),
  KEY `id_sindicato` (`id_sindicato`),
  CONSTRAINT `nomina_ibfk_6` FOREIGN KEY (`id_sindicato`) REFERENCES `sindicato` (`id`),
  CONSTRAINT `nomina_ibfk_2` FOREIGN KEY (`nivel_educativo`) REFERENCES `nivel_educativo` (`cod_interno`),
  CONSTRAINT `nomina_ibfk_4` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `nomina_ibfk_5` FOREIGN KEY (`cod_convencion`) REFERENCES `convencion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=880 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `nomina_tipo_sindicato`
-- -------------------------------------------
DROP TABLE IF EXISTS `nomina_tipo_sindicato`;
CREATE TABLE IF NOT EXISTS `nomina_tipo_sindicato` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_sindicato` bigint(20) unsigned NOT NULL,
  `id_nomina` bigint(20) unsigned NOT NULL,
  `cod_convencion_nomina` bigint(20) unsigned NOT NULL COMMENT 'es el id_empresa',
  UNIQUE KEY `id` (`id`),
  KEY `tipo_sindicato` (`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`),
  KEY `id_nomina` (`id_nomina`),
  KEY `cod_convencion_nomina` (`cod_convencion_nomina`),
  CONSTRAINT `nomina_tipo_sindicato_ibfk_4` FOREIGN KEY (`tipo_sindicato`) REFERENCES `tipo_sindicato` (`id`),
  CONSTRAINT `nomina_tipo_sindicato_ibfk_5` FOREIGN KEY (`id_nomina`) REFERENCES `nomina` (`id`),
  CONSTRAINT `nomina_tipo_sindicato_ibfk_7` FOREIGN KEY (`cod_convencion_nomina`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `parroquias`
-- -------------------------------------------
DROP TABLE IF EXISTS `parroquias`;
CREATE TABLE IF NOT EXISTS `parroquias` (
  `id_parroquia` int(11) NOT NULL AUTO_INCREMENT,
  `id_municipio` int(11) NOT NULL,
  `parroquia` varchar(250) NOT NULL,
  PRIMARY KEY (`id_parroquia`),
  KEY `id_municipio` (`id_municipio`)
) ENGINE=InnoDB AUTO_INCREMENT=1139 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `rama`
-- -------------------------------------------
DROP TABLE IF EXISTS `rama`;
CREATE TABLE IF NOT EXISTS `rama` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_seccion` varchar(5) CHARACTER SET latin1 NOT NULL,
  `codigo_division` tinyint(4) NOT NULL,
  `codigo_grupo` tinyint(4) NOT NULL,
  `codigo_clase` tinyint(4) NOT NULL,
  `codigo_rama` tinyint(4) NOT NULL,
  `rama` varchar(255) CHARACTER SET latin1 NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=801 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `representante_empresa`
-- -------------------------------------------
DROP TABLE IF EXISTS `representante_empresa`;
CREATE TABLE IF NOT EXISTS `representante_empresa` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombres_representante` varchar(100) CHARACTER SET latin1 NOT NULL,
  `telefono` varchar(20) CHARACTER SET latin1 NOT NULL,
  `correo` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cedula` varchar(20) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `seccion`
-- -------------------------------------------
DROP TABLE IF EXISTS `seccion`;
CREATE TABLE IF NOT EXISTS `seccion` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(5) CHARACTER SET latin1 NOT NULL,
  `seccion` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `sector`
-- -------------------------------------------
DROP TABLE IF EXISTS `sector`;
CREATE TABLE IF NOT EXISTS `sector` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `sindicato`
-- -------------------------------------------
DROP TABLE IF EXISTS `sindicato`;
CREATE TABLE IF NOT EXISTS `sindicato` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 NOT NULL,
  `siglas` varchar(20) CHARACTER SET latin1 NOT NULL,
  `nro_boleta_inscripcion` varchar(15) CHARACTER SET latin1 NOT NULL,
  `folio_registro` smallint(6) NOT NULL,
  `tomo_registroo` varchar(255) CHARACTER SET latin1 NOT NULL,
  `rif` varchar(20) CHARACTER SET latin1 NOT NULL,
  `direccion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `estado` int(11) NOT NULL,
  `municipio` int(11) NOT NULL,
  `parroquia` int(11) NOT NULL,
  `telefono` varchar(100) CHARACTER SET latin1 NOT NULL,
  `federacion_nacional` varchar(255) CHARACTER SET latin1 NOT NULL,
  `federacion_regional` varchar(255) CHARACTER SET latin1 NOT NULL,
  `sector` int(11) unsigned NOT NULL,
  `ambito` int(11) NOT NULL,
  `tipo_organizacion` tinyint(11) unsigned NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_actualizacion` date NOT NULL,
  `duracion_junta_directiva` int(11) NOT NULL,
  `fecha_inicio_vigencia` date NOT NULL,
  `fecha_cese_vigencia` date NOT NULL,
  `fecha_informe_finanzas` date NOT NULL,
  `fecha_nomina_afiliado` date NOT NULL,
  `fecha_ultimas_elecciones` date NOT NULL,
  `cod_convencion` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estado` (`estado`),
  KEY `municipio` (`municipio`),
  KEY `parroquia` (`parroquia`),
  KEY `sector` (`sector`),
  KEY `ambito` (`ambito`),
  KEY `tipo_organizacion` (`tipo_organizacion`),
  KEY `cod_convencion` (`cod_convencion`),
  CONSTRAINT `sindicato_ibfk_1` FOREIGN KEY (`estado`) REFERENCES `estados` (`id_estado`),
  CONSTRAINT `sindicato_ibfk_2` FOREIGN KEY (`municipio`) REFERENCES `municipios` (`id_municipio`),
  CONSTRAINT `sindicato_ibfk_3` FOREIGN KEY (`parroquia`) REFERENCES `parroquias` (`id_parroquia`),
  CONSTRAINT `sindicato_ibfk_4` FOREIGN KEY (`sector`) REFERENCES `sector` (`id`),
  CONSTRAINT `sindicato_ibfk_5` FOREIGN KEY (`ambito`) REFERENCES `ambito` (`id`),
  CONSTRAINT `sindicato_ibfk_6` FOREIGN KEY (`tipo_organizacion`) REFERENCES `tipo_organizacion` (`id`),
  CONSTRAINT `sindicato_ibfk_7` FOREIGN KEY (`cod_convencion`) REFERENCES `convencion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `tipo_organizacion`
-- -------------------------------------------
DROP TABLE IF EXISTS `tipo_organizacion`;
CREATE TABLE IF NOT EXISTS `tipo_organizacion` (
  `id` tinyint(11) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) CHARACTER SET latin1 NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `tipo_sindicato`
-- -------------------------------------------
DROP TABLE IF EXISTS `tipo_sindicato`;
CREATE TABLE IF NOT EXISTS `tipo_sindicato` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='tabla de tipos de cargo en los sindicatos';

-- -------------------------------------------
-- TABLE `trabajador_sindicato`
-- -------------------------------------------
DROP TABLE IF EXISTS `trabajador_sindicato`;
CREATE TABLE IF NOT EXISTS `trabajador_sindicato` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nomina_sindicato` bigint(20) unsigned NOT NULL,
  `trabajador` bigint(20) unsigned NOT NULL,
  `trabajadores_amparados_conve_col` tinyint(1) NOT NULL,
  `trabajadores_afiliados_sindicato` tinyint(1) NOT NULL,
  `secretario_general` tinyint(1) NOT NULL,
  `secretario_ejecutivo` tinyint(1) NOT NULL,
  `secretario_tesorero` tinyint(1) NOT NULL,
  `secretario_finanzas` tinyint(1) NOT NULL,
  `secretario_trabajo_reclamos` tinyint(1) NOT NULL,
  `secretario_cultura_deporte` tinyint(1) NOT NULL,
  `secretario_organizacion` tinyint(1) NOT NULL,
  `secretario_actas_correspondencias` tinyint(1) NOT NULL,
  `secretario_salud_laboral` tinyint(1) NOT NULL,
  `secretario_vigilancia_disciplina` tinyint(1) NOT NULL,
  `secretario_otro` tinyint(1) NOT NULL,
  `delegado_sindical` tinyint(1) NOT NULL,
  PRIMARY KEY (`nomina_sindicato`,`trabajador`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nomina_sindicato_2` (`nomina_sindicato`,`trabajador`),
  KEY `nomina_sindicato` (`nomina_sindicato`),
  KEY `trabajador` (`trabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=605 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `usuario`
-- -------------------------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) CHARACTER SET latin1 NOT NULL,
  `cedula` int(11) NOT NULL,
  `correo` varchar(255) CHARACTER SET latin1 NOT NULL,
  `nivel` tinyint(4) NOT NULL,
  `estatus` tinyint(1) NOT NULL,
  `telefono` varchar(100) CHARACTER SET latin1 NOT NULL,
  `login` varchar(255) CHARACTER SET latin1 NOT NULL,
  `clave` varchar(255) CHARACTER SET latin1 NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE DATA activerecordlog
-- -------------------------------------------
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('1','User admin created Convencion[30].','CREATE','Convencion','30','','2015-11-10 08:54:54','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('2','User historico created Convencion[31].','CREATE','Convencion','31','','2015-11-10 09:04:22','4');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('8','User historico created nomina ultimo id 552','CREATE','Nomina','552','','2015-11-10 09:54:50','4');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('9','User historico create trabajador ultimo id552','CREATE','trabajador_nomina','552','','2015-11-10 09:54:50','4');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('10','User admin created nomina ultimo id 604','CREATE','Nomina','604','','2015-11-10 11:03:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('11','User admin create trabajador ultimo id604','CREATE','trabajador_nomina','604','','2015-11-10 11:03:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('12','User admin update trabajador columnatrabajadores_amparados_conve_col','UPDATE','trabajador_nomina','598','','2015-11-10 11:03:58','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('13','User admin update trabajador columnatrabajadores_afiliados_sindicato','UPDATE','trabajador_nomina','598','','2015-11-10 11:03:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('14','User admin update trabajador columnasecretario_general','UPDATE','trabajador_nomina','562','','2015-11-10 11:03:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('15','User admin update trabajador columnasecretario_ejecutivo','UPDATE','trabajador_nomina','592','','2015-11-10 11:03:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('16','User admin update trabajador columnasecretario_tesorero','UPDATE','trabajador_nomina','559','','2015-11-10 11:03:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('17','User admin update trabajador columnasecretario_finanzas','UPDATE','trabajador_nomina','582','','2015-11-10 11:03:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('18','User admin update trabajador columnasecretario_trabajo_reclamos','UPDATE','trabajador_nomina','588','','2015-11-10 11:03:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('19','User admin update trabajador columnasecretario_cultura_deporte','UPDATE','trabajador_nomina','580','','2015-11-10 11:03:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('20','User admin update trabajador columnasecretario_organizacion','UPDATE','trabajador_nomina','560','','2015-11-10 11:03:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('21','User admin update trabajador columnasecretario_actas_correspondencias','UPDATE','trabajador_nomina','594','','2015-11-10 11:03:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('22','User admin update trabajador columnasecretario_salud_laboral','UPDATE','trabajador_nomina','566','','2015-11-10 11:03:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('23','User admin update trabajador columnasecretario_vigilancia_disciplina','UPDATE','trabajador_nomina','597','','2015-11-10 11:03:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('24','User admin update trabajador columnasecretario_otro','UPDATE','trabajador_nomina','572','','2015-11-10 11:03:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('25','User admin update trabajador columnadelegado_sindical','UPDATE','trabajador_nomina','587','','2015-11-10 11:04:00','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('26','User admin changed telefono for Empresa[3].','CHANGE','Empresa','3','telefono','2015-11-11 14:46:49','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('27','User admin changed fecha_deposito for Convencion[8].','CHANGE','Convencion','8','fecha_deposito','2015-11-11 16:10:50','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('28','User admin changed fecha_inicio for Convencion[8].','CHANGE','Convencion','8','fecha_inicio','2015-11-11 16:10:50','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('29','User admin changed fecha_venc for Convencion[8].','CHANGE','Convencion','8','fecha_venc','2015-11-11 16:10:50','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('30','User admin changed fecha_auto_homo for Convencion[8].','CHANGE','Convencion','8','fecha_auto_homo','2015-11-11 16:10:51','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('31','User admin changed municipio for Empresa[3].','CHANGE','Empresa','3','municipio','2015-11-12 11:17:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('32','User admin changed parroquia for Empresa[3].','CHANGE','Empresa','3','parroquia','2015-11-12 11:17:51','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('33','User admin changed telefono for Empresa[3].','CHANGE','Empresa','3','telefono','2015-11-12 11:17:51','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('34','User admin changed telefono for Empresa[3].','CHANGE','Empresa','3','telefono','2015-11-12 11:17:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('35','User admin changed estado for Empresa[3].','CHANGE','Empresa','3','estado','2015-11-12 11:42:55','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('36','User admin changed municipio for Empresa[3].','CHANGE','Empresa','3','municipio','2015-11-12 11:42:55','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('37','User admin changed parroquia for Empresa[3].','CHANGE','Empresa','3','parroquia','2015-11-12 11:42:55','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('38','User admin changed telefono for Empresa[3].','CHANGE','Empresa','3','telefono','2015-11-12 11:42:55','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('39','User admin changed duracion_meses for Convencion[8].','CHANGE','Convencion','8','duracion_meses','2015-11-16 10:16:33','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('40','User admin changed telefono for Empresa[3].','CHANGE','Empresa','3','telefono','2015-11-17 09:14:54','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('41','User admin deleted Empresa[10].','DELETE','Empresa','10','','2015-11-17 15:39:37','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('42','User admin deleted Convencion[17].','DELETE','Convencion','17','','2015-11-17 15:40:33','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('43','User admin created nomina ultimo id 704','CREATE','Nomina','704','','2015-11-18 09:25:10','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('44','User admin created nomina ultimo id 754','CREATE','Nomina','754','','2015-11-18 12:21:25','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('45','User admin created nomina ultimo id 804','CREATE','Nomina','804','','2015-11-18 15:40:48','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('46','User admin created nomina ultimo id 854','CREATE','Nomina','854','','2015-11-19 10:17:37','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('47','User admin update trabajador columna trabajadores_amparados_conve_col','UPDATE','trabajador_nomina','8','','2015-11-19 11:41:16','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('48','User admin update trabajador columna trabajadores_afiliados_sindicato','UPDATE','trabajador_nomina','8','','2015-11-19 11:41:16','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('49','User admin created nomina ultimo id 904','CREATE','Nomina','904','','2015-11-19 13:40:15','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('50','User admin created nomina ultimo id 954','CREATE','Nomina','954','','2015-11-20 08:55:43','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('51','User admin created nomina ultimo id 1004','CREATE','Nomina','1004','','2015-11-23 09:21:10','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('52','User admin created nomina ultimo id 1054','CREATE','Nomina','1054','','2015-11-23 11:18:21','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('53','User admin created nomina ultimo id 1104','CREATE','Nomina','1104','','2015-11-23 11:18:46','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('54','User admin created nomina ultimo id 50','CREATE','Nomina','50','','2015-11-23 11:24:44','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('55','User admin created nomina ultimo id 100','CREATE','Nomina','100','','2015-11-23 11:30:32','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('56','User admin created nomina ultimo id 50','CREATE','Nomina','50','','2015-11-23 11:37:17','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('57','User admin created nomina ultimo id 101','CREATE','Nomina','101','','2015-11-23 14:01:07','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('58','User admin changed razon_social for Empresa[3].','CHANGE','Empresa','3','razon_social','2015-11-23 14:26:29','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('59','User admin created nomina ultimo id 151','CREATE','Nomina','151','','2015-11-23 15:43:51','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('60','User admin created nomina ultimo id 202','CREATE','Nomina','202','','2015-11-24 10:16:46','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('61','User admin insert nomina_tipo_sindicato where id_nomina is  153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201','insert','nomina_tipo_sindicato','153','','2015-11-24 10:17:14','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('62','User admin insert nomina_tipo_sindicato where id_nomina is  153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201','insert','nomina_tipo_sindicato','153','','2015-11-24 10:17:14','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('63','User admin update nomina_tipo_sindicato where id_nomina is  153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201','update','nomina_tipo_sindicato','153','','2015-11-24 10:17:39','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('64','User admin insert nomina_tipo_sindicato where id_nomina is  153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201','insert','nomina_tipo_sindicato','153','','2015-11-24 10:17:39','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('65','User admin update nomina_tipo_sindicato where id_nomina is  153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202, y convencion 8 set tipo en 1','update','nomina_tipo_sindicato','153','','2015-11-24 10:21:29','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('66','User admin insert nomina_tipo_sindicato where id_nomina is  153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202, y convencion is 8','insert','nomina_tipo_sindicato','153','','2015-11-24 10:21:29','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('67','User admin update nomina_tipo_sindicato where id_nomina is  153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202, y convencion 8 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 10:24:24','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('68','User admin insert nomina_tipo_sindicato where id_nomina is  153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202, y convencion is 8','insert','nomina_tipo_sindicato','2','','2015-11-24 10:24:24','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('69','User admin update nomina_tipo_sindicato where id_nomina is  153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202, y convencion 8 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 10:24:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('70','User admin insert nomina_tipo_sindicato where id_nomina is  153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202, y convencion is 8','insert','nomina_tipo_sindicato','2','','2015-11-24 10:24:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('71','User admin update nomina_tipo_sindicato where id_nomina is  153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202, y convencion 8 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 10:26:03','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('72','User admin insert nomina_tipo_sindicato where id_nomina is  153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202, y convencion is 8','insert','nomina_tipo_sindicato','2','','2015-11-24 10:26:03','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('73','User admin insert nomina_tipo_sindicato where id_nomina is  153 y convencion is 8','insert','nomina_tipo_sindicato','153','','2015-11-24 10:26:03','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('74','User admin insert nomina_tipo_sindicato where id_nomina is  154 y convencion is 8','insert','nomina_tipo_sindicato','154','','2015-11-24 10:26:03','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('75','User admin insert nomina_tipo_sindicato where id_nomina is  155 y convencion is 8','insert','nomina_tipo_sindicato','155','','2015-11-24 10:26:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('76','User admin insert nomina_tipo_sindicato where id_nomina is  156 y convencion is 8','insert','nomina_tipo_sindicato','156','','2015-11-24 10:26:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('77','User admin insert nomina_tipo_sindicato where id_nomina is  157 y convencion is 8','insert','nomina_tipo_sindicato','157','','2015-11-24 10:26:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('78','User admin insert nomina_tipo_sindicato where id_nomina is  158 y convencion is 8','insert','nomina_tipo_sindicato','158','','2015-11-24 10:26:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('79','User admin insert nomina_tipo_sindicato where id_nomina is  159 y convencion is 8','insert','nomina_tipo_sindicato','159','','2015-11-24 10:26:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('80','User admin insert nomina_tipo_sindicato where id_nomina is  160 y convencion is 8','insert','nomina_tipo_sindicato','160','','2015-11-24 10:26:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('81','User admin insert nomina_tipo_sindicato where id_nomina is  161 y convencion is 8','insert','nomina_tipo_sindicato','161','','2015-11-24 10:26:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('82','User admin insert nomina_tipo_sindicato where id_nomina is  162 y convencion is 8','insert','nomina_tipo_sindicato','162','','2015-11-24 10:26:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('83','User admin insert nomina_tipo_sindicato where id_nomina is  163 y convencion is 8','insert','nomina_tipo_sindicato','163','','2015-11-24 10:26:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('84','User admin insert nomina_tipo_sindicato where id_nomina is  164 y convencion is 8','insert','nomina_tipo_sindicato','164','','2015-11-24 10:26:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('85','User admin delete nomina_tipo_sindicato where id_nomina is  153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202, y convencion is 8','delete','nomina_tipo_sindicato','153','','2015-11-24 10:27:38','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('86','User admin insert nomina_tipo_sindicato where id_nomina is  153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202, y convencion is 8','insert','nomina_tipo_sindicato','1','','2015-11-24 10:29:14','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('87','User admin insert nomina_tipo_sindicato where id_nomina is  153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202, y convencion is 8','insert','nomina_tipo_sindicato','2','','2015-11-24 10:29:15','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('88','User admin delete nomina y nomina tipo_sindicato where convencion is 10','delete','Nomina','10','','2015-11-24 10:49:32','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('89','User admin delete nomina y nomina tipo_sindicato where convencion is 8','delete','Nomina-nomina_tipo_sindicato','8','','2015-11-24 10:50:55','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('90','User admin created nomina ultimo id 252','CREATE','Nomina','252','','2015-11-24 10:51:43','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('91','User admin insert nomina_tipo_sindicato where id_nomina is  203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252, y convencion is 8','insert','nomina_tipo_sindicato','1','','2015-11-24 10:53:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('92','User admin insert nomina_tipo_sindicato where id_nomina is  203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252, y convencion is 8','insert','nomina_tipo_sindicato','2','','2015-11-24 10:53:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('93','User admin insert nomina_tipo_sindicato where id_nomina is  203 y convencion is 8','insert','nomina_tipo_sindicato','203','','2015-11-24 10:53:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('94','User admin insert nomina_tipo_sindicato where id_nomina is  204 y convencion is 8','insert','nomina_tipo_sindicato','204','','2015-11-24 10:53:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('95','User admin insert nomina_tipo_sindicato where id_nomina is  205 y convencion is 8','insert','nomina_tipo_sindicato','205','','2015-11-24 10:53:48','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('96','User admin insert nomina_tipo_sindicato where id_nomina is  206 y convencion is 8','insert','nomina_tipo_sindicato','206','','2015-11-24 10:53:48','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('97','User admin insert nomina_tipo_sindicato where id_nomina is  207 y convencion is 8','insert','nomina_tipo_sindicato','207','','2015-11-24 10:53:48','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('98','User admin insert nomina_tipo_sindicato where id_nomina is  209 y convencion is 8','insert','nomina_tipo_sindicato','209','','2015-11-24 10:53:48','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('99','User admin insert nomina_tipo_sindicato where id_nomina is  210 y convencion is 8','insert','nomina_tipo_sindicato','210','','2015-11-24 10:53:48','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('100','User admin insert nomina_tipo_sindicato where id_nomina is  211 y convencion is 8','insert','nomina_tipo_sindicato','211','','2015-11-24 10:53:48','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('101','User admin insert nomina_tipo_sindicato where id_nomina is  212 y convencion is 8','insert','nomina_tipo_sindicato','212','','2015-11-24 10:53:48','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('102','User admin insert nomina_tipo_sindicato where id_nomina is  213 y convencion is 8','insert','nomina_tipo_sindicato','213','','2015-11-24 10:53:48','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('103','User admin insert nomina_tipo_sindicato where id_nomina is  214 y convencion is 8','insert','nomina_tipo_sindicato','214','','2015-11-24 10:53:48','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('104','User admin insert nomina_tipo_sindicato where id_nomina is  215 y convencion is 8','insert','nomina_tipo_sindicato','215','','2015-11-24 10:53:48','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('105','User admin delete nomina y nomina tipo_sindicato where convencion is 8','delete','Nomina-nomina_tipo_sindicato','8','','2015-11-24 10:57:34','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('106','User admin created nomina ultimo id 303','CREATE','Nomina','303','','2015-11-24 11:51:18','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('107','User admin insert nomina_tipo_sindicato where id_nomina is  254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303, y convencion is 8','insert','nomina_tipo_sindicato','1','','2015-11-24 11:52:00','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('108','User admin insert nomina_tipo_sindicato where id_nomina is  254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303, y convencion is 8','insert','nomina_tipo_sindicato','2','','2015-11-24 11:52:00','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('109','User admin created nomina ultimo id 353','CREATE','Nomina','353','','2015-11-24 12:01:14','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('110','User admin insert nomina_tipo_sindicato where id_nomina is  304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353, y convencion is 7','insert','nomina_tipo_sindicato','1','','2015-11-24 12:06:51','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('111','User admin insert nomina_tipo_sindicato where id_nomina is  304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353, y convencion is 7','insert','nomina_tipo_sindicato','2','','2015-11-24 12:06:51','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('112','User admin insert nomina_tipo_sindicato where id_nomina is  304 y convencion is 7','insert','nomina_tipo_sindicato','304','','2015-11-24 12:06:51','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('113','User admin insert nomina_tipo_sindicato where id_nomina is  306 y convencion is 7','insert','nomina_tipo_sindicato','306','','2015-11-24 12:06:51','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('114','User admin insert nomina_tipo_sindicato where id_nomina is  307 y convencion is 7','insert','nomina_tipo_sindicato','307','','2015-11-24 12:06:52','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('115','User admin insert nomina_tipo_sindicato where id_nomina is  308 y convencion is 7','insert','nomina_tipo_sindicato','308','','2015-11-24 12:06:52','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('116','User admin update nomina_tipo_sindicato where id_nomina is  306 y convencion 7 set tipo en 1','update','nomina_tipo_sindicato','306','','2015-11-24 12:09:17','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('117','User admin update nomina_tipo_sindicato where id_nomina is  307 y convencion 7 set tipo en 2','update','nomina_tipo_sindicato','307','','2015-11-24 12:09:17','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('118','User admin update nomina_tipo_sindicato where id_nomina is  304,305,306,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353, y convencion 7 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 12:12:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('119','User admin insert nomina_tipo_sindicato where id_nomina is  304,305,306,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353, y convencion is 7','insert','nomina_tipo_sindicato','2','','2015-11-24 12:12:27','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('120','User admin update nomina_tipo_sindicato where id_nomina is  313,314,315, y convencion 7 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 12:13:20','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('121','User admin update nomina_tipo_sindicato where id_nomina is  313,314,315, y convencion 7 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 12:14:07','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('122','User admin update nomina_tipo_sindicato where id_nomina is  312,313,314, y convencion 7 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 12:14:37','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('123','User admin update nomina_tipo_sindicato where id_nomina is  313,314,315,316, y convencion 7 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 12:15:01','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('124','User admin update nomina_tipo_sindicato where id_nomina is  312,313,314,315, y convencion 7 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 12:15:56','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('125','User admin created nomina ultimo id 403','CREATE','Nomina','403','','2015-11-24 12:22:50','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('126','User admin insert nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','1','','2015-11-24 12:27:24','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('127','User admin update nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 13:46:05','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('128','User admin insert nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 13:46:05','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('129','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 13:46:05','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('130','User admin insert nomina_tipo_sindicato where id_nomina is  355 y convencion is 3','insert','nomina_tipo_sindicato','355','','2015-11-24 13:46:05','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('131','User admin insert nomina_tipo_sindicato where id_nomina is  356 y convencion is 3','insert','nomina_tipo_sindicato','356','','2015-11-24 13:46:05','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('132','User admin insert nomina_tipo_sindicato where id_nomina is  357 y convencion is 3','insert','nomina_tipo_sindicato','357','','2015-11-24 13:46:06','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('133','User admin insert nomina_tipo_sindicato where id_nomina is  358 y convencion is 3','insert','nomina_tipo_sindicato','358','','2015-11-24 13:46:06','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('134','User admin update nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 13:46:27','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('135','User admin insert nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 13:46:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('136','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 13:46:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('137','User admin insert nomina_tipo_sindicato where id_nomina is  355 y convencion is 3','insert','nomina_tipo_sindicato','355','','2015-11-24 13:46:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('138','User admin insert nomina_tipo_sindicato where id_nomina is  356 y convencion is 3','insert','nomina_tipo_sindicato','356','','2015-11-24 13:46:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('139','User admin insert nomina_tipo_sindicato where id_nomina is  357 y convencion is 3','insert','nomina_tipo_sindicato','357','','2015-11-24 13:46:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('140','User admin insert nomina_tipo_sindicato where id_nomina is  358 y convencion is 3','insert','nomina_tipo_sindicato','358','','2015-11-24 13:46:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('141','User admin insert nomina_tipo_sindicato where id_nomina is  359 y convencion is 3','insert','nomina_tipo_sindicato','359','','2015-11-24 13:46:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('142','User admin insert nomina_tipo_sindicato where id_nomina is  360 y convencion is 3','insert','nomina_tipo_sindicato','360','','2015-11-24 13:46:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('143','User admin insert nomina_tipo_sindicato where id_nomina is  361 y convencion is 3','insert','nomina_tipo_sindicato','361','','2015-11-24 13:46:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('144','User admin insert nomina_tipo_sindicato where id_nomina is  362 y convencion is 3','insert','nomina_tipo_sindicato','362','','2015-11-24 13:46:29','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('145','User admin insert nomina_tipo_sindicato where id_nomina is  363 y convencion is 3','insert','nomina_tipo_sindicato','363','','2015-11-24 13:46:29','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('146','User admin insert nomina_tipo_sindicato where id_nomina is  364 y convencion is 3','insert','nomina_tipo_sindicato','364','','2015-11-24 13:46:29','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('147','User admin insert nomina_tipo_sindicato where id_nomina is  365 y convencion is 3','insert','nomina_tipo_sindicato','365','','2015-11-24 13:46:29','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('148','User admin update nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 13:49:24','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('149','User admin insert nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 13:49:25','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('150','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 13:49:25','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('151','User admin insert nomina_tipo_sindicato where id_nomina is  355 y convencion is 3','insert','nomina_tipo_sindicato','355','','2015-11-24 13:49:25','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('152','User admin insert nomina_tipo_sindicato where id_nomina is  356 y convencion is 3','insert','nomina_tipo_sindicato','356','','2015-11-24 13:49:25','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('153','User admin insert nomina_tipo_sindicato where id_nomina is  357 y convencion is 3','insert','nomina_tipo_sindicato','357','','2015-11-24 13:49:25','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('154','User admin insert nomina_tipo_sindicato where id_nomina is  358 y convencion is 3','insert','nomina_tipo_sindicato','358','','2015-11-24 13:49:25','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('155','User admin insert nomina_tipo_sindicato where id_nomina is  359 y convencion is 3','insert','nomina_tipo_sindicato','359','','2015-11-24 13:49:25','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('156','User admin insert nomina_tipo_sindicato where id_nomina is  360 y convencion is 3','insert','nomina_tipo_sindicato','360','','2015-11-24 13:49:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('157','User admin insert nomina_tipo_sindicato where id_nomina is  361 y convencion is 3','insert','nomina_tipo_sindicato','361','','2015-11-24 13:49:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('158','User admin insert nomina_tipo_sindicato where id_nomina is  362 y convencion is 3','insert','nomina_tipo_sindicato','362','','2015-11-24 13:49:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('159','User admin insert nomina_tipo_sindicato where id_nomina is  363 y convencion is 3','insert','nomina_tipo_sindicato','363','','2015-11-24 13:49:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('160','User admin insert nomina_tipo_sindicato where id_nomina is  364 y convencion is 3','insert','nomina_tipo_sindicato','364','','2015-11-24 13:49:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('161','User admin insert nomina_tipo_sindicato where id_nomina is  365 y convencion is 3','insert','nomina_tipo_sindicato','365','','2015-11-24 13:49:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('162','User admin update nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 13:50:37','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('163','User admin insert nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 13:50:37','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('164','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 13:50:37','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('165','User admin insert nomina_tipo_sindicato where id_nomina is  355 y convencion is 3','insert','nomina_tipo_sindicato','355','','2015-11-24 13:50:37','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('166','User admin insert nomina_tipo_sindicato where id_nomina is  356 y convencion is 3','insert','nomina_tipo_sindicato','356','','2015-11-24 13:50:37','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('167','User admin insert nomina_tipo_sindicato where id_nomina is  357 y convencion is 3','insert','nomina_tipo_sindicato','357','','2015-11-24 13:50:37','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('168','User admin insert nomina_tipo_sindicato where id_nomina is  358 y convencion is 3','insert','nomina_tipo_sindicato','358','','2015-11-24 13:50:38','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('169','User admin insert nomina_tipo_sindicato where id_nomina is  359 y convencion is 3','insert','nomina_tipo_sindicato','359','','2015-11-24 13:50:38','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('170','User admin insert nomina_tipo_sindicato where id_nomina is  360 y convencion is 3','insert','nomina_tipo_sindicato','360','','2015-11-24 13:50:38','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('171','User admin insert nomina_tipo_sindicato where id_nomina is  361 y convencion is 3','insert','nomina_tipo_sindicato','361','','2015-11-24 13:50:38','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('172','User admin insert nomina_tipo_sindicato where id_nomina is  362 y convencion is 3','insert','nomina_tipo_sindicato','362','','2015-11-24 13:50:38','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('173','User admin insert nomina_tipo_sindicato where id_nomina is  363 y convencion is 3','insert','nomina_tipo_sindicato','363','','2015-11-24 13:50:38','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('174','User admin insert nomina_tipo_sindicato where id_nomina is  364 y convencion is 3','insert','nomina_tipo_sindicato','364','','2015-11-24 13:50:38','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('175','User admin insert nomina_tipo_sindicato where id_nomina is  365 y convencion is 3','insert','nomina_tipo_sindicato','365','','2015-11-24 13:50:38','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('176','User admin update nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 13:52:25','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('177','User admin insert nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 13:52:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('178','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 13:52:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('179','User admin insert nomina_tipo_sindicato where id_nomina is  355 y convencion is 3','insert','nomina_tipo_sindicato','355','','2015-11-24 13:52:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('180','User admin insert nomina_tipo_sindicato where id_nomina is  356 y convencion is 3','insert','nomina_tipo_sindicato','356','','2015-11-24 13:52:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('181','User admin insert nomina_tipo_sindicato where id_nomina is  357 y convencion is 3','insert','nomina_tipo_sindicato','357','','2015-11-24 13:52:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('182','User admin insert nomina_tipo_sindicato where id_nomina is  358 y convencion is 3','insert','nomina_tipo_sindicato','358','','2015-11-24 13:52:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('183','User admin insert nomina_tipo_sindicato where id_nomina is  359 y convencion is 3','insert','nomina_tipo_sindicato','359','','2015-11-24 13:52:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('184','User admin insert nomina_tipo_sindicato where id_nomina is  360 y convencion is 3','insert','nomina_tipo_sindicato','360','','2015-11-24 13:52:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('185','User admin insert nomina_tipo_sindicato where id_nomina is  361 y convencion is 3','insert','nomina_tipo_sindicato','361','','2015-11-24 13:52:26','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('186','User admin insert nomina_tipo_sindicato where id_nomina is  362 y convencion is 3','insert','nomina_tipo_sindicato','362','','2015-11-24 13:52:27','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('187','User admin insert nomina_tipo_sindicato where id_nomina is  363 y convencion is 3','insert','nomina_tipo_sindicato','363','','2015-11-24 13:52:27','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('188','User admin insert nomina_tipo_sindicato where id_nomina is  364 y convencion is 3','insert','nomina_tipo_sindicato','364','','2015-11-24 13:52:27','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('189','User admin insert nomina_tipo_sindicato where id_nomina is  365 y convencion is 3','insert','nomina_tipo_sindicato','365','','2015-11-24 13:52:27','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('190','User admin update nomina_tipo_sindicato where id_nomina is  355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 13:57:46','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('191','User admin insert nomina_tipo_sindicato where id_nomina is  355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 13:57:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('192','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 13:57:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('193','User admin insert nomina_tipo_sindicato where id_nomina is  355 y convencion is 3','insert','nomina_tipo_sindicato','355','','2015-11-24 13:57:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('194','User admin insert nomina_tipo_sindicato where id_nomina is  356 y convencion is 3','insert','nomina_tipo_sindicato','356','','2015-11-24 13:57:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('195','User admin insert nomina_tipo_sindicato where id_nomina is  357 y convencion is 3','insert','nomina_tipo_sindicato','357','','2015-11-24 13:57:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('196','User admin insert nomina_tipo_sindicato where id_nomina is  358 y convencion is 3','insert','nomina_tipo_sindicato','358','','2015-11-24 13:57:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('197','User admin insert nomina_tipo_sindicato where id_nomina is  359 y convencion is 3','insert','nomina_tipo_sindicato','359','','2015-11-24 13:57:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('198','User admin insert nomina_tipo_sindicato where id_nomina is  360 y convencion is 3','insert','nomina_tipo_sindicato','360','','2015-11-24 13:57:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('199','User admin insert nomina_tipo_sindicato where id_nomina is  361 y convencion is 3','insert','nomina_tipo_sindicato','361','','2015-11-24 13:57:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('200','User admin insert nomina_tipo_sindicato where id_nomina is  362 y convencion is 3','insert','nomina_tipo_sindicato','362','','2015-11-24 13:57:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('201','User admin insert nomina_tipo_sindicato where id_nomina is  363 y convencion is 3','insert','nomina_tipo_sindicato','363','','2015-11-24 13:57:48','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('202','User admin insert nomina_tipo_sindicato where id_nomina is  364 y convencion is 3','insert','nomina_tipo_sindicato','364','','2015-11-24 13:57:48','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('203','User admin insert nomina_tipo_sindicato where id_nomina is  365 y convencion is 3','insert','nomina_tipo_sindicato','365','','2015-11-24 13:57:48','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('204','User admin update nomina_tipo_sindicato where id_nomina is  355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 13:58:09','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('205','User admin insert nomina_tipo_sindicato where id_nomina is  355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 13:58:09','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('206','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 13:58:09','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('207','User admin insert nomina_tipo_sindicato where id_nomina is  355 y convencion is 3','insert','nomina_tipo_sindicato','355','','2015-11-24 13:58:09','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('208','User admin insert nomina_tipo_sindicato where id_nomina is  356 y convencion is 3','insert','nomina_tipo_sindicato','356','','2015-11-24 13:58:09','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('209','User admin insert nomina_tipo_sindicato where id_nomina is  357 y convencion is 3','insert','nomina_tipo_sindicato','357','','2015-11-24 13:58:10','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('210','User admin insert nomina_tipo_sindicato where id_nomina is  358 y convencion is 3','insert','nomina_tipo_sindicato','358','','2015-11-24 13:58:10','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('211','User admin insert nomina_tipo_sindicato where id_nomina is  359 y convencion is 3','insert','nomina_tipo_sindicato','359','','2015-11-24 13:58:10','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('212','User admin insert nomina_tipo_sindicato where id_nomina is  360 y convencion is 3','insert','nomina_tipo_sindicato','360','','2015-11-24 13:58:10','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('213','User admin insert nomina_tipo_sindicato where id_nomina is  361 y convencion is 3','insert','nomina_tipo_sindicato','361','','2015-11-24 13:58:10','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('214','User admin insert nomina_tipo_sindicato where id_nomina is  362 y convencion is 3','insert','nomina_tipo_sindicato','362','','2015-11-24 13:58:10','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('215','User admin insert nomina_tipo_sindicato where id_nomina is  363 y convencion is 3','insert','nomina_tipo_sindicato','363','','2015-11-24 13:58:10','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('216','User admin insert nomina_tipo_sindicato where id_nomina is  364 y convencion is 3','insert','nomina_tipo_sindicato','364','','2015-11-24 13:58:10','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('217','User admin insert nomina_tipo_sindicato where id_nomina is  365 y convencion is 3','insert','nomina_tipo_sindicato','365','','2015-11-24 13:58:10','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('218','User admin update nomina_tipo_sindicato where id_nomina is  355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 13:58:45','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('219','User admin insert nomina_tipo_sindicato where id_nomina is  355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 13:58:46','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('220','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 13:58:46','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('221','User admin insert nomina_tipo_sindicato where id_nomina is  355 y convencion is 3','insert','nomina_tipo_sindicato','355','','2015-11-24 13:58:46','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('222','User admin insert nomina_tipo_sindicato where id_nomina is  356 y convencion is 3','insert','nomina_tipo_sindicato','356','','2015-11-24 13:58:46','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('223','User admin insert nomina_tipo_sindicato where id_nomina is  357 y convencion is 3','insert','nomina_tipo_sindicato','357','','2015-11-24 13:58:46','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('224','User admin insert nomina_tipo_sindicato where id_nomina is  358 y convencion is 3','insert','nomina_tipo_sindicato','358','','2015-11-24 13:58:46','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('225','User admin insert nomina_tipo_sindicato where id_nomina is  359 y convencion is 3','insert','nomina_tipo_sindicato','359','','2015-11-24 13:58:46','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('226','User admin insert nomina_tipo_sindicato where id_nomina is  360 y convencion is 3','insert','nomina_tipo_sindicato','360','','2015-11-24 13:58:46','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('227','User admin insert nomina_tipo_sindicato where id_nomina is  361 y convencion is 3','insert','nomina_tipo_sindicato','361','','2015-11-24 13:58:46','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('228','User admin insert nomina_tipo_sindicato where id_nomina is  362 y convencion is 3','insert','nomina_tipo_sindicato','362','','2015-11-24 13:58:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('229','User admin insert nomina_tipo_sindicato where id_nomina is  363 y convencion is 3','insert','nomina_tipo_sindicato','363','','2015-11-24 13:58:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('230','User admin insert nomina_tipo_sindicato where id_nomina is  364 y convencion is 3','insert','nomina_tipo_sindicato','364','','2015-11-24 13:58:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('231','User admin insert nomina_tipo_sindicato where id_nomina is  365 y convencion is 3','insert','nomina_tipo_sindicato','365','','2015-11-24 13:58:47','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('232','User admin insert nomina_tipo_sindicato where id_nomina is  355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','1','','2015-11-24 14:00:21','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('233','User admin insert nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 14:00:21','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('234','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:00:22','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('235','User admin insert nomina_tipo_sindicato where id_nomina is  355 y convencion is 3','insert','nomina_tipo_sindicato','355','','2015-11-24 14:00:22','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('236','User admin insert nomina_tipo_sindicato where id_nomina is  356 y convencion is 3','insert','nomina_tipo_sindicato','356','','2015-11-24 14:00:22','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('237','User admin insert nomina_tipo_sindicato where id_nomina is  357 y convencion is 3','insert','nomina_tipo_sindicato','357','','2015-11-24 14:00:22','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('238','User admin insert nomina_tipo_sindicato where id_nomina is  358 y convencion is 3','insert','nomina_tipo_sindicato','358','','2015-11-24 14:00:22','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('239','User admin insert nomina_tipo_sindicato where id_nomina is  359 y convencion is 3','insert','nomina_tipo_sindicato','359','','2015-11-24 14:00:22','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('240','User admin insert nomina_tipo_sindicato where id_nomina is  360 y convencion is 3','insert','nomina_tipo_sindicato','360','','2015-11-24 14:00:22','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('241','User admin insert nomina_tipo_sindicato where id_nomina is  361 y convencion is 3','insert','nomina_tipo_sindicato','361','','2015-11-24 14:00:22','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('242','User admin insert nomina_tipo_sindicato where id_nomina is  362 y convencion is 3','insert','nomina_tipo_sindicato','362','','2015-11-24 14:00:23','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('243','User admin insert nomina_tipo_sindicato where id_nomina is  363 y convencion is 3','insert','nomina_tipo_sindicato','363','','2015-11-24 14:00:23','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('244','User admin insert nomina_tipo_sindicato where id_nomina is  364 y convencion is 3','insert','nomina_tipo_sindicato','364','','2015-11-24 14:00:23','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('245','User admin insert nomina_tipo_sindicato where id_nomina is  365 y convencion is 3','insert','nomina_tipo_sindicato','365','','2015-11-24 14:00:23','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('246','User admin update nomina_tipo_sindicato where id_nomina is  355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 14:02:31','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('247','User admin insert nomina_tipo_sindicato where id_nomina is  355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 14:02:31','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('248','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:02:31','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('249','User admin insert nomina_tipo_sindicato where id_nomina is  355 y convencion is 3','insert','nomina_tipo_sindicato','355','','2015-11-24 14:02:31','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('250','User admin insert nomina_tipo_sindicato where id_nomina is  356 y convencion is 3','insert','nomina_tipo_sindicato','356','','2015-11-24 14:02:31','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('251','User admin insert nomina_tipo_sindicato where id_nomina is  357 y convencion is 3','insert','nomina_tipo_sindicato','357','','2015-11-24 14:02:31','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('252','User admin insert nomina_tipo_sindicato where id_nomina is  358 y convencion is 3','insert','nomina_tipo_sindicato','358','','2015-11-24 14:02:32','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('253','User admin insert nomina_tipo_sindicato where id_nomina is  359 y convencion is 3','insert','nomina_tipo_sindicato','359','','2015-11-24 14:02:32','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('254','User admin insert nomina_tipo_sindicato where id_nomina is  360 y convencion is 3','insert','nomina_tipo_sindicato','360','','2015-11-24 14:02:32','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('255','User admin insert nomina_tipo_sindicato where id_nomina is  361 y convencion is 3','insert','nomina_tipo_sindicato','361','','2015-11-24 14:02:32','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('256','User admin insert nomina_tipo_sindicato where id_nomina is  362 y convencion is 3','insert','nomina_tipo_sindicato','362','','2015-11-24 14:02:32','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('257','User admin insert nomina_tipo_sindicato where id_nomina is  363 y convencion is 3','insert','nomina_tipo_sindicato','363','','2015-11-24 14:02:32','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('258','User admin insert nomina_tipo_sindicato where id_nomina is  364 y convencion is 3','insert','nomina_tipo_sindicato','364','','2015-11-24 14:02:32','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('259','User admin insert nomina_tipo_sindicato where id_nomina is  365 y convencion is 3','insert','nomina_tipo_sindicato','365','','2015-11-24 14:02:32','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('260','User admin update nomina_tipo_sindicato where id_nomina is  355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 14:06:01','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('261','User admin insert nomina_tipo_sindicato where id_nomina is  355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 14:06:02','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('262','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:06:02','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('263','User admin insert nomina_tipo_sindicato where id_nomina is  355 y convencion is 3','insert','nomina_tipo_sindicato','355','','2015-11-24 14:06:02','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('264','User admin insert nomina_tipo_sindicato where id_nomina is  356 y convencion is 3','insert','nomina_tipo_sindicato','356','','2015-11-24 14:06:02','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('265','User admin insert nomina_tipo_sindicato where id_nomina is  357 y convencion is 3','insert','nomina_tipo_sindicato','357','','2015-11-24 14:06:02','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('266','User admin insert nomina_tipo_sindicato where id_nomina is  358 y convencion is 3','insert','nomina_tipo_sindicato','358','','2015-11-24 14:06:02','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('267','User admin insert nomina_tipo_sindicato where id_nomina is  359 y convencion is 3','insert','nomina_tipo_sindicato','359','','2015-11-24 14:06:03','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('268','User admin insert nomina_tipo_sindicato where id_nomina is  360 y convencion is 3','insert','nomina_tipo_sindicato','360','','2015-11-24 14:06:03','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('269','User admin insert nomina_tipo_sindicato where id_nomina is  361 y convencion is 3','insert','nomina_tipo_sindicato','361','','2015-11-24 14:06:03','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('270','User admin insert nomina_tipo_sindicato where id_nomina is  362 y convencion is 3','insert','nomina_tipo_sindicato','362','','2015-11-24 14:06:03','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('271','User admin insert nomina_tipo_sindicato where id_nomina is  363 y convencion is 3','insert','nomina_tipo_sindicato','363','','2015-11-24 14:06:03','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('272','User admin insert nomina_tipo_sindicato where id_nomina is  364 y convencion is 3','insert','nomina_tipo_sindicato','364','','2015-11-24 14:06:03','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('273','User admin insert nomina_tipo_sindicato where id_nomina is  365 y convencion is 3','insert','nomina_tipo_sindicato','365','','2015-11-24 14:06:03','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('274','User admin insert nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','1','','2015-11-24 14:08:07','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('275','User admin insert nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 14:08:08','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('276','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:08:08','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('277','User admin update nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 14:08:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('278','User admin insert nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 14:08:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('279','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:09:00','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('280','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:09:00','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('281','User admin update nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 14:09:45','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('282','User admin insert nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 14:09:45','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('283','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:09:45','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('284','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:09:45','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('285','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:09:45','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('286','User admin update nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 14:10:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('287','User admin insert nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 14:10:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('288','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:10:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('289','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:10:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('290','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:10:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('291','User admin update nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 14:10:57','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('292','User admin insert nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 14:10:57','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('293','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:10:57','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('294','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:10:58','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('295','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:10:58','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('296','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:11:51','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('297','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:11:51','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('298','User admin update nomina_tipo_sindicato where id_nomina is  354 y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','354','','2015-11-24 14:12:09','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('299','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:12:09','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('300','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:12:09','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('301','User admin update nomina_tipo_sindicato where id_nomina is  354 y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','354','','2015-11-24 14:14:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('302','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:14:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('303','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:14:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('304','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:14:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('305','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:19:33','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('306','User admin update nomina_tipo_sindicato where id_nomina is  354 y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','354','','2015-11-24 14:21:54','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('307','User admin update nomina_tipo_sindicato where id_nomina is  354 y convencion 3 set tipo en 2','update','nomina_tipo_sindicato','354','','2015-11-24 14:21:54','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('308','User admin update nomina_tipo_sindicato where id_nomina is  354 y convencion 3 set tipo en 3','update','nomina_tipo_sindicato','354','','2015-11-24 14:21:54','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('309','User admin update nomina_tipo_sindicato where id_nomina is  354 y convencion 3 set tipo en 4','update','nomina_tipo_sindicato','354','','2015-11-24 14:21:55','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('310','User admin update nomina_tipo_sindicato where id_nomina is  354 y convencion 3 set tipo en 5','update','nomina_tipo_sindicato','354','','2015-11-24 14:21:55','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('311','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:21:55','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('312','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:22:50','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('313','User admin update nomina_tipo_sindicato where id_nomina is  354 y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','354','','2015-11-24 14:23:08','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('314','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:23:08','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('315','User admin update nomina_tipo_sindicato where id_nomina is  354 y convencion 3 set tipo en 1','update','nomina_tipo_sindicato','354','','2015-11-24 14:23:30','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('316','User admin update nomina_tipo_sindicato where id_nomina is  354 y convencion 3 set tipo en 2','update','nomina_tipo_sindicato','354','','2015-11-24 14:23:31','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('317','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:23:31','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('318','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:23:31','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('319','User admin insert nomina_tipo_sindicato where id_nomina is  355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','1','','2015-11-24 14:23:52','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('320','User admin insert nomina_tipo_sindicato where id_nomina is  355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 14:23:52','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('321','User admin delete nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','delete','nomina_tipo_sindicato','354','','2015-11-24 14:24:23','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('322','User admin insert nomina_tipo_sindicato where id_nomina is  354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','1','','2015-11-24 14:27:08','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('323','User admin delete nomina_tipo_sindicato where id_nomina is  355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','delete','nomina_tipo_sindicato','355','','2015-11-24 14:27:17','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('324','User admin insert nomina_tipo_sindicato where id_nomina is  355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403, y convencion is 3','insert','nomina_tipo_sindicato','1','','2015-11-24 14:27:39','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('325','User admin delete nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','delete','nomina_tipo_sindicato','354','','2015-11-24 14:30:39','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('326','User admin insert nomina_tipo_sindicato where id_nomina is  354 y convencion is 3','insert','nomina_tipo_sindicato','354','','2015-11-24 14:31:04','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('327','User admin delete nomina y nomina tipo_sindicato where convencion is 3','delete','Nomina-nomina_tipo_sindicato','3','','2015-11-24 14:34:05','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('328','User admin delete nomina y nomina tipo_sindicato where convencion is 3','delete','Nomina-nomina_tipo_sindicato','3','','2015-11-24 14:34:35','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('329','User admin delete nomina y nomina tipo_sindicato where convencion is 3','delete','Nomina-nomina_tipo_sindicato','3','','2015-11-24 14:35:23','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('330','User admin delete nomina y nomina tipo_sindicato where convencion is 3','delete','Nomina-nomina_tipo_sindicato','3','','2015-11-24 14:36:30','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('331','User admin created nomina ultimo id 453','CREATE','Nomina','453','','2015-11-24 15:26:14','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('332','User admin insert nomina_tipo_sindicato where id_nomina is  404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453, y convencion is 3','insert','nomina_tipo_sindicato','1','','2015-11-24 15:26:23','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('333','User admin created nomina ultimo id 505','CREATE','Nomina','505','','2015-11-24 15:56:40','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('334','User admin insert nomina_tipo_sindicato where id_nomina is  456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505, y convencion is 3','insert','nomina_tipo_sindicato','1','','2015-11-24 16:04:21','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('335','User admin insert nomina_tipo_sindicato where id_nomina is  456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 16:04:21','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('336','User admin insert nomina_tipo_sindicato where id_nomina is  456 y convencion is 3','insert','nomina_tipo_sindicato','456','','2015-11-24 16:04:21','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('337','User admin insert nomina_tipo_sindicato where id_nomina is  457 y convencion is 3','insert','nomina_tipo_sindicato','457','','2015-11-24 16:04:21','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('338','User admin insert nomina_tipo_sindicato where id_nomina is  458 y convencion is 3','insert','nomina_tipo_sindicato','458','','2015-11-24 16:04:21','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('339','User admin insert nomina_tipo_sindicato where id_nomina is  459 y convencion is 3','insert','nomina_tipo_sindicato','459','','2015-11-24 16:04:21','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('340','User admin insert nomina_tipo_sindicato where id_nomina is  460 y convencion is 3','insert','nomina_tipo_sindicato','460','','2015-11-24 16:04:21','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('341','User admin insert nomina_tipo_sindicato where id_nomina is  461 y convencion is 3','insert','nomina_tipo_sindicato','461','','2015-11-24 16:04:21','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('342','User admin created Convencion[32].','CREATE','Convencion','32','','2015-11-24 16:06:48','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('343','User admin created Empresa[22].','CREATE','Empresa','22','','2015-11-24 16:08:07','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('344','User admin created nomina ultimo id 561','CREATE','Nomina','561','','2015-11-24 16:35:54','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('345','User admin insert nomina_tipo_sindicato where id_nomina is  512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561, y convencion is 22','insert','nomina_tipo_sindicato','1','','2015-11-24 16:36:06','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('346','User admin insert nomina_tipo_sindicato where id_nomina is  512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561, y convencion is 22','insert','nomina_tipo_sindicato','2','','2015-11-24 16:36:07','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('347','User admin created nomina ultimo id 611','CREATE','Nomina','611','','2015-11-24 19:01:46','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('348','User admin insert nomina_tipo_sindicato where id_nomina is  562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611, y convencion is 3','insert','nomina_tipo_sindicato','1','','2015-11-24 19:01:57','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('349','User admin insert nomina_tipo_sindicato where id_nomina is  562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 19:01:58','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('350','User admin created nomina ultimo id 662','CREATE','Nomina','662','','2015-11-24 19:06:28','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('351','User admin insert nomina_tipo_sindicato where id_nomina is  613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662, y convencion is 22','insert','nomina_tipo_sindicato','1','','2015-11-24 19:06:37','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('352','User admin insert nomina_tipo_sindicato where id_nomina is  613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662, y convencion is 22','insert','nomina_tipo_sindicato','2','','2015-11-24 19:06:37','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('353','User admin update nomina  id 1','update','Nomina','613','','2015-11-24 19:14:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('354','User admin update nomina  id 1','update','Nomina','613','','2015-11-24 19:15:05','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('355','User admin update nomina_tipo_sindicato where id_nomina is  613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662, y convencion 22 set tipo en 1','update','nomina_tipo_sindicato','1','','2015-11-24 19:15:30','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('356','User admin update nomina_tipo_sindicato where id_nomina is  614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662, y convencion 22 set tipo en 2','update','nomina_tipo_sindicato','2','','2015-11-24 19:15:30','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('357','User admin delete nomina_tipo_sindicato where id_nomina is  613 y convencion is 22','delete','nomina_tipo_sindicato','613','','2015-11-24 19:15:53','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('358','User admin created nomina ultimo id 712','CREATE','Nomina','712','','2015-11-24 19:16:51','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('359','User admin insert nomina_tipo_sindicato where id_nomina is  663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710,711,712, y convencion is 3','insert','nomina_tipo_sindicato','1','','2015-11-24 19:17:02','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('360','User admin insert nomina_tipo_sindicato where id_nomina is  663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710,711,712, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 19:17:02','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('361','User admin delete nomina y nomina tipo_sindicato where convencion is 22','delete','Nomina-nomina_tipo_sindicato','22','','2015-11-24 19:17:18','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('362','User admin created nomina ultimo id 762','CREATE','Nomina','762','','2015-11-24 19:17:41','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('363','User admin insert nomina_tipo_sindicato where id_nomina is  713,714,715,716,717,718,719,720,721,722,723,724,725,726,727,728,729,730,731,732,733,734,735,736,737,738,739,740,741,742,743,744,745,746,747,748,749,750,751,752,753,754,755,756,757,758,759,760,761,762, y convencion is 22','insert','nomina_tipo_sindicato','1','','2015-11-24 19:18:01','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('364','User admin insert nomina_tipo_sindicato where id_nomina is  713,714,715,716,717,718,719,720,721,722,723,724,725,726,727,728,729,730,731,732,733,734,735,736,737,738,739,740,741,742,743,744,745,746,747,748,749,750,751,752,753,754,755,756,757,758,759,760,761,762, y convencion is 22','insert','nomina_tipo_sindicato','2','','2015-11-24 19:18:01','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('365','User admin created Empresa[23].','CREATE','Empresa','23','','2015-11-24 19:33:43','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('366','User admin created Convencion[33].','CREATE','Convencion','33','','2015-11-24 20:22:40','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('367','User admin created Empresa[24].','CREATE','Empresa','24','','2015-11-24 20:23:59','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('368','User admin created nomina ultimo id 812','CREATE','Nomina','812','','2015-11-24 20:25:37','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('369','User admin insert nomina_tipo_sindicato where id_nomina is  763,764,765,766,767,768,769,770,771,772,773,774,775,776,777,778,779,780,781,782,783,784,785,786,787,788,789,790,791,792,793,794,795,796,797,798,799,800,801,802,803,804,805,806,807,808,809,810,811,812, y convencion is 24','insert','nomina_tipo_sindicato','1','','2015-11-24 20:25:49','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('370','User admin insert nomina_tipo_sindicato where id_nomina is  763,764,765,766,767,768,769,770,771,772,773,774,775,776,777,778,779,780,781,782,783,784,785,786,787,788,789,790,791,792,793,794,795,796,797,798,799,800,801,802,803,804,805,806,807,808,809,810,811,812, y convencion is 24','insert','nomina_tipo_sindicato','2','','2015-11-24 20:25:50','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('371','User cargador1 changed duracion_meses for Convencion[8].','CHANGE','Convencion','8','duracion_meses','2015-11-24 20:37:30','3');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('372','User cargador1 changed rnc for Empresa[3].','CHANGE','Empresa','3','rnc','2015-11-24 20:37:42','3');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('373','User cargador1 delete nomina_tipo_sindicato where id_nomina is  663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710,711,712, y convencion is 3','delete','nomina_tipo_sindicato','663','','2015-11-24 20:39:35','3');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('374','User cargador1 delete nomina_tipo_sindicato where id_nomina is  663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710,711,712, y convencion is 3','delete','nomina_tipo_sindicato','663','','2015-11-24 20:39:35','3');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('375','User cargador1 insert nomina_tipo_sindicato where id_nomina is  663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710,711,712, y convencion is 3','insert','nomina_tipo_sindicato','1','','2015-11-24 20:39:46','3');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('376','User cargador1 insert nomina_tipo_sindicato where id_nomina is  663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710,711,712, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-24 20:39:46','3');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('377','User admin created nomina ultimo id 825','CREATE','Nomina','825','','2015-11-25 11:49:46','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('378','User admin insert nomina_tipo_sindicato where id_nomina is  825 y convencion is 3','insert','nomina_tipo_sindicato','825','','2015-11-25 11:50:31','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('379','User admin insert nomina_tipo_sindicato where id_nomina is  825 y convencion is 3','insert','nomina_tipo_sindicato','825','','2015-11-25 11:50:31','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('380','User admin delete nomina y nomina tipo_sindicato where convencion is 3','delete','Nomina-nomina_tipo_sindicato','3','','2015-11-25 12:13:05','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('381','User admin created nomina ultimo id 1','CREATE','Nomina','1','','2015-11-25 12:20:24','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('382','User admin insert nomina_tipo_sindicato where id_nomina is  829 y convencion is 3','insert','nomina_tipo_sindicato','829','','2015-11-25 12:20:33','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('383','User admin created Convencion[34].','CREATE','Convencion','34','','2015-11-25 14:17:21','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('384','User admin created nomina ultimo id 2','CREATE','Nomina','2','','2015-11-25 14:39:18','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('385','User admin insert nomina_tipo_sindicato where id_nomina is  830,831,832,833,834,835,836,837,838,839,840,841,842,843,844,845,846,847,848,849,850,851,852,853,854,855,856,857,858,859,860,861,862,863,864,865,866,867,868,869,870,871,872,873,874,875,876,877,878,879, y convencion is 3','insert','nomina_tipo_sindicato','1','','2015-11-25 14:39:32','1');
INSERT INTO `activerecordlog` (`id`,`description`,`action`,`model`,`idModel`,`field`,`creationdate`,`userid`) VALUES
('386','User admin insert nomina_tipo_sindicato where id_nomina is  830,831,832,833,834,835,836,837,838,839,840,841,842,843,844,845,846,847,848,849,850,851,852,853,854,855,856,857,858,859,860,861,862,863,864,865,866,867,868,869,870,871,872,873,874,875,876,877,878,879, y convencion is 3','insert','nomina_tipo_sindicato','2','','2015-11-25 14:39:32','1');



-- -------------------------------------------
-- TABLE DATA ambito
-- -------------------------------------------
INSERT INTO `ambito` (`id`,`nombre_ambito`) VALUES
('1','Local');
INSERT INTO `ambito` (`id`,`nombre_ambito`) VALUES
('2','Nacional');
INSERT INTO `ambito` (`id`,`nombre_ambito`) VALUES
('3','Estadal');
INSERT INTO `ambito` (`id`,`nombre_ambito`) VALUES
('4','Regional');



-- -------------------------------------------
-- TABLE DATA clase
-- -------------------------------------------
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('1','A','1','1','1','Cultivo de cereales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('2','A','1','1','2','Cultivo de leguminosas, excepto en organopónicos, hidropónicos y para semillas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('3','A','1','1','3','Cultivo de raíces y tubérculos, excepto para semillas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('4','A','1','1','4','Cultivodehortalizasymelones,exceptoenorganopónicos,hidropónicosyparasemillas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('5','A','1','1','5','Cultivo de semillas oleaginosas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('6','A','1','1','6','Cultivo de caña de azúcar');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('7','A','1','1','7','Cultivo de tabaco');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('8','A','1','1','8','Cultivo de plantas de fibra');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('9','A','1','1','9','Cultivo de otras plantas no perennes');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('10','A','1','2','1','Cultivo de uva');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('11','A','1','2','2','Cultivo de frutas tropicales y subtropicales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('12','A','1','2','3','Cultivo de cítricos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('13','A','1','2','4','Cultivo de frutas de pepita y de hueso');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('14','A','1','2','5','Cultivo de otros frutos y nueces de árboles y arbustos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('15','A','1','2','6','Cultivo de frutos oleaginosos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('16','A','1','2','7','Cultivo de plantas con las que se preparan bebidas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('17','A','1','2','8','Cultivo de especias y de plantas aromáticas, medicinales y farmacéuticas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('18','A','1','2','9','Cultivo de plantas perennes n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('19','A','1','3','0','Propagación de plantas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('20','A','1','4','1','Cría de ganado bovino');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('21','A','1','4','2','Cría de ganado equinos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('22','A','1','4','3','Cría de ovinos y caprinos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('23','A','1','4','4','Cría de porcinos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('24','A','1','4','5','Cría de aves de corral');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('25','A','1','4','9','Cría de otros animales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('26','A','1','5','0','Cultivodeprodoductosagrícolasencombinaciónconlacríadeanimales(unidadde producción agrícola mixta)');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('27','A','1','6','1','Actividades de apoyo a la agricultura');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('28','A','1','6','2','Actividades posteriores a la cosecha');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('29','A','1','6','3','Tratamiento de semillas para propagación');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('30','A','1','6','4','Actividades de apoyo a la ganadería');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('31','A','1','7','0','Caza ordinaria, mediante trampas y actividades de servicios conexas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('32','A','2','1','0','Silvicultura y otras actividades forestales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('33','A','2','2','0','Extracción de madera');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('34','A','2','3','0','Recolección de productos forestales distintos de la madera');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('35','A','2','4','0','Servicios de apoyo a la silvicultura');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('36','A','3','1','1','Pesca marítima');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('37','A','3','1','2','Pesca fluvial y lacustre');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('38','A','3','2','1','Acuicultura marítima');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('39','A','3','2','2','Acuicultura de agua dulce');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('40','B','5','1','0','Extracción de carbón de piedra');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('41','B','5','2','0','Extracción de lignito');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('42','B','6','1','0','Extracción de petróleo crudo');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('43','B','6','2','0','Extracción de gas natural');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('44','B','7','1','0','Extracción de minerales de hierro');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('45','B','7','2','1','Extracción de minerales de uranio y torio');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('46','B','7','2','9','Extracción de minerales metalíferos no ferrosos n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('47','B','8','1','0','Extracción de piedra, arena y arcilla');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('48','B','8','9','1','Extracción de minerales para la fabricación de abonos y productos químicos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('49','B','8','9','2','Extracción de turba');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('50','B','8','9','3','Extracción de sal');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('51','B','8','9','9','Explotación de otras minas y canteras n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('52','B','9','1','0','Actividades de apoyo para la extracción de petróleo y gas natural');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('53','B','9','9','0','Actividades de apoyo para la explotación de otras minas y canteras');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('54','C','10','1','0','Elaboración y conservación de carne');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('55','C','10','2','0','Elaboración y conservación de pescado, crustáceos y moluscos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('56','C','10','3','0','Elaboración y conservación de frutas, legumbres y hortalizas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('57','C','10','4','0','Elaboración de aceites y grasas de origen vegetal y animal');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('58','C','10','5','0','Elaboración de productos lácteos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('59','C','10','6','1','Elaboración de productos de molinería');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('60','C','10','6','2','Elaboracióndeaceitedemaíz,almidonesyproductosderivadosdelamolineríahúmeda de maíz y de los almidones');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('61','C','10','7','1','Elaboración de productos de panadería');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('62','C','10','7','2','Elaboración de azúcar');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('63','C','10','7','3','Elaboración de cacao y chocolate y de productos de confitería');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('64','C','10','7','4','Elaboración de macarrones, fideos, alcuzcuz y productos farináceos similares');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('65','C','10','7','5','Elaboración de comidas y platos preparados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('66','C','10','7','9','Elaboración de otros productos alimenticios n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('67','C','10','8','0','Elaboración de alimentos balanceados para animales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('68','C','11','0','1','Destilación, rectificación y mezcla de bebidas alcohólicas espirituosas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('69','C','11','0','2','Elaboración de vinos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('70','C','11','0','3','Elaboración de cervezas y de malta');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('71','C','11','0','4','Elaboracióndebebidasnoalcohólicas;produccióndeaguasmineralesyotrasaguasembotelladas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('72','C','12','0','0','Elaboración de productos de tabaco');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('73','C','13','1','1','Preparación e hilatura de fibras textiles');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('74','C','13','1','2','Tejedura de productos textiles');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('75','C','13','1','3','Acabado de productos textiles');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('76','C','13','9','1','Fabricación de tejidos de punto y ganchillo');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('77','C','13','9','2','Fabricación de artículos confeccionados de materiales textiles, excepto prendas de vestir');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('78','C','13','9','3','Fabricación de tapices y alfombras');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('79','C','13','9','4','Fabricación de cuerdas, cordeles, bramantes y redes');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('80','C','13','9','9','Fabricación de otros productos textiles n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('81','C','14','1','0','Confección de prendas de vestir, excepto prendas de piel y cuero');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('82','C','14','2','0','Fabricación de artículos de piel');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('83','C','14','3','0','Fabricación de artículos de punto y ganchillo');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('84','C','15','1','1','Curtido y adobo de cueros, adobo y teñido de pieles');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('85','C','15','1','2','Fabricación de maletas, bolsos de mano y artículos de talabartería y guarnicionería');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('86','C','15','2','0','Fabricación de calzado, excepto ortopédico');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('87','C','16','1','0','Aserrado y acepilladura de madera (aserraderos)');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('88','C','16','2','1','Fabricación de hojas de madera para enchapado y tableros a base de madera');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('89','C','16','2','2','Fabricación de partes y piezas de carpintería para edificios y construcciones');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('90','C','16','2','3','Fabricación de recipientes de madera');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('91','C','16','2','9','Fabricacióndeotrosproductosdemadera;fabricacióndeartículosdecorcho,pajay materiales trenzables');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('92','C','17','0','1','Fabricación de pasta de madera, papel y cartón');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('93','C','17','0','2','Fabricación de papel y cartón ondulado y de envases de papel y cartón');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('94','C','17','0','9','Fabricación de otros artículos de papel y cartón');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('95','C','18','1','1','Actividades de impresión');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('96','C','18','1','2','Actividades de servicios relacionadas con la impresión');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('97','C','18','2','0','Reproducción de grabaciones');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('98','C','19','1','0','Fabricación de productos de hornos de coque');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('99','C','19','2','0','Fabricación de productos de la refinación del petróleo');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('100','C','20','1','1','Fabricación de sustancias químicas básicas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('101','C','20','1','2','Fabricación de abonos y compuestos de nitrógeno');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('102','C','20','1','3','Fabricación de plásticos y caucho sintético en formas primarias');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('103','C','20','2','1','Fabricación de plaguicidas y otros productos químicos de uso agropecuario');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('104','C','20','2','2','Fabricacióndepinturas,barnicesyproductosderevestimientosimilares,tintasdeimprenta y masillas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('105','C','20','2','3','Fabricacióndejabonesydetergentes,preparadosparalimpiarypulir,perfumesypreparados de tocador');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('106','C','20','2','9','Fabricación de otros productos químicos n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('107','C','20','3','0','Fabricación de fibras artificiales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('108','C','21','0','0','Fabricacióndeproductosfarmacéuticos,sustanciasquímicasmedicinalesyproductos botánicos de uso farmacéutico');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('109','C','22','1','1','Fabricacióndecubiertasycámarasdecaucho;recauchutadoyrenovacióndecubiertas de caucho');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('110','C','22','1','9','Fabricación de otros productos de caucho');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('111','C','22','2','0','Fabricación de productos de plástico');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('112','C','23','1','0','Fabricación de vidrio y productos de vidrio');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('113','C','23','9','1','Fabricación de productos refractarios');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('114','C','23','9','2','Fabricación de materiales de arcilla para la construcción');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('115','C','23','9','3','Fabricación de otros productos de porcelana y de cerámica');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('116','C','23','9','4','Fabricación de cemento, cal y yeso');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('117','C','23','9','5','Fabricación de artículos de hormigón, cemento y yeso');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('118','C','23','9','6','Corte, talla y acabado de la piedra');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('119','C','23','9','9','Fabricación de otros productos minerales no metálicos n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('120','C','24','1','0','Industrias básicas de hierro y acero');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('121','C','24','2','0','Fabricación de productos primarios de metales preciosos y otros metales no ferrosos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('122','C','24','3','1','Fundición de hierro y acero');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('123','C','24','3','2','Fundición de metales no ferrosos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('124','C','25','1','1','Fabricación de productos metálicos para uso estructural');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('125','C','25','1','2','Fabricación de tanques, depósitos y recipientes de metal');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('126','C','25','1','3','Fabricacióndegeneradoresdevapor,exceptocalderasdeaguacalienteparacalefacción central');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('127','C','25','2','0','Fabricación de armas y municiones');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('128','C','25','9','1','Forja, prensado, estampado y laminado de metales; pulvimetalurgia');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('129','C','25','9','2','Tratamiento y revestimiento de metales; maquinado');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('130','C','25','9','3','Fabricacióndeartículosdecuchillería,herramientasdemanoyartículosdeferretería');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('131','C','25','9','9','Fabricación de otros productos elaborados de metal');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('132','C','26','1','0','Fabricación de componentes y tableros electrónicos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('133','C','26','2','0','Fabricación de computadores y equipo periférico');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('134','C','26','3','0','Fabricación de equipo de comunicaciones');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('135','C','26','4','0','Fabricación de aparatos electrónicos de consumo');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('136','C','26','5','1','Fabricación de equipo de medición, prueba, navegación y control');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('137','C','26','5','2','Fabricación de relojes');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('138','C','26','6','0','Fabricacióndeequipodeirradiaciónyequipoelectrónicodeusomédicoyterapéutico');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('139','C','26','7','0','Fabricación de instrumentos ópticos y equipo fotográfico');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('140','C','26','8','0','Fabricación de soportes magnéticos y ópticos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('141','C','27','1','0','Fabricacióndemotores,generadoresytransformadoreseléctricosyaparatosdedistribución y control de la energía eléctrica');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('142','C','27','2','0','Fabricación de pilas, baterías y acumuladores');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('143','C','27','3','1','Fabricación de cables de fibra óptica');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('144','C','27','3','2','Fabricación de otros hilos y cables eléctricos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('145','C','27','3','3','Fabricación de dispositivos de cableado');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('146','C','27','4','0','Fabricación de equipo eléctrico de iluminación');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('147','C','27','5','0','Fabricación de aparatos de uso doméstico');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('148','C','27','9','0','Fabricación de otros tipos de equipo eléctrico');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('149','C','28','1','1','Fabricacióndemotoresyturbinas,exceptomotoresparaaeronaves,vehículosautomotores y motocicletas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('150','C','28','1','2','Fabricación de equipo de propulsión de fluidos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('151','C','28','1','3','Fabricación de otras bombas, compresores, grifos y válvulas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('152','C','28','1','4','Fabricación de cojinetes, engranajes, trenes de engranajes y piezas de transmisión');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('153','C','28','1','5','Fabricación de hornos, hogueras y quemadores');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('154','C','28','1','6','Fabricación de equipo de elevación y manipulación');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('155','C','28','1','7','Fabricacióndemaquinariayequipodeoficina,exceptocomputadoresyequipoperiférico');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('156','C','28','1','8','Fabricación de herramientas de mano motorizadas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('157','C','28','1','9','Fabricación de otros tipos de maquinaria de uso general');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('158','C','28','2','1','Fabricación de maquinaria agropecuaria y forestal');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('159','C','28','2','2','Fabricacióndemaquinariaparalaconformacióndemetalesydemáquinasherramienta');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('160','C','28','2','3','Fabricación de maquinaria metalúrgica');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('161','C','28','2','4','Fabricacióndemaquinariaparalaexplotacióndeminasycanterasyparaobrasdeconstrucción');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('162','C','28','2','5','Fabricación de maquinaria para la elaboración de alimentos, bebidas y tabaco');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('163','C','28','2','6','Fabricacióndemaquinariaparalaelaboracióndeproductostextiles,prendasdevestir y cueros');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('164','C','28','2','9','Fabricación de otros tipos de maquinaria de uso especial');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('165','C','29','1','0','Fabricación de vehículos automotores');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('166','C','29','2','0','Fabricacióndecarroceríasparavehículosautomotores;fabricaciónderemolquesysemirremolques');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('167','C','29','3','0','Fabricación de partes, piezas y accesorios para vehículos automotores');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('168','C','30','1','1','Construcción de buques y estructuras flotantes');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('169','C','30','1','2','Construcción de embarcaciones de recreo y deporte');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('170','C','30','2','0','Fabricación de locomotoras y material rodante');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('171','C','30','3','0','Fabricación de aeronaves, naves espaciales y maquinaria conexa');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('172','C','30','4','0','Fabricación de vehículos militares de combate');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('173','C','30','9','1','Fabricación de motocicletas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('174','C','30','9','2','Fabricación de bicicletas y de sillones de ruedas para inválidos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('175','C','30','9','9','Fabricación de otros tipos de equipo de transporte n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('176','C','31','0','0','Fabricación de muebles');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('177','C','32','1','1','Fabricación de joyas y artículos conexos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('178','C','32','1','2','Fabricación de bisutería y artículos conexos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('179','C','32','2','0','Fabricación de instrumentos musicales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('180','C','32','3','0','Fabricación de artículos de deporte');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('181','C','32','4','0','Fabricación de juegos y juguetes');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('182','C','32','5','0','Fabricación de instrumentos y materiales médicos y odontológicos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('183','C','32','9','0','Otras industrias manufactureras n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('184','C','33','1','1','Reparación de productos elaborados de metal');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('185','C','33','1','2','Reparación de maquinaria');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('186','C','33','1','3','Reparación de equipo electrónico y óptico');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('187','C','33','1','4','Reparación de equipo eléctrico');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('188','C','33','1','5','Reparación de equipo de transporte, excepto vehículos automotores');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('189','C','33','1','9','Reparación de otros tipos de equipo');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('190','C','33','2','0','Instalación de maquinaria y equipo industriales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('191','D','35','1','0','Generación, transmisión y distribución de energía eléctrica');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('192','D','35','2','0','Producción de gas; distribución de combustibles gaseosos por tuberías');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('193','D','35','3','0','Suministro de vapor y de aire acondicionado');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('194','E','36','0','0','Captación, tratamiento y distribución de agua');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('195','E','37','0','0','Evacuación de aguas residuales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('196','E','38','1','1','Recogida de desechos no peligrosos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('197','E','38','1','2','Recogida de desechos peligrosos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('198','E','38','2','1','Tratamiento y eliminación de desechos no peligrosos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('199','E','38','2','2','Tratamiento y eliminación de desechos peligrosos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('200','E','38','3','0','Recuperación de materiales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('201','E','39','0','0','Actividades de descontaminación y otros servicios de gestión de desechos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('202','F','41','0','0','Construcción de edificios');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('203','F','42','1','0','Construcción de carreteras, vías de ferrocarril, puentes y túneles');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('204','F','42','2','0','Construcción de proyectos de servicio público');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('205','F','42','9','0','Construcción de otras obras de ingeniería civil');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('206','F','43','1','1','Demolición');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('207','F','43','1','2','Preparación del terreno');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('208','F','43','2','1','Instalaciones eléctricas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('209','F','43','2','2','Instalaciones de plomería, calefacción y aire acondicionado');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('210','F','43','2','9','Otras instalaciones para obras de construcción');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('211','F','43','3','0','Terminación y acabado de edificios');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('212','F','43','9','0','Otras actividades especializadas de construcción');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('213','G','45','1','0','Venta de vehículos automotores');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('214','G','45','2','0','Mantenimiento y reparación de vehículos automotores');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('215','G','45','3','0','Venta de partes, piezas y accesorios para vehículos automotores');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('216','G','45','4','0','Venta, mantenimiento y reparación de motocicletas y sus partes, piezas y accesorios');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('217','G','46','1','0','Venta al por mayor a cambio de una retribución o por contrata');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('218','G','46','2','0','Venta al por mayor de materias primas agropecuarias y animales vivos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('219','G','46','3','1','Venta al por mayor de alimentos excepto para animales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('220','G','46','3','2','Venta al mayor de alimentos para animales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('221','G','46','3','3','Venta al por mayor de tabaco y bebidas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('222','G','46','4','1','Venta al por mayor de productos textiles, prendas de vestir y calzado');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('223','G','46','4','9','Venta al por mayor de otros enseres domésticos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('224','G','46','5','1','Venta al por mayor de computadores, equipo periférico y programas informáticos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('225','G','46','5','2','Venta al por mayor de equipo, partes y piezas electrónicos y de telecomunicaciones');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('226','G','46','5','3','Venta al por mayor de maquinaria, equipo y materiales agropecuarios');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('227','G','46','5','9','Venta al por mayor de otros tipos de maquinaria y equipo');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('228','G','46','6','1','Ventaalpormayordecombustiblessólidos,líquidosygaseososyproductosconexos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('229','G','46','6','2','Venta al por mayor de metales y minerales metalíferos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('230','G','46','6','3','Ventaalpormayordematerialesdeconstrucción,artículosdeferreteríayequipoymateriales de fontanería y calefacción');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('231','G','46','6','9','Ventaalpormayordeplástico,desperdicios,desechos,chatarrayotrosproductosn.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('232','G','46','9','0','Venta al por mayor no especializada');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('233','G','47','1','1','Ventaalpormenorencomerciosnoespecializadosconpredominiodelaventadealimentos, bebidas o tabaco');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('234','G','47','1','9','Otras actividades de venta al por menor en comercios no especializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('235','G','47','2','1','Venta al por menor de alimentos en comercios especializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('236','G','47','2','2','Ventaalpormenordebebidasencomerciosespecializados(licorerías,depósitosdelicores, etc.)');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('237','G','47','2','3','Venta al por menor de productos de tabaco en comercios especializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('238','G','47','3','0','Ventaalpormenordecombustiblesparavehículosautomotoresencomerciosespecializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('239','G','47','4','1','Venta al por menor de computadoras, equipo periférico, programas informáticos y equipo de telecomunicaciones en comercios especializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('240','G','47','4','2','Venta al por menor de equipo de sonido y de vídeo en comercios especializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('241','G','47','5','1','Venta al por menor de productos textiles en comercios especializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('242','G','47','5','2','Ventaalpormenordeartículosdeferretería,pinturasyproductosdevidrioencomercios especializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('243','G','47','5','3','Ventaalpormenordetapices,alfombrasycubrimientosparaparedesypisosencomercios especializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('244','G','47','5','9','Ventaalpormenordeaparatoseléctricosdeusodoméstico,muebles,equipodeiluminación y otros enseres domésticos en comercios especializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('245','G','47','6','1','Ventaalpormenordeproductosculturalesyrecreativosencomerciosespecializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('246','G','47','6','2','Ventaalpormenordegrabacionesdemúsicaydevídeoencomerciosespecializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('247','G','47','6','3','Venta al por menor de equipo de deporte en comercios especializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('248','G','47','6','4','Venta al por menor de juegos y juguetes en comercios especializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('249','G','47','7','1','Ventaalpormenordeprendasdevestir,calzadoyartículosdecueroencomerciosespecializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('250','G','47','7','2','Ventaalpormenordeproductosfarmacéuticosymedicinales,cosméticosyartículos de tocador en comercios especializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('251','G','47','7','3','Venta al por menor de otros productos nuevos en comercios e especializados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('252','G','47','7','4','Venta al por menor de artículos de segunda mano');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('253','G','47','8','1','Venta al por menor de alimentos, bebidas y tabaco en puestos de venta y mercados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('254','G','47','8','2','Ventaalpormenordeproductostextiles,prendasdevestirycalzadoenpuestosdeventa y mercados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('255','G','47','8','9','Venta al por menor de otros productos en puestos de venta y mercados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('256','G','47','9','1','Venta al por menor por correo y por Internet');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('257','G','47','9','9','Otrasactividadesdeventaalpormenornorealizadasencomercios,puestosdeventa o mercados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('258','H','49','1','1','Transporte interurbano de pasajeros por ferrocarril');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('259','H','49','1','2','Transporte de carga por ferrocarril');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('260','H','49','2','1','Transporte urbano y suburbano de pasajeros por vía terrestre');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('261','H','49','2','2','Otras actividades de transporte por vía terrestre');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('262','H','49','2','3','Transporte de carga por carretera');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('263','H','49','3','0','Transporte por tuberías');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('264','H','50','1','1','Transporte de pasajeros marítimo y de cabotaje');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('265','H','50','1','2','Transporte de carga marítimo y de cabotaje');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('266','H','50','2','1','Transporte de pasajeros por vías de navegación interiores');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('267','H','50','2','2','Transporte de carga por vías de navegación interiores');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('268','H','51','1','0','Transporte de pasajeros por vía aérea');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('269','H','51','2','0','Transporte de carga por vía aérea');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('270','H','52','1','0','Almacenamiento y depósito');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('271','H','52','2','1','Actividades de servicios vinculadas al transporte terrestre');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('272','H','52','2','2','Actividades de servicios vinculadas al transporte acuático');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('273','H','52','2','3','Actividades de servicios vinculadas al transporte aéreo');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('274','H','52','2','4','Manipulación de la carga');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('275','H','52','2','9','Otras actividades de apoyo al transporte');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('276','H','53','1','0','Actividades postales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('277','H','53','2','0','Actividades de mensajería');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('278','I','55','1','0','Actividades de alojamiento para estancias cortas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('279','I','55','2','0','Actividadesdecampamentos,parquesdevehículosderecreoyparquesdecaravanas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('280','I','55','9','0','Otras actividades de alojamiento');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('281','I','56','1','0','Actividades de restaurantes y de servicio móvil de comidas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('282','I','56','2','1','Suministro de comidas por encargo');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('283','I','56','2','9','Otras actividades de servicio de comidas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('284','I','56','3','0','Actividades de servicio de bebidas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('285','J','58','1','1','Edición de libros');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('286','J','58','1','2','Edición de directorios y listas de correos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('287','J','58','1','3','Edición de periódicos, revistas y otras publicaciones periódicas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('288','J','58','1','9','Otras actividades de edición');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('289','J','58','2','0','Edición de programas informáticos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('290','J','59','1','1','Actividadesdeproduccióndepelículascinematográficas,videosyprogramasdetelevisión');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('291','J','59','1','2','Actividades de postproducción de películas, videos y programas de televisión');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('292','J','59','1','3','Actividades de distribución de películas, videos y programas de televisión');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('293','J','59','1','4','Actividades de proyección de películas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('294','J','59','2','0','Actividades de grabación de sonido y edición de música');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('295','J','60','1','0','Actividades programación y difusión de radio');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('296','J','60','2','0','Programación y transmisiones de televisión');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('297','J','61','1','0','Actividades de telecomunicaciones alámbricas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('298','J','61','2','0','Actividades de telecomunicaciones inalámbricas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('299','J','61','3','0','Actividades de telecomunicaciones por satélite');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('300','J','61','9','0','Otras actividades de telecomunicación n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('301','J','62','0','1','Actividades de programación, consultoría informática y actividades conexas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('302','J','62','0','2','Actividades de consultoría informática y de gestión de instalaciones informáticas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('303','J','62','0','9','Otras actividades de tecnología de la información y de servicios informáticos n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('304','J','63','1','1','Procesamiento de datos, hosting y actividades conexas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('305','J','63','1','2','Portales Web');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('306','J','63','9','1','Actividades de agencias de noticias');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('307','J','63','9','9','Otros servicios de información n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('308','K','64','1','1','Servicios del Banco Central');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('309','K','64','1','9','Servicios de intermediación financiera n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('310','K','64','2','0','Actividades de sociedades de cartera');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('311','K','64','3','0','Fondos y sociedades de inversión');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('312','K','64','9','1','Otras actividades crediticias');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('313','K','64','9','9','Otras actividades de servicios financieros n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('314','K','65','1','1','Servicios de seguros de personas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('315','K','65','1','2','Servicios de seguros generales (patrimoniales y de obligaciones y/o responsabilidad)');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('316','K','65','2','0','Reaseguros');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('317','K','65','3','0','Fondos de pensiones');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('318','K','66','1','1','Administración de mercados financieros');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('319','K','66','1','2','Corretaje de valores y de contratos de productos básicos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('320','K','66','1','3','Otras actividades auxiliares de las actividades de servicios financieros');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('321','K','66','2','1','Evaluación de riesgos y daños');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('322','K','66','2','2','Servicios de productores de seguros');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('323','K','66','2','3','Servicios de empresas financiadoras de primas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('324','K','66','2','9','Otras actividades auxiliares de las actividades de seguros y fondos de pensiones');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('325','K','66','3','0','Actividades de gestión de fondos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('326','L','68','1','0','Actividades inmobiliarias realizadas con bienes propios o arrendados');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('327','L','68','2','0','Actividades inmobiliarias realizadas a cambio de una retribución o por contrata');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('328','M','69','1','0','Actividades jurídicas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('329','M','69','2','0','Actividades de contabilidad, teneduría de libros y auditoría; consultoría fiscal');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('330','M','70','1','0','Actividades de oficinas centrales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('331','M','70','2','0','Actividades de consultoría de gestión empresarial');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('332','M','71','1','0','Actividadesdearquitecturaeingenieríayactividadesconexasdeconsultoríatécnica');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('333','M','71','2','0','Ensayos y análisis técnicos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('334','M','72','1','0','Investigacionesydesarrolloexperimentalenelcampodelascienciasnaturalesylaingeniería');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('335','M','72','2','0','Investigacionesydesarrolloexperimentalenelcampodelascienciassocialesylashumanidades');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('336','M','73','1','0','Publicidad');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('337','M','73','2','0','Estudios de mercado y encuestas de opinión pública');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('338','M','74','1','0','Actividades especializadas de diseño');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('339','M','74','2','0','Actividades de fotografía');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('340','M','74','9','0','Otras actividades profesionales, científicas y técnicas n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('341','M','75','0','0','Actividades veterinarias');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('342','N','77','1','0','Alquiler y arrendamiento de vehículos automotores');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('343','N','77','2','1','Alquiler y arrendamiento de equipo recreativo y deportivo');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('344','N','77','2','2','Alquiler de cintas de video y discos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('345','N','77','2','9','Alquiler y arrendamiento de otros efectos personales y enseres domésticos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('346','N','77','3','0','Alquiler y arrendamiento de otros tipos de maquinaria, equipo y bienes tangibles');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('347','N','77','4','0','Arrendamientodepropiedadintelectualyproductossimilares,exceptoobrasprotegidas por derechos de autor');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('348','N','78','1','0','Actividades de agencias de empleo');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('349','N','78','2','0','Actividades de agencias de empleo temporal');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('350','N','78','3','0','Otras actividades de dotación de recursos humanos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('351','N','79','1','1','Actividades de agencias de viajes');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('352','N','79','1','2','Actividades de operadores turísticos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('353','N','79','9','0','Otros servicios de reservas y actividades conexas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('354','N','80','1','0','Actividades de seguridad privada');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('355','N','80','2','0','Actividades de servicios de sistemas de seguridad');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('356','N','80','3','0','Actividades de investigación');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('357','N','81','1','0','Actividades combinadas de apoyo a instalaciones');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('358','N','81','2','1','Limpieza general de edificios');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('359','N','81','2','9','Otras actividades de limpieza de edificios e instalaciones industriales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('360','N','81','3','0','Actividades de paisajismo y servicios de mantenimiento conexos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('361','N','82','1','1','Actividades combinadas de servicios administrativos de oficina');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('362','N','82','1','9','Fotocopiado,preparacióndedocumentosyotrasactividadesespecializadasdeapoyo de oficina');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('363','N','82','2','0','Actividades de centros de llamadas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('364','N','82','3','0','Organización de convenciones y exposiciones comerciales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('365','N','82','9','1','Actividades de agencias de cobro y agencias de calificación crediticia');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('366','N','82','9','2','Actividades de envasado y empaquetado');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('367','N','82','9','9','Otras actividades de servicios de apoyo a las empresas n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('368','O','84','1','1','Actividades de la administración pública en general');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('369','O','84','1','2','Regulacióndelasactividadesdeorganismosqueprestanserviciossanitarios,educativos,culturalesyotrosserviciossociales,exceptoserviciosdeseguridadsocial');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('370','O','84','1','3','Regulación y facilitación de la actividad económica');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('371','O','84','2','1','Relaciones exteriores');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('372','O','84','2','2','Actividades de defensa');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('373','O','84','2','3','Actividades de mantenimiento del orden público y de seguridad');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('374','O','84','3','0','Actividades de planes de seguridad social de afiliación obligatoria');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('375','P','85','1','0','Educación inicial y primaria');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('376','P','85','2','1','Educación media de formación general y técnica');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('377','P','85','2','2','Educación de formación técnica y profesional');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('378','P','85','3','0','Educación universitaria');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('379','P','85','4','1','Enseñanza deportiva y recreativa');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('380','P','85','4','2','Enseñanza cultural');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('381','P','85','4','9','Otros tipos de enseñanza n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('382','P','85','5','0','Actividades de apoyo a la enseñanza');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('383','Q','86','1','0','Servicios hospitalarios');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('384','Q','86','2','0','Servicios médicos y otros especialistas en consultorios');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('385','Q','86','3','0','Servicios de laboratorios clínicos y de diagnóstico por imagen');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('386','Q','86','9','0','Otras actividades relacionadas con la salud humana n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('387','Q','87','1','0','Servicios sociales con alojamiento relacionados con atención a la salud');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('388','Q','87','2','0','Serviciossocialesconalojamientoparapersonascondiscapacidadintelectual,enfermedad mental o adicciones');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('389','Q','87','3','0','Serviciossocialesconalojamientoparapersonasmayoresypersonascondiscapacidad');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('390','Q','87','9','0','Otros servicios sociales con alojamiento n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('391','Q','88','1','0','Serviciossocialessinalojamientoparapersonasmayoresypersonascondiscapacidad');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('392','Q','88','9','1','Servicios de atención a niños, niñas y adolescentes');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('393','Q','88','9','2','Servicios de atención a personas y familias');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('394','Q','88','9','3','Servicios comunitarios de alimentación');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('395','Q','88','9','4','Actividades de emergencia y socorro');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('396','Q','88','9','5','Actividadesdebeneficenciayotrasactividadesdeapoyoconfinesdeasistenciasocial');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('397','Q','88','9','9','Otras actividades de asistencia social sin alojamiento n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('398','R','90','0','0','Actividades creativas, artísticas y de entretenimiento');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('399','R','91','0','1','Actividades de bibliotecas y archivos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('400','R','91','0','2','Actividades de museos y gestión de lugares y edificios históricos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('401','R','91','0','3','Actividades de jardines botánicos y zoológicos y reservas naturales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('402','R','92','0','0','Actividades de juegos de azar y apuestas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('403','R','93','1','1','Gestión de instalaciones deportivas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('404','R','93','1','2','Actividades de clubes deportivos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('405','R','93','1','9','Otras actividades deportivas n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('406','R','93','2','1','Actividades de parques de atracciones y parques temáticos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('407','R','93','2','9','Otras actividades de esparcimiento y recreativas n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('408','S','94','1','1','Actividades de asociaciones empresariales y de empleadores');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('409','S','94','1','2','Actividades de asociaciones profesionales');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('410','S','94','2','0','Actividades de sindicatos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('411','S','94','9','1','Actividades de organizaciones religiosas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('412','S','94','9','2','Actividades de organizaciones políticas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('413','S','94','9','9','Actividades de otras asociaciones n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('414','S','95','1','1','Reparación de computadores y equipo periférico');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('415','S','95','1','2','Reparación de equipo de comunicaciones');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('416','S','95','2','1','Reparación de aparatos electrónicos de consumo');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('417','S','95','2','2','Reparación de aparatos de uso doméstico y equipo doméstico y de jardinería');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('418','S','95','2','3','Reparación de calzado y de artículos de cuero');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('419','S','95','2','4','Reparación de muebles y accesorios domésticos');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('420','S','95','2','9','Reparación de efectos personales y enseres domésticos n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('421','S','96','0','1','Lavadoylimpieza,incluidalalimpiezaenseco,deproductostextilesydepiel(tintorerías)');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('422','S','96','0','2','Peluquería y otros tratamientos de belleza');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('423','S','96','0','3','Pompas fúnebres y actividades conexas');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('424','S','96','0','9','Otras actividades de servicios personales n.c.p.');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('425','T','97','0','0','Actividades de los hogares como empleadores de personal doméstico');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('426','T','98','1','0','Actividades no diferenciadas de los hogares como productores de bienes para uso propio');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('427','T','98','2','0','Actividadesnodiferenciadasdeloshogarescomoproductoresdeserviciosparausopropio');
INSERT INTO `clase` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`clase`) VALUES
('428','U','99','0','0','Actividades de organizaciones y órganos extraterritoriales');



-- -------------------------------------------
-- TABLE DATA consultor
-- -------------------------------------------
INSERT INTO `consultor` (`id`,`nombres`,`cedula`,`cod_convencion`,`cod_empresa`,`cod_sindicato`) VALUES
('1','cnosultor','123123','8','3','6');
INSERT INTO `consultor` (`id`,`nombres`,`cedula`,`cod_convencion`,`cod_empresa`,`cod_sindicato`) VALUES
('2','walter jimenez','17389814','8','3','6');



-- -------------------------------------------
-- TABLE DATA convencion
-- -------------------------------------------
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('8','nueva','121231231','080','2','1','1','2015-10-16','2015-10-28','2016-10-06','113','2017-10-31','10101010.0000','1010101.0000','8-02','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('9','nueva','11','080','2','2','2','2015-10-14','2015-10-14','2015-10-14','10','2015-10-14','121212.0000','1212.0000','8-06','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('10','nueva','2','080','2','2','2','2015-10-14','2015-10-13','2015-10-13','10','2015-10-23','100000.0000','100000.0000','8-01','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('11','dede0','11','001','2','2','2','2015-10-14','2015-10-07','2015-10-07','10','2015-10-22','121212.0000','1010101.0000','11-01','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('12','desde1','4','001','1','1','2','2015-10-14','2015-10-14','2015-10-14','10','2015-10-14','121212.0000','1212.0000','12-01','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('13','nueva','2','080','1','1','1010','2015-10-15','2015-10-15','2015-10-15','10','2015-10-15','259999.0000','24999.0000','8-04','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('14','nueva','199','080','1','1','2','2015-10-15','2015-10-15','2015-10-15','10','2015-10-29','121212.0000','1212.0000','8-05','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('15','desde1','1919','001','2','1','2','2015-10-15','2015-10-15','2015-10-15','10','2015-10-15','18888.0000','81882.0000','12-02','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('18','nueva','33333','080','1','2','12','2015-10-21','2015-10-15','2015-10-08','5','2015-10-21','10101010101010.0000','10101010101.0000','8-03','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('19','nueva','9999999','001','2','3','1','2015-10-06','2015-10-21','2015-10-14','10','2015-10-20','1010101.0000','1010101.0000','8-07','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('20','nueva','1010','071','2','2','2','2015-10-07','2015-10-15','2015-10-08','10','2015-10-22','121212.0000','1212.0000','8-08','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('21','nueva','1010101','069','2','2','2','2015-10-21','2015-10-21','2015-10-14','5','2015-10-21','1000000.0000','1010101.0000','8-09','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('22','sindicato2','92902912','002','2','2','2','2015-10-01','2015-10-29','2015-10-28','5','2015-10-23','121212.0000','1212.0000','22-01','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('23','nueva','898989','080','1','2','1','2015-10-13','2015-10-20','2015-10-22','12','2015-09-30','1000000.0000','1010101.0000','8-10','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('24','sindicato3','10101010101','001','2','2','2','2015-10-21','2015-10-14','2015-10-22','10','2015-10-21','1000000.0000','1212.0000','24-01','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('25','sindicato4','80808080','001','1','1','2','2015-10-21','2015-10-14','2015-10-16','10','2015-10-21','1000000.0000','1010101.0000','25-01','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('26','sindicato4','1010101','001','1','1','2','2015-10-07','2015-10-13','2015-10-16','5','2015-10-28','121212.0000','1212.0000','25-02','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('27','nuev222','021212','004','1','2','1010','2015-11-11','2015-11-10','2015-11-18','4','2015-11-12','30030434.0000','1211212.0000','27-01','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('28','probando5','1010','005','1','2','2','2015-11-18','2015-11-26','2015-11-28','10','2015-11-27','21200020120120.0000','2120020020.0000','28-01','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('29','convencion1','1010','002','1','1','1','2015-11-04','2015-11-04','2015-11-04','10','2015-11-04','122121212121212.0000','121212121212.0000','29-01','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('30','probando bitacora','101010101','007','1','1','1','2015-11-10','2015-11-10','2015-11-11','10','2015-11-18','1020000.0000','1200222.0000','30-01','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('31','historico','111111','053','1','1','1','2015-11-10','2015-11-10','2015-11-17','10','2015-11-17','2032323.0000','23232323.0000','31-01','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('32','ll','1','002','2','2','1','2015-09-28','2015-11-01','2015-11-23','2','2015-12-04','1022222222.0000','12222222.0000','32-01','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('33','ll','1010','002','1','2','2','2015-11-18','2015-11-20','2015-11-19','10','2015-12-03','1022222222.0000','1200222.0000','32-02','');
INSERT INTO `convencion` (`id`,`nombre`,`numero_expediente`,`inspectoria`,`sector`,`ambito`,`edicion`,`fecha_deposito`,`fecha_inicio`,`fecha_venc`,`duracion_meses`,`fecha_auto_homo`,`costo_contrato`,`costo_contrato_sin_prestaciones`,`cod_convencion`,`referencia`) VALUES
('34','nueva_convencion','10','001','2','2','2','2015-10-26','2015-10-28','2015-10-30','10','2015-12-01','10.0000','10.0000','34-01','');



-- -------------------------------------------
-- TABLE DATA convencion_vieja
-- -------------------------------------------
INSERT INTO `convencion_vieja` (`id`,`cod_interno`,`cod_convencion`,`cod_convencion_padre`,`duracion`,`inicio`,`fin`,`beneficios_directos`,`beneficios_familiar`,`beneficios_hijos`,`beneficios_zona_trabajo`,`beneficios_sindicato`,`deducciones`,`nombre_convencion`,`inspectoria`) VALUES
('1','1010','10101','','3','2015-05-10','2020-05-10','probado','proband','probando','probnad','probnado','pronado','probando','0');



-- -------------------------------------------
-- TABLE DATA cruge_authassignment
-- -------------------------------------------
INSERT INTO `cruge_authassignment` (`userid`,`bizrule`,`data`,`itemname`) VALUES
('3','','N;','Cargador');



-- -------------------------------------------
-- TABLE DATA cruge_authitem
-- -------------------------------------------
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_clausuras_admin','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_clausuras_create','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_clausuras_delete','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_clausuras_index','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_clausuras_update','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_clausuras_view','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_convencion_admin','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_convencion_cambiarpadre','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_convencion_create','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_convencion_delete','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_convencion_index','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_convencion_ordenar','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_convencion_ordenar_convenciones','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_convencion_update','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_convencion_view','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_empresa_admin','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_empresa_autocomplete','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_empresa_create','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_empresa_delete','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_empresa_index','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_empresa_llenarcampos','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_empresa_selectmunicipio','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_empresa_selectparroquia','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_empresa_update','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_empresa_view','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_nomina_admin','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_nomina_create','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_nomina_create_cargo_sindicato','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_nomina_delete','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_nomina_getvalue','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_nomina_index','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_nomina_update','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_nomina_view','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_sindicato_admin','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_sindicato_create','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_sindicato_delete','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_sindicato_index','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_sindicato_selectmunicipio','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_sindicato_selectparroquia','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_sindicato_update','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_sindicato_view','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_site_contact','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_site_error','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_site_index','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_site_login','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_site_logout','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_trabajador_sindicato_admin','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_trabajador_sindicato_create','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_trabajador_sindicato_delete','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_trabajador_sindicato_getvalue','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_trabajador_sindicato_index','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_trabajador_sindicato_update','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_trabajador_sindicato_view','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_ui_editprofile','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_ui_fieldsadmincreate','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_ui_fieldsadminlist','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_ui_rbacajaxassignment','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_ui_rbacajaxsetchilditem','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_ui_rbacauthitemchilditems','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_ui_rbacauthitemcreate','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_ui_rbacauthitemdelete','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_ui_rbacauthitemupdate','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_ui_rbaclistroles','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_ui_rbacusersassignments','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_ui_sessionadmin','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_ui_systemupdate','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_ui_usermanagementadmin','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('action_ui_usermanagementupdate','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('admin','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('Cargador','2','carga de datos','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('controller_clausuras','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('controller_convencion','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('controller_empresa','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('controller_nomina','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('controller_sindicato','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('controller_site','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('controller_trabajador_sindicato','0','','','N;');
INSERT INTO `cruge_authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('edit-advanced-profile-features','0','C:\\wamp\\www\\convenciones_colectivas_resp\\protected\\modules\\cruge\\views\\ui\\usermanagementupdate.php linea 114','','N;');



-- -------------------------------------------
-- TABLE DATA cruge_authitemchild
-- -------------------------------------------
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_clausuras_admin');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_clausuras_create');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_clausuras_index');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_clausuras_update');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_clausuras_view');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_convencion_admin');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_convencion_cambiarpadre');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_convencion_create');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_convencion_index');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_convencion_ordenar');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_convencion_ordenar_convenciones');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_convencion_update');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_convencion_view');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_empresa_admin');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_empresa_autocomplete');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_empresa_create');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_empresa_index');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_empresa_llenarcampos');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_empresa_selectmunicipio');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_empresa_selectparroquia');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_empresa_update');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_empresa_view');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_nomina_admin');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_nomina_create');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_nomina_create_cargo_sindicato');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_nomina_getvalue');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_nomina_index');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_nomina_update');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_nomina_view');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_sindicato_admin');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_sindicato_create');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_sindicato_index');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_sindicato_selectmunicipio');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_sindicato_selectparroquia');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_sindicato_update');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_sindicato_view');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_site_contact');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_site_error');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_site_index');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_site_login');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_site_logout');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_trabajador_sindicato_admin');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_trabajador_sindicato_create');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_trabajador_sindicato_delete');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_trabajador_sindicato_getvalue');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_trabajador_sindicato_index');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_trabajador_sindicato_update');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','action_trabajador_sindicato_view');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','admin');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','controller_clausuras');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','controller_convencion');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','controller_empresa');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','controller_nomina');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','controller_sindicato');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','controller_site');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','controller_trabajador_sindicato');
INSERT INTO `cruge_authitemchild` (`parent`,`child`) VALUES
('Cargador','edit-advanced-profile-features');



-- -------------------------------------------
-- TABLE DATA cruge_session
-- -------------------------------------------
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('1','1','1447773506','1447775306','0','127.0.0.1','1','1447773506','1447773520','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('2','1','1447773528','1447775328','0','127.0.0.1','1','1447773528','1447773530','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('3','3','1447773573','1447775373','0','127.0.0.1','1','1447773573','1447773574','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('4','3','1447773603','1447775403','0','127.0.0.1','1','1447773603','1447773603','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('5','3','1447773615','1447775415','0','127.0.0.1','1','1447773615','1447773615','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('6','1','1447773647','1447775447','0','127.0.0.1','1','1447773647','1447773850','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('7','3','1447773861','1447775661','0','127.0.0.1','1','1447773861','1447773881','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('8','1','1447774240','1447776040','0','127.0.0.1','1','1447774240','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('9','1','1447776654','1447788654','0','127.0.0.1','1','1447776654','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('10','3','1447790857','1447802857','0','127.0.0.1','1','1447790857','1447790875','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('11','1','1447790879','1447802879','0','127.0.0.1','1','1447790879','1447791293','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('12','3','1447791310','1447803310','0','127.0.0.1','1','1447791310','1447791311','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('13','3','1447791326','1447803326','0','127.0.0.1','1','1447791326','1447791327','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('14','1','1447791330','1447803330','0','127.0.0.1','1','1447791330','1447791368','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('15','3','1447791382','1447803382','0','127.0.0.1','1','1447791382','1447791382','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('16','1','1447791386','1447803386','0','127.0.0.1','1','1447791386','1447791544','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('17','1','1447791548','1447803548','0','127.0.0.1','1','1447791548','1447791550','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('18','1','1447791560','1447803560','0','127.0.0.1','1','1447791560','1447791577','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('19','3','1447791588','1447803588','0','127.0.0.1','1','1447791588','1447791600','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('20','1','1447791603','1447803603','0','127.0.0.1','2','1447791692','1447791698','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('21','3','1447791707','1447803707','0','127.0.0.1','1','1447791707','1447791809','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('22','3','1447791817','1447803817','0','127.0.0.1','1','1447791817','1447791830','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('23','3','1447791848','1447803848','0','127.0.0.1','1','1447791848','1447791873','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('24','3','1447791910','1447803910','0','127.0.0.1','1','1447791910','1447792164','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('25','3','1447792226','1447804226','0','127.0.0.1','1','1447792226','1447792230','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('26','1','1447853398','1447865398','0','127.0.0.1','1','1447853398','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('27','1','1447865412','1447877412','0','127.0.0.1','1','1447865412','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('28','1','1447877431','1447889431','1','127.0.0.1','1','1447877431','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('29','1','1447944270','1447956270','0','127.0.0.1','1','1447944270','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('30','1','1447956361','1447968361','0','127.0.0.1','1','1447956361','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('31','1','1447968390','1447980390','1','127.0.0.1','1','1447968390','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('32','1','1447983157','1447995157','0','127.0.0.1','1','1447983157','1447983184','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('33','1','1448025843','1448037843','0','127.0.0.1','1','1448025843','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('34','1','1448037879','1448049879','1','127.0.0.1','1','1448037879','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('35','1','1448286396','1448298396','0','127.0.0.1','1','1448286396','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('36','1','1448302344','1448314344','0','127.0.0.1','1','1448302344','1448304648','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('37','1','1448304663','1448316663','0','127.0.0.1','1','1448304663','1448304690','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('38','3','1448304695','1448316695','0','127.0.0.1','1','1448304695','1448304776','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('39','1','1448304779','1448316779','0','127.0.0.1','1','1448304779','1448305028','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('40','3','1448305034','1448317034','0','127.0.0.1','1','1448305034','1448305042','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('41','1','1448305046','1448317046','0','127.0.0.1','1','1448305046','1448306716','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('42','3','1448305078','1448317078','1','127.0.0.1','1','1448305078','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('43','1','1448306741','1448318741','0','127.0.0.1','1','1448306741','1448309665','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('44','1','1448311340','1448323340','0','127.0.0.1','1','1448311340','1448311353','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('45','1','1448370235','1448382235','0','127.0.0.1','1','1448370235','1448370938','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('46','1','1448371836','1448383836','0','127.0.0.1','1','1448371836','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('47','1','1448383864','1448395864','0','127.0.0.1','1','1448383864','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('48','1','1448395873','1448407873','1','127.0.0.1','1','1448395873','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('49','1','1448407893','1448419893','0','127.0.0.1','1','1448407893','1448413604','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('50','3','1448413617','1448425617','0','127.0.0.1','1','1448413617','1448413691','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('51','3','1448413700','1448425700','0','127.0.0.1','1','1448413700','1448413712','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('52','1','1448413718','1448425718','0','127.0.0.1','1','1448413718','1448413747','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('53','3','1448413757','1448425757','0','127.0.0.1','1','1448413757','1448413793','127.0.0.1');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('54','1','1448457207','1448469207','0','127.0.0.1','1','1448457207','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('55','1','1448469656','1448481656','1','127.0.0.1','1','1448469656','','');
INSERT INTO `cruge_session` (`idsession`,`iduser`,`created`,`expire`,`status`,`ipaddress`,`usagecount`,`lastusage`,`logoutdate`,`ipaddressout`) VALUES
('56','1','1448482633','1448494633','1','127.0.0.1','1','1448482633','','');



-- -------------------------------------------
-- TABLE DATA cruge_system
-- -------------------------------------------
INSERT INTO `cruge_system` (`idsystem`,`name`,`largename`,`sessionmaxdurationmins`,`sessionmaxsameipconnections`,`sessionreusesessions`,`sessionmaxsessionsperday`,`sessionmaxsessionsperuser`,`systemnonewsessions`,`systemdown`,`registerusingcaptcha`,`registerusingterms`,`terms`,`registerusingactivation`,`defaultroleforregistration`,`registerusingtermslabel`,`registrationonlogin`) VALUES
('1','default','','200','10','1','-1','-1','0','0','0','0','','0','','','0');



-- -------------------------------------------
-- TABLE DATA cruge_user
-- -------------------------------------------
INSERT INTO `cruge_user` (`iduser`,`regdate`,`actdate`,`logondate`,`username`,`email`,`password`,`authkey`,`state`,`totalsessioncounter`,`currentsessioncounter`) VALUES
('1','','','1448482633','admin','admin@tucorreo.com','admin','','1','0','0');
INSERT INTO `cruge_user` (`iduser`,`regdate`,`actdate`,`logondate`,`username`,`email`,`password`,`authkey`,`state`,`totalsessioncounter`,`currentsessioncounter`) VALUES
('2','','','','invitado','invitado','nopassword','','1','0','0');
INSERT INTO `cruge_user` (`iduser`,`regdate`,`actdate`,`logondate`,`username`,`email`,`password`,`authkey`,`state`,`totalsessioncounter`,`currentsessioncounter`) VALUES
('3','1445615839','','1448413758','cargador1','walter86.79@gmail.com','111111','e1c9786bfb0395fc34fb0f6c4284bea9','1','0','0');
INSERT INTO `cruge_user` (`iduser`,`regdate`,`actdate`,`logondate`,`username`,`email`,`password`,`authkey`,`state`,`totalsessioncounter`,`currentsessioncounter`) VALUES
('4','1447162236','','1447162390','historico','walter86_79@hotmail.com','historico','f1d7660e9f66d67c634545fbc72a992a','1','0','0');



-- -------------------------------------------
-- TABLE DATA division
-- -------------------------------------------
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('1','A','1','Agricultura, ganadería, caza y actividades de servicios conexas');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('2','A','2','Silvicultura y extracción de madera');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('3','A','3','Pesca y acuicultura');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('4','B','5','Extracción de carbón de piedra y lignito');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('5','B','6','Extracción de petróleo crudo y gas natural');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('6','B','7','Extracción de minerales metalíferos');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('7','B','8','Explotación de otras minas y canteras');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('8','B','9','Actividades de servicios de apoyo para la explotación de minas y canteras');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('9','C','10','Elaboración de productos alimenticios');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('10','C','11','Elaboración de bebidas');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('11','C','12','Elaboración de productos de tabaco');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('12','C','13','Fabricación de productos textiles');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('13','C','14','Confección de prendas de vestir');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('14','C','15','Fabricación de productos de cuero y productos conexos');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('15','C','16','Produccióndemaderayfabricacióndeproductosdemaderaycorcho,exceptomuebles; fabricación de artículos de paja y de materiales trensables');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('16','C','17','Fabricación de papel y de productos de papel');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('17','C','18','Impresión y reproducción de grabaciones');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('18','C','19','Fabricación de coque y productos de la refinación del petróleo');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('19','C','20','Fabricación de sustancias y productos químicos');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('20','C','21','Fabricacióndeproductosfarmacéuticos,sustanciasquímicasmedicinalesyproductos botánicos de uso farmacéutico');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('21','C','22','Fabricación de productos de caucho y de plástico');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('22','C','23','Fabricación de otros productos minerales no metálicos');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('23','C','24','Fabricación de metales comunes');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('24','C','25','Fabricación de productos elaborados de metal, excepto maquinaria y equipo');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('25','C','26','Fabricación de productos de informática, electrónica y de óptica');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('26','C','27','Fabricación de equipo eléctrico');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('27','C','28','Fabricación de maquinaria y equipo n.c.p.');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('28','C','29','Fabricación de vehículos automotores, remolques y semirremolques');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('29','C','30','Fabricación de otros tipos de equipo de transporte');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('30','C','31','Fabricación de muebles');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('31','C','32','Otras industrias manufactureras');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('32','C','33','Reparación e instalación de maquinaria y equipo');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('33','D','35','Suministro de electricidad, gas, vapor y aire acondicionado');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('34','E','36','Captación, tratamiento y distribución de agua');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('35','E','37','Evacuación de aguas residuales');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('36','E','38','Recogida, tratamiento y eliminación de desechos; recuperación de materiales');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('37','E','39','Actividades de descontaminación y otros servicios de gestión de desechos');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('38','F','41','Construcción de edificios');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('39','F','42','Obras de ingeniería civil');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('40','F','43','Actividades especializadas de construcción');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('41','G','45','Comercioalpormayoryalpormenoryreparacióndevehículosautomotoresymotocicletas');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('42','G','46','Comercio al por mayor, excepto el de vehículos automotores y motocicletas');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('43','G','47','Comercio al por menor, excepto el de vehículos automotores y motocicletas');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('44','H','49','Transporte por vía terrestre y transporte por tuberías');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('45','H','50','Transporte por vía acuática');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('46','H','51','Transporte por vía aérea');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('47','H','52','Almacenamiento y actividades de apoyo al transporte');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('48','H','53','Actividades postales y de mensajería');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('49','I','55','Actividades de alojamiento');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('50','I','56','Actividades de servicio de comidas y bebidas');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('51','J','58','Actividades de edición');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('52','J','59','Actividadesdeproduccióndepelículascinematográficas,videosyprogramasdetelevisión, grabación de sonido y edición de música');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('53','J','60','Actividades de programación y difusión de radio y televisión');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('54','J','61','Telecomunicaciones');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('55','J','62','Actividades de programación, consultoría informática y actividades conexas');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('56','J','63','Actividades del servicio informativo');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('57','K','64','Servicios financieros');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('58','K','65','Servicios de seguros, reaseguros y fondos de pensiones');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('59','K','66','Actividades auxiliares de las actividades de servicios financieros');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('60','L','68','Actividades inmobiliarias');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('61','M','69','Actividades jurídicas y de contabilidad');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('62','M','70','Actividades de oficinas centrales; actividades de consultoría de gestión');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('63','M','71','Actividades de arquitectura e ingeniería; ensayos y análisis técnicos');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('64','M','72','Actividades de investigación científica y desarrollo');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('65','M','73','Servicios de publicidad y estudios de mercado');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('66','M','74','Otras actividades profesionales, científicas y técnicas');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('67','M','75','Actividades veterinarias');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('68','N','77','Actividades de alquiler y arrendamiento');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('69','N','78','Actividades de empleo');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('70','N','79','Actividadesdeagenciasdeviajes,operadoresturísticos,serviciosdereservasyactividades conexas');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('71','N','80','Actividades de seguridad e investigación');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('72','N','81','Actividades de servicios a edificios y de paisajismo');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('73','N','82','Actividadesadministrativasydeapoyodeoficinayotrasactividadesdeapoyoalasempresas');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('74','O','84','Administraciónpúblicayladefensa;planesdeseguridadsocialdeafiliaciónobligatoria');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('75','P','85','Educación');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('76','Q','86','Actividades de atención a la salud humana');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('77','Q','87','Servicios sociales con alojamiento relacionados con atención a la salud');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('78','Q','88','Servicios sociales sin alojamiento');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('79','R','90','Actividades creativas, artísticas y de entretenimiento ');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('80','R','91','Actividades de bibliotecas, archivos, museos y otras actividades culturales');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('81','R','92','Actividades de juegos de azar y apuestas');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('82','R','93','Actividades deportivas de esparcimiento y recreativas');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('83','S','94','Actividades de asociaciones');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('84','S','95','Reparación de computadores y de efectos personales y enseres domésticos');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('85','S','96','Otras actividades de servicios personales');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('86','T','97','Actividades de los hogares como empleadores de personal doméstico');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('87','T','98','Actividadesnodiferenciadasdeloshogarescomoproductoresdebienesyservicios para uso propio');
INSERT INTO `division` (`id`,`cod_seccion`,`cod_division`,`division`) VALUES
('88','U','99','Actividades de organizaciones y órganos extraterritoriales');



-- -------------------------------------------
-- TABLE DATA empresa
-- -------------------------------------------
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('3','nuevaempresa4','V173898149','10101011','10101','738','2','10000.00','20','caracas','6','66','209','0212-4813639','0212-4813639','walter86_79@hotmail.com','http://kkk.com','17389814j','8');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('4','nuevaempresa','V173898149','1010101','10101','738','2','10000.00','19','caracas','3','29','82','','02124813639','walter86_79@hotmail.com','walter.com','17389814','10');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('6','asociarladesde1','V173898149','1234','12333','352','2','98291922.00','7','caracas','14','236','637','1010','1010','walter86_79@hotmail.com','walter.com','173898148','12');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('7','probando otra empresa','V173898149','123456-1','123456','133','2','150000000.00','5','caracas','24','462','1133','02124813639','02124813639','walter86_79@hotmail.com','soulip.com','','8');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('8','nuevaempresa','V173898149','1010101','10101','738','2','10000.00','2','caracas','3','29','82','02124813639','02124813639','walter86_79@hotmail.com','walter.com','17389814','13');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('9','nuevaempresa','V173898149','1010101','10101','738','2','10000.00','11','caracas','3','29','82','02124813639-12121212','121212','walter86_79@hotmail.com','walter.com','17389814','14');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('11','probando identificacion laboral','J123456789','000001-123','1010','275','2','10100000.00','2','caracas','24','462','1127','02124813639-22121','1212121','walter86_79@hotmail.com','walter.com','17389814','8');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('12','nuevaempresa','V173898149','1010101','10101','738','2','10000.00','100','caracas','3','29','82','0212-4813639-0212-4813639','0212-4813639','walter86_79@hotmail.com','walter.com','17389814','18');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('13','nuevaempresa','V173898149','1010101','10101','738','2','10000.00','2','caracas','3','29','82','0212-4813639-0212-4813639','0212-4813639','walter86_79@hotmail.com','walter.com','17389814','21');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('14','sindicato2','V173898149','123456-1','1010','330','1','10000.00','19','caracas','6','69','227','0212-4813639-0212-4813639','02124813639','walter86_79@hotmail.com','walter.com','17389814','22');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('15','nuevaempresa','V173898149','1010101','10101','738','2','10000.00','20','caracas','3','29','82','0212-4813639-0212-4813639','0212-4813639','walter86_79@hotmail.com','walter.com','17389814','23');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('16','asociarladesde1','V173898149','123456-1','1010','427','2','150000000.00','2','caracas','2','14','38','0212-4813639-0212-4813639','0212-4813639','walter86_79@hotmail.com','walter.com','17389814','24');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('17','sindsicato4','V173898149','123456-12','1010','319','2','98291922.00','7','caracas','2','9','28','0212-4813639-0212-4813639','0212-4813639','walter86_79@hotmail.com','walter.com','17389814','25');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('18','sindsicato4','V173898149','123456-12','1010','319','2','98291922.00','19','caracas','2','9','28','0212-4813639-0212-4813639','0212-4813639','walter86_79@hotmail.com','walter.com','17389814','26');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('19','local','V173981489','123456-44','1010','352','2','1000101010.00','333','caracas','24','462','1130','0212-4813639','0212-4813639','walter86@hotmail.com','http://programacion.com','','27');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('20','nose','V173898149','123456-12','2','24','2','20202020202.00','5','caracas','24','462','1123','0212-4813639','0212-4813639','walter86_79@hotmail.com','http://programacion.com','123','28');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('21','empresa1','V173898149','123456-1','1010','178','2','10202102010.00','10','caracas, no se, no se 1220222','24','462','1119','0212-4813639-0424-1397303','0212-3992277','walter86_79@hotmail.com','http://kkk.com','','29');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('22','empresa real1','V173898149','123466-1','1010','18','2','10101010101.00','20','caracas','24','462','1118','0212-4813639','0212-4813639','walter86_79@hotmail.com','http://probando.com','nose','32');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('23','empresa2 de ll','V173898149','123446-1','1010','18','1','90939933.00','10','caracas','24','462','1123','0212-4813639','0212-4813639','walter86_79@hotmail.com','http://loco.com','nose','32');
INSERT INTO `empresa` (`id`,`razon_social`,`rif`,`identificacion_laboral`,`seguro_social`,`actividad_economica`,`sector`,`capital_empresa`,`nro_sucursales`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`fax`,`correo`,`web`,`rnc`,`cod_convencion`) VALUES
('24','empresa real1 con referencia2','V173898149','123466-1','1010','18','2','10101010101.00','2','caracas','24','462','1118','0212-4813639','0212-4813639','walter86_79@hotmail.com','http://probanco.com','nose','33');



-- -------------------------------------------
-- TABLE DATA estados
-- -------------------------------------------
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('1','Amazonas');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('2','Anzoátegui');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('3','Apure');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('4','Aragua');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('5','Barinas');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('6','Bolívar');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('7','Carabobo');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('8','Cojedes');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('9','Delta Amacuro');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('10','Falcón');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('11','Guárico');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('12','Lara');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('13','Mérida');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('14','Miranda');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('15','Monagas');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('16','Nueva Esparta');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('17','Portuguesa');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('18','Sucre');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('19','Táchira');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('20','Trujillo');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('21','Vargas');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('22','Yaracuy');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('23','Zulia');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('24','Distrito Capital');
INSERT INTO `estados` (`id_estado`,`estado`) VALUES
('25','Dependencias Federales');



-- -------------------------------------------
-- TABLE DATA grupo
-- -------------------------------------------
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('1','A','1','1','Cultivo de plantas no perennes');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('2','A','1','2','Cultivo de plantas perennes');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('3','A','1','3','Propagación de plantas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('4','A','1','4','Ganadería');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('5','A','1','5','Cultivodeproductosagrícolasencombinaciónconlacríadeanimales(unidaddeproducción agrícola mixta)');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('6','A','1','6','Actividades de apoyo a la agricultura y la ganadería y actividades posteriores a la cosecha');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('7','A','1','7','Caza ordinaria, mediante trampas y actividades de servicios conexas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('8','A','2','1','Silvicultura y otras actividades forestales');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('9','A','2','2','Extracción de madera');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('10','A','2','3','Recolección de productos forestales distintos de la madera');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('11','A','2','4','Servicios de apoyo a la silvicultura');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('12','A','3','1','Pesca');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('13','A','3','2','Acuicultura');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('14','B','5','1','Extracción de carbón de piedra');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('15','B','5','2','Extracción de lignito');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('16','B','6','1','Extracción de petróleo crudo');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('17','B','6','2','Extracción de gas natural');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('18','B','7','1','Extracción de minerales de hierro');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('19','B','7','2','Extracción de minerales metalíferos no ferrosos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('20','B','8','1','Extracción de piedra, arena y arcilla');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('21','B','8','9','Explotación de minas y canteras n.c.p.');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('22','B','9','1','Actividades de apoyo para la extracción de petróleo y gas natural');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('23','B','9','9','Actividades de apoyo para la explotación de otras minas y canteras');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('24','C','10','1','Elaboración y conservación de carne');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('25','C','10','2','Elaboración y conservación de pescado, crustáceos y moluscos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('26','C','10','3','Elaboración y conservación de frutas, legumbres y hortalizas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('27','C','10','4','Elaboración de aceites y grasas de origen vegetal y animal');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('28','C','10','5','Elaboración de productos lácteos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('29','C','10','6','Elaboracióndeproductosdemolinería,almidonesyproductosderivadosdelalmidón');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('30','C','10','7','Elaboración de otros productos alimenticios');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('31','C','10','8','Elaboración de alimentos balanceados para animales');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('32','C','11','0','Elaboración de bebidas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('33','C','12','0','Elaboración de productos de tabaco');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('34','C','13','1','Hilatura, tejedura y acabado de productos textiles');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('35','C','13','9','Fabricación de otros productos textiles');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('36','C','14','1','Confección de prendas de vestir, excepto prendas de piel y cuero');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('37','C','14','2','Fabricación de artículos de piel');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('38','C','14','3','Fabricación de artículos de punto y ganchillo');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('39','C','15','1','Curtidoyadobodecueros;fabricacióndemaletas,bolsosdemanoyartículosdetalabartería y guarnicionería, adobo y teñido de pieles');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('40','C','15','2','Fabricación de calzado, excepto ortopédico');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('41','C','16','1','Aserrado y acepilladura de madera (aserraderos)');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('42','C','16','2','Fabricación de productos de madera, corcho, paja y materiales trenzables');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('43','C','17','0','Fabricación de papel y de productos de papel');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('44','C','18','1','Impresión y actividades de servicios relacionadas con la impresión');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('45','C','18','2','Reproducción de grabaciones');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('46','C','19','1','Fabricación de productos de hornos de coque');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('47','C','19','2','Fabricación de productos de la refinación del petróleo');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('48','C','20','1','Fabricacióndesustanciasquímicasbásicas,deabonosycompuestosdenitrógenoyde plásticos y caucho sintético en formas primarias');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('49','C','20','2','Fabricación de otros productos químicos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('50','C','20','3','Fabricación de fibras artificiales');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('51','C','21','0','Fabricacióndeproductosfarmacéuticos,sustanciasquímicasmedicinalesyproductos botánicos de uso farmacéutico');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('52','C','22','1','Fabricación de productos de caucho');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('53','C','22','2','Fabricación de productos de plástico');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('54','C','23','1','Fabricación de vidrio y productos de vidrio');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('55','C','23','9','Fabricación de productos minerales no metálicos n.c.p.');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('56','C','24','1','Industrias básicas de hierro y acero');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('57','C','24','2','Fabricación de productos primarios de metales preciosos y otros metales no ferrosos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('58','C','24','3','Fundición de metales');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('59','C','25','1','Fabricacióndeproductosmetálicosparausoestructural,tanques,depósitos,recipientes de metal y generadores de vapor');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('60','C','25','2','Fabricación de armas y municiones');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('61','C','25','9','Fabricacióndeotrosproductoselaboradosdemetal;actividadesdeserviciosdetrabajo de metales');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('62','C','26','1','Fabricación de componentes y tableros electrónicos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('63','C','26','2','Fabricación de computadores y equipo periférico');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('64','C','26','3','Fabricación de equipo de comunicaciones');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('65','C','26','4','Fabricación de aparatos electrónicos de consumo');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('66','C','26','5','Fabricación de equipo de medición, prueba, navegación y control y de relojes');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('67','C','26','6','Fabricacióndeequipodeirradiaciónyequipoelectrónicodeusomédicoyterapéutico');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('68','C','26','7','Fabricación de instrumentos ópticos y equipo fotográfico');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('69','C','26','8','Fabricación de soportes magnéticos y ópticos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('70','C','27','1','Fabricacióndemotores,generadoresytransformadoreseléctricosyaparatosdedistribución y control de la energía eléctrica');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('71','C','27','2','Fabricación de pilas, baterías y acumuladores');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('72','C','27','3','Fabricación de cables y dispositivos de cableado');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('73','C','27','4','Fabricación de equipo eléctrico de iluminación');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('74','C','27','5','Fabricación de aparatos de uso doméstico');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('75','C','27','9','Fabricación de otros tipos de equipo eléctrico');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('76','C','28','1','Fabricación de maquinaria de uso general');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('77','C','28','2','Fabricación de maquinaria de uso especial');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('78','C','29','1','Fabricación de vehículos automotores');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('79','C','29','2','Fabricacióndecarroceríasparavehículosautomotores;fabricaciónderemolquesysemirremolques');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('80','C','29','3','Fabricación de partes, piezas y accesorios para vehículos automotores');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('81','C','30','1','Construcción de buques y otras embarcaciones');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('82','C','30','2','Fabricación de locomotoras y material rodante');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('83','C','30','3','Fabricación de aeronaves, naves espaciales y maquinaria conexa');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('84','C','30','4','Fabricación de vehículos militares de combate');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('85','C','30','9','Fabricación de equipo de transporte n.c.p.');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('86','C','31','0','Fabricación de muebles');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('87','C','32','1','Fabricación de joyas, bisutería y artículos conexos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('88','C','32','2','Fabricación de instrumentos musicales');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('89','C','32','3','Fabricación de artículos de deporte');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('90','C','32','4','Fabricación de juegos y juguetes');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('91','C','32','5','Fabricación de instrumentos y materiales médicos y odontológicos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('92','C','32','9','Otras industrias manufactureras n.c.p.');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('93','C','33','1','Reparación de productos elaborados de metal, maquinaria y equipo');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('94','C','33','2','Instalación de maquinaria y equipo industriales');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('95','D','35','1','Generación, transmisión y distribución de energía eléctrica');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('96','D','35','2','Producción de gas; distribución de combustibles gaseosos por tuberías');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('97','D','35','3','Suministro de vapor y de aire acondicionado');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('98','E','36','0','Captación, tratamiento y distribución de agua');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('99','E','37','0','Evacuación de aguas residuales');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('100','E','38','1','Recogida de desechos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('101','E','38','2','Tratamiento y eliminación de desechos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('102','E','38','3','Recuperación de materiales');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('103','E','39','0','Actividades de descontaminación y otros servicios de gestión de desechos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('104','F','41','0','Construcción de edificios');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('105','F','42','1','Construcción de carreteras, vías de ferrocarril, puentes y túneles');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('106','F','42','2','Construcción de proyectos de servicio público');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('107','F','42','9','Construcción de otras obras de ingeniería civil');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('108','F','43','1','Demolición y preparación del terreno');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('109','F','43','2','Instalacioneseléctricasydeplomeríayotrasinstalacionesparaobrasdeconstrucción');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('110','F','43','3','Terminación y acabado de edificios');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('111','F','43','9','Otras actividades especializadas de construcción');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('112','G','45','1','Venta de vehículos automotores');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('113','G','45','2','Mantenimiento y reparación de vehículos automotores');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('114','G','45','3','Venta de partes, piezas y accesorios para vehículos automotores');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('115','G','45','4','Venta, mantenimiento y reparación de motocicletas y sus partes, piezas y accesorios');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('116','G','46','1','Venta al por mayor a cambio de una retribución o por contrata');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('117','G','46','2','Venta al por mayor de materias primas agropecuarias y animales vivos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('118','G','46','3','Venta al por mayor de alimentos, bebidas y tabaco');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('119','G','46','4','Venta al por mayor de enseres domésticos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('120','G','46','5','Venta al por mayor de maquinaria, equipo y materiales');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('121','G','46','6','Otras actividades de venta al por mayor especializada');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('122','G','46','9','Venta al por mayor no especializada');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('123','G','47','1','Venta al por menor en comercios no especializados');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('124','G','47','2','Venta al por menor de alimentos, bebidas o tabaco en comercios especializados');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('125','G','47','3','Ventaalpormenordecombustiblesparavehículosautomotoresencomerciosespecializados');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('126','G','47','4','Ventaalpormenordeequipodeinformaciónydecomunicacionesencomerciosespecializados');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('127','G','47','5','Venta al por menor de otros enseres domésticos en comercios especializados');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('128','G','47','6','Ventaalpormenordeproductosculturalesyrecreativosencomerciosespecializados');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('129','G','47','7','Venta al por menor de otros productos en comercios especializados');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('130','G','47','8','Venta al por menor en puestos de venta y mercados');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('131','G','47','9','Venta al por menor no realizada en comercios, puestos de venta o mercados');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('132','H','49','1','Transporte por ferrocarril');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('133','H','49','2','Otras actividades de transporte por vía terrestre');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('134','H','49','3','Transporte por tuberías');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('135','H','50','1','Transporte marítimo y de cabotaje');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('136','H','50','2','Transporte por vías de navegación interiores');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('137','H','51','1','Transporte de pasajeros por vía aérea');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('138','H','51','2','Transporte de carga por vía aérea');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('139','H','52','1','Almacenamiento y depósito');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('140','H','52','2','Actividades de apoyo al transporte');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('141','H','53','1','Actividades postales');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('142','H','53','2','Actividades de mensajería');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('143','I','55','1','Actividades de alojamiento para estancias cortas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('144','I','55','2','Actividadesdecampamentos,parquesdevehículosderecreoyparquesdecaravanas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('145','I','55','9','Otras actividades de alojamiento');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('146','I','56','1','Actividades de restaurantes y de servicio móvil de comidas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('147','I','56','2','Suministro de comidas por encargo y otras actividades de servicio de comidas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('148','I','56','3','Actividades de servicio de bebidas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('149','J','58','1','Edición de libros y publicaciones periódicas y otras actividades de edición');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('150','J','58','2','Edición de programas informáticos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('151','J','59','1','Actividadesdeproduccióndepelículascinematográficas,videosyprogramasdetelevisión');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('152','J','59','2','Actividades de grabación de sonido y edición de música');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('153','J','60','1','Actividades programación y difusión de radio');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('154','J','60','2','Programación y transmisiones de televisión');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('155','J','61','1','Actividades de telecomunicaciones alámbricas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('156','J','61','2','Actividades de telecomunicaciones inalámbricas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('157','J','61','3','Actividades de telecomunicaciones por satélite');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('158','J','61','9','Otras actividades de telecomunicación n.c.p.');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('159','J','62','0','Actividades de programación, consultoría informática y actividades conexas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('160','J','63','1','Procesamiento de datos, hosting y actividades conexas, Portales Web');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('161','J','63','9','Otras actividades del servicio de informática');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('162','K','64','1','Servicios de intermediación financiera');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('163','K','64','2','Actividades de sociedades de cartera');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('164','K','64','3','Fondos y sociedades de inversión');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('165','K','64','9','Otras actividades de servicios financieros');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('166','K','65','1','Servicios de seguros');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('167','K','65','2','Reaseguros');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('168','K','65','3','Fondos de pensiones');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('169','K','66','1','Actividadesauxiliaresdelasactividadesdeserviciosfinancieros,exceptolasdeseguros reaseguros y fondos de pensiones');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('170','K','66','2','Actividades auxiliares de la actividad aseguradora y fondos de pensiones');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('171','K','66','3','Actividades de gestión de fondos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('172','L','68','1','Actividades inmobiliarias realizadas con bienes propios o arrendados');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('173','L','68','2','Actividades inmobiliarias realizadas a cambio de una retribución o por contrata');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('174','M','69','1','Actividades jurídicas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('175','M','69','2','Actividades de contabilidad, teneduría de libros y auditoría; consultoría fiscal');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('176','M','70','1','Actividades de oficinas centrales');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('177','M','70','2','Actividades de consultoría de gestión empresarial');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('178','M','71','1','Actividadesdearquitecturaeingenieríayactividadesconexasdeconsultoríatécnica');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('179','M','71','2','Actividades de servicios de ensayos y análisis técnicos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('180','M','72','1','Investigacionesydesarrolloexperimentalenelcampodelascienciasnaturalesylaingeniería');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('181','M','72','2','Investigacionesydesarrolloexperimentalenelcampodelascienciassocialesylashumanidades');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('182','M','73','1','Servicios de publicidad');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('183','M','73','2','Estudios de mercado y encuestas de opinión pública');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('184','M','74','1','Actividades especializadas de diseño');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('185','M','74','2','Actividades de fotografía');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('186','M','74','9','Otras actividades profesionales, científicas y técnicas n.c.p.');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('187','M','75','0','Actividades veterinarias');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('188','N','77','1','Alquiler y arrendamiento de vehículos automotores sin conductor');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('189','N','77','2','Alquiler y arrendamiento de efectos personales y enseres domésticos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('190','N','77','3','Alquiler y arrendamiento de activos tangibles y de maquinaria y equipo, sin operarios');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('191','N','77','4','Arrendamientodepropiedadintelectualyproductossimilares,exceptoobrasprotegidas por derechos de autor');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('192','N','78','1','Actividades de agencias de empleo');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('193','N','78','2','Actividades de agencias de empleo temporal');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('194','N','78','3','Otras actividades de dotación de recursos humanos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('195','N','79','1','Actividades de agencias de viajes y operadores turísticos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('196','N','79','9','Otros servicios de reservas y actividades conexas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('197','N','80','1','Actividades de seguridad privada');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('198','N','80','2','Actividades de servicios de sistemas de seguridad');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('199','N','80','3','Actividades de investigación');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('200','N','81','1','Actividades combinadas de apoyo a instalaciones');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('201','N','81','2','Actividades de limpieza');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('202','N','81','3','Actividades de paisajismo y servicios de mantenimiento conexos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('203','N','82','1','Actividades administrativas y de apoyo de oficina');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('204','N','82','2','Actividades de centros de llamadas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('205','N','82','3','Organización de convenciones y exposiciones comerciales');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('206','N','82','9','Actividades de servicios de apoyo a las empresas n.c.p.');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('207','O','84','1','AdministracióndelEstadoyaplicacióndelapolíticaeconómicaysocialdelacomunidad');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('208','O','84','2','Prestación de servicios a la comunidad en general');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('209','O','84','3','Actividades de planes de seguridad social de afiliación obligatoria');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('210','P','85','1','Educación inicial y primaria');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('211','P','85','2','Educación media');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('212','P','85','3','Educación universitaria');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('213','P','85','4','Otros tipos de enseñanza');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('214','P','85','5','Actividades de apoyo a la enseñanza');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('215','Q','86','1','Servicios hospitalarios');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('216','Q','86','2','Servicios médicos y otros especialistas en consultorios');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('217','Q','86','3','Servicios de laboratorios clínicos y de diagnóstico por imagen');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('218','Q','86','9','Otras actividades relacionadas con la salud humana n.c.p.');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('219','Q','87','1','Servicios sociales con alojamiento relacionados con atención a la salud');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('220','Q','87','2','Serviciossocialesconalojamientoparapersonascondiscapacidadintelectual,enfermedad mental o adicciones');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('221','Q','87','3','Serviciossocialesconalojamientoparapersonasmayoresypersonascondiscapacidad');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('222','Q','87','9','Otros servicios sociales con alojamiento n.c.p.');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('223','Q','88','1','Serviciossocialessinalojamientoparapersonasmayoresypersonascondiscapacidad');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('224','Q','88','9','Otros servicios sociales sin alojamiento');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('225','R','90','0','Actividades creativas, artísticas y de entretenimiento');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('226','R','91','0','Actividades de bibliotecas, archivos, museos y otras actividades culturales');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('227','R','92','0','Actividades de juegos de azar y apuestas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('228','R','93','1','Actividades deportivas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('229','R','93','2','Otras actividades de esparcimiento y recreativas');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('230','S','94','1','Actividades de asociaciones empresariales, profesionales y de empleadores');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('231','S','94','2','Actividades de sindicatos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('232','S','94','9','Actividades de otras asociaciones');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('233','S','95','1','Reparación de computadores y equipo de comunicaciones');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('234','S','95','2','Reparación de efectos personales y enseres domésticos');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('235','S','96','0','Otras actividades de servicios personales');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('236','T','97','0','Actividades de los hogares como empleadores de personal doméstico');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('237','T','98','1','Actividades no diferenciadas de los hogares como productores de bienes para uso propio');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('238','T','98','2','Actividadesnodiferenciadasdeloshogarescomoproductoresdeserviciosparausopropio');
INSERT INTO `grupo` (`id`,`cod_seccion`,`cod_division`,`codigo_grupo`,`grupo`) VALUES
('239','U','99','0','Actividades de organizaciones y órganos extraterritoriales');



-- -------------------------------------------
-- TABLE DATA inspectoria
-- -------------------------------------------
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('001','ACARIGUA','17');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('002','ALTAGRACIA DE ORITUCO','11');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('003','BARCELONA (Alberto Lovera)','2');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('004','BARINAS','5');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('005','BARQUISIMETO (Pio Tamayo)','12');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('006','BOBURES','23');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('007','BOCONÓ','20');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('008','CABIMAS','23');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('009','CAGUA (Carlos Arturo Pardo)','4');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('011','CALABOZO','11');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('012','ANACO','2');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('013','CARORA','12');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('014','CARÚPANO','18');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('015','CASIGUA','23');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('016','CAUCAGUA','14');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('017','CHARALLAVE','14');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('018','CIUDAD BOLIVAR','6');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('019','CIUDAD PIAR','6');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('020','CORO','10');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('021','CUMANÁ','18');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('022','DABAJURO','10');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('023','CENTRO','24');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('024','EL TIGRE','2');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('025','EL TOCUYO','12');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('026','EL VIGIA','13');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('027','ESTE','24');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('028','GUACARA (Batalla de Vigirima)','7');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('029','GUANARE','17');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('030','GUATIRE (J.R. Núñez Tenorio)','14');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('031','GUASDUALITO','3');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('032','GUASIPÁTI','6');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('033','GÜIRIA','18');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('034','HIGUEROTE','14');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('035','LA FRIA','19');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('036','LA GUAIRA','21');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('037','LA VICTORIA','4');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('039','LOS TEQUES','14');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('040','MACHIQUES','23');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('041','MANTECAL','3');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('042','MARACAIBO (Dr. Luis Gómez)','23');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('043','MARACAY','4');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('044','MATURIN','15');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('045','MENE GRANDE','23');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('046','MERIDA','13');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('047','PORLAMAR','16');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('048','PUERTO AYACUCHO','1');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('049','PUERTO CABELLO','7');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('050','PUERTO LA CRUZ','2');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('051','PTO ORDAZ (Alfredo Maneiro)','6');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('052','PUNTA DE MATA','15');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('053','FALCÓN (Alí Primera)','10');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('054','SAN ANTONIO','19');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('055','SAN CARLOS','8');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('056','SAN CRISTÓBAL (Cipriano Castro)','19');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('057','SAN FELIPE','22');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('058','SAN FERNANDO DE APURE','3');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('059','SAN FRANCISCO','23');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('060','SAN JUAN DE LOS MORROS','11');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('061','SAN RAFAEL EL MOJAN','23');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('062','SOCOPÓ','5');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('063','SANTA BÁRBARA DEL ZULIA','23');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('065','TIMOTES','19');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('066','TRUJILLO','20');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('067','TUCACAS','7');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('068','TUCUPITA','9');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('069','VALENCIA MICHELENA','7');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('070','VALERA','20');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('071','VALLE DE LA PASCUA','11');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('072','YARITAGUA','22');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('074','SAN FELIX','6');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('075','CIUDAD OJEDA LAGUNILLAS','23');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('078','BARQUISIMETO (Pedro Abarca)','12');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('079','SUR DON JULIO (Pedro ortega díaz)','24');
INSERT INTO `inspectoria` (`id`,`inspectoria`,`id_estado`) VALUES
('080','VALENCIA (Cesar Pipo Arteaga)','7');



-- -------------------------------------------
-- TABLE DATA municipios
-- -------------------------------------------
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('1','1','Alto Orinoco');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('2','1','Atabapo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('3','1','Atures');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('4','1','Autana');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('5','1','Manapiare');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('6','1','Maroa');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('7','1','Río Negro');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('8','2','Anaco');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('9','2','Aragua');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('10','2','Manuel Ezequiel Bruzual');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('11','2','Diego Bautista Urbaneja');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('12','2','Fernando Peñalver');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('13','2','Francisco Del Carmen Carvajal');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('14','2','General Sir Arthur McGregor');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('15','2','Guanta');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('16','2','Independencia');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('17','2','José Gregorio Monagas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('18','2','Juan Antonio Sotillo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('19','2','Juan Manuel Cajigal');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('20','2','Libertad');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('21','2','Francisco de Miranda');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('22','2','Pedro María Freites');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('23','2','Píritu');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('24','2','San José de Guanipa');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('25','2','San Juan de Capistrano');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('26','2','Santa Ana');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('27','2','Simón Bolívar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('28','2','Simón Rodríguez');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('29','3','Achaguas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('30','3','Biruaca');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('31','3','Muñóz');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('32','3','Páez');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('33','3','Pedro Camejo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('34','3','Rómulo Gallegos');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('35','3','San Fernando');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('36','4','Atanasio Girardot');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('37','4','Bolívar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('38','4','Camatagua');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('39','4','Francisco Linares Alcántara');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('40','4','José Ángel Lamas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('41','4','José Félix Ribas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('42','4','José Rafael Revenga');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('43','4','Libertador');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('44','4','Mario Briceño Iragorry');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('45','4','Ocumare de la Costa de Oro');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('46','4','San Casimiro');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('47','4','San Sebastián');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('48','4','Santiago Mariño');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('49','4','Santos Michelena');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('50','4','Sucre');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('51','4','Tovar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('52','4','Urdaneta');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('53','4','Zamora');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('54','5','Alberto Arvelo Torrealba');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('55','5','Andrés Eloy Blanco');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('56','5','Antonio José de Sucre');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('57','5','Arismendi');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('58','5','Barinas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('59','5','Bolívar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('60','5','Cruz Paredes');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('61','5','Ezequiel Zamora');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('62','5','Obispos');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('63','5','Pedraza');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('64','5','Rojas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('65','5','Sosa');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('66','6','Caroní');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('67','6','Cedeño');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('68','6','El Callao');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('69','6','Gran Sabana');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('70','6','Heres');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('71','6','Piar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('72','6','Angostura (Raúl Leoni)');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('73','6','Roscio');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('74','6','Sifontes');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('75','6','Sucre');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('76','6','Padre Pedro Chien');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('77','7','Bejuma');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('78','7','Carlos Arvelo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('79','7','Diego Ibarra');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('80','7','Guacara');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('81','7','Juan José Mora');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('82','7','Libertador');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('83','7','Los Guayos');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('84','7','Miranda');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('85','7','Montalbán');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('86','7','Naguanagua');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('87','7','Puerto Cabello');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('88','7','San Diego');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('89','7','San Joaquín');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('90','7','Valencia');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('91','8','Anzoátegui');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('92','8','Tinaquillo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('93','8','Girardot');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('94','8','Lima Blanco');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('95','8','Pao de San Juan Bautista');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('96','8','Ricaurte');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('97','8','Rómulo Gallegos');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('98','8','San Carlos');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('99','8','Tinaco');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('100','9','Antonio Díaz');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('101','9','Casacoima');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('102','9','Pedernales');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('103','9','Tucupita');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('104','10','Acosta');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('105','10','Bolívar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('106','10','Buchivacoa');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('107','10','Cacique Manaure');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('108','10','Carirubana');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('109','10','Colina');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('110','10','Dabajuro');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('111','10','Democracia');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('112','10','Falcón');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('113','10','Federación');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('114','10','Jacura');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('115','10','José Laurencio Silva');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('116','10','Los Taques');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('117','10','Mauroa');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('118','10','Miranda');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('119','10','Monseñor Iturriza');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('120','10','Palmasola');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('121','10','Petit');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('122','10','Píritu');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('123','10','San Francisco');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('124','10','Sucre');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('125','10','Tocópero');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('126','10','Unión');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('127','10','Urumaco');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('128','10','Zamora');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('129','11','Camaguán');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('130','11','Chaguaramas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('131','11','El Socorro');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('132','11','José Félix Ribas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('133','11','José Tadeo Monagas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('134','11','Juan Germán Roscio');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('135','11','Julián Mellado');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('136','11','Las Mercedes');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('137','11','Leonardo Infante');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('138','11','Pedro Zaraza');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('139','11','Ortíz');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('140','11','San Gerónimo de Guayabal');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('141','11','San José de Guaribe');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('142','11','Santa María de Ipire');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('143','11','Sebastián Francisco de Miranda');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('144','12','Andrés Eloy Blanco');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('145','12','Crespo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('146','12','Iribarren');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('147','12','Jiménez');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('148','12','Morán');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('149','12','Palavecino');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('150','12','Simón Planas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('151','12','Torres');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('152','12','Urdaneta');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('179','13','Alberto Adriani');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('180','13','Andrés Bello');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('181','13','Antonio Pinto Salinas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('182','13','Aricagua');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('183','13','Arzobispo Chacón');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('184','13','Campo Elías');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('185','13','Caracciolo Parra Olmedo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('186','13','Cardenal Quintero');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('187','13','Guaraque');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('188','13','Julio César Salas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('189','13','Justo Briceño');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('190','13','Libertador');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('191','13','Miranda');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('192','13','Obispo Ramos de Lora');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('193','13','Padre Noguera');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('194','13','Pueblo Llano');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('195','13','Rangel');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('196','13','Rivas Dávila');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('197','13','Santos Marquina');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('198','13','Sucre');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('199','13','Tovar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('200','13','Tulio Febres Cordero');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('201','13','Zea');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('223','14','Acevedo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('224','14','Andrés Bello');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('225','14','Baruta');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('226','14','Brión');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('227','14','Buroz');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('228','14','Carrizal');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('229','14','Chacao');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('230','14','Cristóbal Rojas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('231','14','El Hatillo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('232','14','Guaicaipuro');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('233','14','Independencia');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('234','14','Lander');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('235','14','Los Salias');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('236','14','Páez');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('237','14','Paz Castillo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('238','14','Pedro Gual');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('239','14','Plaza');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('240','14','Simón Bolívar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('241','14','Sucre');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('242','14','Urdaneta');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('243','14','Zamora');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('258','15','Acosta');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('259','15','Aguasay');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('260','15','Bolívar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('261','15','Caripe');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('262','15','Cedeño');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('263','15','Ezequiel Zamora');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('264','15','Libertador');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('265','15','Maturín');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('266','15','Piar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('267','15','Punceres');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('268','15','Santa Bárbara');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('269','15','Sotillo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('270','15','Uracoa');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('271','16','Antolín del Campo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('272','16','Arismendi');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('273','16','García');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('274','16','Gómez');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('275','16','Maneiro');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('276','16','Marcano');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('277','16','Mariño');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('278','16','Península de Macanao');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('279','16','Tubores');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('280','16','Villalba');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('281','16','Díaz');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('282','17','Agua Blanca');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('283','17','Araure');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('284','17','Esteller');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('285','17','Guanare');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('286','17','Guanarito');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('287','17','Monseñor José Vicente de Unda');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('288','17','Ospino');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('289','17','Páez');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('290','17','Papelón');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('291','17','San Genaro de Boconoíto');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('292','17','San Rafael de Onoto');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('293','17','Santa Rosalía');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('294','17','Sucre');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('295','17','Turén');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('296','18','Andrés Eloy Blanco');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('297','18','Andrés Mata');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('298','18','Arismendi');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('299','18','Benítez');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('300','18','Bermúdez');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('301','18','Bolívar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('302','18','Cajigal');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('303','18','Cruz Salmerón Acosta');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('304','18','Libertador');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('305','18','Mariño');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('306','18','Mejía');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('307','18','Montes');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('308','18','Ribero');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('309','18','Sucre');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('310','18','Valdéz');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('341','19','Andrés Bello');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('342','19','Antonio Rómulo Costa');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('343','19','Ayacucho');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('344','19','Bolívar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('345','19','Cárdenas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('346','19','Córdoba');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('347','19','Fernández Feo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('348','19','Francisco de Miranda');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('349','19','García de Hevia');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('350','19','Guásimos');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('351','19','Independencia');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('352','19','Jáuregui');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('353','19','José María Vargas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('354','19','Junín');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('355','19','Libertad');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('356','19','Libertador');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('357','19','Lobatera');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('358','19','Michelena');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('359','19','Panamericano');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('360','19','Pedro María Ureña');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('361','19','Rafael Urdaneta');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('362','19','Samuel Darío Maldonado');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('363','19','San Cristóbal');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('364','19','Seboruco');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('365','19','Simón Rodríguez');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('366','19','Sucre');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('367','19','Torbes');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('368','19','Uribante');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('369','19','San Judas Tadeo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('370','20','Andrés Bello');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('371','20','Boconó');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('372','20','Bolívar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('373','20','Candelaria');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('374','20','Carache');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('375','20','Escuque');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('376','20','José Felipe Márquez Cañizalez');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('377','20','Juan Vicente Campos Elías');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('378','20','La Ceiba');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('379','20','Miranda');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('380','20','Monte Carmelo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('381','20','Motatán');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('382','20','Pampán');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('383','20','Pampanito');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('384','20','Rafael Rangel');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('385','20','San Rafael de Carvajal');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('386','20','Sucre');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('387','20','Trujillo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('388','20','Urdaneta');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('389','20','Valera');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('390','21','Vargas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('391','22','Arístides Bastidas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('392','22','Bolívar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('407','22','Bruzual');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('408','22','Cocorote');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('409','22','Independencia');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('410','22','José Antonio Páez');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('411','22','La Trinidad');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('412','22','Manuel Monge');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('413','22','Nirgua');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('414','22','Peña');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('415','22','San Felipe');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('416','22','Sucre');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('417','22','Urachiche');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('418','22','José Joaquín Veroes');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('441','23','Almirante Padilla');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('442','23','Baralt');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('443','23','Cabimas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('444','23','Catatumbo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('445','23','Colón');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('446','23','Francisco Javier Pulgar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('447','23','Páez');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('448','23','Jesús Enrique Losada');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('449','23','Jesús María Semprún');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('450','23','La Cañada de Urdaneta');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('451','23','Lagunillas');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('452','23','Machiques de Perijá');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('453','23','Mara');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('454','23','Maracaibo');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('455','23','Miranda');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('456','23','Rosario de Perijá');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('457','23','San Francisco');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('458','23','Santa Rita');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('459','23','Simón Bolívar');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('460','23','Sucre');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('461','23','Valmore Rodríguez');
INSERT INTO `municipios` (`id_municipio`,`id_estado`,`municipio`) VALUES
('462','24','Libertador');



-- -------------------------------------------
-- TABLE DATA nivel_educativo
-- -------------------------------------------
INSERT INTO `nivel_educativo` (`id`,`cod_interno`,`descripcion_nivel`) VALUES
('1','01','No Sabe');
INSERT INTO `nivel_educativo` (`id`,`cod_interno`,`descripcion_nivel`) VALUES
('2','02','Ninguno');
INSERT INTO `nivel_educativo` (`id`,`cod_interno`,`descripcion_nivel`) VALUES
('3','03','Inicial(Preescolar)');
INSERT INTO `nivel_educativo` (`id`,`cod_interno`,`descripcion_nivel`) VALUES
('4','04','Primaria(1-6)');
INSERT INTO `nivel_educativo` (`id`,`cod_interno`,`descripcion_nivel`) VALUES
('5','05','Secundaria (1-5)(6)');
INSERT INTO `nivel_educativo` (`id`,`cod_interno`,`descripcion_nivel`) VALUES
('6','06','Técnico Superior');
INSERT INTO `nivel_educativo` (`id`,`cod_interno`,`descripcion_nivel`) VALUES
('7','07','Universitario');



-- -------------------------------------------
-- TABLE DATA nomina
-- -------------------------------------------
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('830','3','Acosta Bello, Joel Antonio','19667073','V','Venezuela','Valencia','M','22','S','05','0','Operador 3','0','1','3','0','0','0.00','81.90','0.00','106.47','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('831','3','Aray Vitapaz, Brayan José','19479129','V','Venezuela','Valencia','M','22','S','05','0','Operador 3','0','1','4','0','0','0.00','81.89','0.00','106.46','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('832','3','Arias Marcano, Yelika Andreina','14495920','V','Venezuela','Caracas','F','32','C','07','0','Coord Calidad Y Procesos','0','1','3','0','0','5532.12','0.00','7191.76','0.00','1','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('833','3','Arias Rincón, Oscar José','18412958','V','Venezuela','Valencia','M','26','S','06','0','Coord.De Seguridad Y Salud Laboral','0','0','3','0','0','3500.00','0.00','3500.00','0.00','2','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('834','3','Arzola Ron, Omaira De Jesús','7127124','V','Venezuela','Valencia','F','53','S','05','0','Operador 1','0','5','5','0','0','0.00','111.64','0.00','145.13','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('835','3','Betancourt Yanez, Dilcia Del Carmen','9403674','V','Venezuela','San Juan De Los Morros','F','44','S','05','0','Lider Calidad 2','0','4','6','0','0','3418.33','0.00','4443.83','0.00','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('836','3','Cabrera Rodríguez, Resbel Antonio','20950942','V','Venezuela','San Juan De Los Morros','M','18','S','05','0','Operador 3','0','0','2','0','0','0.00','59.35','0.00','106.46','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('837','3','Campos Rodríguez, Regino','6697264','V','Venezuela','Guarico','M','49','S','05','0','Operador 2','0','4','6','0','0','0.00','110.01','0.00','143.01','2','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('838','3','Carrero Guzmán, Jairo Antonio','20382854','V','Venezuela','Valencia','M','20','S','01','0','Operador 3','0','1','3','0','0','0.00','81.90','0.00','106.47','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('839','3','Correa Correa, Wilmer','15684169','V','Venezuela','Caracas','M','32','S','05','0','Chofer 2','0','4','7','0','0','0.00','120.31','0.00','156.40','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('840','3','Fernandes Rodríguez, José Alexander','14303141','V','Venezuela','Guacara','M','37','S','05','0','Aux.Serv.Generales 3','0','1','3','0','0','0.00','81.90','0.00','106.47','1','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('841','3','Figueredo Díaz, Abraham David','9862027','V','Venezuela','Valencia','M','46','S','05','0','Lider De Producci?n 2','0','1','5','0','0','3200.00','0.00','4160.00','0.00','2','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('842','3','García Matute, Carlos Eduardo','20081131','V','Venezuela','Valencia','M','24','S','05','0','Lider Calidad 2','0','2','7','0','0','3389.10','0.00','4405.83','0.00','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('843','3','González César, Carlos Luis','14819080','V','Venezuela','Valencia','M','33','S','05','0','Operador 3','0','1','4','0','0','0.00','81.89','0.00','109.64','4','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('844','3','González Senoco, Omar Alexander','12522371','V','Venezuela','Valencia','M','36','S','05','0','Operador 3','0','1','1','0','0','0.00','81.90','0.00','106.47','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('845','3','Guerrero Flores, Oliver De Jesus','19602230','V','Venezuela','Trujillo','M','25','S','05','0','Operador 3','0','1','2','0','0','0.00','81.90','0.00','106.46','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('846','3','Hernández Crespo, Wilmer Antonio','17956886','V','Venezuela','Valencia','M','29','S','05','0','Operador 3','0','1','4','0','0','0.00','81.89','0.00','106.46','3','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('847','3','Hernandez Peña, Alixon Carolina','12102386','V','Venezuela','Valencia','F','38','C','05','0','Lider De Producci?n','0','2','8','0','0','3449.82','0.00','4484.77','0.00','2','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('848','3','Hernández Perozo, Iris Marbella','13723399','V','Venezuela','Coro','F','34','S','05','0','Lider Calidad 2','0','4','5','0','0','3634.43','0.00','4724.76','0.00','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('849','3','Isambertt Díaz, Hendrikson Manuel','14181858','V','Venezuela','Maracaibo','M','33','S','05','0','Operador 3','0','1','3','0','0','0.00','81.90','0.00','106.47','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('850','3','Leal Da Costa, José Jhon','12481902','V','Venezuela','Caracas','M','36','S','05','0','Coord.Mantenimiento 2','0','4','9','0','0','3995.55','0.00','5194.22','0.00','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('851','3','Llovera Acosta, Mayda Elena','14186987','V','Venezuela','Valencia','F','32','S','06','0','Electrom?canico','0','1','3','0','0','3630.00','0.00','4719.00','0.00','1','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('852','3','Lozada Chinchilla, David Orlando','22009154','V','Venezuela','Valencia','M','19','S','05','0','Aprendiz Ince','0','0','11','0','0','1323.86','0.00','1323.86','0.00','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('853','3','Maldonado Aparicio, Natasha Vanessa','14819405','V','Venezuela','Valencia','F','32','S','06','0','Coord.Pcp/Compras','0','7','6','0','0','4497.71','0.00','5847.02','0.00','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('854','3','Millano Olivera, Wuilmen Antonio','15975376','V','Venezuela','Caracas','M','29','S','05','0','Operador 3','0','0','3','0','0','0.00','81.90','0.00','81.90','2','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('855','3','Mirabal Romero, Freddy Roger','8847435','V','Venezuela','Valencia','M','46','S','05','0','Auxiliar De Alm?cen 3','0','1','6','0','0','0.00','81.90','0.00','109.63','2','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('856','3','Molina Plaza, Frank Gregrio','18500489','V','Venezuela','Valencia','M','25','S','05','0','Electrom?canico 2','0','1','2','0','0','3000.00','0.00','3.90','0.00','1','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('857','3','Ochoa Rodriguez, José Gregorio','8673908','V','Venezuela','Valencia','M','53','S','05','0','Operador 2','0','4','1','0','0','0.00','105.10','0.00','136.63','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('858','3','Oliveros Granados, Jesus Rafael','13618300','V','Venezuela','Maracay','M','33','C','07','0','Jefe De Producci?n','0','1','4','0','0','6655.00','0.00','8651.50','0.00','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('859','3','Osabarrio Botello, Susana','15529327','V','Venezuela','Valencia','F','32','S','07','0','Coord.De Recursos Humanos','0','1','6','0','0','5183.64','0.00','6738.73','0.00','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('860','3','Pacheco Rivero, Pedro Antonio','23742497','V','Venezuela','Trujillo','M','19','S','05','0','Operador 2','0','1','3','0','0','0.00','88.54','0.00','115.10','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('861','3','Peraza Arraez, Osmar Hernan','17553105','V','Venezuela','Valencia','M','27','S','05','0','Operador 3','0','1','2','0','0','0.00','81.90','0.00','106.46','6','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('862','3','Pérez, José Luis','12310091','V','Venezuela','Valencia','M','41','C','05','0','Aux.Serv.Generales 3','0','1','3','0','0','0.00','81.90','0.00','106.47','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('863','3','Pérez Escalona, Gustavo Adolfo','8846297','V','Venezuela','Valencia','M','47','S','05','0','Supervisor De Producci?n','0','1','8','0','0','5081.67','0.00','6606.17','0.00','3','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('864','3','Perez Pinto, Javier Alejandro','17778944','V','Venezuela','Valencia','M','26','S','05','0','Operador 3','0','1','2','0','0','0.00','81.90','0.00','106.46','1','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('865','3','Plasencia Salazar, José Federico','22740182','V','Venezuela','Puerto Ordaz','M','20','S','05','0','Operador 3','0','1','1','0','0','0.00','81.90','0.00','106.47','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('866','3','Primera Nieves, Pablo José','13103016','V','Venezuela','Valencia','M','36','S','05','0','Operador 3','0','1','1','0','0','0.00','81.90','0.00','106.47','1','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('867','3','Quezada Hernández, Alexander Rafael','7124495','V','Venezuela','Valencia','M','42','S','06','0','Coord Mantenimiento','0','1','6','0','0','6708.24','0.00','8720.71','0.00','2','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('868','3','Quintero Rodríguez, Jesús Alexander','23426565','V','Venezuela','Valencia','M','21','S','05','0','Operador 3','0','0','3','0','0','0.00','81.90','0.00','81.90','1','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('869','3','Quintero Zavarce, Zuleima Del Carmen','9633381','V','Venezuela','Coro','F','50','D','05','0','Aux.Serv.Generales 2','0','7','10','0','0','0.00','94.35','0.00','122.66','6','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('870','3','Requena, Auribeth Yadira','13046909','V','Venezuela','Valencia','F','39','S','05','0','Asistente De Operaciones','0','1','5','0','0','2782.77','0.00','3617.60','0.00','1','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('871','3','Rivas Rodríguez, José Javier','19997004','V','Venezuela','Maracay','M','25','S','05','0','Aux.Serv.Generales 2','0','1','4','0','0','0.00','81.89','0.00','106.46','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('872','3','Rodríguez, Yepzi Lisbeth','10059762','V','Venezuela','Valencia','F','41','C','05','0','Operador 2','0','4','7','0','0','0.00','110.01','0.00','143.01','3','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('873','3','Romero Bolívar, Carlos Javier','24295242','V','Venezuela','Valencia','M','21','S','05','0','Auditor 2','0','1','4','0','0','0.00','88.55','0.00','115.12','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('874','3','Rondón Saavedra, Jorge Daniel','20731635','V','Venezuela','Valencia','M','18','S','05','0','Aprendiz Ince','0','0','11','0','0','1323.86','0.00','1323.86','0.00','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('875','3','Salom Herrera, Felipe Antonio','15652960','V','Venezuela','Valencia','M','31','S','05','0','Operador 3','0','1','3','0','0','0.00','81.90','0.00','106.47','1','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('876','3','Torrealba Acosta, Miguel Angel','16401991','V','Venezuela','Valencia','M','28','S','05','0','Operador 3','0','1','2','0','0','0.00','81.90','0.00','106.47','2','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('877','3','Tortolero Morloy, Carlos Eduardo','18501659','V','Venezuela','Valencia','M','25','S','05','0','Operador 3','0','1','2','0','0','0.00','81.90','0.00','106.47','2','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('878','3','Zarate Campos, Jonathan José','17807331','V','Venezuela','Valencia','M','25','S','05','0','Coord.Producci?n','0','5','6','0','0','4672.14','0.00','6073.78','0.00','0','8','6');
INSERT INTO `nomina` (`id`,`id_empresa`,`nombres`,`cedula`,`nacionalidad`,`pais_origen`,`lugar_nacimiento`,`sexo`,`edad`,`estado_civil`,`nivel_educativo`,`grado_anio_aprobado`,`oficio_dentro_establecimiento`,`codigo_ocupacion`,`tiempo_serv_establecimiento_anios`,`tiempo_serv_establecimiento_meses`,`tiempo_ejerciendo_profesion_anios`,`tiempo_ejerciendo_profesion_meses`,`remuneracion_antes_contra_empleado`,`remuneracion_antes_contra_obrero`,`remuneracion_despues_contra_empleado`,`remuneracion_despues_contra_obrero`,`carga_familiar`,`cod_convencion`,`id_sindicato`) VALUES
('879','3','Zerpa Rodríguez, José Fernando','12568645','V','Venezuela','Valencia','M','35','C','07','0','Supervisor Materiales','0','2','4','0','0','8121.76','0.00','10558.29','0.00','1','8','6');



-- -------------------------------------------
-- TABLE DATA nomina_tipo_sindicato
-- -------------------------------------------
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('1','1','830','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('2','1','831','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('3','1','832','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('4','1','833','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('5','1','834','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('6','1','835','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('7','1','836','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('8','1','837','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('9','1','838','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('10','1','839','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('11','1','840','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('12','1','841','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('13','1','842','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('14','1','843','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('15','1','844','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('16','1','845','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('17','1','846','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('18','1','847','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('19','1','848','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('20','1','849','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('21','1','850','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('22','1','851','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('23','1','852','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('24','1','853','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('25','1','854','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('26','1','855','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('27','1','856','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('28','1','857','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('29','1','858','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('30','1','859','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('31','1','860','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('32','1','861','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('33','1','862','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('34','1','863','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('35','1','864','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('36','1','865','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('37','1','866','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('38','1','867','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('39','1','868','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('40','1','869','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('41','1','870','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('42','1','871','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('43','1','872','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('44','1','873','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('45','1','874','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('46','1','875','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('47','1','876','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('48','1','877','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('49','1','878','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('50','1','879','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('51','2','830','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('52','2','831','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('53','2','832','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('54','2','833','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('55','2','834','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('56','2','835','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('57','2','836','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('58','2','837','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('59','2','838','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('60','2','839','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('61','2','840','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('62','2','841','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('63','2','842','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('64','2','843','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('65','2','844','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('66','2','845','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('67','2','846','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('68','2','847','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('69','2','848','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('70','2','849','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('71','2','850','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('72','2','851','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('73','2','852','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('74','2','853','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('75','2','854','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('76','2','855','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('77','2','856','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('78','2','857','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('79','2','858','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('80','2','859','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('81','2','860','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('82','2','861','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('83','2','862','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('84','2','863','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('85','2','864','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('86','2','865','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('87','2','866','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('88','2','867','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('89','2','868','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('90','2','869','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('91','2','870','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('92','2','871','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('93','2','872','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('94','2','873','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('95','2','874','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('96','2','875','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('97','2','876','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('98','2','877','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('99','2','878','3');
INSERT INTO `nomina_tipo_sindicato` (`id`,`tipo_sindicato`,`id_nomina`,`cod_convencion_nomina`) VALUES
('100','2','879','3');



-- -------------------------------------------
-- TABLE DATA parroquias
-- -------------------------------------------
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1','1','Alto Orinoco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('2','1','Huachamacare Acanaña');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('3','1','Marawaka Toky Shamanaña');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('4','1','Mavaka Mavaka');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('5','1','Sierra Parima Parimabé');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('6','2','Ucata Laja Lisa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('7','2','Yapacana Macuruco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('8','2','Caname Guarinuma');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('9','3','Fernando Girón Tovar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('10','3','Luis Alberto Gómez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('11','3','Pahueña Limón de Parhueña');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('12','3','Platanillal Platanillal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('13','4','Samariapo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('14','4','Sipapo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('15','4','Munduapo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('16','4','Guayapo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('17','5','Alto Ventuari');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('18','5','Medio Ventuari');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('19','5','Bajo Ventuari');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('20','6','Victorino');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('21','6','Comunidad');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('22','7','Casiquiare');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('23','7','Cocuy');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('24','7','San Carlos de Río Negro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('25','7','Solano');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('26','8','Anaco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('27','8','San Joaquín');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('28','9','Cachipo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('29','9','Aragua de Barcelona');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('30','11','Lechería');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('31','11','El Morro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('32','12','Puerto Píritu');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('33','12','San Miguel');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('34','12','Sucre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('35','13','Valle de Guanape');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('36','13','Santa Bárbara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('37','14','El Chaparro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('38','14','Tomás Alfaro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('39','14','Calatrava');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('40','15','Guanta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('41','15','Chorrerón');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('42','16','Mamo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('43','16','Soledad');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('44','17','Mapire');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('45','17','Piar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('46','17','Santa Clara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('47','17','San Diego de Cabrutica');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('48','17','Uverito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('49','17','Zuata');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('50','18','Puerto La Cruz');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('51','18','Pozuelos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('52','19','Onoto');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('53','19','San Pablo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('54','20','San Mateo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('55','20','El Carito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('56','20','Santa Inés');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('57','20','La Romereña');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('58','21','Atapirire');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('59','21','Boca del Pao');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('60','21','El Pao');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('61','21','Pariaguán');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('62','22','Cantaura');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('63','22','Libertador');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('64','22','Santa Rosa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('65','22','Urica');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('66','23','Píritu');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('67','23','San Francisco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('68','24','San José de Guanipa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('69','25','Boca de Uchire');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('70','25','Boca de Chávez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('71','26','Pueblo Nuevo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('72','26','Santa Ana');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('73','27','Bergatín');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('74','27','Caigua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('75','27','El Carmen');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('76','27','El Pilar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('77','27','Naricual');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('78','27','San Crsitóbal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('79','28','Edmundo Barrios');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('80','28','Miguel Otero Silva');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('81','29','Achaguas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('82','29','Apurito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('83','29','El Yagual');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('84','29','Guachara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('85','29','Mucuritas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('86','29','Queseras del medio');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('87','30','Biruaca');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('88','31','Bruzual');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('89','31','Mantecal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('90','31','Quintero');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('91','31','Rincón Hondo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('92','31','San Vicente');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('93','32','Guasdualito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('94','32','Aramendi');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('95','32','El Amparo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('96','32','San Camilo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('97','32','Urdaneta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('98','33','San Juan de Payara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('99','33','Codazzi');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('100','33','Cunaviche');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('101','34','Elorza');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('102','34','La Trinidad');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('103','35','San Fernando');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('104','35','El Recreo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('105','35','Peñalver');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('106','35','San Rafael de Atamaica');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('107','36','Pedro José Ovalles');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('108','36','Joaquín Crespo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('109','36','José Casanova Godoy');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('110','36','Madre María de San José');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('111','36','Andrés Eloy Blanco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('112','36','Los Tacarigua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('113','36','Las Delicias');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('114','36','Choroní');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('115','37','Bolívar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('116','38','Camatagua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('117','38','Carmen de Cura');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('118','39','Santa Rita');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('119','39','Francisco de Miranda');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('120','39','Moseñor Feliciano González');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('121','40','Santa Cruz');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('122','41','José Félix Ribas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('123','41','Castor Nieves Ríos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('124','41','Las Guacamayas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('125','41','Pao de Zárate');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('126','41','Zuata');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('127','42','José Rafael Revenga');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('128','43','Palo Negro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('129','43','San Martín de Porres');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('130','44','El Limón');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('131','44','Caña de Azúcar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('132','45','Ocumare de la Costa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('133','46','San Casimiro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('134','46','Güiripa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('135','46','Ollas de Caramacate');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('136','46','Valle Morín');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('137','47','San Sebastían');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('138','48','Turmero');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('139','48','Arevalo Aponte');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('140','48','Chuao');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('141','48','Samán de Güere');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('142','48','Alfredo Pacheco Miranda');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('143','49','Santos Michelena');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('144','49','Tiara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('145','50','Cagua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('146','50','Bella Vista');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('147','51','Tovar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('148','52','Urdaneta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('149','52','Las Peñitas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('150','52','San Francisco de Cara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('151','52','Taguay');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('152','53','Zamora');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('153','53','Magdaleno');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('154','53','San Francisco de Asís');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('155','53','Valles de Tucutunemo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('156','53','Augusto Mijares');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('157','54','Sabaneta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('158','54','Juan Antonio Rodríguez Domínguez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('159','55','El Cantón');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('160','55','Santa Cruz de Guacas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('161','55','Puerto Vivas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('162','56','Ticoporo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('163','56','Nicolás Pulido');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('164','56','Andrés Bello');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('165','57','Arismendi');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('166','57','Guadarrama');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('167','57','La Unión');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('168','57','San Antonio');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('169','58','Barinas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('170','58','Alberto Arvelo Larriva');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('171','58','San Silvestre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('172','58','Santa Inés');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('173','58','Santa Lucía');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('174','58','Torumos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('175','58','El Carmen');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('176','58','Rómulo Betancourt');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('177','58','Corazón de Jesús');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('178','58','Ramón Ignacio Méndez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('179','58','Alto Barinas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('180','58','Manuel Palacio Fajardo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('181','58','Juan Antonio Rodríguez Domínguez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('182','58','Dominga Ortiz de Páez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('183','59','Barinitas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('184','59','Altamira de Cáceres');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('185','59','Calderas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('186','60','Barrancas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('187','60','El Socorro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('188','60','Mazparrito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('189','61','Santa Bárbara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('190','61','Pedro Briceño Méndez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('191','61','Ramón Ignacio Méndez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('192','61','José Ignacio del Pumar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('193','62','Obispos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('194','62','Guasimitos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('195','62','El Real');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('196','62','La Luz');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('197','63','Ciudad Bolívia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('198','63','José Ignacio Briceño');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('199','63','José Félix Ribas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('200','63','Páez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('201','64','Libertad');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('202','64','Dolores');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('203','64','Santa Rosa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('204','64','Palacio Fajardo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('205','65','Ciudad de Nutrias');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('206','65','El Regalo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('207','65','Puerto Nutrias');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('208','65','Santa Catalina');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('209','66','Cachamay');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('210','66','Chirica');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('211','66','Dalla Costa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('212','66','Once de Abril');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('213','66','Simón Bolívar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('214','66','Unare');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('215','66','Universidad');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('216','66','Vista al Sol');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('217','66','Pozo Verde');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('218','66','Yocoima');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('219','66','5 de Julio');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('220','67','Cedeño');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('221','67','Altagracia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('222','67','Ascensión Farreras');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('223','67','Guaniamo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('224','67','La Urbana');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('225','67','Pijiguaos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('226','68','El Callao');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('227','69','Gran Sabana');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('228','69','Ikabarú');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('229','70','Catedral');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('230','70','Zea');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('231','70','Orinoco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('232','70','José Antonio Páez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('233','70','Marhuanta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('234','70','Agua Salada');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('235','70','Vista Hermosa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('236','70','La Sabanita');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('237','70','Panapana');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('238','71','Andrés Eloy Blanco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('239','71','Pedro Cova');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('240','72','Raúl Leoni');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('241','72','Barceloneta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('242','72','Santa Bárbara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('243','72','San Francisco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('244','73','Roscio');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('245','73','Salóm');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('246','74','Sifontes');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('247','74','Dalla Costa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('248','74','San Isidro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('249','75','Sucre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('250','75','Aripao');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('251','75','Guarataro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('252','75','Las Majadas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('253','75','Moitaco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('254','76','Padre Pedro Chien');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('255','76','Río Grande');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('256','77','Bejuma');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('257','77','Canoabo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('258','77','Simón Bolívar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('259','78','Güigüe');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('260','78','Carabobo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('261','78','Tacarigua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('262','79','Mariara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('263','79','Aguas Calientes');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('264','80','Ciudad Alianza');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('265','80','Guacara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('266','80','Yagua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('267','81','Morón');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('268','81','Yagua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('269','82','Tocuyito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('270','82','Independencia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('271','83','Los Guayos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('272','84','Miranda');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('273','85','Montalbán');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('274','86','Naguanagua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('275','87','Bartolomé Salóm');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('276','87','Democracia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('277','87','Fraternidad');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('278','87','Goaigoaza');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('279','87','Juan José Flores');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('280','87','Unión');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('281','87','Borburata');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('282','87','Patanemo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('283','88','San Diego');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('284','89','San Joaquín');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('285','90','Candelaria');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('286','90','Catedral');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('287','90','El Socorro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('288','90','Miguel Peña');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('289','90','Rafael Urdaneta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('290','90','San Blas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('291','90','San José');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('292','90','Santa Rosa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('293','90','Negro Primero');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('294','91','Cojedes');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('295','91','Juan de Mata Suárez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('296','92','Tinaquillo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('297','93','El Baúl');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('298','93','Sucre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('299','94','La Aguadita');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('300','94','Macapo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('301','95','El Pao');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('302','96','El Amparo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('303','96','Libertad de Cojedes');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('304','97','Rómulo Gallegos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('305','98','San Carlos de Austria');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('306','98','Juan Ángel Bravo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('307','98','Manuel Manrique');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('308','99','General en Jefe José Laurencio Silva');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('309','100','Curiapo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('310','100','Almirante Luis Brión');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('311','100','Francisco Aniceto Lugo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('312','100','Manuel Renaud');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('313','100','Padre Barral');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('314','100','Santos de Abelgas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('315','101','Imataca');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('316','101','Cinco de Julio');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('317','101','Juan Bautista Arismendi');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('318','101','Manuel Piar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('319','101','Rómulo Gallegos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('320','102','Pedernales');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('321','102','Luis Beltrán Prieto Figueroa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('322','103','San José (Delta Amacuro)');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('323','103','José Vidal Marcano');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('324','103','Juan Millán');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('325','103','Leonardo Ruíz Pineda');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('326','103','Mariscal Antonio José de Sucre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('327','103','Monseñor Argimiro García');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('328','103','San Rafael (Delta Amacuro)');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('329','103','Virgen del Valle');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('330','10','Clarines');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('331','10','Guanape');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('332','10','Sabana de Uchire');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('333','104','Capadare');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('334','104','La Pastora');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('335','104','Libertador');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('336','104','San Juan de los Cayos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('337','105','Aracua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('338','105','La Peña');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('339','105','San Luis');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('340','106','Bariro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('341','106','Borojó');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('342','106','Capatárida');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('343','106','Guajiro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('344','106','Seque');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('345','106','Zazárida');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('346','106','Valle de Eroa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('347','107','Cacique Manaure');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('348','108','Norte');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('349','108','Carirubana');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('350','108','Santa Ana');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('351','108','Urbana Punta Cardón');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('352','109','La Vela de Coro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('353','109','Acurigua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('354','109','Guaibacoa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('355','109','Las Calderas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('356','109','Macoruca');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('357','110','Dabajuro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('358','111','Agua Clara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('359','111','Avaria');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('360','111','Pedregal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('361','111','Piedra Grande');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('362','111','Purureche');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('363','112','Adaure');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('364','112','Adícora');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('365','112','Baraived');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('366','112','Buena Vista');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('367','112','Jadacaquiva');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('368','112','El Vínculo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('369','112','El Hato');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('370','112','Moruy');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('371','112','Pueblo Nuevo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('372','113','Agua Larga');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('373','113','El Paují');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('374','113','Independencia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('375','113','Mapararí');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('376','114','Agua Linda');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('377','114','Araurima');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('378','114','Jacura');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('379','115','Tucacas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('380','115','Boca de Aroa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('381','116','Los Taques');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('382','116','Judibana');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('383','117','Mene de Mauroa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('384','117','San Félix');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('385','117','Casigua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('386','118','Guzmán Guillermo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('387','118','Mitare');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('388','118','Río Seco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('389','118','Sabaneta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('390','118','San Antonio');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('391','118','San Gabriel');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('392','118','Santa Ana');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('393','119','Boca del Tocuyo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('394','119','Chichiriviche');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('395','119','Tocuyo de la Costa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('396','120','Palmasola');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('397','121','Cabure');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('398','121','Colina');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('399','121','Curimagua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('400','122','San José de la Costa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('401','122','Píritu');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('402','123','San Francisco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('403','124','Sucre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('404','124','Pecaya');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('405','125','Tocópero');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('406','126','El Charal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('407','126','Las Vegas del Tuy');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('408','126','Santa Cruz de Bucaral');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('409','127','Bruzual');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('410','127','Urumaco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('411','128','Puerto Cumarebo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('412','128','La Ciénaga');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('413','128','La Soledad');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('414','128','Pueblo Cumarebo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('415','128','Zazárida');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('416','113','Churuguara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('417','129','Camaguán');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('418','129','Puerto Miranda');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('419','129','Uverito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('420','130','Chaguaramas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('421','131','El Socorro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('422','132','Tucupido');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('423','132','San Rafael de Laya');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('424','133','Altagracia de Orituco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('425','133','San Rafael de Orituco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('426','133','San Francisco Javier de Lezama');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('427','133','Paso Real de Macaira');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('428','133','Carlos Soublette');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('429','133','San Francisco de Macaira');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('430','133','Libertad de Orituco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('431','134','Cantaclaro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('432','134','San Juan de los Morros');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('433','134','Parapara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('434','135','El Sombrero');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('435','135','Sosa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('436','136','Las Mercedes');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('437','136','Cabruta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('438','136','Santa Rita de Manapire');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('439','137','Valle de la Pascua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('440','137','Espino');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('441','138','San José de Unare');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('442','138','Zaraza');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('443','139','San José de Tiznados');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('444','139','San Francisco de Tiznados');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('445','139','San Lorenzo de Tiznados');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('446','139','Ortiz');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('447','140','Guayabal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('448','140','Cazorla');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('449','141','San José de Guaribe');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('450','141','Uveral');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('451','142','Santa María de Ipire');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('452','142','Altamira');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('453','143','El Calvario');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('454','143','El Rastro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('455','143','Guardatinajas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('456','143','Capital Urbana Calabozo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('457','144','Quebrada Honda de Guache');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('458','144','Pío Tamayo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('459','144','Yacambú');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('460','145','Fréitez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('461','145','José María Blanco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('462','146','Catedral');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('463','146','Concepción');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('464','146','El Cují');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('465','146','Juan de Villegas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('466','146','Santa Rosa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('467','146','Tamaca');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('468','146','Unión');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('469','146','Aguedo Felipe Alvarado');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('470','146','Buena Vista');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('471','146','Juárez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('472','147','Juan Bautista Rodríguez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('473','147','Cuara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('474','147','Diego de Lozada');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('475','147','Paraíso de San José');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('476','147','San Miguel');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('477','147','Tintorero');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('478','147','José Bernardo Dorante');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('479','147','Coronel Mariano Peraza ');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('480','148','Bolívar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('481','148','Anzoátegui');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('482','148','Guarico');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('483','148','Hilario Luna y Luna');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('484','148','Humocaro Alto');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('485','148','Humocaro Bajo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('486','148','La Candelaria');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('487','148','Morán');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('488','149','Cabudare');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('489','149','José Gregorio Bastidas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('490','149','Agua Viva');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('491','150','Sarare');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('492','150','Buría');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('493','150','Gustavo Vegas León');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('494','151','Trinidad Samuel');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('495','151','Antonio Díaz');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('496','151','Camacaro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('497','151','Castañeda');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('498','151','Cecilio Zubillaga');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('499','151','Chiquinquirá');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('500','151','El Blanco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('501','151','Espinoza de los Monteros');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('502','151','Lara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('503','151','Las Mercedes');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('504','151','Manuel Morillo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('505','151','Montaña Verde');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('506','151','Montes de Oca');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('507','151','Torres');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('508','151','Heriberto Arroyo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('509','151','Reyes Vargas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('510','151','Altagracia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('511','152','Siquisique');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('512','152','Moroturo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('513','152','San Miguel');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('514','152','Xaguas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('515','179','Presidente Betancourt');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('516','179','Presidente Páez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('517','179','Presidente Rómulo Gallegos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('518','179','Gabriel Picón González');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('519','179','Héctor Amable Mora');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('520','179','José Nucete Sardi');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('521','179','Pulido Méndez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('522','180','La Azulita');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('523','181','Santa Cruz de Mora');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('524','181','Mesa Bolívar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('525','181','Mesa de Las Palmas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('526','182','Aricagua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('527','182','San Antonio');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('528','183','Canagua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('529','183','Capurí');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('530','183','Chacantá');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('531','183','El Molino');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('532','183','Guaimaral');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('533','183','Mucutuy');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('534','183','Mucuchachí');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('535','184','Fernández Peña');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('536','184','Matriz');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('537','184','Montalbán');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('538','184','Acequias');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('539','184','Jají');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('540','184','La Mesa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('541','184','San José del Sur');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('542','185','Tucaní');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('543','185','Florencio Ramírez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('544','186','Santo Domingo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('545','186','Las Piedras');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('546','187','Guaraque');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('547','187','Mesa de Quintero');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('548','187','Río Negro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('549','188','Arapuey');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('550','188','Palmira');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('551','189','San Cristóbal de Torondoy');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('552','189','Torondoy');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('553','190','Antonio Spinetti Dini');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('554','190','Arias');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('555','190','Caracciolo Parra Pérez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('556','190','Domingo Peña');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('557','190','El Llano');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('558','190','Gonzalo Picón Febres');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('559','190','Jacinto Plaza');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('560','190','Juan Rodríguez Suárez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('561','190','Lasso de la Vega');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('562','190','Mariano Picón Salas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('563','190','Milla');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('564','190','Osuna Rodríguez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('565','190','Sagrario');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('566','190','El Morro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('567','190','Los Nevados');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('568','191','Andrés Eloy Blanco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('569','191','La Venta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('570','191','Piñango');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('571','191','Timotes');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('572','192','Eloy Paredes');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('573','192','San Rafael de Alcázar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('574','192','Santa Elena de Arenales');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('575','193','Santa María de Caparo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('576','194','Pueblo Llano');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('577','195','Cacute');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('578','195','La Toma');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('579','195','Mucuchíes');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('580','195','Mucurubá');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('581','195','San Rafael');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('582','196','Gerónimo Maldonado');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('583','196','Bailadores');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('584','197','Tabay');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('585','198','Chiguará');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('586','198','Estánquez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('587','198','Lagunillas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('588','198','La Trampa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('589','198','Pueblo Nuevo del Sur');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('590','198','San Juan');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('591','199','El Amparo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('592','199','El Llano');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('593','199','San Francisco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('594','199','Tovar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('595','200','Independencia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('596','200','María de la Concepción Palacios Blanco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('597','200','Nueva Bolivia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('598','200','Santa Apolonia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('599','201','Caño El Tigre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('600','201','Zea');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('601','223','Aragüita');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('602','223','Arévalo González');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('603','223','Capaya');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('604','223','Caucagua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('605','223','Panaquire');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('606','223','Ribas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('607','223','El Café');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('608','223','Marizapa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('609','224','Cumbo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('610','224','San José de Barlovento');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('611','225','El Cafetal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('612','225','Las Minas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('613','225','Nuestra Señora del Rosario');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('614','226','Higuerote');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('615','226','Curiepe');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('616','226','Tacarigua de Brión');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('617','227','Mamporal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('618','228','Carrizal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('619','229','Chacao');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('620','230','Charallave');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('621','230','Las Brisas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('622','231','El Hatillo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('623','232','Altagracia de la Montaña');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('624','232','Cecilio Acosta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('625','232','Los Teques');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('626','232','El Jarillo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('627','232','San Pedro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('628','232','Tácata');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('629','232','Paracotos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('630','233','Cartanal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('631','233','Santa Teresa del Tuy');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('632','234','La Democracia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('633','234','Ocumare del Tuy');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('634','234','Santa Bárbara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('635','235','San Antonio de los Altos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('636','236','Río Chico');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('637','236','El Guapo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('638','236','Tacarigua de la Laguna');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('639','236','Paparo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('640','236','San Fernando del Guapo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('641','237','Santa Lucía del Tuy');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('642','238','Cúpira');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('643','238','Machurucuto');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('644','239','Guarenas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('645','240','San Antonio de Yare');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('646','240','San Francisco de Yare');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('647','241','Leoncio Martínez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('648','241','Petare');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('649','241','Caucagüita');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('650','241','Filas de Mariche');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('651','241','La Dolorita');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('652','242','Cúa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('653','242','Nueva Cúa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('654','243','Guatire');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('655','243','Bolívar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('656','258','San Antonio de Maturín');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('657','258','San Francisco de Maturín');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('658','259','Aguasay');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('659','260','Caripito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('660','261','El Guácharo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('661','261','La Guanota');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('662','261','Sabana de Piedra');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('663','261','San Agustín');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('664','261','Teresen');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('665','261','Caripe');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('666','262','Areo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('667','262','Capital Cedeño');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('668','262','San Félix de Cantalicio');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('669','262','Viento Fresco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('670','263','El Tejero');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('671','263','Punta de Mata');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('672','264','Chaguaramas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('673','264','Las Alhuacas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('674','264','Tabasca');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('675','264','Temblador');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('676','265','Alto de los Godos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('677','265','Boquerón');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('678','265','Las Cocuizas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('679','265','La Cruz');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('680','265','San Simón');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('681','265','El Corozo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('682','265','El Furrial');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('683','265','Jusepín');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('684','265','La Pica');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('685','265','San Vicente');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('686','266','Aparicio');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('687','266','Aragua de Maturín');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('688','266','Chaguamal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('689','266','El Pinto');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('690','266','Guanaguana');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('691','266','La Toscana');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('692','266','Taguaya');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('693','267','Cachipo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('694','267','Quiriquire');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('695','268','Santa Bárbara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('696','269','Barrancas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('697','269','Los Barrancos de Fajardo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('698','270','Uracoa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('699','271','Antolín del Campo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('700','272','Arismendi');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('701','273','García');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('702','273','Francisco Fajardo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('703','274','Bolívar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('704','274','Guevara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('705','274','Matasiete');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('706','274','Santa Ana');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('707','274','Sucre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('708','275','Aguirre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('709','275','Maneiro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('710','276','Adrián');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('711','276','Juan Griego');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('712','276','Yaguaraparo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('713','277','Porlamar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('714','278','San Francisco de Macanao');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('715','278','Boca de Río');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('716','279','Tubores');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('717','279','Los Baleales');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('718','280','Vicente Fuentes');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('719','280','Villalba');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('720','281','San Juan Bautista');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('721','281','Zabala');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('722','283','Capital Araure');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('723','283','Río Acarigua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('724','284','Capital Esteller');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('725','284','Uveral');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('726','285','Guanare');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('727','285','Córdoba');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('728','285','San José de la Montaña');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('729','285','San Juan de Guanaguanare');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('730','285','Virgen de la Coromoto');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('731','286','Guanarito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('732','286','Trinidad de la Capilla');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('733','286','Divina Pastora');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('734','287','Monseñor José Vicente de Unda');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('735','287','Peña Blanca');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('736','288','Capital Ospino');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('737','288','Aparición');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('738','288','La Estación');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('739','289','Páez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('740','289','Payara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('741','289','Pimpinela');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('742','289','Ramón Peraza');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('743','290','Papelón');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('744','290','Caño Delgadito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('745','291','San Genaro de Boconoito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('746','291','Antolín Tovar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('747','292','San Rafael de Onoto');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('748','292','Santa Fe');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('749','292','Thermo Morles');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('750','293','Santa Rosalía');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('751','293','Florida');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('752','294','Sucre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('753','294','Concepción');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('754','294','San Rafael de Palo Alzado');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('755','294','Uvencio Antonio Velásquez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('756','294','San José de Saguaz');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('757','294','Villa Rosa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('758','295','Turén');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('759','295','Canelones');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('760','295','Santa Cruz');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('761','295','San Isidro Labrador');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('762','296','Mariño');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('763','296','Rómulo Gallegos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('764','297','San José de Aerocuar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('765','297','Tavera Acosta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('766','298','Río Caribe');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('767','298','Antonio José de Sucre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('768','298','El Morro de Puerto Santo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('769','298','Puerto Santo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('770','298','San Juan de las Galdonas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('771','299','El Pilar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('772','299','El Rincón');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('773','299','General Francisco Antonio Váquez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('774','299','Guaraúnos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('775','299','Tunapuicito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('776','299','Unión');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('777','300','Santa Catalina');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('778','300','Santa Rosa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('779','300','Santa Teresa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('780','300','Bolívar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('781','300','Maracapana');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('782','302','Libertad');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('783','302','El Paujil');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('784','302','Yaguaraparo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('785','303','Cruz Salmerón Acosta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('786','303','Chacopata');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('787','303','Manicuare');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('788','304','Tunapuy');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('789','304','Campo Elías');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('790','305','Irapa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('791','305','Campo Claro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('792','305','Maraval');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('793','305','San Antonio de Irapa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('794','305','Soro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('795','306','Mejía');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('796','307','Cumanacoa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('797','307','Arenas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('798','307','Aricagua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('799','307','Cogollar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('800','307','San Fernando');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('801','307','San Lorenzo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('802','308','Villa Frontado (Muelle de Cariaco)');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('803','308','Catuaro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('804','308','Rendón');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('805','308','San Cruz');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('806','308','Santa María');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('807','309','Altagracia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('808','309','Santa Inés');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('809','309','Valentín Valiente');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('810','309','Ayacucho');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('811','309','San Juan');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('812','309','Raúl Leoni');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('813','309','Gran Mariscal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('814','310','Cristóbal Colón');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('815','310','Bideau');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('816','310','Punta de Piedras');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('817','310','Güiria');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('818','341','Andrés Bello');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('819','342','Antonio Rómulo Costa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('820','343','Ayacucho');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('821','343','Rivas Berti');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('822','343','San Pedro del Río');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('823','344','Bolívar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('824','344','Palotal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('825','344','General Juan Vicente Gómez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('826','344','Isaías Medina Angarita');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('827','345','Cárdenas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('828','345','Amenodoro Ángel Lamus');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('829','345','La Florida');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('830','346','Córdoba');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('831','347','Fernández Feo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('832','347','Alberto Adriani');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('833','347','Santo Domingo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('834','348','Francisco de Miranda');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('835','349','García de Hevia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('836','349','Boca de Grita');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('837','349','José Antonio Páez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('838','350','Guásimos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('839','351','Independencia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('840','351','Juan Germán Roscio');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('841','351','Román Cárdenas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('842','352','Jáuregui');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('843','352','Emilio Constantino Guerrero');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('844','352','Monseñor Miguel Antonio Salas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('845','353','José María Vargas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('846','354','Junín');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('847','354','La Petrólea');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('848','354','Quinimarí');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('849','354','Bramón');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('850','355','Libertad');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('851','355','Cipriano Castro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('852','355','Manuel Felipe Rugeles');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('853','356','Libertador');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('854','356','Doradas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('855','356','Emeterio Ochoa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('856','356','San Joaquín de Navay');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('857','357','Lobatera');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('858','357','Constitución');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('859','358','Michelena');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('860','359','Panamericano');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('861','359','La Palmita');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('862','360','Pedro María Ureña');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('863','360','Nueva Arcadia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('864','361','Delicias');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('865','361','Pecaya');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('866','362','Samuel Darío Maldonado');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('867','362','Boconó');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('868','362','Hernández');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('869','363','La Concordia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('870','363','San Juan Bautista');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('871','363','Pedro María Morantes');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('872','363','San Sebastián');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('873','363','Dr. Francisco Romero Lobo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('874','364','Seboruco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('875','365','Simón Rodríguez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('876','366','Sucre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('877','366','Eleazar López Contreras');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('878','366','San Pablo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('879','367','Torbes');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('880','368','Uribante');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('881','368','Cárdenas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('882','368','Juan Pablo Peñalosa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('883','368','Potosí');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('884','369','San Judas Tadeo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('885','370','Araguaney');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('886','370','El Jaguito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('887','370','La Esperanza');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('888','370','Santa Isabel');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('889','371','Boconó');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('890','371','El Carmen');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('891','371','Mosquey');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('892','371','Ayacucho');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('893','371','Burbusay');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('894','371','General Ribas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('895','371','Guaramacal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('896','371','Vega de Guaramacal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('897','371','Monseñor Jáuregui');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('898','371','Rafael Rangel');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('899','371','San Miguel');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('900','371','San José');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('901','372','Sabana Grande');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('902','372','Cheregüé');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('903','372','Granados');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('904','373','Arnoldo Gabaldón');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('905','373','Bolivia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('906','373','Carrillo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('907','373','Cegarra');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('908','373','Chejendé');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('909','373','Manuel Salvador Ulloa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('910','373','San José');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('911','374','Carache');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('912','374','La Concepción');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('913','374','Cuicas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('914','374','Panamericana');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('915','374','Santa Cruz');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('916','375','Escuque');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('917','375','La Unión');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('918','375','Santa Rita');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('919','375','Sabana Libre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('920','376','El Socorro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('921','376','Los Caprichos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('922','376','Antonio José de Sucre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('923','377','Campo Elías');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('924','377','Arnoldo Gabaldón');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('925','378','Santa Apolonia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('926','378','El Progreso');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('927','378','La Ceiba');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('928','378','Tres de Febrero');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('929','379','El Dividive');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('930','379','Agua Santa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('931','379','Agua Caliente');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('932','379','El Cenizo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('933','379','Valerita');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('934','380','Monte Carmelo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('935','380','Buena Vista');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('936','380','Santa María del Horcón');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('937','381','Motatán');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('938','381','El Baño');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('939','381','Jalisco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('940','382','Pampán');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('941','382','Flor de Patria');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('942','382','La Paz');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('943','382','Santa Ana');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('944','383','Pampanito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('945','383','La Concepción');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('946','383','Pampanito II');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('947','384','Betijoque');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('948','384','José Gregorio Hernández');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('949','384','La Pueblita');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('950','384','Los Cedros');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('951','385','Carvajal');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('952','385','Campo Alegre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('953','385','Antonio Nicolás Briceño');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('954','385','José Leonardo Suárez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('955','386','Sabana de Mendoza');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('956','386','Junín');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('957','386','Valmore Rodríguez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('958','386','El Paraíso');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('959','387','Andrés Linares');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('960','387','Chiquinquirá');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('961','387','Cristóbal Mendoza');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('962','387','Cruz Carrillo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('963','387','Matriz');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('964','387','Monseñor Carrillo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('965','387','Tres Esquinas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('966','388','Cabimbú');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('967','388','Jajó');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('968','388','La Mesa de Esnujaque');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('969','388','Santiago');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('970','388','Tuñame');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('971','388','La Quebrada');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('972','389','Juan Ignacio Montilla');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('973','389','La Beatriz');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('974','389','La Puerta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('975','389','Mendoza del Valle de Momboy');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('976','389','Mercedes Díaz');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('977','389','San Luis');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('978','390','Caraballeda');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('979','390','Carayaca');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('980','390','Carlos Soublette');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('981','390','Caruao Chuspa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('982','390','Catia La Mar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('983','390','El Junko');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('984','390','La Guaira');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('985','390','Macuto');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('986','390','Maiquetía');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('987','390','Naiguatá');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('988','390','Urimare');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('989','391','Arístides Bastidas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('990','392','Bolívar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('991','407','Chivacoa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('992','407','Campo Elías');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('993','408','Cocorote');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('994','409','Independencia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('995','410','José Antonio Páez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('996','411','La Trinidad');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('997','412','Manuel Monge');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('998','413','Salóm');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('999','413','Temerla');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1000','413','Nirgua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1001','414','San Andrés');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1002','414','Yaritagua');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1003','415','San Javier');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1004','415','Albarico');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1005','415','San Felipe');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1006','416','Sucre');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1007','417','Urachiche');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1008','418','El Guayabo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1009','418','Farriar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1010','441','Isla de Toas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1011','441','Monagas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1012','442','San Timoteo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1013','442','General Urdaneta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1014','442','Libertador');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1015','442','Marcelino Briceño');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1016','442','Pueblo Nuevo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1017','442','Manuel Guanipa Matos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1018','443','Ambrosio');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1019','443','Carmen Herrera');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1020','443','La Rosa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1021','443','Germán Ríos Linares');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1022','443','San Benito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1023','443','Rómulo Betancourt');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1024','443','Jorge Hernández');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1025','443','Punta Gorda');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1026','443','Arístides Calvani');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1027','444','Encontrados');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1028','444','Udón Pérez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1029','445','Moralito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1030','445','San Carlos del Zulia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1031','445','Santa Cruz del Zulia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1032','445','Santa Bárbara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1033','445','Urribarrí');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1034','446','Carlos Quevedo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1035','446','Francisco Javier Pulgar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1036','446','Simón Rodríguez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1037','446','Guamo-Gavilanes');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1038','448','La Concepción');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1039','448','San José');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1040','448','Mariano Parra León');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1041','448','José Ramón Yépez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1042','449','Jesús María Semprún');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1043','449','Barí');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1044','450','Concepción');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1045','450','Andrés Bello');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1046','450','Chiquinquirá');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1047','450','El Carmelo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1048','450','Potreritos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1049','451','Libertad');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1050','451','Alonso de Ojeda');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1051','451','Venezuela');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1052','451','Eleazar López Contreras');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1053','451','Campo Lara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1054','452','Bartolomé de las Casas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1055','452','Libertad');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1056','452','Río Negro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1057','452','San José de Perijá');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1058','453','San Rafael');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1059','453','La Sierrita');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1060','453','Las Parcelas');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1061','453','Luis de Vicente');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1062','453','Monseñor Marcos Sergio Godoy');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1063','453','Ricaurte');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1064','453','Tamare');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1065','454','Antonio Borjas Romero');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1066','454','Bolívar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1067','454','Cacique Mara');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1068','454','Carracciolo Parra Pérez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1069','454','Cecilio Acosta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1070','454','Cristo de Aranza');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1071','454','Coquivacoa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1072','454','Chiquinquirá');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1073','454','Francisco Eugenio Bustamante');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1074','454','Idelfonzo Vásquez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1075','454','Juana de Ávila');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1076','454','Luis Hurtado Higuera');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1077','454','Manuel Dagnino');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1078','454','Olegario Villalobos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1079','454','Raúl Leoni');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1080','454','Santa Lucía');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1081','454','Venancio Pulgar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1082','454','San Isidro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1083','455','Altagracia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1084','455','Faría');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1085','455','Ana María Campos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1086','455','San Antonio');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1087','455','San José');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1088','456','Donaldo García');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1089','456','El Rosario');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1090','456','Sixto Zambrano');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1091','457','San Francisco');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1092','457','El Bajo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1093','457','Domitila Flores');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1094','457','Francisco Ochoa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1095','457','Los Cortijos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1096','457','Marcial Hernández');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1097','458','Santa Rita');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1098','458','El Mene');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1099','458','Pedro Lucas Urribarrí');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1100','458','José Cenobio Urribarrí');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1101','459','Rafael Maria Baralt');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1102','459','Manuel Manrique');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1103','459','Rafael Urdaneta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1104','460','Bobures');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1105','460','Gibraltar');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1106','460','Heras');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1107','460','Monseñor Arturo Álvarez');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1108','460','Rómulo Gallegos');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1109','460','El Batey');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1110','461','Rafael Urdaneta');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1111','461','La Victoria');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1112','461','Raúl Cuenca');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1113','447','Sinamaica');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1114','447','Alta Guajira');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1115','447','Elías Sánchez Rubio');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1116','447','Guajira');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1117','462','Altagracia');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1118','462','Antímano');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1119','462','Caricuao');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1120','462','Catedral');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1121','462','Coche');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1122','462','El Junquito');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1123','462','El Paraíso');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1124','462','El Recreo');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1125','462','El Valle');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1126','462','La Candelaria');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1127','462','La Pastora');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1128','462','La Vega');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1129','462','Macarao');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1130','462','San Agustín');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1131','462','San Bernardino');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1132','462','San José');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1133','462','San Juan');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1134','462','San Pedro');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1135','462','Santa Rosalía');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1136','462','Santa Teresa');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1137','462','Sucre (Catia)');
INSERT INTO `parroquias` (`id_parroquia`,`id_municipio`,`parroquia`) VALUES
('1138','462','23 de enero');



-- -------------------------------------------
-- TABLE DATA rama
-- -------------------------------------------
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('1','A','1','1','1','1','Cultivo de maíz, excepto de uso forrajero');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('2','A','1','1','1','2','Cultivo de arroz');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('3','A','1','1','1','3','Cultivo de sorgo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('4','A','1','1','1','9','Cultivo de cereales n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('5','A','1','1','2','1','Cultivo de caraotas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('6','A','1','1','2','2','Cultivo de frijoles');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('7','A','1','1','2','9','Cultivo de leguminosas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('8','A','1','1','3','1','Cultivo de papa');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('9','A','1','1','3','2','Cultivo de yuca (mandioca)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('10','A','1','1','3','9','Cultivo de raíces y tubérculos n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('11','A','1','1','4','1','Cultivo de cebollas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('12','A','1','1','4','2','Cultivo de tomates');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('13','A','1','1','4','3','Cultivo de melones y patillas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('14','A','1','1','4','4','Cultivo de hongos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('15','A','1','1','4','9','Cultivo de hortalizas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('16','A','1','1','5','1','Cultivo de girasol');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('17','A','1','1','5','2','Cultivo de soya');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('18','A','1','1','5','9','Cultivo de semillas oleaginosas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('19','A','1','1','6','0','Cultivo de caña de azúcar');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('20','A','1','1','7','0','Cultivo de tabaco');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('21','A','1','1','8','1','Cultivo de algodón');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('22','A','1','1','8','2','Cultivo de sisal y otras plantas de fibras textiles del género agave');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('23','A','1','1','8','9','Cultivo de otras plantas de fibras textiles n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('24','A','1','1','9','1','Cultivo de flores y semillas de flores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('25','A','1','1','9','2','Cultivo de plantas forrajeras, excepto cereales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('26','A','1','2','1','0','Cultivo de uva');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('27','A','1','2','2','1','Cultivo de frutas tropicales y subtropicales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('28','A','1','2','2','9','Otros cultivos de frutas tropicales y subtropicales n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('29','A','1','2','3','1','Cultivo de cítricos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('30','A','1','2','3','9','Cultivo de otros cítricos n.c.p');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('31','A','1','2','4','0','Cultivo de frutas de pepita y de hueso');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('32','A','1','2','5','1','Cultivo de fresas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('33','A','1','2','5','2','Cultivo de nueces y frutos secos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('34','A','1','2','5','9','Cultivo de frutos de arboles y arbustos n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('35','A','1','2','6','1','Cultivo de coco');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('36','A','1','2','6','2','Cultivo de palmas aceiteras');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('37','A','1','2','6','9','Cultivo de otros frutos oleaginosos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('38','A','1','2','7','1','Cultivo de café');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('39','A','1','2','7','2','Cultivo de cacao');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('40','A','1','2','7','9','Cultivo de plantas con las que se preparan bebidas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('41','A','1','2','8','1','Cultivo de ajíes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('42','A','1','2','8','2','Cultivo de pimentón');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('43','A','1','2','8','9','Cultivo de especias y de plantas aromáticas, medicinales y farmacéuticas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('44','A','1','2','9','0','Cultivo de plantas perennes n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('45','A','1','3','0','1','Producción de plántulas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('46','A','1','3','0','2','Actividades de viveros, excepto forestales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('47','A','1','4','1','1','Cría de ganado vacuno para leche');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('48','A','1','4','1','2','Cría de ganado bufalino para leche');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('49','A','1','4','1','3','Cría y reproducción de ganado vacuno, excepto leche');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('50','A','1','4','1','4','Cría y reproducción de ganado bufalino, excepto leche');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('51','A','1','4','1','5','Cría y reproducción de ganado vacuno para doble propósito');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('52','A','1','4','1','6','Cria y reproducción de ganado bufalino para doble propósito');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('53','A','1','4','2','1','Cría de caballos pura sangre de carreras (Haras)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('54','A','1','4','2','2','Cría de caballos para montas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('55','A','1','4','2','9','Cria de equinos n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('56','A','1','4','3','1','Cría de caprinos para leche');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('57','A','1','4','3','2','Cría de caprinos, excepto para leche');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('58','A','1','4','3','3','Cría de ovinos para leche');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('59','A','1','4','3','4','Cría de ovinos, excepto para leche');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('60','A','1','4','4','0','Cría de cerdos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('61','A','1','4','5','1','Cría y reproducción de pollos y gallinas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('62','A','1','4','5','2','Producción de huevos de gallinas para el consumo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('63','A','1','4','5','3','Producción de productos de reproducción avicola');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('64','A','1','4','5','4','Cría de codornices');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('65','A','1','4','5','5','Cría de avestruces');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('66','A','1','4','5','9','Cría y reproducción de aves de corral n.c.p');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('67','A','1','4','9','1','Cría de conejos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('68','A','1','4','9','2','Apicultura');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('69','A','1','4','9','3','Cría y reproducción de animales domésticos (mascotas)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('70','A','1','4','9','9','Cría de animales n.c.p');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('71','A','1','5','0','0','Cultivodeproductosagrícolasencombinaciónconlacríadeanimales(unidaddeproducción agrícola mixta)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('72','A','1','6','1','1','Servicios de mano de obra para la siembra y cuidados de cultivos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('73','A','1','6','1','2','Actividades de fumigación');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('74','A','1','6','1','3','Suministro o alquiler de maquinaria agrícola con operarios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('75','A','1','6','1','4','Explotación de equipo de riego agrícola');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('76','A','1','6','1','5','Servicio de acondicionamiento y cuidado de los terrenos agrícolas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('77','A','1','6','1','9','Otras actividades de apoyo a la agricultura');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('78','A','1','6','2','1','Actividades posteriores a la cosecha del café');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('79','A','1','6','2','2','Servicio de preparación del cacao en grano');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('80','A','1','6','2','3','Actividades posteriores a la cosecha de cereales y leguminosas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('81','A','1','6','2','9','Actividades posteriores a la cosecha n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('82','A','1','6','3','0','Tratamiento de semillas para propagación');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('83','A','1','6','4','1','Servicios de inseminación artificial');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('84','A','1','6','4','2','Serviciodelimpieza,desinfecciónymantenimientodegalponesdeaves,cochineras y vaqueras');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('85','A','1','6','4','3','Servicio de potreraje');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('86','A','1','6','4','9','Otras actividades de apoyo a la ganadería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('87','A','1','7','0','0','Caza ordinaria, mediante trampas y actividades de servicios conexas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('88','A','2','1','0','0','Silvicultura y otras actividades forestales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('89','A','2','2','0','1','Extraccion y producción de madera en rolas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('90','A','2','2','0','2','Recolección y producción de leña');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('91','A','2','2','0','3','Producción de carbón vegetal en bosques');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('92','A','2','3','0','1','Recolección de productos forestales distintos de la madera');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('93','A','2','3','0','9','Recolección de otros productos forestales distintos de la madera');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('94','A','2','4','0','0','Servicios de apoyo a la silvicultura');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('95','A','3','1','1','1','Pesca comercial de altura y costera');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('96','A','3','1','1','9','Pesca marítima n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('97','A','3','1','2','0','Pesca fluvial y lacustre');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('98','A','3','2','1','1','Cultivo y cría de camarones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('99','A','3','2','1','9','Acuicultura marítima n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('100','A','3','2','2','1','Cultivo y cría de cachamas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('101','A','3','2','2','2','Cultivo y cría de truchas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('102','A','3','2','2','9','Acuicultura de agua dulce n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('103','B','5','1','0','0','Extracción de carbón de piedra');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('104','B','5','2','0','0','Estracción de lignito');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('105','B','6','1','0','0','Extracción de petróleo crudo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('106','B','6','2','0','0','Extracción de gas natural');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('107','B','7','1','0','0','Extracción de minerales de hierro');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('108','B','7','2','1','0','Extracción de minerales de uranio y torio');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('109','B','7','2','9','1','Extracción de aluminio (bauxita)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('110','B','7','2','9','2','Extracción de oro');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('111','B','7','2','9','3','Extracción de metales preciosos, excepto oro');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('112','B','7','2','9','9','Extracción de otros minerales no ferrosos n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('113','B','8','1','0','1','Extracción de arcillas, arcillas refractarias y caolín');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('114','B','8','1','0','2','Extracción de mármol y granito sin labrar');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('115','B','8','1','0','3','Extracción, fragmentación de piedra, gravilla y arena');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('116','B','8','1','0','9','Extracción de otras piedras, arena y arcilla n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('117','B','8','9','1','0','Extracción de minerales para la fabricación de abonos y productos químicos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('118','B','8','9','2','0','Extracción de turba');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('119','B','8','9','3','0','Extracción de sal');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('120','B','8','9','9','0','Explotaciòn de otras minas y canteras n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('121','B','9','1','0','0','Actividades de apoyo para la extracción de petróleo y gas natural');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('122','B','9','9','0','0','Actividades de apoyo para la explotación de otras minas y canteras');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('123','C','10','1','0','1','Beneficio y matanza de ganado');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('124','C','10','1','0','2','Beneficio de aves');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('125','C','10','1','0','3','Preparación y conservación de carne y productos a base de carne');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('126','C','10','1','0','9','Elaboración y conservación de carne n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('127','C','10','2','0','1','Preparación y enlatado de pescados, crustáceos y moluscos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('128','C','10','2','0','2','Preparacióndepescados,crustáceosyproductosafines,medianteelsecado,ahumado o congelación industrial');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('129','C','10','2','0','3','Elaboración de productos de pescado, crustáceos y moluscos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('130','C','10','2','0','9','Elaboración y conservación de productos de pescado, crustáceos y moluscos n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('131','C','10','3','0','1','Fabricación,envasadoyconservacióndesalsas,encurtidosysopasdehortalizas,legumbres y vegetales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('132','C','10','3','0','2','Fabricación de mermeladas, jaleas y frutas secas o en almíbar');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('133','C','10','3','0','3','Fabricación de jugos, concentrados de frutas, legumbres y hortalizas; compotas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('134','C','10','3','0','9','Elaboración y conservación de frutas, legumbres y hortalizas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('135','C','10','4','0','1','Fabricación de aceites y grasas comestibles de origen vegetal');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('136','C','10','4','0','2','Elaboración de margarina y otras grasas compuestas, comestibles');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('137','C','10','4','0','9','Fabricación de otros aceites y grasas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('138','C','10','5','0','1','Elaboración de mantequilla y quesos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('139','C','10','5','0','2','Elaboración de leche en estado sólido y condensado');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('140','C','10','5','0','3','Pasteurizacióndelecheyderivadoslácteos,exceptoelaboracióndemantequillasyquesos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('141','C','10','5','0','4','Elaboración de helados y sorbetes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('142','C','10','6','1','1','Trillado y molienda de trigo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('143','C','10','6','1','2','Molienda de arroz');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('144','C','10','6','1','3','Molienda y trillado de maíz');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('145','C','10','6','1','4','Preparación de cereales para el consumo humano, excepto alimentos infantiles');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('146','C','10','6','1','9','Elaboración de otros productos de molinería n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('147','C','10','6','2','1','Elaboración de aceite de maíz');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('148','C','10','6','2','2','Elaboración de harina de yuca y sucedáneos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('149','C','10','6','2','9','Elaboración de almidones y productos derivados del almidón n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('150','C','10','7','1','1','Elaboración de productos de panadería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('151','C','10','7','1','2','Elaboración de productos de pastelería y repostería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('152','C','10','7','1','3','Elaboración de galletas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('153','C','10','7','1','4','Elaboración de casabe');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('154','C','10','7','2','1','Elaboración y refinación de azúcar y otros productos de centrales azucareros');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('155','C','10','7','2','2','Elaboración de panela y papelón');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('156','C','10','7','3','1','Fabricación de cacao y chocolate');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('157','C','10','7','3','2','Fabricación de productos de confitería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('158','C','10','7','4','0','Elaboración de macarrones, fideos, alcuzcuz y productos farináceos similares');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('159','C','10','7','5','0','Elaboración de comidas y platos preparados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('160','C','10','7','9','1','Molienda y torrefacción de café');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('161','C','10','7','9','2','Elaboración de alimentos para usos especiales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('162','C','10','7','9','3','Molienda, preparación y refinación de sal');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('163','C','10','7','9','4','Elaboración de salsa');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('164','C','10','7','9','5','Elaboración de condimentos, especies y sopas diversas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('165','C','10','7','9','6','Elaboración de extractos de infusiones y hierbas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('166','C','10','7','9','9','Elaboración de otros alimentos preparados n.c.p');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('167','C','10','8','0','1','Elaboración de alimentos para mascotas o animales domésticos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('168','C','10','8','0','9','Elaboración de otros alimentos balanceados para animales n.c.p');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('169','C','11','0','1','1','Elaboración de ron');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('170','C','11','0','1','2','Elaboración de aguardiente de cocuy de penca');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('171','C','11','0','1','9','Destilación, rectificación y mezcla de otras bebidas alcohólicas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('172','C','11','0','2','0','Elaboración de vinos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('173','C','11','0','3','0','Elaboración de cervezas y de malta');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('174','C','11','0','4','1','Producción de aguas minerales y otras aguas embotelladas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('175','C','11','0','4','9','Elaboración de bebidas no alcohólicas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('176','C','12','0','0','1','Elaboración de cigarrillos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('177','C','12','0','0','2','Elaboración de tabacos (puros)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('178','C','12','0','0','3','Elaboración de chimó');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('179','C','12','0','0','9','Elaboración de productos de tabaco n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('180','C','13','1','1','1','Preparación de fibras textiles');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('181','C','13','1','1','2','Hilatura de fibras textiles');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('182','C','13','1','2','0','Tejedura de productos textiles');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('183','C','13','1','3','0','Acabado de productos textiles');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('184','C','13','9','1','0','Fabricación de tejidos de punto y ganchillo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('185','C','13','9','2','1','Fabricación de artículos confeccionados para el hogar y mobiliario');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('186','C','13','9','2','2','Fabricación de artículos de lona y nylon');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('187','C','13','9','2','9','Fabricación de otros artículos confeccionados con textiles, excepto prendas de vestir');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('188','C','13','9','3','0','Fabricación de tapices y alfombras');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('189','C','13','9','4','0','Fabricación de cuerdas, cordeles, bramantes y redes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('190','C','13','9','9','0','Fabricación de otros productos textiles n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('191','C','14','1','0','1','Confección de ropa interior y trajes de baño');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('192','C','14','1','0','2','Confección de prendas de vestir exterior');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('193','C','14','1','0','3','Confección de uniformes de trabajo y uniformes escolares');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('194','C','14','1','0','4','Confección de prendas de vestir deportivas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('195','C','14','1','0','5','Confección a la medida');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('196','C','14','1','0','6','Confección de prendas de vestir para bebés');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('197','C','14','1','0','9','Confección de prendas de vestir y accesorios n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('198','C','14','2','0','0','Fabricación de artículos de piel');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('199','C','14','3','0','1','Fabricación de artículos de punto y ganchillo para damas, caballeros y niños');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('200','C','14','3','0','2','Fabricación de artículos de punto y ganchillo para bebe');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('201','C','15','1','1','0','Curtido y adobo de cueros, adobo y teñido de pieles');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('202','C','15','1','2','1','Fabricación de maletas, bolsos de mano de cuero y artículos similares');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('203','C','15','1','2','2','Fabricación de productos de talabartería y guarnicionería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('204','C','15','2','0','1','Fabricación de calzado de cuero');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('205','C','15','2','0','2','Fabricación de calzado, excepto de cuero');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('206','C','15','2','0','3','Fabricación de partes y accesorios de cuero para calzados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('207','C','15','2','0','9','Fabricación de calzados, partes y accesorios para calzados n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('208','C','16','1','0','0','Aserrado y acepilladura de madera (aserraderos)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('209','C','16','2','1','0','Fabricación de hojas de madera para enchapado y tableros a base de madera');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('210','C','16','2','2','0','Fabricación de partes y piezas de carpintería para edificios y construcciones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('211','C','16','2','3','0','Fabricación de recipientes de madera');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('212','C','16','2','9','1','Fabricacióndemangosdemaderaparaherramientasyartículosmenudosdemadera');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('213','C','16','2','9','2','Fabricación de artículos de corcho');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('214','C','16','2','9','3','Fabricación de artículos de mimbre y materiales trenzables');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('215','C','16','2','9','9','Fabricación de otros productos de madera');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('216','C','17','0','1','1','Fabricación de pasta de madera');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('217','C','17','0','1','2','Fabricación de papel y cartón');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('218','C','17','0','2','0','Fabricación de papel y cartón ondulado y de envases de papel y cartón');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('219','C','17','0','9','1','Fabricación de productos de papel de higiene personal');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('220','C','17','0','9','2','Fabricación artículos de papel y cartón para oficina');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('221','C','17','0','9','9','Fabricación de otros artículos de papel y cartón');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('222','C','18','1','1','1','Litografías, tipografías e imprentas en general');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('223','C','18','1','1','2','Impresión de periódicos y revistas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('224','C','18','1','1','3','Impresión de libros');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('225','C','18','1','2','0','Actividades de servicios relacionadas con la impresión');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('226','C','18','2','0','1','Reproducción de discos compactos de música');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('227','C','18','2','0','2','Reproducción de películas y videocintas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('228','C','18','2','0','3','Reproducción de programas informáticos y datos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('229','C','19','1','0','0','Fabricación de productos de hornos de coque');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('230','C','19','2','0','0','Fabricación de productos de la refinación del petróleo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('231','C','20','1','1','1','Fabricación de gases industriales o médicos inorgánicos, licuados o comprimidos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('232','C','20','1','1','2','Fabricación de sustancias químicas de bases inorgánicas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('233','C','20','1','1','9','Fabricación de sustancias químicas básicas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('234','C','20','1','2','0','Fabricación de abonos y compuestos de nitrógeno');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('235','C','20','1','3','1','Fabricación de plásticos en formas primarias');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('236','C','20','1','3','2','Fabricación de plásticos y caucho sintético en formas primarias');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('237','C','20','2','1','0','Fabricación de plaguicidas y otros productos químicos de uso agropecuario');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('238','C','20','2','2','1','Fabricación de pinturas, barnices, lacas y masillas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('239','C','20','2','2','2','Fabricación de tintas de imprenta');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('240','C','20','2','3','1','Fabricación de jabones y detergentes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('241','C','20','2','3','2','Fabricación de preparados para limpiar y pulir');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('242','C','20','2','3','3','Fabricación de perfumes y preparados de tocador');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('243','C','20','2','9','1','Fabricación de productos químicos para fotografía y película');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('244','C','20','2','9','2','Fabricación de adhesivos, colas, aprestos y mordientes para la industria');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('245','C','20','2','9','3','Fabricación de fósforos, explosivos y fuegos artificiales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('246','C','20','2','9','9','Fabricación de otros productos químicos n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('247','C','20','3','0','0','Fabricación de fibras artificiales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('248','C','21','0','0','1','Fabricación de productos medicinales de uso humano y productos farmaceúticos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('249','C','21','0','0','2','Fabricación de medicamentos de uso veterinario');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('250','C','21','0','0','3','Fabricación de materia prima para la elaboración de medicamentos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('251','C','21','0','0','9','Fabricación de otros productos medicinales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('252','C','22','1','1','1','Fabricación de cauchos y llantas para vehículos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('253','C','22','1','1','2','Recauchutado y renovación de cubiertas de caucho');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('254','C','22','1','9','1','Fabricación de productos de caucho para uso industrial, mecánica y construcción');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('255','C','22','1','9','9','Fabricación de productos de caucho n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('256','C','22','2','0','1','Fabricacióndeserviciosdemesa,utensiliosdecocinayartículosdetocadordeplástico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('257','C','22','2','0','2','Fabricación de productos plásticos utilizados en construcción');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('258','C','22','2','0','3','Fabricacióndeenvases,estuches,materialdeembalajeyartículosconexosdematerial plástico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('259','C','22','2','0','9','Fabricación de productos plásticos n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('260','C','23','1','0','1','Fabricacióndevidrio,espejo,fibradevidrioymanufacturadevidrioparacarrosyotros vidrios de seguridad');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('261','C','23','1','0','2','Fabricación de envases y artículos conexos de vidrios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('262','C','23','1','0','3','Fabricacióndeartículosdevidrioydefibradevidrioparalamesaylacocina;artículos para decoración y ornamento');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('263','C','23','1','0','9','Fabricación de vidrio y productos de vidrio n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('264','C','23','9','1','0','Fabricación de productos refractarios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('265','C','23','9','2','0','Fabricación de materiales de arcilla para la construcción');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('266','C','23','9','3','1','Fabricación de vajillas y otros artículos de uso doméstico y de aseo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('267','C','23','9','3','2','Fabricación de estatuillas y otros artículos ornamentales de cerámica');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('268','C','23','9','3','9','Fabricación de otros productos de porcelana y de cerámica n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('269','C','23','9','4','1','Fabricación de cemento');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('270','C','23','9','4','2','Fabricación de cal y yeso');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('271','C','23','9','5','1','Fabricación de artículos de hormigón y cemento');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('272','C','23','9','5','2','Fabricación de artículos de yeso');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('273','C','23','9','6','0','Corte, talla y acabado de la piedra');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('274','C','23','9','9','0','Fabricación de otros productos minerales no metálicos n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('275','C','24','1','0','0','Industrias básicas de hierro y acero');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('276','C','24','2','0','1','Fabricación de aluminio en formas básicas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('277','C','24','2','0','2','Industriasbásicasdelcobre,plomo,estaño,zinc,bronceylatónyreciclajedeestosmetales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('278','C','24','2','0','3','Industrias de metales preciosos básicas y sus aleaciones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('279','C','24','2','0','9','Fabricación de productos primarios de metales no ferrosos n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('280','C','24','3','1','0','Fundición de hierro y acero');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('281','C','24','3','2','0','Fundición de metales no ferrosos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('282','C','25','1','1','0','Fabricación de productos metálicos para uso estructural');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('283','C','25','1','2','0','Fabricación de tanques, depósitos y recipientes de metal');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('284','C','25','1','3','0','Fabricacióndegeneradoresdevapor,exceptocalderasdeaguacalienteparacalefacción central');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('285','C','25','2','0','0','Fabricación de armas y municiones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('286','C','25','9','1','0','Forja, prensado, estampado y laminado de metales; pulvimetalurgia');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('287','C','25','9','2','0','Tratamiento y revestimiento de metales; maquinado');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('288','C','25','9','3','1','Fabricación de artículos de cuchillería y herramientas de mano no motorizadas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('289','C','25','9','3','2','Fabricación de herrajes y artículos de cerrajerías');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('290','C','25','9','3','9','Fabricación de artículos de cuchillería, herramientas de mano y artículos de ferretería n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('291','C','25','9','9','1','Fabricación de envases metálicos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('292','C','25','9','9','2','Fabricación de resortes y productos de alambre');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('293','C','25','9','9','3','Fabricación de clavos y productos de tornillería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('294','C','25','9','9','4','Fabricación de artículos de metal de uso doméstico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('295','C','25','9','9','9','Fabricación de otros productos elaborados de metal n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('296','C','26','1','0','0','Fabricación de componentes y tableros electrónicos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('297','C','26','2','0','0','Fabricación de computadores y equipo periférico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('298','C','26','3','0','0','Fabricación de equipo de comunicaciones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('299','C','26','4','0','0','Fabricación de aparatos electrónicos de consumo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('300','C','26','5','1','0','Fabricación de equipo de medición, prueba, navegación y control');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('301','C','26','5','2','0','Fabricación de relojes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('302','C','26','6','0','0','Fabricacióndeequipodeirradiaciónyequipoelectrónicodeusomédicoyterapéutico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('303','C','26','7','0','1','Fabricación de instrumentos de óptica, lentes y artículos oftalmicos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('304','C','26','7','0','2','Fabricación de cámaras fotográficas, filmadoras, proyectores y artículos fotográficos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('305','C','26','8','0','0','Fabricación de soportes magnéticos y ópticos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('306','C','27','1','0','0','Fabricacióndemotores,generadoresytransformadoreseléctricosyaparatosdedistribución y control de la energía eléctrica');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('307','C','27','2','0','1','Fabricación de acumuladores para diferentes uso');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('308','C','27','2','0','2','Fabricación de pilas y baterías');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('309','C','27','3','1','0','Fabricación de cables de fibra óptica');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('310','C','27','3','2','0','Fabricación de otros hilos y cables eléctricos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('311','C','27','3','3','0','Fabricación de dispositivos de cableado');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('312','C','27','4','0','0','Fabricación de equipo eléctrico de iluminación');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('313','C','27','5','0','0','Fabricación de aparatos de uso doméstico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('314','C','27','9','0','0','Fabricación de otros tipos de equipo eléctrico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('315','C','28','1','1','0','Fabricacióndemotoresyturbinas,exceptomotoresparaaeronaves,vehículosautomotores y motocicletas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('316','C','28','1','2','0','Fabricación de equipo de propulsión de fluidos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('317','C','28','1','3','1','Fabricación de otras bombas y compresores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('318','C','28','1','3','2','Fabricación de grifos y válvulas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('319','C','28','1','4','0','Fabricación de cojinetes, engranajes, trenes de engranajes y piezas de transmisión');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('320','C','28','1','5','0','Fabricación de hornos, hogueras y quemadores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('321','C','28','1','6','1','Fabricación de ascensores, escaleras mecánicas y pasillos rodantes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('322','C','28','1','6','9','Fabricación de equipo de elevación y manipulación n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('323','C','28','1','7','0','Fabricacióndemaquinariayequipodeoficina,exceptocomputadoresyequipoperiférico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('324','C','28','1','8','0','Fabricación de herramientas de mano motorizadas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('325','C','28','1','9','0','Fabricación de otros tipos de maquinaria de uso general');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('326','C','28','2','1','0','Fabricación de maquinaria agropecuaria y forestal');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('327','C','28','2','2','0','Fabricacióndemaquinariaparalaconformacióndemetalesydemáquinasherramienta');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('328','C','28','2','3','0','Fabricación de maquinaria metalúrgica');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('329','C','28','2','4','0','Fabricacióndemaquinariaparalaexplotacióndeminasycanterasyparaobrasdeconstrucción');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('330','C','28','2','5','0','Fabricación de maquinaria para la elaboración de alimentos, bebidas y tabaco');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('331','C','28','2','6','0','Fabricacióndemaquinariaparalaelaboracióndeproductostextiles,prendasdevestir y cueros');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('332','C','28','2','9','0','Fabricación de otros tipos de maquinaria de uso especial');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('333','C','29','1','0','0','Fabricación de vehículos automotores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('334','C','29','2','0','0','Fabricacióndecarroceríasparavehículosautomotores;fabricaciónderemolquesysemirremolques');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('335','C','29','3','0','1','Fabricacióndepartes,piezas,repuestosmecánicosydecarroceríaparavehículosautomotores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('336','C','29','3','0','2','Fabricación de asientos para automóviles');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('337','C','29','3','0','3','Fabricación de partes, piezas y repuestos eléctricos para vehículos automotores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('338','C','29','3','0','4','Rectificación o recostrucción de motores para vehículos automotores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('339','C','29','3','0','9','Fabricación de otras piezas y accesorios para vehículos automotores n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('340','C','30','1','1','0','Construcción de buques y estructuras flotantes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('341','C','30','1','2','0','Construcción de embarcaciones de recreo y deporte');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('342','C','30','2','0','0','Fabricación de locomotoras y material rodante');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('343','C','30','3','0','0','Fabricación de aeronaves, naves espaciales y maquinaria conexa');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('344','C','30','4','0','0','Fabricación de vehículos militares de combate');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('345','C','30','9','1','0','Fabricación de motocicletas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('346','C','30','9','2','1','Fabricación de bicicletas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('347','C','30','9','2','2','Fabricación de sillones de ruedas para inválidos y coches para bebes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('348','C','30','9','9','0','Fabricación de otros tipos de equipo de transporte n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('349','C','31','0','0','1','Fabricacióndemueblesparaelhogarolavivienda,exceptomueblesdecocinas,closets y gabinetes para los baños');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('350','C','31','0','0','2','Fabricación de muebles para oficinas y otros establecimientos de servicios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('351','C','31','0','0','3','Fabricación de muebles de cocinas, closets y gabinetes para los baños');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('352','C','31','0','0','4','Fabricación de muebles especiales para locales comerciales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('353','C','31','0','0','5','Fabricación de colchones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('354','C','31','0','0','6','Acabado de muebles');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('355','C','31','0','0','9','Fabricación de muebles n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('356','C','32','1','1','0','Fabricación de joyas y artículos conexos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('357','C','32','1','2','0','Fabricación de bisutería y artículos conexos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('358','C','32','2','0','1','Fabricación de instrumentos musicales folklóricos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('359','C','32','2','0','2','Fabricación de otros instrumentos musicales, excepto los folklóricos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('360','C','32','3','0','0','Fabricación de artículos de deporte');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('361','C','32','4','0','0','Fabricación de juegos y juguetes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('362','C','32','5','0','0','Fabricacióndeequipoyprótesismédicas,ortopédicas,odontológicasysimilares,excepto equipos electrónicos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('363','C','32','9','0','1','Fabricación de escobas y cepillos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('364','C','32','9','0','2','Fabricación de plumas, boligrafos y lápices');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('365','C','32','9','0','3','Fabricación de velas y cirios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('366','C','32','9','0','4','Fabricación de ataudes y urnas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('367','C','32','9','0','9','Otras industrias manufactureras n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('368','C','33','1','1','0','Reparación de productos elaborados de metal');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('369','C','33','1','2','1','Reparación de maquinaria agrícola, forestal y de explotación maderera');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('370','C','33','1','2','2','Reparación de maquinaria de la industria manufacturera');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('371','C','33','1','2','4','Reparación de maquinaria de oficina y de uso comercial');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('372','C','33','1','2','5','Reparaciónymantenimientodemaquinariaparalaminería,laconstrucción,laextracción de petróleo y la extracción de gas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('373','C','33','1','2','6','Reparación de maquinaria n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('374','C','33','1','3','1','Reparación de equipo electrónico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('375','C','33','1','3','2','Reparación de equipo óptico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('376','C','33','1','4','0','Reparación de equipo eléctrico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('377','C','33','1','5','1','Reparación y mantenimiento de barcos, embarcaciones de trabajo y paseo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('378','C','33','1','5','2','Reparación y mantenimiento de aeronaves');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('379','C','33','1','5','9','Reparación de equipo de transporte, excepto vehículos automotores n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('380','C','33','1','9','0','Reparación de otros tipos de equipo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('381','C','33','2','0','0','Instalación de maquinaria y equipo industriales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('382','D','35','1','0','1','Generación y captación de energía eléctrica');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('383','D','35','1','0','2','Distribución de energía eléctrica');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('384','D','35','2','0','1','Producción de gas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('385','D','35','2','0','2','Distribución de combustibles gaseosos por tubería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('386','D','35','3','0','0','Suministro de vapor y de aire acondicionado');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('387','E','36','0','0','1','Captación, depuración o purificación de agua');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('388','E','36','0','0','2','Distribución de agua');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('389','E','37','0','0','0','Evacuación de aguas residuales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('390','E','38','1','1','1','Recogida de papel y cartón');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('391','E','38','1','1','2','Recogida de latas y material de aluminio');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('392','E','38','1','1','3','Recogida de vidrios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('393','E','38','1','1','4','Recogida de caucho o neumáticos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('394','E','38','1','1','9','Recogida de otros desechos no peligrosos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('395','E','38','1','2','0','Recogida de desechos peligrosos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('396','E','38','2','1','0','Tratamiento y eliminación de desechos no peligrosos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('397','E','38','2','2','0','Tratamiento y eliminación de desechos peligrosos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('398','E','38','3','0','1','Procesamiento de papel y cartón recuperado');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('399','E','38','3','0','2','Clasificación y nodulación de plásticos recuperado');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('400','E','38','3','0','3','Trituración, limpieza y clasificación de desechos de vidrio');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('401','E','38','3','0','4','Aplastamiento y compactación de desperdicios metálicos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('402','E','38','3','0','5','Reciclamiento de caucho');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('403','E','38','3','0','9','Otras recuperadoras de materiales n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('404','E','39','0','0','0','Actividades de descontaminación y otros servicios de gestión de desechos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('405','F','41','0','0','1','Construcción reforma y reparación de edificios residenciales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('406','F','41','0','0','2','Construcción reforma y reparación de edificios no residenciales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('407','F','42','1','0','0','Construcción de carreteras, vías de ferrocarril, puentes y túneles');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('408','F','42','2','0','0','Construcción de proyectos de servicio público');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('409','F','42','9','0','0','Construcción de otras obras de ingeniería civil');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('410','F','43','1','1','0','Demolición');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('411','F','43','1','2','0','Preparación del terreno');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('412','F','43','2','1','0','Instalaciones eléctricas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('413','F','43','2','2','0','Instalaciones de plomería, calefacción y aire acondicionado');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('414','F','43','2','9','0','Otras instalaciones para obras de construcción');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('415','F','43','3','0','0','Terminación y acabado de edificios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('416','F','43','9','0','0','Otras actividades especializadas de construcción');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('417','G','45','1','0','1','Venta al por mayor y al por menor de vehículos automotores nuevos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('418','G','45','1','0','2','Venta al por mayor y al por menor de vehículos automotores usados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('419','G','45','1','0','3','Venta al por mayor de chatarra y repuestos usados de automóviles (chiveras)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('420','G','45','2','0','1','Mantenimiento y reparación del motor y mecánica integral');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('421','G','45','2','0','2','Reparaciones eléctricas, del tablero e instrumental; reparación y recarga de baterías (electroautos)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('422','G','45','2','0','3','Mantenimiento y reparación de cauchos (neumáticos), alineación de dirección y balanceo de ruedas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('423','G','45','2','0','4','Mantenimiento y reparación de frenos y tren delantero');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('424','G','45','2','0','5','Instalación, mantenimiento y reparación de tubos de escape y silenciadores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('425','G','45','2','0','6','Reparación de latonería y pintura de carrocerías');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('426','G','45','2','0','7','Instalacióndealarmas,cerraduras,yotrossistemasdeseguridad,equiposdesonidoy accesorios en general');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('427','G','45','2','0','8','Lavado automático y manual');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('428','G','45','2','0','9','Otros mantenimientos y reparaciones de vehículos automotores n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('429','G','45','3','0','0','Venta de partes, piezas y accesorios para vehículos automotores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('430','G','45','4','0','0','Venta, mantenimiento y reparación de motocicletas y sus partes, piezas y accesorios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('431','G','46','1','0','1','Ventaalpormayoracambiodeunaretribuciónoporcontratadeproductosagrícolas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('432','G','46','1','0','2','Ventaalpormayoracambiodeunaretribuciónoporcontratadeproductospecuarios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('433','G','46','1','0','3','Ventaalpormayoracambiodeunaretribuciónoporcontratadealimentos,bebidas y tabaco');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('434','G','46','1','0','4','Ventaalpormayoracambiodeunaretribuciónoporcontratadecombustibles,minerales, productos siderúrgicos y químicos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('435','G','46','1','0','9','Venta al por mayor a cambio de una retribución o por contrata de mercancías');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('436','G','46','2','0','1','Venta al por mayor de animales vivos, pieles y cueros');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('437','G','46','2','0','2','Venta al por mayor de cereales, granos y semillas y frutos oleaginosos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('438','G','46','2','0','9','Venta al por mayor de otras materias primas agropecuarias n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('439','G','46','3','1','1','Ventaalpormayordecarne,productoscárnicos,avesdecorralyotrosanimalesdecaza menor');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('440','G','46','3','1','2','Venta al por mayor de pescado, y otros productos de la pesca');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('441','G','46','3','1','3','Venta al por mayor de embutidos, quesos y otros productos lácteos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('442','G','46','3','1','4','Venta al por mayor de frutas, legumbres y hortalizas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('443','G','46','3','1','5','Venta al por mayor de víveres en general');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('444','G','46','3','1','6','Venta al por mayor de productos de confitería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('445','G','46','3','1','7','Ventaalpormayordemaníyotrosfrutossecos,granos,condimentos,hierbasyespecias');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('446','G','46','3','2','0','Venta al mayor de alimentos para animales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('447','G','46','3','3','0','Venta al por mayor de tabaco y bebidas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('448','G','46','4','1','1','Venta al mayor de artículos de lencería para el hogar');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('449','G','46','4','1','2','Venta al por mayor de artículos de mercería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('450','G','46','4','1','3','Ventaalpormayordeproductostextilesexceptolenceríasparaelhogaryartículosde mercerias');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('451','G','46','4','1','4','Venta al por mayor de prendas de vestir');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('452','G','46','4','1','5','Venta al por mayor de productos calzado');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('453','G','46','4','9','1','Venta al por mayor de muebles y lámparas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('454','G','46','4','9','2','Venta al por mayor de electrodomésticos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('455','G','46','4','9','3','Venta al por mayor de aparatos electrónicos e instrumentos musicales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('456','G','46','4','9','4','Venta al por mayor de artículos de uso doméstico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('457','G','46','4','9','5','Venta al por mayor de productos farmacéuticos y perfumería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('458','G','46','4','9','6','Venta al por mayor de artículos de papelería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('459','G','46','4','9','7','Venta al por mayor de juguetes, artículos de deporte y esparcimiento');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('460','G','46','4','9','9','Venta al por mayor de otros enseres domésticos n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('461','G','46','5','1','0','Venta al por mayor de computadores, equipo periférico y programas informáticos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('462','G','46','5','2','0','Venta al por mayor de equipo, partes y piezas electrónicos y de telecomunicaciones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('463','G','46','5','3','0','Venta al por mayor de maquinaria, equipo y materiales agropecuarios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('464','G','46','5','9','1','Ventaalpormayordemaquinariayequipodeoficina,exceptocomputadoresyequipo periférico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('465','G','46','5','9','2','Ventaalpormayordemáquinas,equiposeimplementosdeusoenlaelaboraciónde alimentos, bebidas y tabaco');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('466','G','46','5','9','3','Ventaalpormayordemáquinas,equiposeimplementosdeusoenlafabricacióndetextiles,prendasyaccesoriosdevestir,calzado,artículosdecueroymarroquinería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('467','G','46','5','9','4','Ventaalpormayordemáquinas,equiposeimplementosdeusoenimprentas,artesgráficas y actividades conexas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('468','G','46','5','9','5','Ventaalpormayordemáquinas,equiposeimplementosdeusomédicoyparamédico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('469','G','46','5','9','6','Ventaalpormayordemáquinas,equiposeimplementosdeusoenlaindustriadelplástico y el caucho');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('470','G','46','5','9','9','Venta al por mayor de máquinas, equipos e implementos de uso especial n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('471','G','46','6','1','0','Ventaalpormayordecombustiblessólidos,líquidosygaseososyproductosconexos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('472','G','46','6','2','0','Venta al por mayor de metales y minerales metalíferos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('473','G','46','6','3','1','Venta al por mayor de madera no trabajada y productos primarios de la madera');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('474','G','46','6','3','2','Venta al por mayor de materiales de construcción');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('475','G','46','6','3','9','Ventaalpormayordeartículosdeferretería,equipo,materialesdefontaneríay');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('476','G','46','6','9','1','Venta al por mayor de materiales plásticos en formas primarias');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('477','G','46','6','9','2','Venta al por mayor de sustancias químicas industriales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('478','G','46','6','9','3','Venta al por mayor de abonos y productos químicos de uso agrícola');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('479','G','46','6','9','9','Ventaalpormayordedesperdicios,desechos,chatarra(exceptodeautomóviles)yotros productos n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('480','G','46','9','0','0','Venta al por mayor no especializada');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('481','G','47','1','1','1','Ventaalpormenorencomerciosnoespecializadosconpredominiodelaventadealimentos, bebidas o tabaco en abastos y bodegas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('482','G','47','1','1','2','Ventaalpormenorencomerciosnoespecializadosconpredominiodelaventadealimentos, bebidas o tabaco en supermercados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('483','G','47','1','1','3','Ventaalpormenorencomerciosnoespecializadosconpredominiodelaventadealimentos, bebidas o tabaco en hipermercados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('484','G','47','1','9','0','Otras actividades de venta al por menor en comercios no especializados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('485','G','47','2','1','1','Ventaalpormenordecarne,productoscárnicos,avesdecorralyotrosanimalesdecaza menor (carnicerías)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('486','G','47','2','1','2','Venta al por menor de pescado, y otros productos de la pesca (pescaderías)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('487','G','47','2','1','3','Venta al por menor de embutidos, quesos y otros productos lácteos (charcuterías)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('488','G','47','2','1','4','Venta al por menor de frutas, legumbres y hortalizas (fruterías)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('489','G','47','2','1','5','Venta al por menor de productos de panadería, confitería y pastelería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('490','G','47','2','1','9','Ventas de otros productos alimenticios n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('491','G','47','2','2','0','Ventaalpormenordebebidasencomerciosespecializados(licorerías,depósitosdelicores, etc.)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('492','G','47','2','3','0','Venta al por menor de productos de tabaco en comercios especializados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('493','G','47','3','0','1','Ventaalpormenordecombustiblesparavehículosautomotoresymotocicletas(estaciones de servicios, bombas de gasolinas, etcétera)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('494','G','47','3','0','2','Ventaalpormenordeproductoslubricantesyrefrigerantesparavehículoautomotores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('495','G','47','4','1','0','Venta al por menor de computadoras, equipo periférico, programas informáticos y equipo de telecomunicaciones en comercios especializados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('496','G','47','4','2','0','Venta al por menor de equipo de sonido y de vídeo en comercios especializados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('497','G','47','5','1','1','Venta al por menor de productos textiles en comercios especializados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('498','G','47','5','1','2','Venta al por menor de confecciones para el hogar');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('499','G','47','5','2','1','Venta al por menor de artículos de ferretería (ferreterías)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('500','G','47','5','2','2','Venta al por menor de pinturas en comercios especializados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('501','G','47','5','2','3','Ventaalpormenordeproductosdevidrioencomerciosespecializados(cristaleríasy vidrierías)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('502','G','47','5','2','9','Ventaalpormenordematerialyequipodebricolaje,herramientasmenoresysaunas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('503','G','47','5','3','0','Ventaalpormenordetapices,alfombrasycubrimientosparaparedesypisosencomercios especializados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('504','G','47','5','9','1','Venta al por menor de muebles, colchones y lámparas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('505','G','47','5','9','2','Venta al por menor de electrodomésticos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('506','G','47','5','9','3','Venta al por menor de artículos de cocina y ornamento');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('507','G','47','5','9','4','Venta al por menor de instrumentos musicales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('508','G','47','5','9','5','Venta al por menor de sistemas de seguridad');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('509','G','47','5','9','9','Ventaalpormenordeaparatoseléctricosdeusodoméstico,muebles,equipodeiluminación y otros enseres domésticos en comercios especializados n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('510','G','47','6','1','1','Venta al por menor de libros (librerías)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('511','G','47','6','1','2','Venta al por menor de artículos de papelería en comercios especializados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('512','G','47','6','1','3','Venta al por menor de periódicos y revistas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('513','G','47','6','2','0','Ventaalpormenordegrabacionesdemúsicaydevídeoencomerciosespecializados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('514','G','47','6','3','0','Venta al por menor de equipo de deporte en comercios especializados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('515','G','47','6','4','0','Venta al por menor de juegos y juguetes en comercios especializados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('516','G','47','7','1','1','Ventaalpormenordeprendasdevestiryartículosdecueroencomerciosespecializados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('517','G','47','7','1','2','Venta al por menor de ropa interior, medias, prendas para dormir y trajes de baño');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('518','G','47','7','1','3','Venta al por menor de indumentaria de trabajo, uniformes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('519','G','47','7','1','4','Venta al por menor de ropa para bebés y niños');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('520','G','47','7','1','5','Venta al por menor de calzado (zapaterías)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('521','G','47','7','2','1','Ventaalpormenordeproductosfarmacéuticosymedicinalesencomerciosespecializados (farmacias)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('522','G','47','7','2','2','Ventaalpormenordeproductosfarmacéuticosymedicinalesdeorigennaturalencomercios especializados (tiendas naturistas)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('523','G','47','7','2','3','Ventaalpormenordeproductoscosméticos,artículosdetocadoryperfumeríaencomercios especializados (perfumerías)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('524','G','47','7','2','9','Ventaalpormenordeinstrumentalmédicoyodontológicoyartículosortopédicosen comercios especializados y otros n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('525','G','47','7','3','1','Venta al por menor de equipo fotográfico, óptico y de precisión');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('526','G','47','7','3','2','Actividades de ópticas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('527','G','47','7','3','3','Venta al por menor de relojes y joyas (joyerías y relojerías)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('528','G','47','7','3','4','Venta al por menor de flores, arreglos florales y arreglos frutales (floristerías)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('529','G','47','7','3','5','Venta al por menor de plantas ornamentales (viveros)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('530','G','47','7','3','6','Ventaalpormenordeartículosreligiosos,esotéricosydesanterías,fantasíasysouvenirs');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('531','G','47','7','3','7','Actividades de galerías de arte comerciales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('532','G','47','7','3','9','Venta al por menor de otros productos nuevos en comercios especializados n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('533','G','47','7','4','0','Venta al por menor de artículos de segunda mano');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('534','G','47','8','1','0','Venta al por menor de alimentos, bebidas y tabaco en puestos de venta y mercados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('535','G','47','8','2','0','Ventaalpormenordeproductostextiles,prendasdevestirycalzadoenpuestosdeventa y mercados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('536','G','47','8','9','0','Venta al por menor de otros productos en puestos de venta y mercados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('537','G','47','9','1','0','Venta al por menor por correo y por Internet');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('538','G','47','9','9','0','Otrasactividadesdeventaalpormenornorealizadasencomercios,puestosdeventa o mercados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('539','H','49','1','1','0','Transporte interurbano de pasajeros por ferrocarril');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('540','H','49','1','2','0','Transporte de carga por ferrocarril');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('541','H','49','2','1','1','Serviciodetransportedepasajerosenmetro,metrobusyfuniculardetransporteurbano');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('542','H','49','2','1','2','Servicio de transporte de pasajeros por sistemas de transportes urbanos y suburbanos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('543','H','49','2','2','1','Servicio de transporte terrestre de pasajeros en taxi y mototaxi');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('544','H','49','2','2','2','Servicio de alquiler de vehículos comerciales con conductor');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('545','H','49','2','2','3','Servicio de transporte para excursiones turísticas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('546','H','49','2','2','4','Servicio de transporte terrestre de pasajeros de larga distancia regulares');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('547','H','49','2','2','9','Otros tipos de transportes por vía terrestres de pasajeros n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('548','H','49','2','3','1','Servicio de transporte terrestre de carga interestatal e internacional');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('549','H','49','2','3','2','Servicios de mudanza y fletes a corta distancia');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('550','H','49','2','3','9','Otros tipos de transporte terrestre por carreteras n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('551','H','49','3','0','0','Transporte por tuberías');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('552','H','50','1','1','0','Transporte de pasajeros marítimo y de cabotaje');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('553','H','50','1','2','0','Transporte de carga marítimo y de cabotaje');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('554','H','50','2','1','0','Transporte de pasajeros por vías de navegación interiores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('555','H','50','2','2','0','Transporte de carga por vías de navegación interiores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('556','H','51','1','0','0','Transporte de pasajeros por vía aérea');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('557','H','51','2','0','0','Transporte de carga por vía aérea');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('558','H','52','1','0','1','Servicios de almacenamiento y depósito de granos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('559','H','52','1','0','2','Servicios de almacenamiento de artículos congelados o refrigerados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('560','H','52','1','0','3','Servicios de almacenamiento de líquidos o gases');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('561','H','52','1','0','9','Otros servicios de almacenamiento n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('562','H','52','2','1','1','Servicios de estacionamientos y garajes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('563','H','52','2','1','9','Otras actividades de transporte terrestre complementarias n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('564','H','52','2','2','0','Actividades de servicios vinculadas al transporte acuático');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('565','H','52','2','3','0','Actividades de servicios vinculadas al transporte aéreo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('566','H','52','2','4','0','Manipulación de la carga');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('567','H','52','2','9','1','Actividades de agencias de aduana (comercio exterior de mercancías)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('568','H','52','2','9','9','Actividades de otras agencias de transporte');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('569','H','53','1','0','0','Actividades postales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('570','H','53','2','0','0','Actividades de mensajería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('571','I','55','1','0','1','Actividades de alojamiento en hoteles');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('572','I','55','1','0','2','Actividades de alojamiento en posadas y pensiones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('573','I','55','1','0','9','Otros alojamientos de corto plazo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('574','I','55','2','0','0','Actividadesdecampamentos,parquesdevehículosderecreoyparquesdecaravanas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('575','I','55','9','0','0','Otras actividades de alojamiento');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('576','I','56','1','0','1','Servicios de restaurantes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('577','I','56','1','0','2','Servicios de cafeterías, luncherías y areperas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('578','I','56','1','0','3','Servicios de restaurantes de comidas rápidas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('579','I','56','1','0','4','Servicios de reparto de comida a domicilio');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('580','I','56','1','0','5','Servicios de comidas en puestos ambulantes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('581','I','56','1','0','6','Servicios de comida en puestos de mercado');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('582','I','56','1','0','7','Servicios de expendio de helados y cepillados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('583','I','56','1','0','9','Actividades de restaurantes n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('584','I','56','2','1','0','Suministro de comidas por encargo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('585','I','56','2','9','1','Actividades de servicio de comidas por contratistas para empresas de transporte');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('586','I','56','2','9','2','Actividadesdeserviciodecomidasencantinasocafeteríasenrégimendeconcesión');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('587','I','56','2','9','3','Actividadesdeserviciodecomidaseninstalacionesdeportivaseinstalacionessimilares en régimen de concesión');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('588','I','56','3','0','1','Actividades de servicio de bebidas bares, tascas, discotecas y cervecerías');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('589','I','56','3','0','2','Servicios de bebidas ambulantes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('590','I','56','3','0','9','Actividades de servicio de bebidas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('591','J','58','1','1','0','Edición de libros');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('592','J','58','1','2','0','Edición de directorios y listas de correos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('593','J','58','1','3','0','Edición de periódicos, revistas y otras publicaciones periódicas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('594','J','58','1','9','0','Otras actividades de edición');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('595','J','58','2','0','0','Edición de programas informáticos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('596','J','59','1','1','0','Actividades cinematográficas, videos y programas de televisión');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('597','J','59','1','2','0','Actividades de postproducción de películas, videos y programas de televisión');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('598','J','59','1','3','0','Actividades de distribución de películas, videos y programas de televisión');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('599','J','59','1','4','0','Actividades de proyección de películas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('600','J','59','2','0','0','Actividades de grabación de sonido y edición de música');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('601','J','60','1','0','0','Actividades programación y difusión de radio');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('602','J','60','2','0','0','Programación y transmisiones de televisión');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('603','J','61','1','0','0','Actividades de telecomunicaciones alámbricas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('604','J','61','2','0','0','Actividades de telecomunicaciones inalámbricas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('605','J','61','3','0','0','Actividades de telecomunicaciones por satélite');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('606','J','61','9','0','0','Otras actividades de telecomunicación n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('607','J','62','0','1','0','Actividades de programación, consultoría informática y actividades conexas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('608','J','62','0','2','0','Actividades de consultoría informática y de gestión de instalaciones informáticas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('609','J','62','0','9','0','Otras actividades de tecnología de la información y de servicios informáticos n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('610','J','63','1','1','0','Procesamiento de datos, hosting y actividades conexas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('611','J','63','1','2','0','Portales Web');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('612','J','63','9','1','0','Actividades de agencias de noticias');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('613','J','63','9','9','0','Otros servicios de información n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('614','K','64','1','1','0','Servicios del Banco Central');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('615','K','64','1','9','1','Servicios del sector bancario');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('616','K','64','1','9','2','Actividades de fondos y cajas de ahorro');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('617','K','64','1','9','3','Servicios de la banca comunal');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('618','K','64','1','9','4','Servicios de cooperativas de crédito');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('619','K','64','1','9','5','Servicios de casas de cambio y operador cambiario fronterizo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('620','K','64','1','9','6','Servicios de sociedades de garantías reciprocas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('621','K','64','1','9','9','Otros tipos de intermediación financiera n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('622','K','64','2','0','0','Actividades de sociedades de cartera');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('623','K','64','3','0','0','Fondos y sociedades de inversión');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('624','K','64','9','1','0','Otras actividades crediticias');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('625','K','64','9','9','0','Otras actividades de servicios financieros n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('626','K','65','1','1','1','Servicios de seguros de vida');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('627','K','65','1','1','2','Servicios de seguros de Hospitalización, Cirugía y Maternidad');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('628','K','65','1','1','3','Servicios de seguros de accidentes personales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('629','K','65','1','1','4','Servicio de medicina prepagada');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('630','K','65','1','1','5','Servicios de seguro del viajero');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('631','K','65','1','1','6','Servicios de seguros funerarios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('632','K','65','1','1','9','Otros servicios de seguros de personas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('633','K','65','1','2','1','Servicios de seguros patrimoniales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('634','K','65','1','2','2','Servicios de seguros de obligación y/o responsabilidad');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('635','K','65','2','0','0','Reaseguros');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('636','K','65','3','0','0','Fondos de pensiones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('637','K','66','1','1','0','Administración de mercados financieros');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('638','K','66','1','2','0','Corretaje de valores y de contratos de productos básicos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('639','K','66','1','3','0','Otras actividades auxiliares de las actividades de servicios financieros');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('640','K','66','2','1','0','Evaluación de riesgos y daños');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('641','K','66','2','2','1','Servicios de agentes de seguros');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('642','K','66','2','2','2','Servicios de corredores de seguros y medicina prepagada');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('643','K','66','2','2','3','Servicios de sociedades de corretaje de seguros y reaseguros');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('644','K','66','2','3','0','Servicios de empresas financiadoras de primas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('645','K','66','2','9','0','Otras actividades auxiliares de las actividades de seguros y fondos de pensiones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('646','K','66','3','0','0','Actividades de gestión de fondos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('647','L','68','1','0','0','Actividades inmobiliarias realizadas con bienes propios o arrendados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('648','L','68','2','0','0','Actividades inmobiliarias realizadas a cambio de una retribución o por contrata');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('649','M','69','1','0','0','Actividades jurídicas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('650','M','69','2','0','0','Actividades de contabilidad, teneduría de libros y auditoría; consultoría fiscal');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('651','M','70','1','0','0','Actividades de oficinas centrales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('652','M','70','2','0','0','Actividades de consultoría de gestión empresarial');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('653','M','71','1','0','1','Servicios de arquitectura');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('654','M','71','1','0','2','Servicios de ingeniería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('655','M','71','1','0','9','Otras actividades técnicas y conexas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('656','M','71','2','0','0','Ensayos y análisis técnicos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('657','M','72','1','0','0','Investigacionesydesarrolloexperimentalenelcampodelascienciasnaturalesylaingeniería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('658','M','72','2','0','0','Investigacionesydesarrolloexperimentalenelcampodelascienciassocialesylashumanidades');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('659','M','73','1','0','1','Publicidad');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('660','M','73','1','0','2','Servicios de ventas y provisión de tiempo y espacio publicitario');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('661','M','73','2','0','0','Estudios de mercado y encuestas de opinión pública');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('662','M','74','1','0','1','Servicios de diseño gráfico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('663','M','74','1','0','2','Servicios de diseño industrial');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('664','M','74','1','0','3','Servicios de decoración y de diseño interiores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('665','M','74','1','0','9','Otras actividades especializadas de diseño');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('666','M','74','2','0','1','Servicios de fotografía social');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('667','M','74','2','0','2','Servicios de fotografía comercial y/o publicitaria');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('668','M','74','2','0','9','Otras actividades de fotografía');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('669','M','74','9','0','0','Otras actividades profesionales, científicas y técnicas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('670','M','75','0','0','1','Actividades veterinarias');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('671','M','75','0','0','2','Servicios veterinarios para animales domésticos y de compañía');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('672','M','75','0','0','9','Servicios veterinarios n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('673','N','77','1','0','0','Alquiler y arrendamiento de vehículos automotores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('674','N','77','2','1','0','Alquiler y arrendamiento de equipo recreativo y deportivo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('675','N','77','2','2','0','Alquiler de cintas de video y discos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('676','N','77','2','9','0','Alquiler y arrendamiento de otros efectos personales y enseres domésticos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('677','N','77','3','0','1','Alquiler y arrendamiento de maquinaria manufacturera sin operario');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('678','N','77','3','0','2','Alquiler y arrendamiento de equipo agrícola sin operario');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('679','N','77','3','0','3','Alquiler y arrendamiento de equipo de construcción sin operario');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('680','N','77','3','0','4','Alquileryarrendamientodeequipocontable,decomputaciónydeoficinasinoperario');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('681','N','77','3','0','9','Alquileryarrendamientodeotrotipodemaquinaria,equipoymercancíastangiblesn.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('682','N','77','4','0','1','Servicio de franquicia');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('683','N','77','4','0','2','Servicios de permisos de explotación y evaluación de recursos naturales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('684','N','77','4','0','9','Serviciosdepropiedadintelectualyotrosserviciosdeactivosintangiblesn.c.pexcepto financieros');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('685','N','78','1','0','0','Actividades de agencias de empleo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('686','N','78','2','0','0','Actividades de agencias de empleo temporal');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('687','N','78','3','0','0','Otras actividades de dotación de recursos humanos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('688','N','79','1','1','0','Actividades de agencias de viajes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('689','N','79','1','2','0','Actividades de operadores turísticos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('690','N','79','9','0','0','Otros servicios de reservas y actividades conexas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('691','N','80','1','0','1','Servicios de transporte de dinero y artículos valiosos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('692','N','80','1','0','2','Servicios de guardias de seguridad sin monitoreo electrónico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('693','N','80','1','0','9','Otras actividades de seguridad e investigación n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('694','N','80','2','0','0','Actividades de servicios de sistemas de seguridad');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('695','N','80','3','0','0','Actividades de investigación');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('696','N','81','1','0','0','Actividades combinadas de apoyo a instalaciones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('697','N','81','2','1','0','Limpieza general de edificios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('698','N','81','2','9','0','Otras actividades de limpieza de edificios e instalaciones industriales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('699','N','81','3','0','1','Servicio de jardinería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('700','N','81','3','0','2','Servicio de limpieza de piscinas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('701','N','81','3','0','9','Otras actividades de servicio de mantenimiento y cuidado de paisajes n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('702','N','82','1','1','0','Actividades combinadas de servicios administrativos de oficina');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('703','N','82','1','9','0','Fotocopiado,preparacióndedocumentosyotrasactividadesespecializadasdeapoyo de oficina');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('704','N','82','2','0','0','Actividades de centros de llamadas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('705','N','82','3','0','0','Organización de convenciones y exposiciones comerciales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('706','N','82','9','1','1','Actividades de agencias de cobro');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('707','N','82','9','1','2','Agencias de calificación crediticia');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('708','N','82','9','2','0','Actividades de envasado y empaquetado');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('709','N','82','9','9','0','Otras actividades de servicios de apoyo a las empresas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('710','O','84','1','1','1','Actividades de la administración pública en general');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('711','O','84','1','1','2','Actividades de la administración pública con función tributaria y aduanera');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('712','O','84','1','1','3','Actividades de la administración pública con función contralora');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('713','O','84','1','2','0','Regulacióndelasactividadesdeorganismosqueprestanserviciossanitarios,educativos,culturalesyotrosserviciossociales,exceptoserviciosdeseguridadsocial');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('714','O','84','1','3','0','Regulación y facilitación de la actividad económica');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('715','O','84','2','1','0','Relaciones exteriores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('716','O','84','2','2','0','Actividades de defensa');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('717','O','84','2','3','1','Actividades de orden público y seguridad y protección civil');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('718','O','84','2','3','2','Actividades judiciales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('719','O','84','3','0','0','Actividades de planes de seguridad social de afiliación obligatoria');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('720','P','85','1','0','1','Educación maternal y preescolar');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('721','P','85','1','0','2','Educación primaria');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('722','P','85','1','0','3','Misión Robinson I');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('723','P','85','1','0','4','Misión Robinson II');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('724','P','85','2','1','1','Educación media de formación general');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('725','P','85','2','1','2','Misión Ribas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('726','P','85','2','2','0','Educación de formación técnica y profesional');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('727','P','85','3','0','1','Educación técnica superior universitaria');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('728','P','85','3','0','2','Educación superior universitaria');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('729','P','85','3','0','3','Educación superior de post grados');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('730','P','85','3','0','4','Misión Sucre');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('731','P','85','4','1','0','Enseñanza deportiva y recreativa');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('732','P','85','4','2','0','Enseñanza cultural');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('733','P','85','4','9','0','Otros tipos de enseñanza n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('734','P','85','5','0','0','Actividades de apoyo a la enseñanza');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('735','Q','86','1','0','1','Actividades de hospitales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('736','Q','86','1','0','2','Servicios de salud en módulos y ambulatorios de la misión barrio adentro');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('737','Q','86','1','0','3','Servicios de salud en centros de diagnóstico integral, CDI');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('738','Q','86','1','0','4','Servicios de salud en salas de rehabilitación integral, SRI');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('739','Q','86','2','0','1','Servicios de médicos en consultorios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('740','Q','86','2','0','2','Servicios de atención médica y vacunación');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('741','Q','86','2','0','3','Servicios odontológicos en consultorios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('742','Q','86','2','0','4','Servicios odontológicos comunitarios a través de misiones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('743','Q','86','2','0','5','Servicios oftalmológicos en consultorios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('744','Q','86','2','0','6','Servicios oftalmológicos comunitarios a través de misiones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('745','Q','86','2','0','7','Servicios psiquiátricos y psicológicos en consultorios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('746','Q','86','2','0','8','Servicios nutricionista y dietéticos en consultorios');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('747','Q','86','3','0','1','Servicios de diagnóstico en laboratorios de análisis clínicos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('748','Q','86','3','0','2','Servicios de diagnóstico por imagen');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('749','Q','86','3','0','9','Otros servicios de diagnóstico n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('750','Q','86','9','0','1','Servicios de recogida, conservación y resguardo de elementos biológicos humanos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('751','Q','86','9','0','2','Servicios de apoyo terapéutico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('752','Q','86','9','0','3','Servicios de traslado de pacientes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('753','Q','86','9','0','9','Otros servicios relacionados con la salud humana n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('754','Q','87','1','0','0','Servicios sociales con alojamiento relacionados con atención a la salud');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('755','Q','87','2','0','1','Serviciossocialesconalojamientoparapersonascondiscapacidadintelectual,enfermedad mental o adicciones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('756','Q','87','2','0','2','Servicios sociales con alojamiento para personas a través de las misiones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('757','Q','87','3','0','1','Servicios sociales con alojamiento para personas mayores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('758','Q','87','3','0','2','Servicios sociales con alojamiento para personas con discapacidad');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('759','Q','87','9','0','0','Otros servicios sociales con alojamiento n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('760','Q','88','1','0','0','Serviciossocialessinalojamientoparapersonasmayoresypersonascondiscapacidad');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('761','Q','88','9','1','0','Servicios de atención a niños, niñas y adolescentes');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('762','Q','88','9','2','0','Servicios de atención a personas y familias');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('763','Q','88','9','3','0','Servicios comunitarios de alimentación');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('764','Q','88','9','4','0','Actividades de emergencia y socorro');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('765','Q','88','9','5','0','Actividadesdebeneficenciayotrasactividadesdeapoyoconfinesdeasistenciasocial');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('766','Q','88','9','9','0','Otras actividades de asistencia social sin alojamiento n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('767','R','90','0','0','0','Actividades creativas, artísticas y de entretenimiento');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('768','R','91','0','1','0','Actividades de bibliotecas y archivos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('769','R','91','0','2','0','Actividades de museos y gestión de lugares y edificios históricos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('770','R','91','0','3','0','Actividades de jardines botánicos y zoológicos y reservas naturales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('771','R','92','0','0','1','Actividad de los casinos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('772','R','92','0','0','2','Actividades de agencias de loterías (venta de billetes y números)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('773','R','92','0','0','3','Actividades de centros de apuestas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('774','R','93','1','1','0','Gestión de instalaciones deportivas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('775','R','93','1','2','0','Actividades de clubes deportivos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('776','R','93','1','9','0','Otras actividades deportivas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('777','R','93','2','1','0','Actividades de parques de atracciones y parques temáticos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('778','R','93','2','9','0','Otras actividades de esparcimiento y recreativas n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('779','S','94','1','1','0','Actividades de asociaciones empresariales y de empleadores');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('780','S','94','1','2','0','Actividades de asociaciones profesionales');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('781','S','94','2','0','0','Actividades de sindicatos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('782','S','94','9','1','0','Actividades de organizaciones religiosas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('783','S','94','9','2','0','Actividades de organizaciones políticas');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('784','S','94','9','9','0','Actividades de otras asociaciones n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('785','S','95','1','1','0','Reparación de computadores y equipo periférico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('786','S','95','1','2','0','Reparación de equipo de comunicaciones');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('787','S','95','2','1','0','Reparación de aparatos electrónicos de consumo');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('788','S','95','2','2','0','Reparación de aparatos de uso doméstico y equipo doméstico y de jardinería');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('789','S','95','2','3','0','Reparación de calzado y de artículos de cuero');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('790','S','95','2','4','0','Reparación de muebles y accesorios domésticos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('791','S','95','2','9','0','Reparación de efectos personales y enseres domésticos n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('792','S','96','0','1','0','Lavadoylimpieza,incluidalalimpiezaenseco,deproductostextilesydepiel(tintorerías)');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('793','S','96','0','2','0','Peluquería y otros tratamientos de belleza');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('794','S','96','0','3','1','Actividades de funerarías y capillas velatorias');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('795','S','96','0','3','2','Actividades de cementerios y camposantos');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('796','S','96','0','9','0','Otras actividades de servicios personales n.c.p.');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('797','T','97','0','0','0','Actividades de los hogares como empleadores de personal doméstico');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('798','T','98','1','0','0','Actividades no diferenciadas de los hogares como productores de bienes para uso propio');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('799','T','98','2','0','0','Actividadesnodiferenciadasdeloshogarescomoproductoresdeserviciosparausopropio');
INSERT INTO `rama` (`id`,`codigo_seccion`,`codigo_division`,`codigo_grupo`,`codigo_clase`,`codigo_rama`,`rama`) VALUES
('800','U','99','0','0','0','Actividades de organizaciones y órganos extraterritoriales');



-- -------------------------------------------
-- TABLE DATA seccion
-- -------------------------------------------
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('1','A','Agricultura, ganadería, caza, silvicultura y pesca');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('2','B','Explotación de minas y canteras');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('3','C','Industrias manufactureras');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('4','D','Suministro de electricidad, gas, vapor y aire acondicionado');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('5','E','Suministro de agua; evacuación de aguas residuales, gestión de desechos y descontaminación');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('6','F','Construcción');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('7','G','Comercio al por mayor y al por menor; reparación de vehículos automotores y motocicletas');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('8','H','Transporte y almacenamiento');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('9','I','Actividades de alojamiento y de servicio de comidas');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('10','J','Información y comunicaciones');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('11','K','Actividades financieras y de seguros');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('12','L','Actividades inmobiliarias');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('13','M','Actividades profesionales, científicas y técnicas');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('14','N','Actividades de servicios administrativos y de apoyo');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('15','O','Administración pública y defensa; planes de seguridad social de afiliación obligatoria');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('16','P','Educación');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('17','Q','Salud humana y servicios sociales');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('18','R','Actividades artísticas de entretenimiento y recreativas');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('19','S','Otras actividades de servicios');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('20','T','Actividades de los hogares como empleadores; actividades no diferenciadas de los hogares como productores de bienes y servicios para uso propio');
INSERT INTO `seccion` (`id`,`codigo`,`seccion`) VALUES
('21','U',' Actividades de organizaciones y órganos extraterritoriales');



-- -------------------------------------------
-- TABLE DATA sector
-- -------------------------------------------
INSERT INTO `sector` (`id`,`nombre`) VALUES
('1','Publico');
INSERT INTO `sector` (`id`,`nombre`) VALUES
('2','Privado');



-- -------------------------------------------
-- TABLE DATA sindicato
-- -------------------------------------------
INSERT INTO `sindicato` (`id`,`nombre`,`siglas`,`nro_boleta_inscripcion`,`folio_registro`,`tomo_registroo`,`rif`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`federacion_nacional`,`federacion_regional`,`sector`,`ambito`,`tipo_organizacion`,`fecha_registro`,`fecha_actualizacion`,`duracion_junta_directiva`,`fecha_inicio_vigencia`,`fecha_cese_vigencia`,`fecha_informe_finanzas`,`fecha_nomina_afiliado`,`fecha_ultimas_elecciones`,`cod_convencion`) VALUES
('5','sindicato4','4','1234-12-12345','1','1','V173898148','caracas','14','234','633','0212-4813639','nose','nose','1','1','2','2015-10-13','2015-10-08','111','2015-10-14','2015-10-14','2015-10-07','2015-10-22','2015-10-28','26');
INSERT INTO `sindicato` (`id`,`nombre`,`siglas`,`nro_boleta_inscripcion`,`folio_registro`,`tomo_registroo`,`rif`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`federacion_nacional`,`federacion_regional`,`sector`,`ambito`,`tipo_organizacion`,`fecha_registro`,`fecha_actualizacion`,`duracion_junta_directiva`,`fecha_inicio_vigencia`,`fecha_cese_vigencia`,`fecha_informe_finanzas`,`fecha_nomina_afiliado`,`fecha_ultimas_elecciones`,`cod_convencion`) VALUES
('6','sindicato unico de trabajadores','SUT','0202-02-12345','12','12','V173898149','caracas','24','462','1119','0212-4813639','nose','nose','1','2','1','2015-10-23','2015-10-23','10','2015-10-01','2015-10-23','0000-00-00','2015-10-28','2015-10-28','8');
INSERT INTO `sindicato` (`id`,`nombre`,`siglas`,`nro_boleta_inscripcion`,`folio_registro`,`tomo_registroo`,`rif`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`federacion_nacional`,`federacion_regional`,`sector`,`ambito`,`tipo_organizacion`,`fecha_registro`,`fecha_actualizacion`,`duracion_junta_directiva`,`fecha_inicio_vigencia`,`fecha_cese_vigencia`,`fecha_informe_finanzas`,`fecha_nomina_afiliado`,`fecha_ultimas_elecciones`,`cod_convencion`) VALUES
('7','sindicato1','1','1234-12-12345','2','23','','caracas','2','11','31','0212-4813639','nose','nose','2','2','2','2015-10-27','2015-10-30','9','2015-10-27','2015-10-27','0000-00-00','2015-10-27','2015-10-27','10');
INSERT INTO `sindicato` (`id`,`nombre`,`siglas`,`nro_boleta_inscripcion`,`folio_registro`,`tomo_registroo`,`rif`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`federacion_nacional`,`federacion_regional`,`sector`,`ambito`,`tipo_organizacion`,`fecha_registro`,`fecha_actualizacion`,`duracion_junta_directiva`,`fecha_inicio_vigencia`,`fecha_cese_vigencia`,`fecha_informe_finanzas`,`fecha_nomina_afiliado`,`fecha_ultimas_elecciones`,`cod_convencion`) VALUES
('8','probando sindicatp','ps','1234-12-12345','2','2','v173898149','caracas','24','462','1123','0212-4813639','nose','nose','2','2','2','2015-11-11','2015-11-04','10','2015-11-27','2015-11-30','0000-00-00','2015-11-30','2015-11-30','27');
INSERT INTO `sindicato` (`id`,`nombre`,`siglas`,`nro_boleta_inscripcion`,`folio_registro`,`tomo_registroo`,`rif`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`federacion_nacional`,`federacion_regional`,`sector`,`ambito`,`tipo_organizacion`,`fecha_registro`,`fecha_actualizacion`,`duracion_junta_directiva`,`fecha_inicio_vigencia`,`fecha_cese_vigencia`,`fecha_informe_finanzas`,`fecha_nomina_afiliado`,`fecha_ultimas_elecciones`,`cod_convencion`) VALUES
('9','sindicato unico de trabajadores','SUT','1234-12-12345','2','2','V-173898149','caracas','6','68','226','0212-4813639','nose','nose','2','1','2','2015-11-17','2015-11-19','10','2015-11-18','2015-11-30','0000-00-00','2015-11-25','2015-11-18','28');
INSERT INTO `sindicato` (`id`,`nombre`,`siglas`,`nro_boleta_inscripcion`,`folio_registro`,`tomo_registroo`,`rif`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`federacion_nacional`,`federacion_regional`,`sector`,`ambito`,`tipo_organizacion`,`fecha_registro`,`fecha_actualizacion`,`duracion_junta_directiva`,`fecha_inicio_vigencia`,`fecha_cese_vigencia`,`fecha_informe_finanzas`,`fecha_nomina_afiliado`,`fecha_ultimas_elecciones`,`cod_convencion`) VALUES
('10','unico de trabajadores','ut','1234-12-12345','2','2','','caracas, no se, no se','24','462','1119','0212-3336677','no se',' no se','1','2','1','2015-11-01','2015-11-01','10','2015-11-04','2015-11-30','0000-00-00','2015-11-25','2015-11-25','29');
INSERT INTO `sindicato` (`id`,`nombre`,`siglas`,`nro_boleta_inscripcion`,`folio_registro`,`tomo_registroo`,`rif`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`federacion_nacional`,`federacion_regional`,`sector`,`ambito`,`tipo_organizacion`,`fecha_registro`,`fecha_actualizacion`,`duracion_junta_directiva`,`fecha_inicio_vigencia`,`fecha_cese_vigencia`,`fecha_informe_finanzas`,`fecha_nomina_afiliado`,`fecha_ultimas_elecciones`,`cod_convencion`) VALUES
('16','sindicato 5','s5','1234-11-11111','2','nose','','caracas','24','462','1118','0212-4813639','no se','no se','1','1','1','0000-00-00','0000-00-00','10','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','8');
INSERT INTO `sindicato` (`id`,`nombre`,`siglas`,`nro_boleta_inscripcion`,`folio_registro`,`tomo_registroo`,`rif`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`federacion_nacional`,`federacion_regional`,`sector`,`ambito`,`tipo_organizacion`,`fecha_registro`,`fecha_actualizacion`,`duracion_junta_directiva`,`fecha_inicio_vigencia`,`fecha_cese_vigencia`,`fecha_informe_finanzas`,`fecha_nomina_afiliado`,`fecha_ultimas_elecciones`,`cod_convencion`) VALUES
('17','sindicato 6','s6','1234-11-11111','12','aweqwe','','caracas','24','462','1117','0212-4813639','nose','nose','1','1','2','0000-00-00','0000-00-00','10','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','8');
INSERT INTO `sindicato` (`id`,`nombre`,`siglas`,`nro_boleta_inscripcion`,`folio_registro`,`tomo_registroo`,`rif`,`direccion`,`estado`,`municipio`,`parroquia`,`telefono`,`federacion_nacional`,`federacion_regional`,`sector`,`ambito`,`tipo_organizacion`,`fecha_registro`,`fecha_actualizacion`,`duracion_junta_directiva`,`fecha_inicio_vigencia`,`fecha_cese_vigencia`,`fecha_informe_finanzas`,`fecha_nomina_afiliado`,`fecha_ultimas_elecciones`,`cod_convencion`) VALUES
('18','sindicato 6','s6','1234-11-11111','12','12','','caracas','24','462','1118','0212-4813639','no se','no se','1','1','1','0000-00-00','0000-00-00','20','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','8');



-- -------------------------------------------
-- TABLE DATA tipo_organizacion
-- -------------------------------------------
INSERT INTO `tipo_organizacion` (`id`,`descripcion`) VALUES
('1','Sindicato');
INSERT INTO `tipo_organizacion` (`id`,`descripcion`) VALUES
('2','Federación');
INSERT INTO `tipo_organizacion` (`id`,`descripcion`) VALUES
('3','Confederación');
INSERT INTO `tipo_organizacion` (`id`,`descripcion`) VALUES
('4','Coalisión De Trabajadores');



-- -------------------------------------------
-- TABLE DATA tipo_sindicato
-- -------------------------------------------
INSERT INTO `tipo_sindicato` (`id`,`nombre_cargo`) VALUES
('1','Trabajadores amparados por la convención colectiva');
INSERT INTO `tipo_sindicato` (`id`,`nombre_cargo`) VALUES
('2','Trabajadores Afiliados al Sindicato');
INSERT INTO `tipo_sindicato` (`id`,`nombre_cargo`) VALUES
('3','Secretario general');
INSERT INTO `tipo_sindicato` (`id`,`nombre_cargo`) VALUES
('4','Secretario ejecutivo');
INSERT INTO `tipo_sindicato` (`id`,`nombre_cargo`) VALUES
('5','Secretario del Tesorero');
INSERT INTO `tipo_sindicato` (`id`,`nombre_cargo`) VALUES
('6','Secretario de finanzas');
INSERT INTO `tipo_sindicato` (`id`,`nombre_cargo`) VALUES
('7','Secretario de trabajo y Reclamos');
INSERT INTO `tipo_sindicato` (`id`,`nombre_cargo`) VALUES
('8','Secretario de Cultura y Deporte');
INSERT INTO `tipo_sindicato` (`id`,`nombre_cargo`) VALUES
('9','Secretario de Organización');
INSERT INTO `tipo_sindicato` (`id`,`nombre_cargo`) VALUES
('10','Secretario de Actas y Correspondencia');
INSERT INTO `tipo_sindicato` (`id`,`nombre_cargo`) VALUES
('11','Secretario de Salud Laboral');
INSERT INTO `tipo_sindicato` (`id`,`nombre_cargo`) VALUES
('12','Secretario de vigilancia y Disciplina');
INSERT INTO `tipo_sindicato` (`id`,`nombre_cargo`) VALUES
('13','Secretario Otro');
INSERT INTO `tipo_sindicato` (`id`,`nombre_cargo`) VALUES
('14','Delegado sindical');
INSERT INTO `tipo_sindicato` (`id`,`nombre_cargo`) VALUES
('15','Asesor');



-- -------------------------------------------
-- TABLE DATA trabajador_sindicato
-- -------------------------------------------
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('8','8','6697264','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('38','8','7124495','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('5','8','7127124','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('28','8','8673908','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('34','8','8846297','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('26','8','8847435','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('6','8','9403674','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('40','8','9633381','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('12','8','9862027','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('43','8','10059762','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('18','8','12102386','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('33','8','12310091','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('21','8','12481902','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('15','8','12522371','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('50','8','12568645','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('41','8','13046909','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('37','8','13103016','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('29','8','13618300','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('19','8','13723399','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('20','8','14181858','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('22','8','14186987','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('11','8','14303141','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('3','8','14495920','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('14','8','14819080','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('24','8','14819405','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('30','8','15529327','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('46','8','15652960','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('10','8','15684169','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('25','8','15975376','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('47','8','16401991','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('32','8','17553105','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('35','8','17778944','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('49','8','17807331','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('17','8','17956886','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('4','8','18412958','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('27','8','18500489','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('48','8','18501659','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('2','8','19479129','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('16','8','19602230','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('1','8','19667073','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('42','8','19997004','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('13','8','20081131','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('9','8','20382854','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('45','8','20731635','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('7','8','20950942','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('23','8','22009154','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('36','8','22740182','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('39','8','23426565','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('31','8','23742497','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('44','8','24295242','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('562','10','6697264','1','1','1','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('592','10','7124495','1','1','0','1','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('559','10','7127124','1','1','0','0','1','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('582','10','8673908','1','1','0','0','0','1','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('588','10','8846297','1','1','0','0','0','0','1','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('580','10','8847435','1','1','0','0','0','0','0','1','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('560','10','9403674','1','1','0','0','0','0','0','0','1','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('594','10','9633381','1','1','0','0','0','0','0','0','0','1','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('566','10','9862027','1','1','0','0','0','0','0','0','0','0','1','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('597','10','10059762','1','1','0','0','0','0','0','0','0','0','0','1','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('572','10','12102386','1','1','0','0','0','0','0','0','0','0','0','0','1','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('587','10','12310091','1','1','0','0','0','0','0','0','0','0','0','0','0','1');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('575','10','12481902','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('569','10','12522371','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('604','10','12568645','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('595','10','13046909','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('591','10','13103016','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('583','10','13618300','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('573','10','13723399','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('574','10','14181858','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('576','10','14186987','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('565','10','14303141','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('557','10','14495920','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('568','10','14819080','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('578','10','14819405','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('584','10','15529327','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('600','10','15652960','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('564','10','15684169','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('579','10','15975376','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('601','10','16401991','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('586','10','17553105','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('589','10','17778944','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('603','10','17807331','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('571','10','17956886','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('558','10','18412958','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('581','10','18500489','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('602','10','18501659','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('556','10','19479129','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('570','10','19602230','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('555','10','19667073','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('596','10','19997004','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('567','10','20081131','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('563','10','20382854','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('599','10','20731635','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('561','10','20950942','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('577','10','22009154','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('590','10','22740182','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('593','10','23426565','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('585','10','23742497','1','1','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `trabajador_sindicato` (`id`,`nomina_sindicato`,`trabajador`,`trabajadores_amparados_conve_col`,`trabajadores_afiliados_sindicato`,`secretario_general`,`secretario_ejecutivo`,`secretario_tesorero`,`secretario_finanzas`,`secretario_trabajo_reclamos`,`secretario_cultura_deporte`,`secretario_organizacion`,`secretario_actas_correspondencias`,`secretario_salud_laboral`,`secretario_vigilancia_disciplina`,`secretario_otro`,`delegado_sindical`) VALUES
('598','10','24295242','1','1','0','0','0','0','0','0','0','0','0','0','0','0');



-- -------------------------------------------
-- TABLE DATA usuario
-- -------------------------------------------
INSERT INTO `usuario` (`id`,`nombres`,`cedula`,`correo`,`nivel`,`estatus`,`telefono`,`login`,`clave`) VALUES
('1','administrador','123456','example@example.com','1','1','02125555555','admin','21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `usuario` (`id`,`nombres`,`cedula`,`correo`,`nivel`,`estatus`,`telefono`,`login`,`clave`) VALUES
('2','cargador','123456','probando@probnado.com','2','1','02124813639','cargador','f2b318b5e71f2afe39fcda462a7702f7');



-- -------------------------------------------
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
COMMIT;
-- -------------------------------------------
-- -------------------------------------------
-- END BACKUP
-- -------------------------------------------
