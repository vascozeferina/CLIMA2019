# CLIMA2019
EnergyPlus Model for CLIMA paper on Sensitivity Analysis

Main Sensitivity Analysis:

Use Matlab program: 

‘Code_CalculateMorris_Indexes.m’ – This program calculates the Morris EE sensitivity metrics from the simulation output results of model simulations on ‘Simulation_Result_Output,csv’. Firstly, it collect the annual and peak simulation results, calculate its rate by floorspace area and summarise them by each climate file.  In Addition, the analysis requires to be informed of the parameters iterated in each simulation step which are read from ‘Simulation_Result_Output.csv’

Input files:
‘Input_Simulation_Parameter.mat’ – Matrix informing the relevant values of the sensitivity analysis using Morris EE method. (Parameter changed, number of trajectories, number of parameters, number of levels)
‘Input_Simulation_Result_Output.csv’ – Collection of Output simulation results from EnergyPlus, executed by the parametric analysis on JEPlus program.

Output:
'Output_MorrisMetrics_Result.mat' : Matrix containing the sensitivity metrics of all parameters for the 5 climates
'Output_Simulation_Result.mat' : Matrix containing the Annual and Peak space cooling demand per square meter of floor space area, for all 595 simulation runs in the 5 different climates.
'Output_Summary_Results.mat': Matrixes for each climate containing a summary of simulation result (Peak & Annual at Min., Max. and Mean).

‘Code_Generate_Plots.m’ – This program generates plots comparing both sensitivity metrics for Peak and Annual results. In addition, compare the metrics currently and in a future climate. Additional plots are also generated, showing the distribution of Peak and Annual demand of all simulation samples.

Input:
'Output_Morris_Metrics_Result.mat' – Results from the method analysis
'Output_Simulation_Result.mat' – Simulation results per floor space area

Output:
'Peak_Morris.png' – Figure 3 on the paper
'Annual_Morris.png' - Figure 4 on the paper
'Climate_Sen_Peak_Morris.png' - Figure 5 on the paper
'Climate_Sen_Annual_Morris.png' - Figure 6 on the paper

Additional figure for analysis:
'Peak_vs_Annual_Clim_5.png'
'Peak_vs_Annual_AllCliData.png'
'Peak_vs_Annual_Averages.png'


JEPlus Project

‘Parametric_Morris.jep’ – JEPlus Project file for the parametric analysis. This JEPlus project file executes the sample of EnergyPlus model simulation according the parameterisation for Morris Elementary Effect analysis.

Inputs:

Weather Files:

C1 – ‘2080_Manchester_a1b_90_percentile_TRY.epw’
C2 – ‘2080_Manchester_a1fi_10_percentile_TRY.epw’
C3 – ‘2080_Manchester_a1fi_50_percentile_TRY.epw’
C4 – ‘2080_Manchester_a1fi_90_percentile_TRY.epw’
C5 – ‘cntr_Manchester_TRY.epw’

‘CLIMA_RVX_Extraction.rvx’ – RVX files stand for RVI-extended files, which is a data structure represented in JSON format. This file allow JEplus to extract a series of items from different E+ simulation output files, and combine all results from all simulations over the same output file.

‘JobListMorris_Total_Climate_P16_Tr_35_L6.csv’ – Input file for the input parameterisation of the EnergyPlus model accordingly Morris EE analysis.

‘Aut_IDF_MorrisMethod.imf’ – E+ model prepared for automatic iteration of parameters.

Output:

‘AllCombinedResults.csv’ – Collects the results from all simulations executed. 
Main result headers:
C0 column – for annual space cooling demand
C1 column – for peak space cooling demand
C10 column – for total floor space area

PS: Order of results in rows is not related to jobindex of simulation execution. It is necessary to order results according # column

Other files:

‘Generate_Morris_Parameters_Sample.m’ – Generate the input parameters of a simulation sample for Morris Analysis. The csv output file has to be adapted to be used as a jobindex file in JEPLus, but it stores all the iterated input parameters for the whole simulation run. The mat file includes the information on parameters updated during simulation iteration, necessary to calculate Morris metrics.

Input: ‘Sampling_Function_2.m’ – Morris Method Function
Output: 
‘MorrisTest_Input_Parameter_Samples_Info.mat’ 
‘Joblist_.csv’ – file with all simulation parameters

‘Test_Climate_Table.m’

Input: ‘StdModel_inAllClimates.csv’
Output: ‘Clim_STD_Var.mat' (Table 6 on the paper)

