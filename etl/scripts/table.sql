/*
  ETL
*/

CREATE TABLE etl.occupationDescriptions
(
  ANZSCO_Code VARCHAR(MAX),
  ANZSCO_Title VARCHAR(MAX),
  ANZSCO_Desc VARCHAR(MAX)
);
GO

CREATE TABLE etl.coreCompetencies
(
  ANZSCO_Code VARCHAR(MAX),
  ANZSCO_Title VARCHAR(MAX),
  Core_Competencies VARCHAR(MAX),
  Score VARCHAR(MAX),
  Proficiency_level VARCHAR(MAX),
  Anchor_value VARCHAR(MAX)
);
GO

CREATE TABLE etl.coreCompetenciesDescriptions
(
  Core_Competencies VARCHAR(MAX),
  [Competency Description] VARCHAR(MAX),
  Score VARCHAR(MAX),
  Proficiency_level VARCHAR(MAX),
  Anchor_value VARCHAR(MAX)
);
GO

CREATE TABLE etl.specialistTasks
(
  ANZSCO_Code VARCHAR(MAX),
  ANZSCO_Title VARCHAR(MAX),
  Specialist_Task VARCHAR(MAX),
  [% of time spent on task] VARCHAR(MAX),
  Specialist_Cluster VARCHAR(MAX),
  [% of time spent on cluster] VARCHAR(MAX),
  Cluster_Family VARCHAR(MAX),
  [% of time spent on family] VARCHAR(MAX)
);
GO

CREATE TABLE etl.technologyTools
(
  ANZSCO_Code VARCHAR(MAX),
  ANZSCO_Title VARCHAR(MAX),
  Technology_tool VARCHAR(MAX)
);
GO

CREATE TABLE etl.technologyToolsExamples
(
  Technology_tool VARCHAR(MAX),
  Technology_tool_example VARCHAR(MAX),
  [Tech Tool Ranking] VARCHAR(MAX)
);
GO

CREATE TABLE etl.[14A]
(
  Col0   VARCHAR(MAX), --[Occupation - unit group1] VARCHAR(MAX),
  Col1   VARCHAR(MAX), --[Sex] VARCHAR(MAX),
  Col2   VARCHAR(MAX), --[Taxable income range - tax brackets] VARCHAR(MAX),
  Col3   VARCHAR(MAX), --[Number of individuals] VARCHAR(MAX),
  Col4   VARCHAR(MAX), --[Taxable income or loss3 no.] VARCHAR(MAX),
  Col5   VARCHAR(MAX), --[Taxable income or loss3 $] VARCHAR(MAX),
  Col6   VARCHAR(MAX), --[Tax on taxable income no.] VARCHAR(MAX),
  Col7   VARCHAR(MAX), --[Tax on taxable income $] VARCHAR(MAX),
  Col8   VARCHAR(MAX), --[Medicare levy no.] VARCHAR(MAX),
  Col9   VARCHAR(MAX), --[Medicare levy $] VARCHAR(MAX),
  Col10  VARCHAR(MAX), --[Medicare levy surcharge no.] VARCHAR(MAX),
  Col11  VARCHAR(MAX), --[Medicare levy surcharge $] VARCHAR(MAX),
  Col12  VARCHAR(MAX), --[Total Medicare levy liability no.] VARCHAR(MAX),
  Col13  VARCHAR(MAX), --[Total Medicare levy liability $] VARCHAR(MAX),
  Col14  VARCHAR(MAX), --[Net tax no.] VARCHAR(MAX),
  Col15  VARCHAR(MAX), --[Net tax $] VARCHAR(MAX),
  Col16  VARCHAR(MAX), --[HELP Australian compulsory repayment due no.] VARCHAR(MAX),
  Col17  VARCHAR(MAX), --[HELP Australian compulsory repayment due $] VARCHAR(MAX),
  Col18  VARCHAR(MAX), --[Salary or wages no.] VARCHAR(MAX),
  Col19  VARCHAR(MAX), --[Salary or wages $] VARCHAR(MAX),
  Col20  VARCHAR(MAX), --[Tax withheld from salary or wages no.] VARCHAR(MAX),
  Col21  VARCHAR(MAX), --[Tax withheld from salary or wages $] VARCHAR(MAX),
  Col22  VARCHAR(MAX), --[Allowances earnings tips directors fees etc no.] VARCHAR(MAX),
  Col23  VARCHAR(MAX), --[Allowances earnings tips directors fees etc $] VARCHAR(MAX),
  Col24  VARCHAR(MAX), --[Employer lump sum payments amount A no.] VARCHAR(MAX),
  Col25  VARCHAR(MAX), --[Employer lump sum payments amount A $] VARCHAR(MAX),
  Col26  VARCHAR(MAX), --[Employment termination payments taxable component no.] VARCHAR(MAX),
  Col27  VARCHAR(MAX), --[Employment termination payments taxable component $] VARCHAR(MAX),
  Col28  VARCHAR(MAX), --[Australian government allowances and payments no.] VARCHAR(MAX),
  Col29  VARCHAR(MAX), --[Australian government allowances and payments $] VARCHAR(MAX),
  Col30  VARCHAR(MAX), --[Australian government pensions and allowances no.] VARCHAR(MAX),
  Col31  VARCHAR(MAX), --[Australian government pensions and allowances $] VARCHAR(MAX),
  Col32  VARCHAR(MAX), --[Australian annuities and superannuation income streams taxable component taxed element no.] VARCHAR(MAX),
  Col33  VARCHAR(MAX), --[Australian annuities and superannuation income streams taxable component taxed element $] VARCHAR(MAX),
  Col34  VARCHAR(MAX), --[Australian annuities and superannuation income streams taxable component untaxed element no.] VARCHAR(MAX),
  Col35  VARCHAR(MAX), --[Australian annuities and superannuation income streams taxable component untaxed element $] VARCHAR(MAX),
  Col36  VARCHAR(MAX), --[Gross interest no.] VARCHAR(MAX),
  Col37  VARCHAR(MAX), --[Gross interest $] VARCHAR(MAX),
  Col38  VARCHAR(MAX), --[Dividends unfranked no.] VARCHAR(MAX),
  Col39  VARCHAR(MAX), --[Dividends unfranked $] VARCHAR(MAX),
  Col40  VARCHAR(MAX), --[Dividends franked no.] VARCHAR(MAX),
  Col41  VARCHAR(MAX), --[Dividends franked $] VARCHAR(MAX),
  Col42  VARCHAR(MAX), --[Dividends franking credit no.] VARCHAR(MAX),
  Col43  VARCHAR(MAX), --[Dividends franking credit $] VARCHAR(MAX),
  Col44  VARCHAR(MAX), --[Total Income or Loss3 no.] VARCHAR(MAX),
  Col45  VARCHAR(MAX), --[Total Income or Loss3 $] VARCHAR(MAX),
  Col46  VARCHAR(MAX), --[Total work related car expenses no.] VARCHAR(MAX),
  Col47  VARCHAR(MAX), --[Total work related car expenses $] VARCHAR(MAX),
  Col48  VARCHAR(MAX), --[Work related travel expenses no.] VARCHAR(MAX),
  Col49  VARCHAR(MAX), --[Work related travel expenses $] VARCHAR(MAX),
  Col50  VARCHAR(MAX), --[Total work related uniform/clothing expenses no.] VARCHAR(MAX),
  Col51  VARCHAR(MAX), --[Total work related uniform/clothing expenses $] VARCHAR(MAX),
  Col52  VARCHAR(MAX), --[Total work related self education expenses no.] VARCHAR(MAX),
  Col53  VARCHAR(MAX), --[Total work related self education expenses $] VARCHAR(MAX),
  Col54  VARCHAR(MAX), --[Other work related expenses no.] VARCHAR(MAX),
  Col55  VARCHAR(MAX), --[Other work related expenses $] VARCHAR(MAX),
  Col56  VARCHAR(MAX), --[Total work related expenses no.] VARCHAR(MAX),
  Col57  VARCHAR(MAX), --[Total work related expenses $] VARCHAR(MAX),
  Col58  VARCHAR(MAX), --[Low value pool deduction no.] VARCHAR(MAX),
  Col59  VARCHAR(MAX), --[Low value pool deduction $] VARCHAR(MAX),
  Col60  VARCHAR(MAX), --[Interest deductions no.] VARCHAR(MAX),
  Col61  VARCHAR(MAX), --[Interest deductions $] VARCHAR(MAX),
  Col62  VARCHAR(MAX), --[Dividend deductions no.] VARCHAR(MAX),
  Col63  VARCHAR(MAX), --[Dividend deductions $] VARCHAR(MAX),
  Col64  VARCHAR(MAX), --[Gifts or donations no.] VARCHAR(MAX),
  Col65  VARCHAR(MAX), --[Gifts or donations $] VARCHAR(MAX),
  Col66  VARCHAR(MAX), --[Cost of managing tax affairs - Interest charged by the ATO no.] VARCHAR(MAX),
  Col67  VARCHAR(MAX), --[Cost of managing tax affairs - Interest charged by the ATO $] VARCHAR(MAX),
  Col68  VARCHAR(MAX), --[Cost of managing tax affairs - Litigation costs no.] VARCHAR(MAX),
  Col69  VARCHAR(MAX), --[Cost of managing tax affairs - Litigation costs $] VARCHAR(MAX),
  Col70  VARCHAR(MAX), --[Cost of managing tax affairs - Other expenses incurred in managing your tax affairs no.] VARCHAR(MAX),
  Col71  VARCHAR(MAX), --[Cost of managing tax affairs - Other expenses incurred in managing your tax affairs $] VARCHAR(MAX),
  Col72  VARCHAR(MAX), --[Total deductions3 no.] VARCHAR(MAX),
  Col73  VARCHAR(MAX), --[Total deductions3 $] VARCHAR(MAX),
  Col74  VARCHAR(MAX), --[Total reportable fringe benefits amounts - Employers exempt from FBT under section 57A of the FBTAA 1986 no.] VARCHAR(MAX),
  Col75  VARCHAR(MAX), --[Total reportable fringe benefits amounts - Employers exempt from FBT under section 57A of the FBTAA 1986 $] VARCHAR(MAX),
  Col76  VARCHAR(MAX), --[Total reportable fringe benefits amounts - Employers not exempt from FBT under section 57A of the FBTAA 1986 no.] VARCHAR(MAX),
  Col77  VARCHAR(MAX), --[Total reportable fringe benefits amounts - Employers not exempt from FBT under section 57A of the FBTAA 1986 $] VARCHAR(MAX),
  Col78  VARCHAR(MAX), --[Reportable employer superannuation contributions no.] VARCHAR(MAX),
  Col79  VARCHAR(MAX), --[Reportable employer superannuation contributions $] VARCHAR(MAX),
  Col80  VARCHAR(MAX), --[P&T net primary production amount no.] VARCHAR(MAX),
  Col81  VARCHAR(MAX), --[P&T net primary production amount $] VARCHAR(MAX),
  Col82  VARCHAR(MAX), --[P&T net non-primary production amount no.] VARCHAR(MAX),
  Col83  VARCHAR(MAX), --[P&T net non-primary production amount $] VARCHAR(MAX),
  Col84  VARCHAR(MAX), --[Share of franking credit from franked dividends no.] VARCHAR(MAX),
  Col85  VARCHAR(MAX), --[Share of franking credit from franked dividends $] VARCHAR(MAX),
  Col86  VARCHAR(MAX), --[Net PSI transferred no.] VARCHAR(MAX),
  Col87  VARCHAR(MAX), --[Net PSI transferred $] VARCHAR(MAX),
  Col88  VARCHAR(MAX), --[Deferred non-commercial business losses primary production deferred losses no.] VARCHAR(MAX),
  Col89  VARCHAR(MAX), --[Deferred non-commercial business losses primary production deferred losses $] VARCHAR(MAX),
  Col90  VARCHAR(MAX), --[Deferred non-commercial business losses non primary production deferred losses no.] VARCHAR(MAX),
  Col91  VARCHAR(MAX), --[Deferred non-commercial business losses non primary production deferred losses $] VARCHAR(MAX),
  Col92  VARCHAR(MAX), --[Capital gains net capital gain no.] VARCHAR(MAX),
  Col93  VARCHAR(MAX), --[Capital gains net capital gain $] VARCHAR(MAX),
  Col94  VARCHAR(MAX), --[Estimated tax on net capital gains no.] VARCHAR(MAX),
  Col95  VARCHAR(MAX), --[Estimated tax on net capital gains $] VARCHAR(MAX),
  Col96  VARCHAR(MAX), --[Capital gains total current year capital gains no.] VARCHAR(MAX),
  Col97  VARCHAR(MAX), --[Capital gains total current year capital gains $] VARCHAR(MAX),
  Col98  VARCHAR(MAX), --[Capital gains net capital losses carried forward no.] VARCHAR(MAX),
  Col99  VARCHAR(MAX), --[Capital gains net capital losses carried forward $] VARCHAR(MAX),
  Col100 VARCHAR(MAX), --[Foreign source income assessable foreign source income no.] VARCHAR(MAX),
  Col101 VARCHAR(MAX), --[Foreign source income assessable foreign source income $] VARCHAR(MAX),
  Col102 VARCHAR(MAX), --[Foreign source income other net foreign source income no.] VARCHAR(MAX),
  Col103 VARCHAR(MAX), --[Foreign source income other net foreign source income $] VARCHAR(MAX),
  Col104 VARCHAR(MAX), --[Foreign source income foreign income tax offset no.] VARCHAR(MAX),
  Col105 VARCHAR(MAX), --[Foreign source income foreign income tax offset $] VARCHAR(MAX),
  Col106 VARCHAR(MAX), --[Gross rent no.] VARCHAR(MAX),
  Col107 VARCHAR(MAX), --[Gross rent $] VARCHAR(MAX),
  Col108 VARCHAR(MAX), --[Rent interest deductions no.] VARCHAR(MAX),
  Col109 VARCHAR(MAX), --[Rent interest deductions $] VARCHAR(MAX),
  Col110 VARCHAR(MAX), --[Rent capital works deductions no.] VARCHAR(MAX),
  Col111 VARCHAR(MAX), --[Rent capital works deductions $] VARCHAR(MAX),
  Col112 VARCHAR(MAX), --[Rent other rental deductions no.] VARCHAR(MAX),
  Col113 VARCHAR(MAX), --[Rent other rental deductions $] VARCHAR(MAX),
  Col114 VARCHAR(MAX), --[Net rent - profit  no.] VARCHAR(MAX),
  Col115 VARCHAR(MAX), --[Net rent - profit  $] VARCHAR(MAX),
  Col116 VARCHAR(MAX), --[Net rent - loss  no.] VARCHAR(MAX),
  Col117 VARCHAR(MAX), --[Net rent - loss  $] VARCHAR(MAX),
  Col118 VARCHAR(MAX), --[Net rent3 no.] VARCHAR(MAX),
  Col119 VARCHAR(MAX), --[Net rent3 $] VARCHAR(MAX),
  Col120 VARCHAR(MAX), --[Other income category 1 no.] VARCHAR(MAX),
  Col121 VARCHAR(MAX), --[Other income category 1 $] VARCHAR(MAX),
  Col122 VARCHAR(MAX), --[Other income category 2 (ATO interest) no.] VARCHAR(MAX),
  Col123 VARCHAR(MAX), --[Other income category 2 (ATO interest) $] VARCHAR(MAX),
  Col124 VARCHAR(MAX), --[Other income category 3 (FHSS) no.] VARCHAR(MAX),
  Col125 VARCHAR(MAX), --[Other income category 3 (FHSS) $] VARCHAR(MAX),
  Col126 VARCHAR(MAX), --[Other income category 4 no.] VARCHAR(MAX),
  Col127 VARCHAR(MAX), --[Other income category 4 $] VARCHAR(MAX),
  Col128 VARCHAR(MAX), --[Personal superannuation contributions no.] VARCHAR(MAX),
  Col129 VARCHAR(MAX), --[Personal superannuation contributions $] VARCHAR(MAX),
  Col130 VARCHAR(MAX), --[Other deductions no.] VARCHAR(MAX),
  Col131 VARCHAR(MAX), --[Other deductions $] VARCHAR(MAX),
  Col132 VARCHAR(MAX), --[Total business income3 no.] VARCHAR(MAX),
  Col133 VARCHAR(MAX), --[Total business income3 $] VARCHAR(MAX),
  Col134 VARCHAR(MAX), --[Total business expenses3 no.] VARCHAR(MAX),
  Col135 VARCHAR(MAX), --[Total business expenses3 $] VARCHAR(MAX),
  Col136 VARCHAR(MAX), --[Net income or loss from business no.] VARCHAR(MAX),
  Col137 VARCHAR(MAX), --[Net income or loss from business $] VARCHAR(MAX),
  Col138 VARCHAR(MAX), --[Estimated business net tax no.] VARCHAR(MAX),
  Col139 VARCHAR(MAX), --[Estimated business net tax $] VARCHAR(MAX),
  Col140 VARCHAR(MAX), --[Australian superannuation income stream tax offset no.] VARCHAR(MAX),
  Col141 VARCHAR(MAX), --[Australian superannuation income stream tax offset $] VARCHAR(MAX),
  Col142 VARCHAR(MAX), --[Small business income tax offset no.] VARCHAR(MAX),
  Col143 VARCHAR(MAX), --[Small business income tax offset $] VARCHAR(MAX),
  Col144 VARCHAR(MAX), --[Low income tax offset no.] VARCHAR(MAX),
  Col145 VARCHAR(MAX), --[Low income tax offset $] VARCHAR(MAX),
  Col146 VARCHAR(MAX), --[Low and middle income tax offset no.] VARCHAR(MAX),
  Col147 VARCHAR(MAX), --[Low and middle income tax offset $] VARCHAR(MAX),
  Col148 VARCHAR(MAX), --[Employment termination payment tax offset no.] VARCHAR(MAX),
  Col149 VARCHAR(MAX), --[Employment termination payment tax offset $] VARCHAR(MAX),
  Col150 VARCHAR(MAX), --[HELP debt balance no.] VARCHAR(MAX),
  Col151 VARCHAR(MAX), --[HELP debt balance $] VARCHAR(MAX),
  Col152 VARCHAR(MAX), --[SFSS debt balance no.] VARCHAR(MAX),
  Col153 VARCHAR(MAX), --[SFSS debt balance $] VARCHAR(MAX),
  Col154 VARCHAR(MAX), --[TSL debt balance no.] VARCHAR(MAX),
  Col155 VARCHAR(MAX), --[TSL debt balance $] VARCHAR(MAX),
  Col156 VARCHAR(MAX), --[People with private health insurance  no.] VARCHAR(MAX),
  Col157 VARCHAR(MAX), --[Private health insurance - your Australian Government rebate received no.] VARCHAR(MAX),
  Col158 VARCHAR(MAX), --[Private health insurance - your Australian Government rebate received $] VARCHAR(MAX),
  Col159 VARCHAR(MAX), --[Private health insurance rebate no.] VARCHAR(MAX),
  Col160 VARCHAR(MAX), --[Private health insurance rebate $] VARCHAR(MAX),
  Col161 VARCHAR(MAX), --[Excess private health reduction or refund (rebate reduced) no.] VARCHAR(MAX),
  Col162 VARCHAR(MAX)  --[Excess private health reduction or refund (rebate reduced) $] VARCHAR(MAX)
);
GO

CREATE TABLE etl.[14B]
(
  Col0  VARCHAR(MAX),--[Income Year2] VARCHAR(MAX),
  Col1  VARCHAR(MAX),--[Occupation - unit group1] VARCHAR(MAX),
  Col2  VARCHAR(MAX),--[Sex] VARCHAR(MAX),
  Col3  VARCHAR(MAX),--[Taxable income ranges (tax brackets)] VARCHAR(MAX),
  Col4  VARCHAR(MAX),--[Number of individuals no.] VARCHAR(MAX),
  Col5  VARCHAR(MAX),--[Salary or wages no.] VARCHAR(MAX),
  Col6  VARCHAR(MAX),--[Salary or wages $] VARCHAR(MAX),
  Col7  VARCHAR(MAX),--[Total Income or Loss3 no.] VARCHAR(MAX),
  Col8  VARCHAR(MAX),--[Total Income or Loss3 $] VARCHAR(MAX),
  Col9  VARCHAR(MAX),--[Total work related car expenses no.] VARCHAR(MAX),
  Col10 VARCHAR(MAX),--[Total work related car expenses $] VARCHAR(MAX),
  Col11 VARCHAR(MAX),--[Work related travel expenses no.] VARCHAR(MAX),
  Col12 VARCHAR(MAX),--[Work related travel expenses $] VARCHAR(MAX),
  Col13 VARCHAR(MAX),--[Total work related uniform/clothing expenses no.] VARCHAR(MAX),
  Col14 VARCHAR(MAX),--[Total work related uniform/clothing expenses $] VARCHAR(MAX),
  Col15 VARCHAR(MAX),--[Total work related self education expenses no.] VARCHAR(MAX),
  Col16 VARCHAR(MAX),--[Total work related self education expenses $] VARCHAR(MAX),
  Col17 VARCHAR(MAX),--[Other work related expenses no.] VARCHAR(MAX),
  Col18 VARCHAR(MAX),--[Other work related expenses $] VARCHAR(MAX),
  Col19 VARCHAR(MAX),--[Gifts or donations no.] VARCHAR(MAX),
  Col20 VARCHAR(MAX),--[Gifts or donations $] VARCHAR(MAX),
  Col21 VARCHAR(MAX),--[Cost of managing tax affairs no.] VARCHAR(MAX),
  Col22 VARCHAR(MAX),--[Cost of managing tax affairs $] VARCHAR(MAX),
  Col23 VARCHAR(MAX),--[Cost of managing tax affairs - Other expenses incurred in managing your tax affairs no.] VARCHAR(MAX),
  Col24 VARCHAR(MAX),--[Cost of managing tax affairs - Other expenses incurred in managing your tax affairs $] VARCHAR(MAX),
  Col25 VARCHAR(MAX),--[Total deductions3 no.] VARCHAR(MAX),
  Col26 VARCHAR(MAX),--[Total deductions3 $] VARCHAR(MAX),
  Col27 VARCHAR(MAX),--[Capital gains net capital gain no.] VARCHAR(MAX),
  Col28 VARCHAR(MAX),--[Capital gains net capital gain $] VARCHAR(MAX),
  Col29 VARCHAR(MAX),--[Net rent - profit no.] VARCHAR(MAX),
  Col30 VARCHAR(MAX),--[Net rent - profit $] VARCHAR(MAX),
  Col31 VARCHAR(MAX),--[Net rent - loss no.] VARCHAR(MAX),
  Col32 VARCHAR(MAX),--[Net rent - loss $] VARCHAR(MAX),
  Col33 VARCHAR(MAX),--[Net rent3 no.] VARCHAR(MAX),
  Col34 VARCHAR(MAX),--[Net rent3 $] VARCHAR(MAX),
  Col35 VARCHAR(MAX),--[Total business income3 no.] VARCHAR(MAX),
  Col36 VARCHAR(MAX),--[Total business income3 $] VARCHAR(MAX),
  Col37 VARCHAR(MAX),--[Total business expenses3 no.] VARCHAR(MAX),
  Col38 VARCHAR(MAX),--[Total business expenses3 $] VARCHAR(MAX),
  Col39 VARCHAR(MAX),--[Net income or loss from business no.] VARCHAR(MAX),
  Col40 VARCHAR(MAX),--[Net income or loss from business $] VARCHAR(MAX),
  Col41 VARCHAR(MAX),--[Taxable income or loss3 no.] VARCHAR(MAX),
  Col42 VARCHAR(MAX),--[Taxable income or loss3 $] VARCHAR(MAX),
  Col43 VARCHAR(MAX),--[Net tax no.] VARCHAR(MAX),
  Col44 VARCHAR(MAX) --[Net tax $] VARCHAR(MAX)
);
GO

/*
  National Skills Commision tables
*/

CREATE TABLE nsc.occupationDescriptions
(
  ANZSCOCode INT,
  ANZSCOTitle VARCHAR(100),
  ANZSCODesc VARCHAR(1000),
  PRIMARY KEY (ANZSCOCode)
);
GO

CREATE TABLE nsc.coreCompetencies
(
  ANZSCOCode INT,
  ANZSCOTitle VARCHAR(100),
  CoreCompetencies VARCHAR(100),
  Score INT,
  ProficiencyLevel VARCHAR(50),
  AnchorValue VARCHAR(1000),
  PRIMARY KEY (ANZSCOCode, CoreCompetencies)
);
GO

CREATE TABLE nsc.coreCompetenciesDescriptions
(
  CoreCompetencies VARCHAR(100),
  CompetencyDescription VARCHAR(1000),
  Score INT,
  ProficiencyLevel VARCHAR(50),
  AnchorValue VARCHAR(1000),
  PRIMARY KEY (CoreCompetencies, Score)
);
GO

CREATE TABLE nsc.specialistTasks
(
  ANZSCOCode INT,
  ANZSCOTitle VARCHAR(100),
  SpecialistTask VARCHAR(200),
  PctTimeSpentOnTask DECIMAL(18,15),
  SpecialistCluster VARCHAR(100),
  PctTimeSpentOnCluster DECIMAL(18,15),
  ClusterFamily VARCHAR(100),
  PctTimeSpentOnFamily DECIMAL(18,15),
  PRIMARY KEY (ANZSCOCode, SpecialistTask)
);
GO

CREATE TABLE nsc.technologyTools
(
  ANZSCOCode INT,
  ANZSCOTitle VARCHAR(100),
  TechnologyTool VARCHAR(200),
  PRIMARY KEY (ANZSCOCode, TechnologyTool)
);
GO

CREATE TABLE nsc.technologyToolsExamples
(
  TechnologyTool VARCHAR(200),
  TechnologyToolExample VARCHAR(200),
  TechnologyToolRanking INT,
  PRIMARY KEY (TechnologyTool, TechnologyToolExample)
);
GO

CREATE TABLE nsc.technologyToolsCommon
(
  TechnologyTool VARCHAR(200),
  PRIMARY KEY (TechnologyTool)
);
GO

/*
  Australian Taxation Office
*/

CREATE TABLE ato.[14A]
(
  [Occupation-UnitGroup] VARCHAR(200), --Col0
  [Sex] VARCHAR(20), --Col1
  [TaxableIncomeRange-TaxBrackets] VARCHAR(100), --Col2
  [NumberOfIndividuals] VARCHAR(MAX), --Col3
  [TaxableIncomeOrLossNo.] BIGINT, --Col4
  [TaxableIncomeOrLoss$] FLOAT, --Col5
  [TaxOnTaxableIncomeNo.] BIGINT, --Col6
  [TaxOnTaxableIncome$] FLOAT, --Col7
  [MedicareLevyNo.] VARCHAR(MAX), --Col8
  [MedicareLevy$] VARCHAR(MAX), --Col9
  [MedicareLevySurchargeNo.] VARCHAR(MAX), --Col10
  [MedicareLevySurcharge$] VARCHAR(MAX), --Col11
  [TotalMedicareLevyLiabilityNo.] VARCHAR(MAX), --Col12
  [TotalMedicareLevyLiability$] VARCHAR(MAX), --Col13
  [NetTaxNo.] VARCHAR(MAX), --Col14
  [NetTax$] VARCHAR(MAX), --Col15
  [HelpAustralianCompulsoryRepaymentDueNo.] VARCHAR(MAX), --Col16
  [HelpAustralianCompulsoryRepaymentDue$] VARCHAR(MAX), --Col17
  [SalaryOrWagesNo.] VARCHAR(MAX), --Col18
  [SalaryOrWages$] VARCHAR(MAX), --Col19
  [TaxWithheldFromSalaryOrWagesNo.] VARCHAR(MAX), --Col20
  [TaxWithheldFromSalaryOrWages$] VARCHAR(MAX), --Col21
  [AllowancesEarningsTipsDirectorsFeesEtcNo.] VARCHAR(MAX), --Col22
  [AllowancesEarningsTipsDirectorsFeesEtc$] VARCHAR(MAX), --Col23
  [EmployerLumpSumPaymentsAmountANo.] VARCHAR(MAX), --Col24
  [EmployerLumpSumPaymentsAmountA$] VARCHAR(MAX), --Col25
  [EmploymentTerminationPaymentsTaxableComponentNo.] VARCHAR(MAX), --Col26
  [EmploymentTerminationPaymentsTaxableComponent$] VARCHAR(MAX), --Col27
  [AustralianGovernmentAllowancesAndPaymentsNo.] VARCHAR(MAX), --Col28
  [AustralianGovernmentAllowancesAndPayments$] VARCHAR(MAX), --Col29
  [AustralianGovernmentPensionsAndAllowancesNo.] VARCHAR(MAX), --Col30
  [AustralianGovernmentPensionsAndAllowances$] VARCHAR(MAX), --Col31
  [AustralianAnnuitiesAndSuperannuationIncomeStreamsTaxableComponentTaxedElementNo.] VARCHAR(MAX), --Col32
  [AustralianAnnuitiesAndSuperannuationIncomeStreamsTaxableComponentTaxedElement$] VARCHAR(MAX), --Col33
  [AustralianAnnuitiesAndSuperannuationIncomeStreamsTaxableComponentUntaxedElementNo.] VARCHAR(MAX), --Col34
  [AustralianAnnuitiesAndSuperannuationIncomeStreamsTaxableComponentUntaxedElement$] VARCHAR(MAX), --Col35
  [GrossInterestNo.] VARCHAR(MAX), --Col36
  [GrossInterest$] VARCHAR(MAX), --Col37
  [DividendsUnfrankedNo.] VARCHAR(MAX), --Col38
  [DividendsUnfranked$] VARCHAR(MAX), --Col39
  [DividendsFrankedNo.] VARCHAR(MAX), --Col40
  [DividendsFranked$] VARCHAR(MAX), --Col41
  [DividendsFrankingCreditNo.] VARCHAR(MAX), --Col42
  [DividendsFrankingCredit$] VARCHAR(MAX), --Col43
  [TotalIncomeOrLossNo.] VARCHAR(MAX), --Col44
  [TotalIncomeOrLoss$] VARCHAR(MAX), --Col45
  [TotalWorkRelatedCarExpensesNo.] VARCHAR(MAX), --Col46
  [TotalWorkRelatedCarExpenses$] VARCHAR(MAX), --Col47
  [WorkRelatedTravelExpensesNo.] VARCHAR(MAX), --Col48
  [WorkRelatedTravelExpenses$] VARCHAR(MAX), --Col49
  [TotalWorkRelatedUniform/ClothingExpensesNo.] VARCHAR(MAX), --Col50
  [TotalWorkRelatedUniform/ClothingExpenses$] VARCHAR(MAX), --Col51
  [TotalWorkRelatedSelfEducationExpensesNo.] VARCHAR(MAX), --Col52
  [TotalWorkRelatedSelfEducationExpenses$] VARCHAR(MAX), --Col53
  [OtherWorkRelatedExpensesNo.] VARCHAR(MAX), --Col54
  [OtherWorkRelatedExpenses$] VARCHAR(MAX), --Col55
  [TotalWorkRelatedExpensesNo.] VARCHAR(MAX), --Col56
  [TotalWorkRelatedExpenses$] VARCHAR(MAX), --Col57
  [LowValuePoolDeductionNo.] VARCHAR(MAX), --Col58
  [LowValuePoolDeduction$] VARCHAR(MAX), --Col59
  [InterestDeductionsNo.] VARCHAR(MAX), --Col60
  [InterestDeductions$] VARCHAR(MAX), --Col61
  [DividendDeductionsNo.] VARCHAR(MAX), --Col62
  [DividendDeductions$] VARCHAR(MAX), --Col63
  [GiftsOrDonationsNo.] VARCHAR(MAX), --Col64
  [GiftsOrDonations$] VARCHAR(MAX), --Col65
  [CostOfManagingTaxAffairs-InterestChargedByTheAtoNo.] VARCHAR(MAX), --Col66
  [CostOfManagingTaxAffairs-InterestChargedByTheAto$] VARCHAR(MAX), --Col67
  [CostOfManagingTaxAffairs-LitigationCostsNo.] VARCHAR(MAX), --Col68
  [CostOfManagingTaxAffairs-LitigationCosts$] VARCHAR(MAX), --Col69
  [CostOfManagingTaxAffairs-OtherExpensesIncurredInManagingYourTaxAffairsNo.] VARCHAR(MAX), --Col70
  [CostOfManagingTaxAffairs-OtherExpensesIncurredInManagingYourTaxAffairs$] VARCHAR(MAX), --Col71
  [TotalDeductionsNo.] VARCHAR(MAX), --Col72
  [TotalDeductions$] VARCHAR(MAX), --Col73
  [TotalReportableFringeBenefitsAmounts-EmployersExemptFromFbtUnderSection57AOfTheFbtaa1986No.] VARCHAR(MAX), --Col74
  [TotalReportableFringeBenefitsAmounts-EmployersExemptFromFbtUnderSection57AOfTheFbtaa1986$] VARCHAR(MAX), --Col75
  [TotalReportableFringeBenefitsAmounts-EmployersNotExemptFromFbtUnderSection57AOfTheFbtaa1986No.] VARCHAR(MAX), --Col76
  [TotalReportableFringeBenefitsAmounts-EmployersNotExemptFromFbtUnderSection57AOfTheFbtaa1986$] VARCHAR(MAX), --Col77
  [ReportableEmployerSuperannuationContributionsNo.] VARCHAR(MAX), --Col78
  [ReportableEmployerSuperannuationContributions$] VARCHAR(MAX), --Col79
  [P&TNetPrimaryProductionAmountNo.] VARCHAR(MAX), --Col80
  [P&TNetPrimaryProductionAmount$] VARCHAR(MAX), --Col81
  [P&TNetNon-PrimaryProductionAmountNo.] VARCHAR(MAX), --Col82
  [P&TNetNon-PrimaryProductionAmount$] VARCHAR(MAX), --Col83
  [ShareOfFrankingCreditFromFrankedDividendsNo.] VARCHAR(MAX), --Col84
  [ShareOfFrankingCreditFromFrankedDividends$] VARCHAR(MAX), --Col85
  [NetPsiTransferredNo.] VARCHAR(MAX), --Col86
  [NetPsiTransferred$] VARCHAR(MAX), --Col87
  [DeferredNon-CommercialBusinessLossesPrimaryProductionDeferredLossesNo.] VARCHAR(MAX), --Col88
  [DeferredNon-CommercialBusinessLossesPrimaryProductionDeferredLosses$] VARCHAR(MAX), --Col89
  [DeferredNon-CommercialBusinessLossesNonPrimaryProductionDeferredLossesNo.] VARCHAR(MAX), --Col90
  [DeferredNon-CommercialBusinessLossesNonPrimaryProductionDeferredLosses$] VARCHAR(MAX), --Col91
  [CapitalGainsNetCapitalGainNo.] VARCHAR(MAX), --Col92
  [CapitalGainsNetCapitalGain$] VARCHAR(MAX), --Col93
  [EstimatedTaxOnNetCapitalGainsNo.] VARCHAR(MAX), --Col94
  [EstimatedTaxOnNetCapitalGains$] VARCHAR(MAX), --Col95
  [CapitalGainsTotalCurrentYearCapitalGainsNo.] VARCHAR(MAX), --Col96
  [CapitalGainsTotalCurrentYearCapitalGains$] VARCHAR(MAX), --Col97
  [CapitalGainsNetCapitalLossesCarriedForwardNo.] VARCHAR(MAX), --Col98
  [CapitalGainsNetCapitalLossesCarriedForward$] VARCHAR(MAX), --Col99
  [ForeignSourceIncomeAssessableForeignSourceIncomeNo.] VARCHAR(MAX), --Col100
  [ForeignSourceIncomeAssessableForeignSourceIncome$] VARCHAR(MAX), --Col101
  [ForeignSourceIncomeOtherNetForeignSourceIncomeNo.] VARCHAR(MAX), --Col102
  [ForeignSourceIncomeOtherNetForeignSourceIncome$] VARCHAR(MAX), --Col103
  [ForeignSourceIncomeForeignIncomeTaxOffsetNo.] VARCHAR(MAX), --Col104
  [ForeignSourceIncomeForeignIncomeTaxOffset$] VARCHAR(MAX), --Col105
  [GrossRentNo.] VARCHAR(MAX), --Col106
  [GrossRent$] VARCHAR(MAX), --Col107
  [RentInterestDeductionsNo.] VARCHAR(MAX), --Col108
  [RentInterestDeductions$] VARCHAR(MAX), --Col109
  [RentCapitalWorksDeductionsNo.] VARCHAR(MAX), --Col110
  [RentCapitalWorksDeductions$] VARCHAR(MAX), --Col111
  [RentOtherRentalDeductionsNo.] VARCHAR(MAX), --Col112
  [RentOtherRentalDeductions$] VARCHAR(MAX), --Col113
  [NetRent-ProfitNo.] VARCHAR(MAX), --Col114
  [NetRent-Profit$] VARCHAR(MAX), --Col115
  [NetRent-LossNo.] VARCHAR(MAX), --Col116
  [NetRent-Loss$] VARCHAR(MAX), --Col117
  [NetRentNo.] VARCHAR(MAX), --Col118
  [NetRent$] VARCHAR(MAX), --Col119
  [OtherIncomeCategory1No.] VARCHAR(MAX), --Col120
  [OtherIncomeCategory1$] VARCHAR(MAX), --Col121
  [OtherIncomeCategory2(AtoInterest)No.] VARCHAR(MAX), --Col122
  [OtherIncomeCategory2(AtoInterest)$] VARCHAR(MAX), --Col123
  [OtherIncomeCategory3(Fhss)No.] VARCHAR(MAX), --Col124
  [OtherIncomeCategory3(Fhss)$] VARCHAR(MAX), --Col125
  [OtherIncomeCategory4No.] VARCHAR(MAX), --Col126
  [OtherIncomeCategory4$] VARCHAR(MAX), --Col127
  [PersonalSuperannuationContributionsNo.] VARCHAR(MAX), --Col128
  [PersonalSuperannuationContributions$] VARCHAR(MAX), --Col129
  [OtherDeductionsNo.] VARCHAR(MAX), --Col130
  [OtherDeductions$] VARCHAR(MAX), --Col131
  [TotalBusinessIncomeNo.] VARCHAR(MAX), --Col132
  [TotalBusinessIncome$] VARCHAR(MAX), --Col133
  [TotalBusinessExpensesNo.] VARCHAR(MAX), --Col134
  [TotalBusinessExpenses$] VARCHAR(MAX), --Col135
  [NetIncomeOrLossFromBusinessNo.] VARCHAR(MAX), --Col136
  [NetIncomeOrLossFromBusiness$] VARCHAR(MAX), --Col137
  [EstimatedBusinessNetTaxNo.] VARCHAR(MAX), --Col138
  [EstimatedBusinessNetTax$] VARCHAR(MAX), --Col139
  [AustralianSuperannuationIncomeStreamTaxOffsetNo.] VARCHAR(MAX), --Col140
  [AustralianSuperannuationIncomeStreamTaxOffset$] VARCHAR(MAX), --Col141
  [SmallBusinessIncomeTaxOffsetNo.] VARCHAR(MAX), --Col142
  [SmallBusinessIncomeTaxOffset$] VARCHAR(MAX), --Col143
  [LowIncomeTaxOffsetNo.] VARCHAR(MAX), --Col144
  [LowIncomeTaxOffset$] VARCHAR(MAX), --Col145
  [LowAndMiddleIncomeTaxOffsetNo.] VARCHAR(MAX), --Col146
  [LowAndMiddleIncomeTaxOffset$] VARCHAR(MAX), --Col147
  [EmploymentTerminationPaymentTaxOffsetNo.] VARCHAR(MAX), --Col148
  [EmploymentTerminationPaymentTaxOffset$] VARCHAR(MAX), --Col149
  [HelpDebtBalanceNo.] VARCHAR(MAX), --Col150
  [HelpDebtBalance$] VARCHAR(MAX), --Col151
  [SfssDebtBalanceNo.] VARCHAR(MAX), --Col152
  [SfssDebtBalance$] VARCHAR(MAX), --Col153
  [TslDebtBalanceNo.] VARCHAR(MAX), --Col154
  [TslDebtBalance$] VARCHAR(MAX), --Col155
  [PeopleWithPrivateHealthInsuranceNo.] VARCHAR(MAX), --Col156
  [PrivateHealthInsurance-YourAustralianGovernmentRebateReceivedNo.] VARCHAR(MAX), --Col157
  [PrivateHealthInsurance-YourAustralianGovernmentRebateReceived$] VARCHAR(MAX), --Col158
  [PrivateHealthInsuranceRebateNo.] VARCHAR(MAX), --Col159
  [PrivateHealthInsuranceRebate$] VARCHAR(MAX), --Col160
  [ExcessPrivateHealthReductionOrRefund(RebateReduced)No.] VARCHAR(MAX), --Col161
  [ExcessPrivateHealthReductionOrRefund(RebateReduced)$] VARCHAR(MAX), --Col162
  [ANZSCOCode] INT,
  [ANZSCOTitle] VARCHAR(100)
);
GO

CREATE TABLE ato.[14B]
(
  [IncomeYear] VARCHAR(MAX), --Col0 
  [Occupation-UnitGroup] VARCHAR(MAX), --Col1 
  [Sex] VARCHAR(MAX), --Col2 
  [TaxableIncomeRanges(TaxBrackets)] VARCHAR(MAX), --Col3 
  [NumberOfIndividualsNo.] BIGINT, --Col4 
  [SalaryOrWagesNo.] BIGINT, --Col5 
  [SalaryOrWages$] FLOAT, --Col6 
  [TotalIncomeOrLossNo.] BIGINT, --Col7 
  [TotalIncomeOrLoss$] FLOAT, --Col8 
  [TotalWorkRelatedCarExpensesNo.] BIGINT, --Col9 
  [TotalWorkRelatedCarExpenses$] FLOAT, --Col10
  [WorkRelatedTravelExpensesNo.] BIGINT, --Col11
  [WorkRelatedTravelExpenses$] FLOAT, --Col12
  [TotalWorkRelatedUniform/ClothingExpensesNo.] BIGINT, --Col13
  [TotalWorkRelatedUniform/ClothingExpenses$] FLOAT, --Col14
  [TotalWorkRelatedSelfEducationExpensesNo.] BIGINT, --Col15
  [TotalWorkRelatedSelfEducationExpenses$] FLOAT, --Col16
  [OtherWorkRelatedExpensesNo.] BIGINT, --Col17
  [OtherWorkRelatedExpenses$] FLOAT, --Col18
  [GiftsOrDonationsNo.] BIGINT, --Col19
  [GiftsOrDonations$] FLOAT, --Col20
  [CostOfManagingTaxAffairsNo.] BIGINT, --Col21
  [CostOfManagingTaxAffairs$] FLOAT, --Col22
  [CostOfManagingTaxAffairs-OtherExpensesIncurredInManagingYourTaxAffairsNo.] BIGINT, --Col23
  [CostOfManagingTaxAffairs-OtherExpensesIncurredInManagingYourTaxAffairs$] FLOAT, --Col24
  [TotalDeductionsNo.] BIGINT, --Col25
  [TotalDeductions$] FLOAT, --Col26
  [CapitalGainsNetCapitalGainNo.] BIGINT, --Col27
  [CapitalGainsNetCapitalGain$] FLOAT, --Col28
  [NetRent-ProfitNo.] BIGINT, --Col29
  [NetRent-Profit$] FLOAT, --Col30
  [NetRent-LossNo.] BIGINT, --Col31
  [NetRent-Loss$] FLOAT, --Col32
  [NetRentNo.] BIGINT, --Col33
  [NetRent$] FLOAT, --Col34
  [TotalBusinessIncomeNo.] BIGINT, --Col35
  [TotalBusinessIncome$] FLOAT, --Col36
  [TotalBusinessExpensesNo.] BIGINT, --Col37
  [TotalBusinessExpenses$] FLOAT, --Col38
  [NetIncomeOrLossFromBusinessNo.] BIGINT, --Col39
  [NetIncomeOrLossFromBusiness$] FLOAT, --Col40
  [TaxableIncomeOrLossNo.] BIGINT, --Col41
  [TaxableIncomeOrLoss$] FLOAT, --Col42
  [NetTaxNo.] BIGINT, --Col43
  [NetTax$] FLOAT, --Col44
  [ANZSCOCode] INT,
  [ANZSCOTitle] VARCHAR(100)
);
GO
