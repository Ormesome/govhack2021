/*
  Scripts used for exporting the data for consumption by the application.
*/

-- competencies.json
select distinct cc.CoreCompetencies from nsc.coreCompetencies cc FOR JSON AUTO

-- occupations.json
select distinct cc.ANZSCOCode, cc.ANZSCOTitle from nsc.coreCompetencies cc FOR JSON AUTO

-- skills.json
select distinct st.ANZSCOCode, st.ClusterFamily, st.SpecialistCluster, st.SpecialistTask from nsc.specialistTasks st FOR JSON AUTO

-- sub-competencies.json
select distinct ccd.CoreCompetencies, ccd.Score, ccd.AnchorValue from nsc.coreCompetenciesDescriptions ccd for json auto

-- occupation-competencies.json
select distinct cc.ANZSCOCode , cc.CoreCompetencies , cc.Score from nsc.coreCompetencies cc for JSON AUTO

-- income2019.json
select ANZSCOCode, '2018-19' IncomeYear, CAST(sum(TaxableIncomeOrLoss$)/sum([TaxableIncomeOrLossNo.]) AS BIGINT) AvgIncome2019 from ato.[14A] a
group by ANZSCOCode
order by ANZSCOCode
FOR JSON AUTO

-- income.json
select ANZSCOCode, IncomeYear, CAST(sum(TaxableIncomeOrLoss$)/sum([TaxableIncomeOrLossNo.]) AS BIGINT) AvgIncome2021 from ato.[14B] b
group by ANZSCOCode, IncomeYear
order by ANZSCOCode, IncomeYear
FOR JSON AUTO
