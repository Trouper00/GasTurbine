% Gerekli girdileri tanımla
M_0 = 0.8;
T_0 = 223.25;%Kelvin
P_0 = 26499.3;%Pascal 
beta = 0.03; %bleed air fraction
C_TOL = 0; %CTO low
C_TOH = 0.005;  %CTO high
h_PR = 42798; % fuel heating value(kj/kg)
epsilon1 = 0.05; % % coolant mixer air fraction
epsilon2 = 0.05; % % coolant mixer air fraction
pi_b = 0.95; %combustor pressure ratio
pi_dmax = 0.99; %diffuser max pressure ratio
pi_n = 0.99; %nozzle pressure ratio
pi_nf = 0.99; %fan nozzle pressure ratio
e_f = 0.93;  %fan polytropic eff
e_cL = 0.91; %low pressure comp polytropic ef
e_cH = 0.91;  %high pressure comp polytropic eff
e_tH = 0.93; %high pressure turbine polytropic eff
e_tL = 0.93; %low pressure turbine polytropic eff
eta_b = 0.99; %combustor efficiency
eta_mL = 0.99;%lp spool mech eff
eta_mH = 0.99; %hp spool mech effic
eta_mPL = 1; %lp spool power takeoff mech eff
eta_mPH = 0.99; %hp spool power takeoff mech eff
pi_f = 1.55; %fan pressure ratip
pi_cL = 1.55; %lpc pressure ratio
pi_c=26.5;
pi_cH=pi_c/pi_cL;
alfa = 6; %bypass ratio
Tt4 = 1538.16667; %hp turbine inlet temp(K)
mdot0=425.878; %kg/s
[Fovermdot, S, f0, eta_P, eta_TH, rateofV9toa0, rateofV19toa0, Pt9overP9, Pt19overP19, P19overP0, P9overP0, T9overT0, T19overT0, pi_tH, pi_tL, tau_f, tau_cL, tau_cH, tau_tH, tau_tL, tau_lambda, f, eta_f, eta_cL, eta_cH, eta_tH, eta_tL, M_9, M_19] = highbypass(M_0, T_0, P_0, beta, C_TOL, C_TOH, h_PR, epsilon1, epsilon2, pi_b, pi_dmax, pi_n, pi_nf, e_f, e_cL, e_cH, e_tH, e_tL, eta_b, eta_mL, eta_mH, eta_mPL, eta_mPH, pi_f, pi_cL, pi_cH, alfa, Tt4);
% Sonuçları yazdır
fprintf('Specific Thrust (F/m_dot): %.4f N/(kg/s)\n', Fovermdot);
fprintf('Specific Fuel Consumption (S): %.4f (kg/hr)/N \n', S);
fprintf('Overall air-to fuel ratio (f0): %.4f\n', f0);
fprintf('Propulsive efficiency (eta_P): %.4f\n', eta_P);
fprintf('ETA_TH: %.4f\n', eta_TH);
fprintf('Rate of V9 to a0: %.4f\n', rateofV9toa0);
fprintf('Rate of V19 to a0: %.4f\n', rateofV19toa0);
fprintf('Pt9overP9: %.4f\n', Pt9overP9);
fprintf('Pt19overP19: %.4f\n', Pt19overP19);
fprintf('P19overP0: %.4f\n', P19overP0);
fprintf('P9overP0: %.4f\n', P9overP0);
fprintf('T9overT0: %.4f\n', T9overT0);
fprintf('T19overT0: %.4f\n', T19overT0);
fprintf('Pi_tH: %.4f\n', pi_tH);
fprintf('Pi_tL: %.4f\n', pi_tL);
fprintf('Tau_f: %.4f\n', tau_f);
fprintf('Tau_cL: %.4f\n', tau_cL);
fprintf('Tau_cH: %.4f\n', tau_cH);
fprintf('Tau_tH: %.4f\n', tau_tH);
fprintf('Tau_tL: %.4f\n', tau_tL);
fprintf('Tau_lambda: %.4f\n', tau_lambda);
fprintf('Combustor fuel to air ratio: %.4f\n', f);
fprintf('Eta_f: %.4f\n', eta_f);
fprintf('Eta_cL: %.4f\n', eta_cL);
fprintf('Eta_cH: %.4f\n', eta_cH);
fprintf('Eta_tH: %.4f\n', eta_tH);
fprintf('Eta_tL: %.4f\n', eta_tL);
fprintf('M_9: %.4f\n', M_9);
fprintf('M_19: %.4f\n', M_19);
