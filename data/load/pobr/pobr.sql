USE DATASUS;

-- Create the table.

CREATE TABLE IF NOT EXISTS POBR (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ANO_DIAGN DECIMAL(4, 0) NOT NULL,
	TRATAMENTO ENUM(
		'Cirurgia', 'Quimioterapia', 'Radioterapia',
		'Quimioterapia + Radioterapia', 'Sem informação de tratamento'
	) NOT NULL,
	DIAGNOSTIC ENUM(
		'Neoplasias Malignas', 'Neoplasias in situ',
		'Neoplasias de comportamento incerto ou desconhecido', 'C44 e C73'
	) NOT NULL,
	IDADE DECIMAL(3, 0) NOT NULL,
	SEXO VARCHAR(1) NOT NULL,
	ESTADIAM ENUM(
		'0', 'I', 'II', 'III', 'IV', 'N/A', 'Ignorado'
	) NOT NULL,
	DIAG_DETH ENUM(
		'Sistema Digestivo', 'Sistema Respiratorio', 'Pele',
		'Sistema Reprodutivo, Mamas', 'Sistema Nervoso', 'Sistema Endocrino',
		'Sistema Hematologico', 'Sistema Musculo-Esqueletico',
		'Sistema Cardiaco', 'Sistema Urinario', 'Outros'
	) NOT NULL,
	DT_DIAG VARCHAR(10) NOT NULL,
	DT_TRAT VARCHAR(10)
);

-- Load data from the file into the table.

LOAD DATA LOCAL INFILE '/data/load/pobr/pobr.csv'
     INTO TABLE POBR
     FIELDS TERMINATED BY ','
     ENCLOSED BY '"'
     LINES TERMINATED BY '\n'
     IGNORE 1 ROWS
     (
		ANO_DIAGN, TRATAMENTO, DIAGNOSTIC, IDADE, SEXO, ESTADIAM,
		DIAG_DETH, DT_DIAG, DT_TRAT
	 );

-- Add indexes.

CREATE INDEX IX_POBR_ANO_DIAGN ON POBR (ANO_DIAGN) USING BTREE;
CREATE INDEX IX_POBR_TRATAMENTO ON POBR (TRATAMENTO) USING HASH;
CREATE INDEX IX_POBR_DIAGNOSTIC ON POBR (DIAGNOSTIC) USING HASH;
CREATE INDEX IX_POBR_IDADE ON POBR (IDADE) USING BTREE;
CREATE INDEX IX_POBR_SEXO ON POBR (SEXO) USING HASH;
CREATE INDEX IX_POBR_ESTADIAM ON POBR (ESTADIAM) USING HASH;
CREATE INDEX IX_POBR_DIAG_DETH ON POBR (DIAG_DETH) USING HASH;
