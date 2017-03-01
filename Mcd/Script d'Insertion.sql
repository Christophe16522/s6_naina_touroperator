INSERT INTO client (idclient, nomclient, emailclient, passclient) VALUES (1, 'Christophe', 'lai_christophe@hotmail.com', 'root');
INSERT INTO client (idclient, nomclient, emailclient, passclient) VALUES (2, 'Alexandra', 'alexandralai@yahoo.fr', 'root');

INSERT INTO pack_voyage (idpackvoyage, idvoiture, idtarifvoyage, decription) VALUES (3, 1, 1, 'tana tamatave en starex');
INSERT INTO pack_voyage (idpackvoyage, idvoiture, idtarifvoyage, decription) VALUES (4, 2, 2, 'tana tamatave en patrole');

INSERT INTO voiture (idvoiture, matriculevoiture, imagevoiture, prixlocationvoiture, modelvoiture) VALUES (2, '4562 Tab', NULL, '150 000,00 €', 'Patrol');
INSERT INTO voiture (idvoiture, matriculevoiture, imagevoiture, prixlocationvoiture, modelvoiture) VALUES (3, '4895 Tam', NULL, '250 000,00 €', 'Navara');
INSERT INTO voiture (idvoiture, matriculevoiture, imagevoiture, prixlocationvoiture, modelvoiture) VALUES (1, '8731 Ac', NULL, '200 000,00 €', 'Grand Starex ');

INSERT INTO voyage (idvoyage, idpackvoyage, idclient, datedebutvoyage, datefinvoyage) VALUES (3, 3, 1, '2017-02-28', '2017-03-03');
INSERT INTO voyage (idvoyage, idpackvoyage, idclient, datedebutvoyage, datefinvoyage) VALUES (4, 4, 2, '2017-02-28', '2017-02-03');

INSERT INTO voyage_confirmer (idvoyageconfirmer, idvoyage) VALUES (1, 4);
