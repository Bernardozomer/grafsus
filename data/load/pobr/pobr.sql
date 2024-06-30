USE DATASUS;

-- Create the table.

CREATE TABLE IF NOT EXISTS `POBR` (
	`ANO_DIAGN` DECIMAL(4, 0) NOT NULL,
	`TRATAMENTO` DECIMAL(1, 0) NOT NULL,
	`DIAGNOSTIC` DECIMAL(1, 0) NOT NULL,
	`IDADE` DECIMAL(3, 0) NOT NULL,
	`SEXO` VARCHAR(1) NOT NULL,
	`ESTADIAM` DECIMAL(1, 0) NOT NULL,
	`DIAG_DETH` DECIMAL(2, 0) NOT NULL,
	`DT_DIAG` VARCHAR(10) NOT NULL,
	`DT_TRAT` VARCHAR(10)
);

-- Load data from file into the table.

LOAD DATA LOCAL INFILE '/data/load/pobr/pobr.csv'
     INTO TABLE POBR
     FIELDS TERMINATED BY ','
     ENCLOSED BY '"'
     LINES TERMINATED BY '\n'
     IGNORE 1 ROWS
     (
		`ANO_DIAGN`, `TRATAMENTO`, `DIAGNOSTIC`, `IDADE`, `SEXO`, `ESTADIAM`,
		`DIAG_DETH`, `DT_DIAG`, `DT_TRAT`
	 );

-- Add a primary key to the table.

ALTER TABLE POBR ADD ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Transform the TRATAMENTO column into an enum.

ALTER TABLE POBR MODIFY COLUMN TRATAMENTO ENUM(
	'1', '2', '3', '4', '5',
	'Cirurgia', 'Quimioterapia', 'Radioterapia',
	'Quimioterapia + Radioterapia', 'Sem informação de tratamento'
);

UPDATE POBR SET TRATAMENTO = 'Cirurgia' WHERE TRATAMENTO = '1';
UPDATE POBR SET TRATAMENTO = 'Quimioterapia' WHERE TRATAMENTO = '2';
UPDATE POBR SET TRATAMENTO = 'Radioterapia' WHERE TRATAMENTO = '3';
UPDATE POBR SET TRATAMENTO = 'Quimioterapia + Radioterapia' WHERE TRATAMENTO = '4';
UPDATE POBR SET TRATAMENTO = 'Sem informação de tratamento' WHERE TRATAMENTO = '5';

ALTER TABLE POBR MODIFY COLUMN TRATAMENTO ENUM(
	'Cirurgia', 'Quimioterapia', 'Radioterapia',
	'Quimioterapia + Radioterapia', 'Sem informação de tratamento'
);

-- Transform the DIAGNOSTIC column into an enum.

ALTER TABLE POBR MODIFY COLUMN DIAGNOSTIC ENUM(
	'1', '2', '3', '4',
	'Neoplasias Malignas', 'Neoplasias in situ',
	'Neoplasias de comportamento incerto ou desconhecido', 'C44 e C73'
);

UPDATE POBR SET DIAGNOSTIC = 'Neoplasias Malignas' WHERE DIAGNOSTIC = '1';
UPDATE POBR SET DIAGNOSTIC = 'Neoplasias in situ' WHERE DIAGNOSTIC = '2';
UPDATE POBR SET DIAGNOSTIC = 'Neoplasias de comportamento incerto ou desconhecido' WHERE DIAGNOSTIC = '3';
UPDATE POBR SET DIAGNOSTIC = 'C44 e C73' WHERE DIAGNOSTIC = '4';

ALTER TABLE POBR MODIFY COLUMN DIAGNOSTIC ENUM(
	'Neoplasias Malignas', 'Neoplasias in situ',
	'Neoplasias de comportamento incerto ou desconhecido', 'C44 e C73'
);

-- Transform the ESTADIAM column into an enum.

ALTER TABLE POBR MODIFY COLUMN ESTADIAM ENUM(
	'0', '1', '2', '3', '4', '5', '9',
	'I', 'II', 'III', 'IV', 'N/A', 'Ignorado'
);

UPDATE POBR SET ESTADIAM = 'I' WHERE ESTADIAM = '1';
UPDATE POBR SET ESTADIAM = 'II' WHERE ESTADIAM = '2';
UPDATE POBR SET ESTADIAM = 'III' WHERE ESTADIAM = '3';
UPDATE POBR SET ESTADIAM = 'IV' WHERE ESTADIAM = '4';
UPDATE POBR SET ESTADIAM = 'N/A' WHERE ESTADIAM = '5';
UPDATE POBR SET ESTADIAM = 'Ignorado' WHERE ESTADIAM = '9';

ALTER TABLE POBR MODIFY COLUMN ESTADIAM ENUM(
	'0', 'I', 'II', 'III', 'IV', 'N/A', 'Ignorado'
);

-- Transform the DIAG_DETH column into an enum.

ALTER TABLE POBR MODIFY COLUMN DIAG_DETH ENUM(
	'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
	'Sistema Digestivo', 'Sistema Respiratorio', 'Pele',
	'Sistema Reprodutivo, Mamas', 'Sistema Nervoso', 'Sistema Endocrino',
	'Sistema Hematologico', 'Sistema Musculo-Esqueletico', 'Sistema Cardiaco',
	'Sistema Urinario', 'Outros'
);

UPDATE POBR SET DIAG_DETH = 'Sistema Digestivo' WHERE DIAG_DETH = '0';
UPDATE POBR SET DIAG_DETH = 'Sistema Respiratorio' WHERE DIAG_DETH = '1';
UPDATE POBR SET DIAG_DETH = 'Pele' WHERE DIAG_DETH = '2';
UPDATE POBR SET DIAG_DETH = 'Sistema Reprodutivo, Mamas' WHERE DIAG_DETH = '3';
UPDATE POBR SET DIAG_DETH = 'Sistema Nervoso' WHERE DIAG_DETH = '4';
UPDATE POBR SET DIAG_DETH = 'Sistema Endocrino' WHERE DIAG_DETH = '5';
UPDATE POBR SET DIAG_DETH = 'Sistema Hematologico' WHERE DIAG_DETH = '6';
UPDATE POBR SET DIAG_DETH = 'Sistema Musculo-Esqueletico' WHERE DIAG_DETH = '7';
UPDATE POBR SET DIAG_DETH = 'Sistema Cardiaco' WHERE DIAG_DETH = '8';
UPDATE POBR SET DIAG_DETH = 'Sistema Urinario' WHERE DIAG_DETH = '9';
UPDATE POBR SET DIAG_DETH = 'Outros' WHERE DIAG_DETH = '10';

ALTER TABLE POBR MODIFY COLUMN DIAG_DETH ENUM(
	'Sistema Digestivo', 'Sistema Respiratorio', 'Pele',
	'Sistema Reprodutivo, Mamas', 'Sistema Nervoso', 'Sistema Endocrino',
	'Sistema Hematologico', 'Sistema Musculo-Esqueletico', 'Sistema Cardiaco',
	'Sistema Urinario', 'Outros'
);
