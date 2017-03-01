select * from pack_voyage where idpackvoyage = 4
select * from voyage
select * from voiture

select pack_voyage.idpackvoyage,voiture.matriculevoiture from pack_voyage as  pack_voyage
join voiture as voiture
on pack_voyage.idVoiture = voiture.idVoiture

select pack_voyage.idVoiture,voiture.matriculevoiture from voyage as  voyage
join voiture as voiture
join pack_voyage as pack_voyage
on pack_voyage.idVoiture = voiture.idVoiture

//contrainte de disponibilite avec dates

select voyage_confirmer.idvoyage,voyage.datedebutvoyage,voyage.datefinvoyage from voyage_confirmer
join voyage on voyage_confirmer.idvoyage = voyage.idvoyage
where 

// Vue voiture disponibles

select voyage.idvoyage,voyage.idpackvoyage,pack_voyage.idvoiture,voiture.modelvoiture from voyage 
join pack_voyage on pack_voyage.idpackvoyage = voyage.idpackvoyage  
join voiture on voiture.idvoiture = pack_voyage.idvoiture
where voyage.idvoyage not in (select idvoyage from voyage_confirmer) 

