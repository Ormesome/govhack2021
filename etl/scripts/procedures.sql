/*
  ETL
*/

CREATE OR ALTER PROCEDURE etl.mergeOccupationDescriptions
AS
BEGIN
  MERGE
    nsc.occupationDescriptions dst
  USING
  (
    SELECT
      ANZSCO_Code,
      ANZSCO_Title,
      ANZSCO_Desc
    FROM
      etl.occupationDescriptions
  ) src
  ON CAST(src.ANZSCO_Code AS INT) = dst.ANZSCOCode
  WHEN MATCHED THEN
    UPDATE SET
    -- dst.ANZSCOCode = src.ANZSCO_Code,
    dst.ANZSCOTitle = src.ANZSCO_Title,
    dst.ANZSCODesc = src.ANZSCO_Desc
  WHEN NOT MATCHED THEN
    INSERT
    (
      ANZSCOCode,
      ANZSCOTitle,
      ANZSCODesc
    )
    VALUES
    (
      src.ANZSCO_Code,
      src.ANZSCO_Title,
      src.ANZSCO_Desc
    );
END;
GO


CREATE OR ALTER PROCEDURE etl.mergeCoreCompetencies
AS
BEGIN
  MERGE
    nsc.coreCompetencies dst
  USING
  (
    SELECT
      ANZSCO_Code,
      ANZSCO_Title,
      Core_Competencies,
      Score,
      Proficiency_level,
      Anchor_value
    FROM
      etl.coreCompetencies
  ) src
  ON CAST(src.ANZSCO_Code AS INT) = dst.ANZSCOCode
  AND src.Core_Competencies = dst.CoreCompetencies
  WHEN MATCHED THEN
    UPDATE SET
    -- dst.ANZSCOCode = src.ANZSCO_Code,
    dst.ANZSCOTitle = src.ANZSCO_Title,
    -- dst.CoreCompetencies = src.Core_Competencies,
    dst.Score = src.Score,
    dst.ProficiencyLevel = src.Proficiency_level,
    dst.AnchorValue = src.Anchor_value
  WHEN NOT MATCHED THEN
    INSERT
    (
      ANZSCOCode,
      ANZSCOTitle,
      CoreCompetencies,
      Score,
      ProficiencyLevel,
      AnchorValue
    )
    VALUES
    (
      src.ANZSCO_Code,
      src.ANZSCO_Title,
      src.Core_Competencies,
      src.Score,
      src.Proficiency_level,
      src.Anchor_value
    );
END;
GO

CREATE OR ALTER PROCEDURE etl.mergeCoreCompetenciesDescriptions
AS
BEGIN
  MERGE
    nsc.coreCompetenciesDescriptions dst
  USING
  (
    SELECT
      Core_Competencies,
      [Competency Description],
      Score,
      Proficiency_level,
      Anchor_value
    FROM
      etl.coreCompetenciesDescriptions
  ) src
  ON src.Core_Competencies = dst.CoreCompetencies
  AND src.Score = dst.Score
  WHEN MATCHED THEN
    UPDATE SET
    -- dst.CoreCompetencies = src.Core_Competencies,
    dst.CompetencyDescription = src.[Competency Description],
    -- dst.Score = src.Score,
    dst.ProficiencyLevel = src.Proficiency_level,
    dst.AnchorValue = src.Anchor_value
  WHEN NOT MATCHED THEN
    INSERT
    (
      CoreCompetencies,
      CompetencyDescription,
      Score,
      ProficiencyLevel,
      AnchorValue
    )
    VALUES
    (
      src.Core_Competencies,
      src.[Competency Description],
      src.Score,
      src.Proficiency_level,
      src.Anchor_value
    );
END;
GO

CREATE OR ALTER PROCEDURE etl.mergeSpecialistTasks
AS
BEGIN
  MERGE
    nsc.specialistTasks dst
  USING
  (
    SELECT
      ANZSCO_Code,
      ANZSCO_Title,
      Specialist_Task,
      [% of time spent on task],
      Specialist_Cluster,
      [% of time spent on cluster],
      Cluster_Family,
      [% of time spent on family]
    FROM
      etl.specialistTasks
  ) src
  ON src.ANZSCO_Code = dst.ANZSCOCode
  AND src.Specialist_Task = dst.SpecialistTask
  WHEN MATCHED THEN
    UPDATE SET
    -- dst.ANZSCOCode = src.ANZSCO_Code,
    dst.ANZSCOTitle = src.ANZSCO_Title,
    -- dst.SpecialistTask = src.Specialist_Task,
    dst.PctTimeSpentOnTask = src.[% of time spent on task],
    dst.SpecialistCluster = src.Specialist_Cluster,
    dst.PctTimeSpentOnCluster = src.[% of time spent on cluster],
    dst.ClusterFamily = src.Cluster_Family,
    dst.PctTimeSpentOnFamily = src.[% of time spent on family]
  WHEN NOT MATCHED THEN
    INSERT
    (
      ANZSCOCode,
      ANZSCOTitle,
      SpecialistTask,
      PctTimeSpentOnTask,
      SpecialistCluster,
      PctTimeSpentOnCluster,
      ClusterFamily,
      PctTimeSpentOnFamily
    )
    VALUES
    (
      src.ANZSCO_Code,
      src.ANZSCO_Title,
      src.Specialist_Task,
      src.[% of time spent on task],
      src.Specialist_Cluster,
      src.[% of time spent on cluster],
      src.Cluster_Family,
      src.[% of time spent on family]
    );
END;
GO

CREATE OR ALTER PROCEDURE etl.mergeTechnologyTools
AS
BEGIN
  MERGE
    nsc.technologyTools dst
  USING
  (
    SELECT
      ANZSCO_Code,
      ANZSCO_Title,
      Technology_tool
    FROM
      etl.technologyTools
  ) src
  ON src.ANZSCO_Code = dst.ANZSCOCode
  AND src.Technology_tool = dst.TechnologyTool
  WHEN MATCHED THEN
    UPDATE SET
    -- dst.ANZSCOCode = src.ANZSCO_Code,
    dst.ANZSCOTitle = src.ANZSCO_Title--,
    -- dst.TechnologyTool = src.Technology_tool
  WHEN NOT MATCHED THEN
    INSERT
    (
      ANZSCOCode,
      ANZSCOTitle,
      TechnologyTool
    )
    VALUES
    (
      src.ANZSCO_Code,
      src.ANZSCO_Title,
      src.Technology_tool
    );
END;
GO

CREATE OR ALTER PROCEDURE etl.mergeTechnologyToolsExamples
AS
BEGIN
  MERGE
    nsc.technologyToolsExamples dst
  USING
  (
    SELECT
      Technology_tool,
      Technology_tool_example,
      [Tech Tool Ranking]
    FROM
      etl.technologyToolsExamples
  ) src
  ON src.Technology_tool = dst.TechnologyTool
  AND src.Technology_tool_example = dst.TechnologyToolExample
  WHEN MATCHED THEN
    UPDATE SET
    -- dst.TechnologyTool = src.Technology_tool,
    -- dst.TechnologyToolExample = src.Technology_tool_example,
    dst.TechnologyToolRanking = src.[Tech Tool Ranking]
  WHEN NOT MATCHED THEN
    INSERT
    (
      TechnologyTool,
      TechnologyToolExample,
      TechnologyToolRanking
    )
    VALUES
    (
      src.Technology_tool,
      src.Technology_tool_example,
      src.[Tech Tool Ranking]
    );
END;
GO

CREATE OR ALTER PROCEDURE etl.mergeTechnologyToolsCommon
AS
BEGIN
  MERGE
    nsc.technologyToolsCommon dst
  USING
  (
    SELECT
      Common_Tech_Tools
    FROM
      etl.technologyToolsCommon
    WHERE
      Common_Tech_Tools NOT LIKE 'Several technology tools are so universal in 2021%'
  ) src
  ON src.Common_Tech_Tools = dst.TechnologyTool
  WHEN NOT MATCHED THEN
    INSERT
    (
      TechnologyTool
    )
    VALUES
    (
      src.Common_Tech_Tools
    );
END;
GO

/*
  Australian Taxation Office
*/

CREATE OR ALTER PROCEDURE etl.merge14A
AS
BEGIN
  MERGE
    ato.[14A] dst
  USING
  (
    SELECT
      Col0,  
      Col1,  
      Col2,  
      Col3,  
      Col4,  
      Col5,  
      Col6,  
      Col7--,  
      -- Col8,  
      -- Col9,  
      -- Col10, 
      -- Col11, 
      -- Col12, 
      -- Col13, 
      -- Col14, 
      -- Col15, 
      -- Col16, 
      -- Col17, 
      -- Col18, 
      -- Col19, 
      -- Col20, 
      -- Col21, 
      -- Col22, 
      -- Col23, 
      -- Col24, 
      -- Col25, 
      -- Col26, 
      -- Col27, 
      -- Col28, 
      -- Col29, 
      -- Col30, 
      -- Col31, 
      -- Col32, 
      -- Col33, 
      -- Col34, 
      -- Col35, 
      -- Col36, 
      -- Col37, 
      -- Col38, 
      -- Col39, 
      -- Col40, 
      -- Col41, 
      -- Col42, 
      -- Col43, 
      -- Col44, 
      -- Col45, 
      -- Col46, 
      -- Col47, 
      -- Col48, 
      -- Col49, 
      -- Col50, 
      -- Col51, 
      -- Col52, 
      -- Col53, 
      -- Col54, 
      -- Col55, 
      -- Col56, 
      -- Col57, 
      -- Col58, 
      -- Col59, 
      -- Col60, 
      -- Col61, 
      -- Col62, 
      -- Col63, 
      -- Col64, 
      -- Col65, 
      -- Col66, 
      -- Col67, 
      -- Col68, 
      -- Col69, 
      -- Col70, 
      -- Col71, 
      -- Col72, 
      -- Col73, 
      -- Col74, 
      -- Col75, 
      -- Col76, 
      -- Col77, 
      -- Col78, 
      -- Col79, 
      -- Col80, 
      -- Col81, 
      -- Col82, 
      -- Col83, 
      -- Col84, 
      -- Col85, 
      -- Col86, 
      -- Col87, 
      -- Col88, 
      -- Col89, 
      -- Col90, 
      -- Col91, 
      -- Col92, 
      -- Col93, 
      -- Col94, 
      -- Col95, 
      -- Col96, 
      -- Col97, 
      -- Col98, 
      -- Col99, 
      -- Col100,
      -- Col101,
      -- Col102,
      -- Col103,
      -- Col104,
      -- Col105,
      -- Col106,
      -- Col107,
      -- Col108,
      -- Col109,
      -- Col110,
      -- Col111,
      -- Col112,
      -- Col113,
      -- Col114,
      -- Col115,
      -- Col116,
      -- Col117,
      -- Col118,
      -- Col119,
      -- Col120,
      -- Col121,
      -- Col122,
      -- Col123,
      -- Col124,
      -- Col125,
      -- Col126,
      -- Col127,
      -- Col128,
      -- Col129,
      -- Col130,
      -- Col131,
      -- Col132,
      -- Col133,
      -- Col134,
      -- Col135,
      -- Col136,
      -- Col137,
      -- Col138,
      -- Col139,
      -- Col140,
      -- Col141,
      -- Col142,
      -- Col143,
      -- Col144,
      -- Col145,
      -- Col146,
      -- Col147,
      -- Col148,
      -- Col149,
      -- Col150,
      -- Col151,
      -- Col152,
      -- Col153,
      -- Col154,
      -- Col155,
      -- Col156,
      -- Col157,
      -- Col158,
      -- Col159,
      -- Col160,
      -- Col161,
      -- Col162
    FROM
      etl.[14A]
  ) src
  ON src.Col0 = dst.[Occupation-UnitGroup]
  AND src.Col1 = dst.[Sex]
  AND src.Col2 = dst.[TaxableIncomeRange-TaxBrackets]
  WHEN MATCHED THEN
  UPDATE SET
    -- [Occupation-UnitGroup] = Col0,
    -- [Sex] = Col1,
    -- [TaxableIncomeRange-TaxBrackets] = Col2,
    [NumberOfIndividuals] = Col3,
    [TaxableIncomeOrLossNo.] = CAST(Col4 AS BIGINT),
    [TaxableIncomeOrLoss$] = CAST(Col5 AS FLOAT),
    [TaxOnTaxableIncomeNo.] = CAST(Col6 AS BIGINT),
    [TaxOnTaxableIncome$] = CAST(Col7 AS FLOAT)--,
    -- [MedicareLevyNo.] = Col8,
    -- [MedicareLevy$] = CAST(Col9 AS DECIMAL(18,0)),
    -- [MedicareLevySurchargeNo.] = Col10,
    -- [MedicareLevySurcharge$] = Col11,
    -- [TotalMedicareLevyLiabilityNo.] = Col12,
    -- [TotalMedicareLevyLiability$] = Col13,
    -- [NetTaxNo.] = Col14,
    -- [NetTax$] = Col15,
    -- [HelpAustralianCompulsoryRepaymentDueNo.] = Col16,
    -- [HelpAustralianCompulsoryRepaymentDue$] = Col17,
    -- [SalaryOrWagesNo.] = Col18,
    -- [SalaryOrWages$] = Col19,
    -- [TaxWithheldFromSalaryOrWagesNo.] = Col20,
    -- [TaxWithheldFromSalaryOrWages$] = Col21,
    -- [AllowancesEarningsTipsDirectorsFeesEtcNo.] = Col22,
    -- [AllowancesEarningsTipsDirectorsFeesEtc$] = Col23,
    -- [EmployerLumpSumPaymentsAmountANo.] = Col24,
    -- [EmployerLumpSumPaymentsAmountA$] = Col25,
    -- [EmploymentTerminationPaymentsTaxableComponentNo.] = Col26,
    -- [EmploymentTerminationPaymentsTaxableComponent$] = Col27,
    -- [AustralianGovernmentAllowancesAndPaymentsNo.] = Col28,
    -- [AustralianGovernmentAllowancesAndPayments$] = Col29,
    -- [AustralianGovernmentPensionsAndAllowancesNo.] = Col30,
    -- [AustralianGovernmentPensionsAndAllowances$] = Col31,
    -- [AustralianAnnuitiesAndSuperannuationIncomeStreamsTaxableComponentTaxedElementNo.] = Col32,
    -- [AustralianAnnuitiesAndSuperannuationIncomeStreamsTaxableComponentTaxedElement$] = Col33,
    -- [AustralianAnnuitiesAndSuperannuationIncomeStreamsTaxableComponentUntaxedElementNo.] = Col34,
    -- [AustralianAnnuitiesAndSuperannuationIncomeStreamsTaxableComponentUntaxedElement$] = Col35,
    -- [GrossInterestNo.] = Col36,
    -- [GrossInterest$] = Col37,
    -- [DividendsUnfrankedNo.] = Col38,
    -- [DividendsUnfranked$] = Col39,
    -- [DividendsFrankedNo.] = Col40,
    -- [DividendsFranked$] = Col41,
    -- [DividendsFrankingCreditNo.] = Col42,
    -- [DividendsFrankingCredit$] = Col43,
    -- [TotalIncomeOrLossNo.] = Col44,
    -- [TotalIncomeOrLoss$] = Col45,
    -- [TotalWorkRelatedCarExpensesNo.] = Col46,
    -- [TotalWorkRelatedCarExpenses$] = Col47,
    -- [WorkRelatedTravelExpensesNo.] = Col48,
    -- [WorkRelatedTravelExpenses$] = Col49,
    -- [TotalWorkRelatedUniform/ClothingExpensesNo.] = Col50,
    -- [TotalWorkRelatedUniform/ClothingExpenses$] = Col51,
    -- [TotalWorkRelatedSelfEducationExpensesNo.] = Col52,
    -- [TotalWorkRelatedSelfEducationExpenses$] = Col53,
    -- [OtherWorkRelatedExpensesNo.] = Col54,
    -- [OtherWorkRelatedExpenses$] = Col55,
    -- [TotalWorkRelatedExpensesNo.] = Col56,
    -- [TotalWorkRelatedExpenses$] = Col57,
    -- [LowValuePoolDeductionNo.] = Col58,
    -- [LowValuePoolDeduction$] = Col59,
    -- [InterestDeductionsNo.] = Col60,
    -- [InterestDeductions$] = Col61,
    -- [DividendDeductionsNo.] = Col62,
    -- [DividendDeductions$] = Col63,
    -- [GiftsOrDonationsNo.] = Col64,
    -- [GiftsOrDonations$] = Col65,
    -- [CostOfManagingTaxAffairs-InterestChargedByTheAtoNo.] = Col66,
    -- [CostOfManagingTaxAffairs-InterestChargedByTheAto$] = Col67,
    -- [CostOfManagingTaxAffairs-LitigationCostsNo.] = Col68,
    -- [CostOfManagingTaxAffairs-LitigationCosts$] = Col69,
    -- [CostOfManagingTaxAffairs-OtherExpensesIncurredInManagingYourTaxAffairsNo.] = Col70,
    -- [CostOfManagingTaxAffairs-OtherExpensesIncurredInManagingYourTaxAffairs$] = Col71,
    -- [TotalDeductionsNo.] = Col72,
    -- [TotalDeductions$] = Col73,
    -- [TotalReportableFringeBenefitsAmounts-EmployersExemptFromFbtUnderSection57AOfTheFbtaa1986No.] = Col74,
    -- [TotalReportableFringeBenefitsAmounts-EmployersExemptFromFbtUnderSection57AOfTheFbtaa1986$] = Col75,
    -- [TotalReportableFringeBenefitsAmounts-EmployersNotExemptFromFbtUnderSection57AOfTheFbtaa1986No.] = Col76,
    -- [TotalReportableFringeBenefitsAmounts-EmployersNotExemptFromFbtUnderSection57AOfTheFbtaa1986$] = Col77,
    -- [ReportableEmployerSuperannuationContributionsNo.] = Col78,
    -- [ReportableEmployerSuperannuationContributions$] = Col79,
    -- [P&TNetPrimaryProductionAmountNo.] = Col80,
    -- [P&TNetPrimaryProductionAmount$] = Col81,
    -- [P&TNetNon-PrimaryProductionAmountNo.] = Col82,
    -- [P&TNetNon-PrimaryProductionAmount$] = Col83,
    -- [ShareOfFrankingCreditFromFrankedDividendsNo.] = Col84,
    -- [ShareOfFrankingCreditFromFrankedDividends$] = Col85,
    -- [NetPsiTransferredNo.] = Col86,
    -- [NetPsiTransferred$] = Col87,
    -- [DeferredNon-CommercialBusinessLossesPrimaryProductionDeferredLossesNo.] = Col88,
    -- [DeferredNon-CommercialBusinessLossesPrimaryProductionDeferredLosses$] = Col89,
    -- [DeferredNon-CommercialBusinessLossesNonPrimaryProductionDeferredLossesNo.] = Col90,
    -- [DeferredNon-CommercialBusinessLossesNonPrimaryProductionDeferredLosses$] = Col91,
    -- [CapitalGainsNetCapitalGainNo.] = Col92,
    -- [CapitalGainsNetCapitalGain$] = Col93,
    -- [EstimatedTaxOnNetCapitalGainsNo.] = Col94,
    -- [EstimatedTaxOnNetCapitalGains$] = Col95,
    -- [CapitalGainsTotalCurrentYearCapitalGainsNo.] = Col96,
    -- [CapitalGainsTotalCurrentYearCapitalGains$] = Col97,
    -- [CapitalGainsNetCapitalLossesCarriedForwardNo.] = Col98,
    -- [CapitalGainsNetCapitalLossesCarriedForward$] = Col99,
    -- [ForeignSourceIncomeAssessableForeignSourceIncomeNo.] = Col100,
    -- [ForeignSourceIncomeAssessableForeignSourceIncome$] = Col101,
    -- [ForeignSourceIncomeOtherNetForeignSourceIncomeNo.] = Col102,
    -- [ForeignSourceIncomeOtherNetForeignSourceIncome$] = Col103,
    -- [ForeignSourceIncomeForeignIncomeTaxOffsetNo.] = Col104,
    -- [ForeignSourceIncomeForeignIncomeTaxOffset$] = Col105,
    -- [GrossRentNo.] = Col106,
    -- [GrossRent$] = Col107,
    -- [RentInterestDeductionsNo.] = Col108,
    -- [RentInterestDeductions$] = Col109,
    -- [RentCapitalWorksDeductionsNo.] = Col110,
    -- [RentCapitalWorksDeductions$] = Col111,
    -- [RentOtherRentalDeductionsNo.] = Col112,
    -- [RentOtherRentalDeductions$] = Col113,
    -- [NetRent-ProfitNo.] = Col114,
    -- [NetRent-Profit$] = Col115,
    -- [NetRent-LossNo.] = Col116,
    -- [NetRent-Loss$] = Col117,
    -- [NetRentNo.] = Col118,
    -- [NetRent$] = Col119,
    -- [OtherIncomeCategory1No.] = Col120,
    -- [OtherIncomeCategory1$] = Col121,
    -- [OtherIncomeCategory2(AtoInterest)No.] = Col122,
    -- [OtherIncomeCategory2(AtoInterest)$] = Col123,
    -- [OtherIncomeCategory3(Fhss)No.] = Col124,
    -- [OtherIncomeCategory3(Fhss)$] = Col125,
    -- [OtherIncomeCategory4No.] = Col126,
    -- [OtherIncomeCategory4$] = Col127,
    -- [PersonalSuperannuationContributionsNo.] = Col128,
    -- [PersonalSuperannuationContributions$] = Col129,
    -- [OtherDeductionsNo.] = Col130,
    -- [OtherDeductions$] = Col131,
    -- [TotalBusinessIncomeNo.] = Col132,
    -- [TotalBusinessIncome$] = Col133,
    -- [TotalBusinessExpensesNo.] = Col134,
    -- [TotalBusinessExpenses$] = Col135,
    -- [NetIncomeOrLossFromBusinessNo.] = Col136,
    -- [NetIncomeOrLossFromBusiness$] = Col137,
    -- [EstimatedBusinessNetTaxNo.] = Col138,
    -- [EstimatedBusinessNetTax$] = Col139,
    -- [AustralianSuperannuationIncomeStreamTaxOffsetNo.] = Col140,
    -- [AustralianSuperannuationIncomeStreamTaxOffset$] = Col141,
    -- [SmallBusinessIncomeTaxOffsetNo.] = Col142,
    -- [SmallBusinessIncomeTaxOffset$] = Col143,
    -- [LowIncomeTaxOffsetNo.] = Col144,
    -- [LowIncomeTaxOffset$] = Col145,
    -- [LowAndMiddleIncomeTaxOffsetNo.] = Col146,
    -- [LowAndMiddleIncomeTaxOffset$] = Col147,
    -- [EmploymentTerminationPaymentTaxOffsetNo.] = Col148,
    -- [EmploymentTerminationPaymentTaxOffset$] = Col149,
    -- [HelpDebtBalanceNo.] = Col150,
    -- [HelpDebtBalance$] = Col151,
    -- [SfssDebtBalanceNo.] = Col152,
    -- [SfssDebtBalance$] = Col153,
    -- [TslDebtBalanceNo.] = Col154,
    -- [TslDebtBalance$] = Col155,
    -- [PeopleWithPrivateHealthInsuranceNo.] = Col156,
    -- [PrivateHealthInsurance-YourAustralianGovernmentRebateReceivedNo.] = Col157,
    -- [PrivateHealthInsurance-YourAustralianGovernmentRebateReceived$] = Col158,
    -- [PrivateHealthInsuranceRebateNo.] = Col159,
    -- [PrivateHealthInsuranceRebate$] = Col160,
    -- [ExcessPrivateHealthReductionOrRefund(RebateReduced)No.] = Col161,
    -- [ExcessPrivateHealthReductionOrRefund(RebateReduced)$] = Col162
  WHEN NOT MATCHED THEN
    INSERT
    (
      [Occupation-UnitGroup],
      [Sex],
      [TaxableIncomeRange-TaxBrackets],
      [NumberOfIndividuals],
      [TaxableIncomeOrLossNo.],
      [TaxableIncomeOrLoss$],
      [TaxOnTaxableIncomeNo.],
      [TaxOnTaxableIncome$]--,
      -- [MedicareLevyNo.],
      -- [MedicareLevy$],
      -- [MedicareLevySurchargeNo.],
      -- [MedicareLevySurcharge$],
      -- [TotalMedicareLevyLiabilityNo.],
      -- [TotalMedicareLevyLiability$],
      -- [NetTaxNo.],
      -- [NetTax$],
      -- [HelpAustralianCompulsoryRepaymentDueNo.],
      -- [HelpAustralianCompulsoryRepaymentDue$],
      -- [SalaryOrWagesNo.],
      -- [SalaryOrWages$],
      -- [TaxWithheldFromSalaryOrWagesNo.],
      -- [TaxWithheldFromSalaryOrWages$],
      -- [AllowancesEarningsTipsDirectorsFeesEtcNo.],
      -- [AllowancesEarningsTipsDirectorsFeesEtc$],
      -- [EmployerLumpSumPaymentsAmountANo.],
      -- [EmployerLumpSumPaymentsAmountA$],
      -- [EmploymentTerminationPaymentsTaxableComponentNo.],
      -- [EmploymentTerminationPaymentsTaxableComponent$],
      -- [AustralianGovernmentAllowancesAndPaymentsNo.],
      -- [AustralianGovernmentAllowancesAndPayments$],
      -- [AustralianGovernmentPensionsAndAllowancesNo.],
      -- [AustralianGovernmentPensionsAndAllowances$],
      -- [AustralianAnnuitiesAndSuperannuationIncomeStreamsTaxableComponentTaxedElementNo.],
      -- [AustralianAnnuitiesAndSuperannuationIncomeStreamsTaxableComponentTaxedElement$],
      -- [AustralianAnnuitiesAndSuperannuationIncomeStreamsTaxableComponentUntaxedElementNo.],
      -- [AustralianAnnuitiesAndSuperannuationIncomeStreamsTaxableComponentUntaxedElement$],
      -- [GrossInterestNo.],
      -- [GrossInterest$],
      -- [DividendsUnfrankedNo.],
      -- [DividendsUnfranked$],
      -- [DividendsFrankedNo.],
      -- [DividendsFranked$],
      -- [DividendsFrankingCreditNo.],
      -- [DividendsFrankingCredit$],
      -- [TotalIncomeOrLossNo.],
      -- [TotalIncomeOrLoss$],
      -- [TotalWorkRelatedCarExpensesNo.],
      -- [TotalWorkRelatedCarExpenses$],
      -- [WorkRelatedTravelExpensesNo.],
      -- [WorkRelatedTravelExpenses$],
      -- [TotalWorkRelatedUniform/ClothingExpensesNo.],
      -- [TotalWorkRelatedUniform/ClothingExpenses$],
      -- [TotalWorkRelatedSelfEducationExpensesNo.],
      -- [TotalWorkRelatedSelfEducationExpenses$],
      -- [OtherWorkRelatedExpensesNo.],
      -- [OtherWorkRelatedExpenses$],
      -- [TotalWorkRelatedExpensesNo.],
      -- [TotalWorkRelatedExpenses$],
      -- [LowValuePoolDeductionNo.],
      -- [LowValuePoolDeduction$],
      -- [InterestDeductionsNo.],
      -- [InterestDeductions$],
      -- [DividendDeductionsNo.],
      -- [DividendDeductions$],
      -- [GiftsOrDonationsNo.],
      -- [GiftsOrDonations$],
      -- [CostOfManagingTaxAffairs-InterestChargedByTheAtoNo.],
      -- [CostOfManagingTaxAffairs-InterestChargedByTheAto$],
      -- [CostOfManagingTaxAffairs-LitigationCostsNo.],
      -- [CostOfManagingTaxAffairs-LitigationCosts$],
      -- [CostOfManagingTaxAffairs-OtherExpensesIncurredInManagingYourTaxAffairsNo.],
      -- [CostOfManagingTaxAffairs-OtherExpensesIncurredInManagingYourTaxAffairs$],
      -- [TotalDeductionsNo.],
      -- [TotalDeductions$],
      -- [TotalReportableFringeBenefitsAmounts-EmployersExemptFromFbtUnderSection57AOfTheFbtaa1986No.],
      -- [TotalReportableFringeBenefitsAmounts-EmployersExemptFromFbtUnderSection57AOfTheFbtaa1986$],
      -- [TotalReportableFringeBenefitsAmounts-EmployersNotExemptFromFbtUnderSection57AOfTheFbtaa1986No.],
      -- [TotalReportableFringeBenefitsAmounts-EmployersNotExemptFromFbtUnderSection57AOfTheFbtaa1986$],
      -- [ReportableEmployerSuperannuationContributionsNo.],
      -- [ReportableEmployerSuperannuationContributions$],
      -- [P&TNetPrimaryProductionAmountNo.],
      -- [P&TNetPrimaryProductionAmount$],
      -- [P&TNetNon-PrimaryProductionAmountNo.],
      -- [P&TNetNon-PrimaryProductionAmount$],
      -- [ShareOfFrankingCreditFromFrankedDividendsNo.],
      -- [ShareOfFrankingCreditFromFrankedDividends$],
      -- [NetPsiTransferredNo.],
      -- [NetPsiTransferred$],
      -- [DeferredNon-CommercialBusinessLossesPrimaryProductionDeferredLossesNo.],
      -- [DeferredNon-CommercialBusinessLossesPrimaryProductionDeferredLosses$],
      -- [DeferredNon-CommercialBusinessLossesNonPrimaryProductionDeferredLossesNo.],
      -- [DeferredNon-CommercialBusinessLossesNonPrimaryProductionDeferredLosses$],
      -- [CapitalGainsNetCapitalGainNo.],
      -- [CapitalGainsNetCapitalGain$],
      -- [EstimatedTaxOnNetCapitalGainsNo.],
      -- [EstimatedTaxOnNetCapitalGains$],
      -- [CapitalGainsTotalCurrentYearCapitalGainsNo.],
      -- [CapitalGainsTotalCurrentYearCapitalGains$],
      -- [CapitalGainsNetCapitalLossesCarriedForwardNo.],
      -- [CapitalGainsNetCapitalLossesCarriedForward$],
      -- [ForeignSourceIncomeAssessableForeignSourceIncomeNo.],
      -- [ForeignSourceIncomeAssessableForeignSourceIncome$],
      -- [ForeignSourceIncomeOtherNetForeignSourceIncomeNo.],
      -- [ForeignSourceIncomeOtherNetForeignSourceIncome$],
      -- [ForeignSourceIncomeForeignIncomeTaxOffsetNo.],
      -- [ForeignSourceIncomeForeignIncomeTaxOffset$],
      -- [GrossRentNo.],
      -- [GrossRent$],
      -- [RentInterestDeductionsNo.],
      -- [RentInterestDeductions$],
      -- [RentCapitalWorksDeductionsNo.],
      -- [RentCapitalWorksDeductions$],
      -- [RentOtherRentalDeductionsNo.],
      -- [RentOtherRentalDeductions$],
      -- [NetRent-ProfitNo.],
      -- [NetRent-Profit$],
      -- [NetRent-LossNo.],
      -- [NetRent-Loss$],
      -- [NetRentNo.],
      -- [NetRent$],
      -- [OtherIncomeCategory1No.],
      -- [OtherIncomeCategory1$],
      -- [OtherIncomeCategory2(AtoInterest)No.],
      -- [OtherIncomeCategory2(AtoInterest)$],
      -- [OtherIncomeCategory3(Fhss)No.],
      -- [OtherIncomeCategory3(Fhss)$],
      -- [OtherIncomeCategory4No.],
      -- [OtherIncomeCategory4$],
      -- [PersonalSuperannuationContributionsNo.],
      -- [PersonalSuperannuationContributions$],
      -- [OtherDeductionsNo.],
      -- [OtherDeductions$],
      -- [TotalBusinessIncomeNo.],
      -- [TotalBusinessIncome$],
      -- [TotalBusinessExpensesNo.],
      -- [TotalBusinessExpenses$],
      -- [NetIncomeOrLossFromBusinessNo.],
      -- [NetIncomeOrLossFromBusiness$],
      -- [EstimatedBusinessNetTaxNo.],
      -- [EstimatedBusinessNetTax$],
      -- [AustralianSuperannuationIncomeStreamTaxOffsetNo.],
      -- [AustralianSuperannuationIncomeStreamTaxOffset$],
      -- [SmallBusinessIncomeTaxOffsetNo.],
      -- [SmallBusinessIncomeTaxOffset$],
      -- [LowIncomeTaxOffsetNo.],
      -- [LowIncomeTaxOffset$],
      -- [LowAndMiddleIncomeTaxOffsetNo.],
      -- [LowAndMiddleIncomeTaxOffset$],
      -- [EmploymentTerminationPaymentTaxOffsetNo.],
      -- [EmploymentTerminationPaymentTaxOffset$],
      -- [HelpDebtBalanceNo.],
      -- [HelpDebtBalance$],
      -- [SfssDebtBalanceNo.],
      -- [SfssDebtBalance$],
      -- [TslDebtBalanceNo.],
      -- [TslDebtBalance$],
      -- [PeopleWithPrivateHealthInsuranceNo.],
      -- [PrivateHealthInsurance-YourAustralianGovernmentRebateReceivedNo.],
      -- [PrivateHealthInsurance-YourAustralianGovernmentRebateReceived$],
      -- [PrivateHealthInsuranceRebateNo.],
      -- [PrivateHealthInsuranceRebate$],
      -- [ExcessPrivateHealthReductionOrRefund(RebateReduced)No.],
      -- [ExcessPrivateHealthReductionOrRefund(RebateReduced)$]
    )
    VALUES
    (
      Col0,
      Col1,
      Col2,
      Col3,
      CAST(Col4 AS BIGINT),
      CAST(Col5 AS FLOAT),
      CAST(Col6 AS BIGINT),
      CAST(Col7 AS FLOAT)--,
      -- Col8,
      -- Col9,
      -- Col10,
      -- Col11,
      -- Col12,
      -- Col13,
      -- Col14,
      -- Col15,
      -- Col16,
      -- Col17,
      -- Col18,
      -- Col19,
      -- Col20,
      -- Col21,
      -- Col22,
      -- Col23,
      -- Col24,
      -- Col25,
      -- Col26,
      -- Col27,
      -- Col28,
      -- Col29,
      -- Col30,
      -- Col31,
      -- Col32,
      -- Col33,
      -- Col34,
      -- Col35,
      -- Col36,
      -- Col37,
      -- Col38,
      -- Col39,
      -- Col40,
      -- Col41,
      -- Col42,
      -- Col43,
      -- Col44,
      -- Col45,
      -- Col46,
      -- Col47,
      -- Col48,
      -- Col49,
      -- Col50,
      -- Col51,
      -- Col52,
      -- Col53,
      -- Col54,
      -- Col55,
      -- Col56,
      -- Col57,
      -- Col58,
      -- Col59,
      -- Col60,
      -- Col61,
      -- Col62,
      -- Col63,
      -- Col64,
      -- Col65,
      -- Col66,
      -- Col67,
      -- Col68,
      -- Col69,
      -- Col70,
      -- Col71,
      -- Col72,
      -- Col73,
      -- Col74,
      -- Col75,
      -- Col76,
      -- Col77,
      -- Col78,
      -- Col79,
      -- Col80,
      -- Col81,
      -- Col82,
      -- Col83,
      -- Col84,
      -- Col85,
      -- Col86,
      -- Col87,
      -- Col88,
      -- Col89,
      -- Col90,
      -- Col91,
      -- Col92,
      -- Col93,
      -- Col94,
      -- Col95,
      -- Col96,
      -- Col97,
      -- Col98,
      -- Col99,
      -- Col100,
      -- Col101,
      -- Col102,
      -- Col103,
      -- Col104,
      -- Col105,
      -- Col106,
      -- Col107,
      -- Col108,
      -- Col109,
      -- Col110,
      -- Col111,
      -- Col112,
      -- Col113,
      -- Col114,
      -- Col115,
      -- Col116,
      -- Col117,
      -- Col118,
      -- Col119,
      -- Col120,
      -- Col121,
      -- Col122,
      -- Col123,
      -- Col124,
      -- Col125,
      -- Col126,
      -- Col127,
      -- Col128,
      -- Col129,
      -- Col130,
      -- Col131,
      -- Col132,
      -- Col133,
      -- Col134,
      -- Col135,
      -- Col136,
      -- Col137,
      -- Col138,
      -- Col139,
      -- Col140,
      -- Col141,
      -- Col142,
      -- Col143,
      -- Col144,
      -- Col145,
      -- Col146,
      -- Col147,
      -- Col148,
      -- Col149,
      -- Col150,
      -- Col151,
      -- Col152,
      -- Col153,
      -- Col154,
      -- Col155,
      -- Col156,
      -- Col157,
      -- Col158,
      -- Col159,
      -- Col160,
      -- Col161,
      -- Col162
    );

    UPDATE ato.[14A]
    SET
      ANZSCOCode = LEFT([Occupation-UnitGroup],  CHARINDEX(' ', [Occupation-UnitGroup])),
      ANZSCOTitle = RIGHT([Occupation-UnitGroup],  LEN([Occupation-UnitGroup]) - CHARINDEX(' ', [Occupation-UnitGroup]));

END;
GO

CREATE OR ALTER PROCEDURE etl.merge14B
AS
BEGIN
  MERGE
    ato.[14B] dst
  USING
  (
    SELECT
      Col0,
      Col1,
      Col2,
      Col3,
      CASE WHEN Col4='na' THEN NULL ELSE Col4 END Col4,
      CASE WHEN Col5='na' THEN NULL ELSE Col5 END Col5,
      CASE WHEN Col6='na' THEN NULL ELSE Col6 END Col6,
      CASE WHEN Col7='na' THEN NULL ELSE Col7 END Col7,
      CASE WHEN Col8='na' THEN NULL ELSE Col8 END Col8,
      CASE WHEN Col9='na' THEN NULL ELSE Col9 END Col9,
      CASE WHEN Col10='na' THEN NULL ELSE Col10 END Col10,
      CASE WHEN Col11='na' THEN NULL ELSE Col11 END Col11,
      CASE WHEN Col12='na' THEN NULL ELSE Col12 END Col12,
      CASE WHEN Col13='na' THEN NULL ELSE Col13 END Col13,
      CASE WHEN Col14='na' THEN NULL ELSE Col14 END Col14,
      CASE WHEN Col15='na' THEN NULL ELSE Col15 END Col15,
      CASE WHEN Col16='na' THEN NULL ELSE Col16 END Col16,
      CASE WHEN Col17='na' THEN NULL ELSE Col17 END Col17,
      CASE WHEN Col18='na' THEN NULL ELSE Col18 END Col18,
      CASE WHEN Col19='na' THEN NULL ELSE Col19 END Col19,
      CASE WHEN Col20='na' THEN NULL ELSE Col20 END Col20,
      CASE WHEN Col21='na' THEN NULL ELSE Col21 END Col21,
      CASE WHEN Col22='na' THEN NULL ELSE Col22 END Col22,
      CASE WHEN Col23='na' THEN NULL ELSE Col23 END Col23,
      CASE WHEN Col24='na' THEN NULL ELSE Col24 END Col24,
      CASE WHEN Col25='na' THEN NULL ELSE Col25 END Col25,
      CASE WHEN Col26='na' THEN NULL ELSE Col26 END Col26,
      CASE WHEN Col27='na' THEN NULL ELSE Col27 END Col27,
      CASE WHEN Col28='na' THEN NULL ELSE Col28 END Col28,
      CASE WHEN Col29='na' THEN NULL ELSE Col29 END Col29,
      CASE WHEN Col30='na' THEN NULL ELSE Col30 END Col30,
      CASE WHEN Col31='na' THEN NULL ELSE Col31 END Col31,
      CASE WHEN Col32='na' THEN NULL ELSE Col32 END Col32,
      CASE WHEN Col33='na' THEN NULL ELSE Col33 END Col33,
      CASE WHEN Col34='na' THEN NULL ELSE Col34 END Col34,
      CASE WHEN Col35='na' THEN NULL ELSE Col35 END Col35,
      CASE WHEN Col36='na' THEN NULL ELSE Col36 END Col36,
      CASE WHEN Col37='na' THEN NULL ELSE Col37 END Col37,
      CASE WHEN Col38='na' THEN NULL ELSE Col38 END Col38,
      CASE WHEN Col39='na' THEN NULL ELSE Col39 END Col39,
      CASE WHEN Col40='na' THEN NULL ELSE Col40 END Col40,
      CASE WHEN Col41='na' THEN NULL ELSE Col41 END Col41,
      CASE WHEN Col42='na' THEN NULL ELSE Col42 END Col42,
      CASE WHEN Col43='na' THEN NULL ELSE Col43 END Col43,
      CASE WHEN Col44='na' THEN NULL ELSE Col44 END Col44
    FROM
      etl.[14B]
  ) src
  ON src.Col0 = dst.[IncomeYear]
  AND src.Col1 = dst.[Occupation-UnitGroup]
  AND src.Col2 = dst.[Sex]
  AND src.Col3 = dst.[TaxableIncomeRanges(TaxBrackets)]
  WHEN MATCHED THEN
  UPDATE SET
    [IncomeYear] = Col0 ,
    [Occupation-UnitGroup] = Col1 ,
    [Sex] = Col2 ,
    [TaxableIncomeRanges(TaxBrackets)] = Col3 ,
    [NumberOfIndividualsNo.] = Col4 ,
    [SalaryOrWagesNo.] = Col5 ,
    [SalaryOrWages$] = CAST(Col6 AS FLOAT),
    [TotalIncomeOrLossNo.] = Col7 ,
    [TotalIncomeOrLoss$] = CAST(Col8 AS FLOAT),
    [TotalWorkRelatedCarExpensesNo.] = Col9 ,
    [TotalWorkRelatedCarExpenses$] = CAST(Col10 AS FLOAT),
    [WorkRelatedTravelExpensesNo.] = Col11,
    [WorkRelatedTravelExpenses$] = CAST(Col12 AS FLOAT),
    [TotalWorkRelatedUniform/ClothingExpensesNo.] = Col13,
    [TotalWorkRelatedUniform/ClothingExpenses$] = CAST(Col14 AS FLOAT),
    [TotalWorkRelatedSelfEducationExpensesNo.] = Col15,
    [TotalWorkRelatedSelfEducationExpenses$] = CAST(Col16 AS FLOAT),
    [OtherWorkRelatedExpensesNo.] = Col17,
    [OtherWorkRelatedExpenses$] = CAST(Col18 AS FLOAT),
    [GiftsOrDonationsNo.] = Col19,
    [GiftsOrDonations$] = CAST(Col20 AS FLOAT),
    [CostOfManagingTaxAffairsNo.] = Col21,
    [CostOfManagingTaxAffairs$] = CAST(Col22 AS FLOAT),
    [CostOfManagingTaxAffairs-OtherExpensesIncurredInManagingYourTaxAffairsNo.] = Col23,
    [CostOfManagingTaxAffairs-OtherExpensesIncurredInManagingYourTaxAffairs$] = CAST(Col24 AS FLOAT),
    [TotalDeductionsNo.] = Col25,
    [TotalDeductions$] = CAST(Col26 AS FLOAT),
    [CapitalGainsNetCapitalGainNo.] = Col27,
    [CapitalGainsNetCapitalGain$] = CAST(Col28 AS FLOAT),
    [NetRent-ProfitNo.] = Col29,
    [NetRent-Profit$] = CAST(Col30 AS FLOAT),
    [NetRent-LossNo.] = Col31,
    [NetRent-Loss$] = CAST(Col32 AS FLOAT),
    [NetRentNo.] = Col33,
    [NetRent$] = CAST(Col34 AS FLOAT),
    [TotalBusinessIncomeNo.] = Col35,
    [TotalBusinessIncome$] = CAST(Col36 AS FLOAT),
    [TotalBusinessExpensesNo.] = Col37,
    [TotalBusinessExpenses$] = CAST(Col38 AS FLOAT),
    [NetIncomeOrLossFromBusinessNo.] = Col39,
    [NetIncomeOrLossFromBusiness$] = CAST(Col40 AS FLOAT),
    [TaxableIncomeOrLossNo.] = Col41,
    [TaxableIncomeOrLoss$] = CAST(Col42 AS FLOAT),
    [NetTaxNo.] = Col43,
    [NetTax$] = CAST(Col44 AS FLOAT)
  WHEN NOT MATCHED THEN
    INSERT
    (
      [IncomeYear],
      [Occupation-UnitGroup],
      [Sex],
      [TaxableIncomeRanges(TaxBrackets)],
      [NumberOfIndividualsNo.],
      [SalaryOrWagesNo.],
      [SalaryOrWages$],
      [TotalIncomeOrLossNo.],
      [TotalIncomeOrLoss$],
      [TotalWorkRelatedCarExpensesNo.],
      [TotalWorkRelatedCarExpenses$],
      [WorkRelatedTravelExpensesNo.],
      [WorkRelatedTravelExpenses$],
      [TotalWorkRelatedUniform/ClothingExpensesNo.],
      [TotalWorkRelatedUniform/ClothingExpenses$],
      [TotalWorkRelatedSelfEducationExpensesNo.],
      [TotalWorkRelatedSelfEducationExpenses$],
      [OtherWorkRelatedExpensesNo.],
      [OtherWorkRelatedExpenses$],
      [GiftsOrDonationsNo.],
      [GiftsOrDonations$],
      [CostOfManagingTaxAffairsNo.],
      [CostOfManagingTaxAffairs$],
      [CostOfManagingTaxAffairs-OtherExpensesIncurredInManagingYourTaxAffairsNo.],
      [CostOfManagingTaxAffairs-OtherExpensesIncurredInManagingYourTaxAffairs$],
      [TotalDeductionsNo.],
      [TotalDeductions$],
      [CapitalGainsNetCapitalGainNo.],
      [CapitalGainsNetCapitalGain$],
      [NetRent-ProfitNo.],
      [NetRent-Profit$],
      [NetRent-LossNo.],
      [NetRent-Loss$],
      [NetRentNo.],
      [NetRent$],
      [TotalBusinessIncomeNo.],
      [TotalBusinessIncome$],
      [TotalBusinessExpensesNo.],
      [TotalBusinessExpenses$],
      [NetIncomeOrLossFromBusinessNo.],
      [NetIncomeOrLossFromBusiness$],
      [TaxableIncomeOrLossNo.],
      [TaxableIncomeOrLoss$],
      [NetTaxNo.],
      [NetTax$]
    )
    VALUES
    (
      Col0 ,
      Col1 ,
      Col2 ,
      Col3 ,
      Col4 ,
      Col5 ,
      CAST(Col6 AS FLOAT),
      Col7 ,
      CAST(Col8 AS FLOAT),
      Col9 ,
      CAST(Col10 AS FLOAT),
      Col11,
      CAST(Col12 AS FLOAT),
      Col13,
      CAST(Col14 AS FLOAT),
      Col15,
      CAST(Col16 AS FLOAT),
      Col17,
      CAST(Col18 AS FLOAT),
      Col19,
      CAST(Col20 AS FLOAT),
      Col21,
      CAST(Col22 AS FLOAT),
      Col23,
      CAST(Col24 AS FLOAT),
      Col25,
      CAST(Col26 AS FLOAT),
      Col27,
      CAST(Col28 AS FLOAT),
      Col29,
      CAST(Col30 AS FLOAT),
      Col31,
      CAST(Col32 AS FLOAT),
      Col33,
      CAST(Col34 AS FLOAT),
      Col35,
      CAST(Col36 AS FLOAT),
      Col37,
      CAST(Col38 AS FLOAT),
      Col39,
      CAST(Col40 AS FLOAT),
      Col41,
      CAST(Col42 AS FLOAT),
      Col43,
      CAST(Col44 AS FLOAT)
    );

    UPDATE ato.[14B]
    SET
      ANZSCOCode = LEFT([Occupation-UnitGroup],  CHARINDEX(' ', [Occupation-UnitGroup])),
      ANZSCOTitle = RIGHT([Occupation-UnitGroup],  LEN([Occupation-UnitGroup]) - CHARINDEX(' ', [Occupation-UnitGroup]));

END;
GO
