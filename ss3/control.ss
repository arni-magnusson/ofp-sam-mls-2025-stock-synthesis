#C No comments
#C file created using an r4ss function
#C file write time: 2025-07-23  03:30:07
#
0 # 0 means do not read wtatage.ss; 1 means read and usewtatage.ss and also read and use growth parameters
1 #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern
4 # recr_dist_method for parameters
1 # not yet implemented; Future usage:Spawner-Recruitment; 1=global; 2=by area
1 # number of recruitment settlement assignments 
0 # unused option
# for each settlement assignment:
#_GPattern	month	area	age
1	1	1	0	#_recr_dist_pattern1
#
#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
1 #_Nblock_Patterns
1 #_blocks_per_pattern
#_begin and end years of blocks
1951 1951
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# AUTOGEN
1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement
#
4 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=Maunder_M;_6=Age-range_Lorenzen
#_ #_Age_natmort_by sex x growthpattern
#_Age_0	Age_1	Age_2	Age_3	Age_4	Age_5	Age_6	Age_7	Age_8	Age_9	Age_10
0.707867	0.4718	0.4007	0.3766	0.3669	0.3629	0.3612	0.3605	0.3602	0.36	0.36	#_natM1
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr;5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
0 #_Age(post-settlement)_for_L1;linear growth below this
10 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0 #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
2 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
1 #_First_Mature_Age
3 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env_var&link	dev_link	dev_minyr	dev_maxyr	dev_PH	Block	Block_Fxn
    5	     100	    94.7832	       59.9	 99	0	  7	0	0	0	0	  0	0	0	#_L_at_Amin_Fem_GP_1 
   50	     600	    215.686	    210.956	 99	0	  6	0	0	0	0	  0	0	0	#_L_at_Amax_Fem_GP_1 
 0.01	    0.99	   0.438985	     0.8351	 99	0	  8	0	0	0	0	  0	0	0	#_VonBert_K_Fem_GP_1 
 0.01	      20	     9.9314	     9.9314	 99	0	 -2	0	0	0	0	  0	0	0	#_CV_young_Fem_GP_1  
 0.01	      20	    11.0517	    11.0517	 99	0	 -3	0	0	0	0	  0	0	0	#_CV_old_Fem_GP_1    
   -3	       3	5.39942e-07	5.39942e-07	 99	0	 -3	0	0	0	0	  0	0	0	#_Wtlen_1_Fem_GP_1   
   -3	       5	    3.58378	    3.58378	 99	0	 -3	0	0	0	0	  0	0	0	#_Wtlen_2_Fem_GP_1   
    1	     300	    181.205	    181.205	 99	0	 -3	0	0	0	0	  0	0	0	#_Mat50%_Fem_GP_1    
 -200	       3	  -0.197458	  -0.197458	 99	0	 -3	0	0	0	0	  0	0	0	#_Mat_slope_Fem_GP_1 
   -3	      20	          1	          1	0.5	6	 -3	0	0	0	0	0.5	0	0	#_Eggs_alpha_Fem_GP_1
   -3	       3	          1	          1	0.5	6	 -3	0	0	0	0	0.5	0	0	#_Eggs_beta_Fem_GP_1 
  0.1	      10	          1	          1	  1	6	 -1	0	0	0	0	  0	0	0	#_CohortGrowDev      
1e-06	0.999999	        0.5	        0.5	0.5	0	-99	0	0	0	0	  0	0	0	#_FracFemale_GP_1    
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; 2=Ricker; 3=std_B-H; 4=SCAA;5=Hockey; 6=B-H_flattop; 7=survival_3Parm;8=Shepard_3Parm
0 # 0/1 to use steepness in initial equ recruitment calculation
0 # future feature: 0/1 to make realized sigmaR a function of SR curvature
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn # parm_name
   2	  20	5.19497	  6	  99	0	 1	0	0	0	0	0	0	0	#_SR_LN(R0)  
 0.2	0.99	    0.8	0.8	1000	6	-2	0	0	0	0	0	0	0	#_SR_BH_steep
0.05	 1.9	    0.6	0.6	1000	6	-4	0	0	0	0	0	0	0	#_SR_sigmaR  
  -4	   4	      0	  0	  99	0	-1	0	0	0	0	0	0	0	#_SR_regime  
   0	   0	      0	  0	  99	0	-1	0	0	0	0	0	0	0	#_SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1952 # first year of main recr_devs; early devs can preceed this era
2021 # last year of main recr_devs; forecast devs start in following year
1 #_recdev phase
1 # (0/1) to read 13 advanced options
1942 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
2 #_recdev_early_phase
0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1 #_lambda for Fcast_recr_like occurring before endyr+1
1947 #_last_yr_nobias_adj_in_MPD; begin of ramp
1968.6 #_first_yr_fullbias_adj_in_MPD; begin of plateau
2020.8 #_last_yr_fullbias_adj_in_MPD
2022.3 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
0.8442 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
0 #_period of cycles in recruitment (N parms read below)
-5 #min rec_dev
5 #max rec_dev
0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
#Fishing Mortality info
0.3 # F ballpark
2010 # F ballpark year (neg value to disable)
4 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
10 # max F or harvest rate, depends on F_Method
#_fleet	start_F	first_parm_phase
    1	0.05	99	#_F_4_Fleet_Parms1 
    2	0.05	99	#_F_4_Fleet_Parms2 
    3	0.05	99	#_F_4_Fleet_Parms3 
    4	0.05	99	#_F_4_Fleet_Parms4 
    5	0.05	99	#_F_4_Fleet_Parms5 
    6	0.05	99	#_F_4_Fleet_Parms6 
    7	0.05	99	#_F_4_Fleet_Parms7 
    8	0.05	99	#_F_4_Fleet_Parms8 
    9	0.05	99	#_F_4_Fleet_Parms9 
   10	0.05	99	#_F_4_Fleet_Parms10
   11	0.05	99	#_F_4_Fleet_Parms11
   12	0.05	99	#_F_4_Fleet_Parms12
   13	0.05	99	#_F_4_Fleet_Parms13
   14	0.05	99	#_F_4_Fleet_Parms14
   15	0.05	 5	#_F_4_Fleet_Parms15
   16	0.05	99	#_F_4_Fleet_Parms16
   17	0.05	99	#_F_4_Fleet_Parms17
-9999	   0	 0	#_terminator       
4 # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 0
#
#_Q_setup for fleets with cpue or survey data
#_fleet	link	link_info	extra_se	biasadj	float  #  fleetname
   18	1	0	1	0	1	#_S01_INDEX.1-4
   19	1	0	1	0	1	#_S02_INDEX.NZ 
   20	1	0	1	0	1	#_S03_INDEX.AU 
-9999	0	0	0	0	0	#_terminator   
#_Q_parms(if_any);Qunits_are_ln(q)
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
-25	25	 -3.95379	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_S01_INDEX.1-4(18) 
  0	 1	0.0922228	0	1	0	-1	0	0	0	0	0	0	0	#_Q_extraSD_S01_INDEX.1-4(18)
-25	25	  -2.7652	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_S02_INDEX.NZ(19)  
  0	 1	  0.18222	0	1	0	-1	0	0	0	0	0	0	0	#_Q_extraSD_S02_INDEX.NZ(19) 
-25	25	 -3.25865	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_S03_INDEX.AU(20)  
  0	 1	 0.301309	0	1	0	-1	0	0	0	0	0	0	0	#_Q_extraSD_S03_INDEX.AU(20) 
#_no timevary Q parameters
#
#_size_selex_patterns
#_Pattern	Discard	Male	Special
24	0	0	0	#_1 F01_LL.JP.1       
24	0	0	0	#_2 F02_LL.JP.2       
24	0	0	0	#_3 F03_LL.JP.3       
24	0	0	0	#_4 F04_LL.JP.4       
 5	0	0	4	#_5 F05_LL.TW.4       
24	0	0	0	#_6 F06_LL.AU.2       
24	0	0	0	#_7 F07_LL.AU.3       
 5	0	0	7	#_8 F08_LL.NZ.3       
24	0	0	0	#_9 F09.REC.AU.3      
 1	0	0	0	#_10 F10_REC.NZ.3     
 5	0	0	1	#_11 F11_LL.ALL.1     
 5	0	0	2	#_12 F12_LL.ALL.2     
 5	0	0	3	#_13 F13_LL.ALL.3     
 5	0	0	4	#_14 F14_LL.ALL.4     
 5	0	0	2	#_15 F15_LL.JP.2_early
24	0	0	0	#_16 F16_LL.NC.2      
24	0	0	0	#_17 F17_LL.PF.4      
24	0	0	0	#_18 S01_INDEX.1-4    
24	0	0	0	#_19 S02_INDEX.NZ     
 5	0	0	6	#_20 S03_INDEX.AU     
#
#_age_selex_patterns
#_Pattern	Discard	Male	Special
11	0	0	0	#_1 F01_LL.JP.1       
11	0	0	0	#_2 F02_LL.JP.2       
11	0	0	0	#_3 F03_LL.JP.3       
11	0	0	0	#_4 F04_LL.JP.4       
11	0	0	0	#_5 F05_LL.TW.4       
11	0	0	0	#_6 F06_LL.AU.2       
11	0	0	0	#_7 F07_LL.AU.3       
11	0	0	0	#_8 F08_LL.NZ.3       
11	0	0	0	#_9 F09.REC.AU.3      
11	0	0	0	#_10 F10_REC.NZ.3     
11	0	0	0	#_11 F11_LL.ALL.1     
11	0	0	0	#_12 F12_LL.ALL.2     
11	0	0	0	#_13 F13_LL.ALL.3     
11	0	0	0	#_14 F14_LL.ALL.4     
11	0	0	0	#_15 F15_LL.JP.2_early
11	0	0	0	#_16 F16_LL.NC.2      
11	0	0	0	#_17 F17_LL.PF.4      
11	0	0	0	#_18 S01_INDEX.1-4    
11	0	0	0	#_19 S02_INDEX.NZ     
11	0	0	0	#_20 S03_INDEX.AU     
#
#_SizeSelex
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
  45	325	    182.304	 100	99	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_F01_LL.JP.1(1)       
 -10	 10	        -10	 -10	99	0	 -3	0	0	0	0	0	0	0	#_SizeSel_P_2_F01_LL.JP.1(1)       
 -10	 10	    7.01552	   0	99	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_3_F01_LL.JP.1(1)       
 -10	 10	    6.51614	   0	99	0	  5	0	0	0	0	0	0	0	#_SizeSel_P_4_F01_LL.JP.1(1)       
-999	  9	       -999	-999	99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_P_5_F01_LL.JP.1(1)       
-999	  9	   -494.967	   0	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_6_F01_LL.JP.1(1)       
  45	325	    199.747	 100	99	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_F02_LL.JP.2(2)       
 -10	 10	  -0.627069	   0	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_F02_LL.JP.2(2)       
 -10	 10	    5.78528	   0	99	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_3_F02_LL.JP.2(2)       
 -10	 10	   -1.07288	   0	99	0	  5	0	0	0	0	0	0	0	#_SizeSel_P_4_F02_LL.JP.2(2)       
-999	  9	       -999	-999	99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_P_5_F02_LL.JP.2(2)       
-999	  9	       -999	-999	99	0	 -3	0	0	0	0	0	0	0	#_SizeSel_P_6_F02_LL.JP.2(2)       
  45	325	    204.168	 100	99	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_F03_LL.JP.3(3)       
 -10	 10	        -10	 -10	99	0	 -3	0	0	0	0	0	0	0	#_SizeSel_P_2_F03_LL.JP.3(3)       
 -10	 10	    6.26526	   0	99	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_3_F03_LL.JP.3(3)       
 -10	 10	    9.98124	   0	99	0	  5	0	0	0	0	0	0	0	#_SizeSel_P_4_F03_LL.JP.3(3)       
-999	  9	       -999	-999	99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_P_5_F03_LL.JP.3(3)       
-999	  9	       -495	   0	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_6_F03_LL.JP.3(3)       
  45	325	    196.393	 100	99	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_F04_LL.JP.4(4)       
 -10	 10	        -10	 -10	99	0	 -3	0	0	0	0	0	0	0	#_SizeSel_P_2_F04_LL.JP.4(4)       
 -10	 10	    6.89461	   0	99	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_3_F04_LL.JP.4(4)       
 -10	 10	    4.53918	   0	99	0	  5	0	0	0	0	0	0	0	#_SizeSel_P_4_F04_LL.JP.4(4)       
-999	  9	       -999	-999	99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_P_5_F04_LL.JP.4(4)       
-999	  9	       -495	   0	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_6_F04_LL.JP.4(4)       
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_1_F05_LL.TW.4(5)       
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_2_F05_LL.TW.4(5)       
  45	325	    189.581	 100	99	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_F06_LL.AU.2(6)       
 -10	 10	        -10	 -10	99	0	 -3	0	0	0	0	0	0	0	#_SizeSel_P_2_F06_LL.AU.2(6)       
 -10	 10	    5.63547	   0	99	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_3_F06_LL.AU.2(6)       
 -10	 10	    4.86317	   0	99	0	  5	0	0	0	0	0	0	0	#_SizeSel_P_4_F06_LL.AU.2(6)       
-999	  9	       -999	-999	99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_P_5_F06_LL.AU.2(6)       
-999	  9	    0.45815	   0	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_6_F06_LL.AU.2(6)       
  45	325	    198.246	 100	99	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_F07_LL.AU.3(7)       
 -10	 10	        -10	 -10	99	0	 -3	0	0	0	0	0	0	0	#_SizeSel_P_2_F07_LL.AU.3(7)       
 -10	 10	    6.09357	   0	99	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_3_F07_LL.AU.3(7)       
 -10	 10	    5.96087	   0	99	0	  5	0	0	0	0	0	0	0	#_SizeSel_P_4_F07_LL.AU.3(7)       
-999	  9	       -999	-999	99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_P_5_F07_LL.AU.3(7)       
-999	  9	       -495	   0	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_6_F07_LL.AU.3(7)       
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_1_F08_LL.NZ.3(8)       
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_2_F08_LL.NZ.3(8)       
  45	325	    201.321	 100	99	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_F09.REC.AU.3(9)      
 -10	 10	 0.00592117	   0	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_F09.REC.AU.3(9)      
 -10	 10	    5.54073	   0	99	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_3_F09.REC.AU.3(9)      
 -10	 10	6.04255e-05	   0	99	0	  5	0	0	0	0	0	0	0	#_SizeSel_P_4_F09.REC.AU.3(9)      
-999	  9	       -999	-999	99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_P_5_F09.REC.AU.3(9)      
-999	  9	       -999	-999	99	0	 -3	0	0	0	0	0	0	0	#_SizeSel_P_6_F09.REC.AU.3(9)      
  45	325	     205.04	 100	99	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_F10_REC.NZ.3(10)     
   0	500	    18.9442	  10	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_F10_REC.NZ.3(10)     
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_1_F11_LL.ALL.1(11)     
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_2_F11_LL.ALL.1(11)     
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_1_F12_LL.ALL.2(12)     
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_2_F12_LL.ALL.2(12)     
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_1_F13_LL.ALL.3(13)     
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_2_F13_LL.ALL.3(13)     
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_1_F14_LL.ALL.4(14)     
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_2_F14_LL.ALL.4(14)     
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_1_F15_LL.JP.2_early(15)
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_2_F15_LL.JP.2_early(15)
  45	325	    202.803	 100	99	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_F16_LL.NC.2(16)      
 -10	 10	   0.230727	   0	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_F16_LL.NC.2(16)      
 -10	 10	    6.67457	   0	99	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_3_F16_LL.NC.2(16)      
 -10	 10	 0.00269738	   0	99	0	  5	0	0	0	0	0	0	0	#_SizeSel_P_4_F16_LL.NC.2(16)      
-999	  9	       -999	-999	99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_P_5_F16_LL.NC.2(16)      
-999	  9	       -999	-999	99	0	 -3	0	0	0	0	0	0	0	#_SizeSel_P_6_F16_LL.NC.2(16)      
  45	325	     193.49	 100	99	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_F17_LL.PF.4(17)      
 -10	 10	    0.16735	   0	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_F17_LL.PF.4(17)      
 -10	 10	    7.30872	   0	99	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_3_F17_LL.PF.4(17)      
 -10	 10	 0.00142847	   0	99	0	  5	0	0	0	0	0	0	0	#_SizeSel_P_4_F17_LL.PF.4(17)      
-999	  9	       -999	-999	99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_P_5_F17_LL.PF.4(17)      
-999	  9	       -999	-999	99	0	 -3	0	0	0	0	0	0	0	#_SizeSel_P_6_F17_LL.PF.4(17)      
  45	325	    199.301	 100	99	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_S01_INDEX.1-4(18)    
 -10	 10	   -8.57102	   0	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_S01_INDEX.1-4(18)    
 -10	 10	    7.72842	   0	99	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_3_S01_INDEX.1-4(18)    
 -10	 10	   -5.49315	   0	99	0	  5	0	0	0	0	0	0	0	#_SizeSel_P_4_S01_INDEX.1-4(18)    
-999	  9	       -999	-999	99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_P_5_S01_INDEX.1-4(18)    
-999	  9	       -999	-999	99	0	 -3	0	0	0	0	0	0	0	#_SizeSel_P_6_S01_INDEX.1-4(18)    
  45	325	        185	 100	99	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_S02_INDEX.NZ(19)     
 -10	 10	        -10	 -10	99	0	 -3	0	0	0	0	0	0	0	#_SizeSel_P_2_S02_INDEX.NZ(19)     
 -10	 10	3.27106e-08	   0	99	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_3_S02_INDEX.NZ(19)     
 -10	 10	         10	  10	99	0	 -5	0	0	0	0	0	0	0	#_SizeSel_P_4_S02_INDEX.NZ(19)     
-999	  9	       -999	-999	99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_P_5_S02_INDEX.NZ(19)     
-999	  9	       -999	-999	99	0	 -6	0	0	0	0	0	0	0	#_SizeSel_P_6_S02_INDEX.NZ(19)     
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_1_S03_INDEX.AU(20)     
 -99	 10	         -1	   1	99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_2_S03_INDEX.AU(20)     
#_AgeSelex
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F01_LL.JP.1(1)       
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F01_LL.JP.1(1)       
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F02_LL.JP.2(2)       
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F02_LL.JP.2(2)       
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F03_LL.JP.3(3)       
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F03_LL.JP.3(3)       
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F04_LL.JP.4(4)       
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F04_LL.JP.4(4)       
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F05_LL.TW.4(5)       
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F05_LL.TW.4(5)       
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F06_LL.AU.2(6)       
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F06_LL.AU.2(6)       
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F07_LL.AU.3(7)       
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F07_LL.AU.3(7)       
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F08_LL.NZ.3(8)       
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F08_LL.NZ.3(8)       
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F09.REC.AU.3(9)      
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F09.REC.AU.3(9)      
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F10_REC.NZ.3(10)     
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F10_REC.NZ.3(10)     
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F11_LL.ALL.1(11)     
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F11_LL.ALL.1(11)     
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F12_LL.ALL.2(12)     
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F12_LL.ALL.2(12)     
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F13_LL.ALL.3(13)     
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F13_LL.ALL.3(13)     
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F14_LL.ALL.4(14)     
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F14_LL.ALL.4(14)     
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F15_LL.JP.2_early(15)
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F15_LL.JP.2_early(15)
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F16_LL.NC.2(16)      
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F16_LL.NC.2(16)      
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_F17_LL.PF.4(17)      
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_F17_LL.PF.4(17)      
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_S01_INDEX.1-4(18)    
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_S01_INDEX.1-4(18)    
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_S02_INDEX.NZ(19)     
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_S02_INDEX.NZ(19)     
 0	 10	 0	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_1_S03_INDEX.AU(20)     
10	100	10	0	99	0	-99	0	0	0	0	0	0	0	#_AgeSel_P_2_S03_INDEX.AU(20)     
#_no timevary selex parameters
#
0 #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
# Tag loss and Tag reporting parameters go next
0 # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# Input variance adjustments factors: 
#_factor	fleet	value
    4	 1	0.4688	#_Variance_adjustment_list1 
    4	 2	 0.104	#_Variance_adjustment_list2 
    4	 3	0.1314	#_Variance_adjustment_list3 
    4	 5	0.3537	#_Variance_adjustment_list4 
    4	10	0.2561	#_Variance_adjustment_list5 
    4	11	0.0943	#_Variance_adjustment_list6 
    4	12	0.0197	#_Variance_adjustment_list7 
    4	16	 0.054	#_Variance_adjustment_list8 
    4	17	0.0401	#_Variance_adjustment_list9 
    7	 1	  0.25	#_Variance_adjustment_list10
    7	 2	  0.35	#_Variance_adjustment_list11
    7	 3	   0.3	#_Variance_adjustment_list12
    7	 6	   0.2	#_Variance_adjustment_list13
    7	 7	   0.3	#_Variance_adjustment_list14
    7	 9	  0.25	#_Variance_adjustment_list15
    7	10	  0.35	#_Variance_adjustment_list16
-9999	 0	     0	#_terminator                
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 20 changes to default Lambdas (default value is 1.0)
#_like_comp	fleet	phase	value	sizefreq_method
    1	 1	1	0	1	#_Surv_F01_LL.JP.1_Phz1      
    1	 2	1	0	1	#_Surv_F02_LL.JP.2_Phz1      
    1	 3	1	0	1	#_Surv_F03_LL.JP.3_Phz1      
    1	 4	1	0	1	#_Surv_F04_LL.JP.4_Phz1      
    1	 5	1	0	1	#_Surv_F05_LL.TW.4_Phz1      
    1	 6	1	0	1	#_Surv_F06_LL.AU.2_Phz1      
    1	 7	1	0	1	#_Surv_F07_LL.AU.3_Phz1      
    1	 8	1	0	1	#_Surv_F08_LL.NZ.3_Phz1      
    1	 9	1	0	1	#_Surv_F09.REC.AU.3_Phz1     
    1	10	1	0	1	#_Surv_F10_REC.NZ.3_Phz1     
    1	11	1	0	1	#_Surv_F11_LL.ALL.1_Phz1     
    1	12	1	0	1	#_Surv_F12_LL.ALL.2_Phz1     
    1	13	1	0	1	#_Surv_F13_LL.ALL.3_Phz1     
    1	14	1	0	1	#_Surv_F14_LL.ALL.4_Phz1     
    1	15	1	0	1	#_Surv_F15_LL.JP.2_early_Phz1
    1	16	1	0	1	#_Surv_F16_LL.NC.2_Phz1      
    1	17	1	0	1	#_Surv_F17_LL.PF.4_Phz1      
    1	18	1	1	1	#_Surv_S01_INDEX.1-4_Phz1    
    1	19	1	0	1	#_Surv_S02_INDEX.NZ_Phz1     
    1	20	1	0	1	#_Surv_S03_INDEX.AU_Phz1     
-9999	 0	0	0	0	#_terminator                 
#
0 # 0/1 read specs for more stddev reporting
#
999
