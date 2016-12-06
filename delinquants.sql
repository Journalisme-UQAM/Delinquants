
-- Je veux connaître tous les champs possibles pour certaines colonnes. 

select distinct ethnicite
from delinquants;

select distinct emplacement
from delinquants;

select distinct religion
from delinquants;

select distinct province
from delinquants;

select distinct infraction
from delinquants; 

select distinct securiteetablissement
from delinquants;


-- Je fais des tests de commandes ici

select * 
from delinquants
where age <= 25 and GroupeEthnique = "autochtone" and genre = "homme"; 

select province
from delinquants
where province IN ("Quebec", "Ontario");

select religion
from delinquants
where religion = "wicca" and genre = "femme";

select *
from delinquants
order by province, age asc; 

select genre, age
from delinquants
where genre = "femme"
having age > 40
order by genre, age asc;


-- J'inscris diverses commandes pour faire des statistiques de mes différentes colonnes. J'inscrirai ensuite les informations recueillies dans des graphiques

select ROUND(AVG(age))
from delinquants;
-- âge moyen des délinquants 

select ROUND(AVG(age)), genre  
from delinquants
where genre = "femme";
-- âge moyen des femmes 

select ROUND(AVG(age)), genre
from delinquants
where genre = "homme";
-- âge moyen des hommes 


select COUNT(dureepeine)
from delinquants
where dureepeine != 0; 
-- Nombre de délinquants avec une durée de peine déterminée 

select ROUND(AVG(dureepeine))
from delinquants;
-- durée moyenne ceux avec peine de durée déterminée 

select ROUND(AVG(dureepeine)), genre
from delinquants
where genre = "femme";
-- durée moyenne pour les femems

select ROUND(AVG(dureepeine)), genre
from delinquants
where genre = "homme";
-- durée moyenne pour les hommes


select COUNT(groupeethnique)
from delinquants
where groupeethnique = "autochtone"; 
-- combien de délinquants sont autochtones

select COUNT(groupeethnique)
from delinquants
where groupeethnique = "non autochtone"; 
-- combien de délinquants sont non autochtones

select COUNT(genre)
from delinquants
where genre = "femme"; 
-- combien de délinquants sont des femmes 

select COUNT(genre)
from delinquants
where genre = "homme"; 
-- combien de délinquants sont des hommes 


select MAX(age)
from delinquants;
-- le délinquant le plus vieux est âgé de 94 ans

select MIN(age)
from delinquants;
-- le délinquant le plus jeune est âgé de 18 ans

select MAX(age), genre
from delinquants
where genre = "femme";
-- la femme la plus âgée

select MIN(age), genre
from delinquants
where genre = "femme";
-- la femme la plus jeune

select MAX(age), genre
from delinquants
where genre = "homme";
-- l'homme le plus âgé

select MIN(age), genre
from delinquants
where genre = "homme";
-- l'homme le plus jeune 

select MAX(age), groupeethnique 
from delinquants
where groupeethnique = "autochtone";
-- la personne autochtone la plus âgée

select MAX(age), groupeethnique 
from delinquants
where groupeethnique = "non autochtone";
-- la personne non autochtone la plus âgée 

select MIN(age), groupeethnique 
from delinquants
where groupeethnique = "autochtone";
-- la personne autochtone la moins âgée 

select MIN(age), groupeethnique 
from delinquants
where groupeethnique = "non autochtone";
-- la personne non autochtone la moins âgée


-- Je fais ci-dessous des statistiques pour les groupes d'âges
 
select COUNT(age) 
from delinquants 
where age <= 29;

select COUNT(age) 
from delinquants 
where age BETWEEN 30 and 39;

select COUNT(age) 
from delinquants 
where age BETWEEN 40 and 49;

select COUNT(age) 
from delinquants 
where age BETWEEN 50 and 59;

select COUNT(age) 
from delinquants 
where age BETWEEN 60 and 69;

select COUNT(age) 
from delinquants 
where age BETWEEN 70 and 79;

select COUNT(age) 
from delinquants 
where age BETWEEN 80 and 89;

select COUNT(age) 
from delinquants 
where age >= 90;


select COUNT(incarceration), incarceration
from delinquants 
group by incarceration;
-- combien sont incarcérés et combien sont sous surveillance

select COUNT(incarceration), genre 
from delinquants 
where incarceration = "incarcere" and genre = "femme";
-- combien de femmes sont incarcérées
 
select COUNT(incarceration), genre 
from delinquants 
where incarceration = "surveillance" and genre = "femme";
-- combien de femmes sont sous surveillance 

select COUNT(incarceration), genre 
from delinquants 
where incarceration = "incarcere" and genre = "homme";
-- combien d'hommes sont incarcérés
 
select COUNT(incarceration), genre 
from delinquants 
where incarceration = "surveillance" and genre = "homme";
-- combien d'hommes sont sous surveillance 


select COUNT(typesurveillance)
from delinquants
where typesurveillance = "sl";
-- combien de délinquants sont en semi-liberté

select COUNT(typesurveillance)
from delinquants
where typesurveillance = "lct";
-- combien de délinquants sont en libération conditionnelle totale

select COUNT(typesurveillance)
from delinquants
where typesurveillance = "lo";
-- combien de délinquants sont en libération d'office

select COUNT(typesurveillance)
from delinquants
where typesurveillance = "osld";
-- combien de délinquants sont en ordonnance de surveillance de longue durée 

select COUNT(typesurveillance)
from delinquants
where typesurveillance = "ar";
-- combien de délinquants sont en condition d'assignation à résidence 


select COUNT(jurisdiction), jurisdiction
from delinquants
group by jurisdiction;
-- combien de délinquants sont sous administration fédérale ou provinciale


select COUNT(typepeine)
from delinquants
where typepeine = "indeterminee";
-- nombre de personnes avec peine de durée indéterminée (on sait déjà plus haut combien ont une durée déterminée)


-- Je fais ci-dessous des statistiques sur les niveaux de sécurité des établissements 

select COUNT(securiteetablissement), securiteetablissement
from delinquants
group by securiteetablissement;
-- le nombre de délinquants associés à chaque niveau de sécurité d'établissement 

select COUNT(securiteetablissement), groupeethnique
from delinquants
where groupeethnique = "autochtone" and securiteetablissement = "minimale";

select COUNT(securiteetablissement), groupeethnique
from delinquants
where groupeethnique = "autochtone" and securiteetablissement = "moyenne";

select COUNT(securiteetablissement), groupeethnique
from delinquants
where groupeethnique = "autochtone" and securiteetablissement = "maximale";

select COUNT(securiteetablissement), groupeethnique
from delinquants
where groupeethnique = "autochtone" and securiteetablissement = "niv. multiples";

select COUNT(securiteetablissement), genre
from delinquants
where genre = "femme" and securiteetablissement = "minimale";

select COUNT(securiteetablissement), genre
from delinquants
where genre = "femme" and securiteetablissement = "moyenne";

select COUNT(securiteetablissement), genre
from delinquants
where genre = "femme" and securiteetablissement = "maximale";

select COUNT(securiteetablissement), genre
from delinquants
where genre = "femme" and securiteetablissement = "niv. multiples";

select genre, securiteetablissement
from delinquants
where genre = "femme"
order by securiteetablissement;
-- Je réalise ici que seulement 615 femmes sur 1123 ont un niveau de sécurité d'établissement associé. 631 sont incarcérées (voir plus haut)


select COUNT(province), province
from delinquants
group by province;
-- Le nombre de délinquants associés dans chaque province 

select COUNT(ethnicite), ethnicite
from delinquants
group by ethnicite;
-- la nationalité de chaque délinquants. Je note que 350 délinquants n'ont pas déclaré leur nationalité (ce n'est pas obligatoire)
-- ****voir pour infogr.am 
