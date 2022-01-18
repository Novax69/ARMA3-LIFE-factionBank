CREATE TABLE IF NOT EXISTS `bankFaction` (
    `id`            INT NOT NULL AUTO_INCREMENT,
    `bankBLUFOR`    INT NOT NULL DEFAULT 0,
    `bankINDE`     INT NOT NULL DEFAULT 0,

    PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO bankFaction (id,bankBLUFOR, bankINDE) VALUES (1,10000,10000);


-- Exec this in your DB