---question3
CREATE VIEW EmploiDeTemps AS
    SELECT DISTINCT T.jourCoursDate, C.codeCours
    FROM Cours C
        JOIN Typehoraire T
        ON C.codeCours= T.crsCodeCours
        JOIN Jourcours J
        ON J.dateJourCours=T.jourCoursDate
        JOIN Coursdeclasse cls
        ON  T.crsCodeCours=cls.crsCodeCours
        JOIN Classe Cl
        ON cl.specialiteNomSpec=cls.classSpecialiteNomspec
    ORDER BY T.jourCoursDate;

    ----question4
    alter table etudiant add password varchar(50);
    Update ETUDIANT SET MATRICULE + ORA_HASH(MATRICULE) WHERE MATRICULE = &VALUES;

   alter table enseignant add password varchar(50);
    Update ENSEIGNANT SET MATRICULE + ORA_HASH(MATRICULE) WHERE MATRICULE = &VALUES;

    ----question5
-- script de l'emploi de temps
SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON -
HEAD "<TITLE>Department Report</TITLE> -
<STYLE type='text/css'> -
<!-- BODY {background: white} --> -
</STYLE>" –
 BODY "TEXT='#ffffff'" –
 TABLE "WIDTH='90%' BORDER='5'"
SPOOL TimeTable.html
SELECT DISTINCT C.codeCours, T.jourCoursDate,C.VOLUMEH FROM Cours C
JOIN Typehoraire T
ON C.codeCours= T.crsCodeCours
JOIN Jourcours J
ON J.dateJourCours=T.jourCoursDate
JOIN Coursdeclasse cls
ON T.crsCodeCours=cls.crsCodeCours
JOIN Classe Cl
ON cl.specialiteNomSpec=cls.classSpecialiteNomspec
JOIN Etudiantdeclasse et 
on cls.crsCodeCours=et.COURCODECOURS
JOIN ETUDIANT pp 
ON pp.MATRICULE=et.ETUDIANTMATRICULE
WHERE  et.ETUDIANTMATRICULE=&Matricule AND PASSWORD=&Password;