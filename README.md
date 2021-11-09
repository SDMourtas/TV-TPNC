# TV-TPNC
In finance, the most efficient portfolio is the tangency portfolio, which is formed by the intersection point of the efficient frontier and the Capital Market Line.
The Time-Varying Tangency Portfolio under Nonlinear Constraints (TV-TPNC) problem is a time-varying nonlinear programming problem in which the nonlinear constraints refer to transaction costs and cardinality constraints. Because of this, TV-TPNC is more realistic and an even greater analysis tool suitable to evaluate investments and identify trading opportunities across a time period than the original tangency portfolio optimization problem.\
The purpose of this package is to solve online the TV-TPNC problem by using a Semi-Integer Beetle Antennae Search (SIBAS) algorithm. The main article used is the following:
*	V.N.Katsikis, S.D.Mourtas, V.N.Katsikis, "Diversification of Time-Varying Tangency Portfolio under Nonlinear Constraints through Semi-Integer Beetle Antennae Search Algorithm," (submitted)

Also, the package includes the following two Matlab functions for comparison purposes:
*	Yarpiz (2020). Differential Evolution (DE) (https://www.mathworks.com/matlabcentral/fileexchange/52897-differential-evolution-de), MATLAB Central File Exchange. Retrieved December 8, 2020.
*	Slime Mould Algorithm (SMA) (https://www.mathworks.com/matlabcentral/fileexchange/76619-slime-mould-algorithm-sma-a-method-for-optimization)
The Matlab function DE can also be found in https://yarpiz.com/, and the Matlab function SMA can also be found in https://github.com/aliasghar68/Slime-Mould-Algorithm-A-New-Method-for-Stochastic-Optimization-.\
Note that these functions have been appropriately modified for the TV-TPNC problem.

# M-files Description
*	Main_TVTPNC.m: the main function and parameters declaration
*	TVTPNC.m: problem setup and main procedure
*	dataprep.m: function for the construction of the market, expected return and covariance
*	example.m: complementary function for the problem setup
*	objfun1.m: objective function of the problem
*	objfun2.m: function for calculating the Sharpe ratio
*	Sphere.m: objective function of the problem used by PSO, DE and SMA algorithms
*	penfun1.m: objective function of the problem plus the penalty value
*	penfun2.m: objective function of the binary problem plus the penalty value
*	SIBAS.m: appropriately modified SIBAS algorithm
*	DE.m: appropriately modified DE algorithm
*	SMA.m: appropriately modified SMA algorithm
*	Initialization.m: complementary function of the SMA algorithm

# Installation
*	Unzip the file you just downloaded and copy the TV-TPNC directory to a location,e.g.,/my-directory/
*	Run Matlab/Octave, Go to /my-directory/TV-TPNC/ at the command prompt
*	run 'Main_TVTPNC' (Matlab/Octave)

# Results
After running the Main_TVTPNC.m file, the package outputs are the following:
*	The optimal portfolio of TV-TPNC problem created by SIBAS, PSO, DE and SMA.
*	The time consumptions of SIBAS, PSO, DE and SMA.
*	The graphic illustration of the average price of the objected function along with the optimal portfolios Sharpe ratio and transaction cost.

# Environment
The TV-TPNC package has been tested in Matlab 2018b on OS: Windows 10 64-bit.
