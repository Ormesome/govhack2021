/*
  Scripts used for exporting the data for consumption by the application.
*/

-- competencies.json
select distinct cc.CoreCompetencies AS competency from nsc.coreCompetencies cc FOR JSON AUTO

-- occupations.json
select distinct cc.ANZSCOCode, cc.ANZSCOTitle from nsc.coreCompetencies cc FOR JSON AUTO

-- skills.json
select distinct ANZSCOCode, ClusterFamily, SpecialistCluster, SpecialistTask from nsc.specialistTasks FOR JSON AUTO

-- sub-competencies.json
select CoreCompetencies, score, AnchorValue from nsc.coreCompetenciesDescriptions ccd for json auto
