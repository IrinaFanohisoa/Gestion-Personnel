SELECT id_employe, nom_employe, prenom_employe FROM employe WHERE id_equipe IS NULL;
2
SELECT e.id_employe, nom_employe, prenom_employe FROM employe e LEFT JOIN conge c ON e.id_employe = c.id_employe WHERE c.id_conge IS NULL;
3
SELECT c.id_conge, debut_date, date_fin, e.nom_employe, e.prenom_employe, nom_equipe FROM employe e INNER JOIN conge c ON e.id_employe = c.id_employe INNER JOIN equipe p ON e.id_equipe = p.id_equipe;
4
SELECT contrat, COUNT(*) AS "Nombre d'employés par contrat" FROM employe GROUP BY contrat;
5
SELECT debut_date, COUNT(*) AS "Les employés en congé" FROM conge WHERE debut_date = '2026-01-16' GROUP BY debut_date;
6
SELECT e.id_employe, nom_employe, prenom_employe, nom_equipe FROM employe e INNER JOIN equipe p ON e.id_equipe = p.id_equipe INNER JOIN conge c ON e.id_employe = c.id_employe WHERE c.debut_date = '2026-01-16';
CATEGORIE 3
1
SELECT eq.id_equipe,nom_equipe, COUNT(*) AS "Le nombre des employés en FULL TIME" FROM equipe eq LEFT JOIN employe e ON eq.id_equipe = e.id_equipe WHERE contrat = 'FULL_TIME' GROUP BY eq.id_equipe, nom_equipe;
2
SELECT eq.id_equipe, nom_equipe, COUNT(*) AS "Le nombre des employés en PART TIME" FROM equipe eq LEFT JOIN employe e ON eq.id_equipe = e.id_equipe WHERE contrat = 'PART_TIME' GROUP BY eq.id_equipe, nom_equipe;
3
SELECT e.id_employe, nom_employe, prenom_employe, COUNT(c.id_conge) FROM employe e RIGHT JOIN conge c ON e.id_employe = c.id_employe WHERE contrat = 'FULL_TIME' GROUP BY e.id_employe, nom_employe, prenom_employe;
4
SELECT p.nom_equipe, contrat, MAX(salaire), MIN(salaire) FROM employe e INNER JOIN equipe p ON e.id_equipe = p.id_equipe GROUP BY p.nom_equipe, contrat;

CATEGORIE 4
SELECT ep.id_employe, nom_employe, prenom_employe, COUNT(c.id_conge) AS "Les employés qui aiment travailler" FROM employe ep LEFT JOIN conge c ON ep.id_employe = c.id_employe GROUP BY ep.id_employe, nom_employe, prenom_employe HAVING COUNT(c.id_conge)<2;
2
SELECT ep.id_employe,nom_employe,prenom_employe, COUNT(c.id_conge) FROM employe ep INNER JOIN conge c ON ep.id_employe = c.id_employe GROUP BY ep.id_employe,nom_employe,prenom_employe HAVING COUNT(c.id_conge)>=2;
3
SELECT eq.id_equipe, nom_equipe, AVG(salaire) FROM equipe eq INNER JOIN employe emp ON eq.id_equipe = emp.id_equipe GROUP BY eq.id_equipe, nom_equipe HAVING AVG(salaire) > 1000000;
SELECT* FROM conge;