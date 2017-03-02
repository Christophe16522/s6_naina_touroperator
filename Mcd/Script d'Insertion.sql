INSERT INTO client (idclient, nomclient, emailclient, passclient) VALUES (default, 'Christophe', 'lai_christophe@hotmail.com', 'root');
INSERT INTO client (idclient, nomclient, emailclient, passclient) VALUES (default, 'Alexandra', 'alexandralai@yahoo.fr', 'root');

INSERT INTO voiture (idvoiture, matriculevoiture, imagevoiture, prixlocationvoiture, modelvoiture) VALUES (default, '4562 Tab', NULL, '150 000,00 €', 'Patrol');
INSERT INTO voiture (idvoiture, matriculevoiture, imagevoiture, prixlocationvoiture, modelvoiture) VALUES (default, '4895 Tam', NULL, '250 000,00 €', 'Navara');
INSERT INTO voiture (idvoiture, matriculevoiture, imagevoiture, prixlocationvoiture, modelvoiture) VALUES (default, '8731 Ac', NULL, '200 000,00 €', 'Grand Starex ');

INSERT INTO voyage (idvoyage, idpackvoyage, idclient, datedebutvoyage, datefinvoyage) VALUES (default, 4, 5, '2017-02-28', '2017-03-03');
INSERT INTO voyage (idvoyage, idpackvoyage, idclient, datedebutvoyage, datefinvoyage) VALUES (default, 5, 6, '2017-02-28', '2017-02-03');

INSERT INTO pack_voyage (idpackvoyage, idvoiture, idtarifvoyage, decription) VALUES (default, 4, 1, 'tana tamatave en starex');
INSERT INTO pack_voyage (idpackvoyage, idvoiture, idtarifvoyage, decription) VALUES (default, 6, 2, 'tana tamatave en patrole');

INSERT INTO voyage_confirmer (idvoyageconfirmer, idvoyage) VALUES (default, 6);
