CREATE TABLE `tlspolicies` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `domain` varchar(255) NOT NULL,
    `policy` enum('none', 'may', 'encrypt', 'dane', 'dane-only', 'fingerprint', 'verify', 'secure') NOT NULL,
    `params` varchar(255),
    PRIMARY KEY (`id`),
    UNIQUE KEY (`domain`)
) CHARSET=latin1;

INSERT INTO `tlspolicies` (`id`, `domain`, `policy`, `params`) VALUES
(1, 'gmx.de', 'secure', 'match=.gmx.net');