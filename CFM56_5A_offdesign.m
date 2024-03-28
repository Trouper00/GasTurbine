% On design inputs
M_0R = 0.8;
T_0R = 223.25;%Kelvin
P_0R = 26499.3;%Pascal 
betaR = 0.03; %bleed air fraction
C_TOLR = 0; %CTO low
C_TOHR = 0.005;  %CTO high
h_PRR = 42798; % fuel heating value(kj/kg)
epsilon1R = 0.05; % % coolant mixer1 air fraction
epsilon2R = 0.05; % % coolant mixer2 air fraction
pi_bR = 0.95; %combustor pressure ratio
pi_dmaxR = 0.99; %diffuser max pressure ratio
pi_nR = 0.99; %nozzle pressure ratio
pi_nfR = 0.99; %fan nozzle pressure ratio
e_fR = 0.93;  %fan polytropic eff
e_cLR = 0.91; %low pressure comp polytropic ef
e_cHR = 0.91;  %high pressure comp polytropic eff
e_tHR = 0.93; %high pressure turbine polytropic eff
e_tLR = 0.93; %low pressure turbine polytropic eff
eta_bR = 0.99; %combustor efficiency
eta_mLR = 0.99;%lp spool mech eff
eta_mHR = 0.99; %hp spool mech effic
eta_mPLR = 1; %lp spool power takeoff mech eff
eta_mPHR = 0.99; %hp spool power takeoff mech eff
pi_fR = 1.55; %fan pressure ratio
pi_cLR = 1.55; %lpc pressure ratio
pi_cR=26.5; %compressor total pressure ratio
pi_cHR=pi_cR/pi_cLR; 
alfaR = 6; %bypass ratio
Tt4R = 1538.16667; %hp turbine inlet temp(K)
mdot_0R=425.019; %kg/s
        % Off design inputs
% Değer girdileri
M_0 = 0.4;
T_0 = 288.1611; % Kelvin 
P_0 = 101325.353;%Pascal 
beta = 0.03;%bleed air fraction
P_TOL = 0; % Power Take off(Low Pressure Spool) Watt    
P_TOH = 133800; %% Power Take off(Low Pressure Spool) Watt
epsilon1 = 0.05; % % coolant mixer1 air fraction
epsilon2 = 0.05; % % coolant mixer2 air fraction
h_PR = 42798.4; % fuel heating value(kj/kg)
pi_b = 0.95; %combustor pressure ratio
pi_dmax = 0.99;%diffuser max pressure ratio
pi_n = 0.99; %nozzle pressure ratio
pi_nf = 0.99; %fan nozzle pressure ratio
eta_f = 0.9252; %fan efficiency
eta_cL = 0.9039; %low pressure compressor efficiency
eta_cH = 0.8721; %high pressure compressor efficiency
eta_tH = 0.9407; %high pressure turbine efficiency
eta_tL = 0.9438; %low pressure turbine efficiency
eta_b = 0.99; %combustor efficiency
eta_mL = 0.99; %LP Spool mech efficiency
eta_mH = 0.99; %HP Spool mech efficiency
eta_mPL = 1.00; %LP Spool power take off mech efficiency
eta_mPH = 0.99; %HP Spool power take off mech efficiency
pi_cmax = 30; %Loop upper limit for compressor pressure ratio
Tt4=1592.22; %HP Pressure Turbine inlet temperature (Kelvin)
[F,mdot_0, Fovermdot0,percentageNL,percentageNH,pi_c, S, f0, eta_P, alfa, eta_TH, rateofV9toa0, rateofV19toa0, Pt9overP9, Pt19overP19, P19overP0, P9overP0, T9overT0, T19overT0,pi_f,pi_cL,pi_cH, pi_tH, pi_tL, tau_f, tau_cL, tau_cH, tau_tH, tau_tL, tau_lambda, f,tau_m1,tau_m2, M_9, M_19] = offdesign(M_0, T_0, P_0, beta, P_TOL, P_TOH, epsilon1, epsilon2,h_PR,pi_b, pi_dmax, pi_n, pi_nf, eta_f,eta_cL,eta_cH,eta_tH, eta_tL, eta_b, eta_mL, eta_mH, eta_mPL, eta_mPH,pi_cmax,Tt4,M_0R, T_0R, P_0R, betaR, C_TOLR, C_TOHR, h_PRR, epsilon1R, epsilon2R, pi_bR, pi_dmaxR, pi_nR, pi_nfR, e_fR, e_cLR, e_cHR, e_tHR, e_tLR, eta_bR, eta_mLR, eta_mHR, eta_mPLR, eta_mPHR, pi_fR, pi_cLR, pi_cHR, alfaR, Tt4R,mdot_0R);
fprintf('F(thrust): %.2f N\n', F);
fprintf('mdot_0(mass flow rate): %.2f kg/s\n', mdot_0);
fprintf('Fovermdot0(specificthrust): %.2f N/(kg/s)\n', Fovermdot0);
fprintf('percentageNL(LP Spool RPM %%): %.2f \n', percentageNL);
fprintf('percentageNH(LP Spool RPM %%): %.2f \n', percentageNH);
fprintf('pi_c(compressor pressure ratio): %.2f \n', pi_c);
fprintf('S (Thrust specific fuel consumption): %.2f (kg/hr)/N\n', S);
fprintf('f0(overall fuel-to air ratio): %.2f \n', f0);
fprintf('eta_P: %.2f \n', eta_P);
fprintf('alfa(bypassratio): %.2f \n', alfa);
fprintf('eta_TH: %.2f \n', eta_TH);
fprintf('rateofV9toa0: %.2f \n', rateofV9toa0);
fprintf('rateofV19toa0: %.2f \n', rateofV19toa0);
fprintf('Pt9overP9: %.2f \n', Pt9overP9);
fprintf('Pt19overP19: %.2f \n', Pt19overP19);
fprintf('P19overP0: %.2f \n', P19overP0);
fprintf('P9overP0: %.2f \n', P9overP0);
fprintf('T9overT0: %.2f \n', T9overT0);
fprintf('T19overT0: %.2f \n', T19overT0);
fprintf('pi_f(fan pressure ratio): %.2f \n', pi_f);
fprintf('pi_cL(low pressure compressor pressure ratio): %.2f \n', pi_cL);
fprintf('pi_cH(high pressure compressor pressure ratio): %.2f \n', pi_cH);
fprintf('pi_tH(high pressure turbine pressure ratio): %.2f \n', pi_tH);
fprintf('pi_tL(low pressure turbine pressure ratio): %.2f \n', pi_tL);
fprintf('tau_f(fan temperature ratio): %.2f \n', tau_f);
fprintf('tau_cL(low pressure compressor temperature ratio): %.2f \n', tau_cL);
fprintf('tau_cH(high pressure compressor temperature ratio): %.2f \n', tau_cH);
fprintf('tau_tH(high pressure turbine temperature ratio): %.2f \n', tau_tH);
fprintf('tau_tL(low pressure turbine temperature ratio): %.2f \n', tau_tL);
fprintf('tau_lambda: %.2f \n', tau_lambda);
fprintf('f(combustor fuel-to air ratio): %.2f \n', f);
fprintf('tau_m1(coolant mixer-1 temperature ratio): %.2f \n', tau_m1);
fprintf('tau_m2(coolant mixer-2 temperature ratio): %.2f \n', tau_m2);
fprintf('M_9(Mach Number at 9): %.2f\n', M_9);
fprintf('M_19(Mach Number at 19): %.2f\n', M_19);
