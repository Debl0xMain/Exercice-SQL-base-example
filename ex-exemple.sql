Utilise la base de donne example;
USE `example`;

1. Afficher toutes les informations concernant les employés;

Select * from employe;

2.Afficher toutes les informations concernant les départements;

SELECT * from dept;

3. Afficher le nom, la date d embauche, le numéro du supérieur, le
numéro de département et le salaire de tous les employés.;

select employe.nom , employe.dateemb , employe.nosup , employe.nodep , employe.salaire
FROM employe
JOIN dept
ON dept.nodept = employe.nodep;

4. Afficher le titre de tous les employés;

SELECT DISTINCT nom , titre
FROM employe;

6. Afficher le nom, le numéro d employé et le numéro du
département des employés dont le titre est « Secrétaire ». ;

SELECT nom , noemp , nodep , titre
FROM employe
WHERE titre = 'secretaire';

7. Afficher le nom et le numéro de département dont le numéro de
département est supérieur à 40;

SELECT nom , noemp , nodep
FROM employe
WHERE nodep >= 40 ;

9. Afficher le nom, le salaire et le numéro du département des employés
dont le titre est « Représentant », le numéro de département est 35 et
le salaire est supérieur à 20000. ;

SELECT nom , noemp , nodep , titre , salaire
FROM employe
WHERE titre = "représentant"
AND nodep = 35
AND salaire > 20000

10.Afficher le nom, le titre et le salaire des employés dont le titre est
« Représentant » ou dont le titre est « Président ».;

SELECT nom , titre , salaire 
FROM employe
WHERE titre = "representant"
or titre = "president";

12.Afficher le nom, le titre, le numéro de département, le salaire des
employés dont le titre est Représentant, ou dont le titre est Secrétaire
dans le département numéro 34.;

SELECT nom , titre , salaire , nodep 
FROM employe
WHERE titre = "representant"
AND nodep = 34
or titre = "secretaire"
AND nodep = 34;

13.Afficher le nom, et le salaire des employés dont le salaire est compris
entre 20000 et 30000.;

SELECT nom , salaire
FROM employe
WHERE salaire >= 20000
and salaire <= 30000;

15.Afficher le nom des employés commençant par la lettre « H ». ;

SELECT nom 
FROM employe
WHERE nom LIKE 'H%';

16.Afficher le nom des employés se terminant par la lettre « n ». ;

SELECT nom 
FROM employe
WHERE nom LIKE '%n';

17.Afficher le nom des employés contenant la lettre « u » en 3ème
position. ;

SELECT nom 
FROM employe
WHERE nom LIKE '__u%';

18.Afficher le salaire et le nom des employés du service 41 classés par
salaire croissant. ;

select nom , salaire , nodep 
FROM employe
where nodep = 41
order by salaire DESC;

19.Afficher le salaire et le nom des employés du service 41 classés par
salaire décroissant;
select nom , salaire , nodep 
FROM employe
where nodep = 41
order by salaire ASC ;

20.Afficher le titre, le salaire et le nom des employés classés par titre
croissant et par salaire décroissant.;

select nom , salaire , nodep , titre
FROM employe
order by salaire ASC , titre DESC

21.Afficher le taux de commission, le salaire et le nom des employés
classés par taux de commission croissante. ;

select nom , salaire , tauxcom , titre
FROM employe
order by tauxcom DESC;

22.Afficher le nom, le salaire, le taux de commission et le titre des
employés dont le taux de commission n est pas renseigné.  ;

select nom , salaire , tauxcom , titre
FROM employe
where tauxcom is NULL
order by tauxcom DESC;

24.Afficher le nom, le salaire, le taux de commission, le titre des
employés dont le taux de commission est inférieur à 15.;

select nom , salaire , tauxcom , titre
FROM employe
where tauxcom <= 15
order by tauxcom DESC;

25. Afficher le nom, le salaire, le taux de commission, le titre des
employés dont le taux de commission est supérieur à 15. ;

select nom , salaire , tauxcom , titre
FROM employe
where tauxcom >= 15
order by tauxcom DESC;

Y.
26.Afficher le nom, le salaire, le taux de commission et la commission des
employés dont le taux de commission n est pas nul. (la commission
est calculée en multipliant le salaire par le taux de commission);

select nom , salaire , tauxcom , titre
FROM employe
where tauxcom is NOT NULL
order by tauxcom DESC;

28. Afficher le nom et le prénom (concaténés) des employés. Renommer
les colonnes;
select CONCAT( nom,' ',prenom) as "Employe"
FROM employe
where tauxcom is NOT NULL
order by tauxcom DESC;

29. Afficher les 5 premières lettres du nom des employés.;
SELECT SUBSTR(nom, 3,3)
FROM employe;

30. Afficher le nom et le rang de la lettre « r » dans le nom des
employés. Vrante.;

 select UPPER(nom) as 'nom',lower(prenom) as 'prenom'
 from employe
 WHERE nom = 'Vrante';

32. Afficher le nom et le nombre de caractères du nom des employés. ;

SELECT nom , LENGTH(nom) as 'Nbr de caractere'
FROM employe



Ajouter trois employés dans la base de données avec les données de votre choix.;

INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (51, 'Bob', 'lebricoleur', '100', 5, 'président', '50', 50000, NULL),
                                                                                                                    (52, 'serveur', 'agathe', '50000415', '1', 'dir.distrib', '41', 35000, NULL) ,
                                                                                                                    (53, 'zedoux', 'rachid', '80000505', '1', 'dir.vente', '31', 34000, NULL);

Ajouter un département;
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('10', 'PoleVideo', '80');
Augmenter de 10% le salaire de l employe 17;
Update employe
set noemp = noemp * 1.1
WHERE noemp = 17;

Changer le nom du département 45 en 'Logistique';

Update dept
set nom = 'Logistique'
WHERE nodept = 45;


Suprime le dernier employe;

DELETE FROM employe
WHERE 'Last' (select noemp as 'Last'
              from employe
              order by noemp DESC);
              
              
              
----------------------Phase2-----------------------------------

1. Calculer le nombre d employés de chaque titre;

SELECT COUNT(nom) AS 'nbr_', titre 
FROM employe 
GROUP BY titre;
2. Calculer la moyenne des salaires et leur somme, par région.;

SELECT AVG(salaire) AS 'mynslr', SUM(salaire) AS 'salaire', nodep 
FROM employe 
GROUP BY nodep;

3. Afficher les numéros des départements ayant au moins 3 employés;

SELECT COUNT(nom) AS 'nmbr', nodep
FROM employ 
GROUP BY nodep 
HAVING COUNT(*) > 3;

4. Afficher les lettres qui sont l'initiale d'au moins trois employés.;

SELECT COUNT(nom, 1) AS 'ltr', COUNT(*) AS 'count'
FROM employe 
GROUP BY ltr 
HAVING COUNT(*) > 3;
5. Rechercher le salaire maximum et le salaire minimum parmi tous les
salariés et l écart entre les deux. ;

SELECT MAX(salaire) AS "slrmax", 
    MIN(salaire) AS "slrmin",
    'slrmax' - 'slrmin' 
AS diff 
FROM employe;

6. Rechercher le nombre de titres différents. ;

SELECT COUNT(DISTINCT titre) as'Titre'
FROM employe;

7. Pour chaque titre, compter le nombre d employés possédant ce titre.;

SELECT COUNT(nom) as 'nom', titre 
FROM employe 
GROUP BY titre;

8. Pour chaque nom de département, afficher le nom du département et
le nombre d employés;

SELECT COUNT(employe.nom) as 'nom employe', dept.nom 
FROM employe 
JOIN dept 
ON employe.nodep = dept.nodept 
GROUP BY dept.nom ASC;

9. Rechercher les titres et la moyenne des salaires par titre dont la
moyenne est supérieure à la moyenne des salaires des Représentants. 

SELECT AVG(salaire) AS 'slr', titre 
FROM employe 
GROUP BY titre 
HAVING slr > (
                SELECT AVG(salaire) AS moy_salaire 
                FROM employe 
                WHERE titre = 'rprsent');

10.Rechercher le nombre de salaires renseignés et le nombre de taux de
commission renseignés. 

SELECT COUNT(tauxcom) , COUNT(salaire)
FROM employe;

Rechercher le numéro de département, le nom du département, le
nom des employés, en affichant aussi les départements dans lesquels
il n y a personne, classés par numéro de département ;

SELECT employe.nodep , employe.nom , dept.nom
FROM employe
JOIN dept 
ON employe.nodep = dept.nodept 
order by employe.nodep;

Rechercher le nom et le salaire des employés qui gagnent plus que
leur patron, et le nom et le salaire de leur patron. ;

Rechercher le numéro du département, le nom du département, le
nom des employés classés par numéro de département (renommer les
tables utilisées).;

SELECT employe.nodep as "numero Departement" , employe.nom as 'Salarie' , dept.nom as "departement"
FROM employe
JOIN dept 
ON employe.nodep = dept.nodept 
order by employe.nodep;

Rechercher le nom des employés du département Distribution. ;

SELECT employe.nodep as "numero Departement" , employe.nom as 'Salarie' , dept.nom as "departement"
FROM employe
JOIN dept 
ON employe.nodep = dept.nodept 
WHERE employe.nodep = 41 ;

Rechercher le prénom des employés et le numéro de la région de leur
département.;

SELECT employe.nodep as "numero Departement" , employe.prenom as 'Salarie'
FROM employe
JOIN dept 
ON employe.nodep = dept.nodept ;

