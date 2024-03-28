% Gerekli girdileri tanımla
M_0 = 0.8;
T_0 = 216.823;
P_0 = 188.227; 
beta = 0.01; %bleed air fraction
C_TOL = 0.01; %CTO low
C_TOH = 0.0;  %CTO high
h_PR = 41868; % fuel heating value(kj/kg)
epsilon1 = 0.02; % % coolant mixer air fraction
epsilon2 = 0.02; % % coolant mixer air fraction
pi_b = 0.97; %combustor pressure ratio
pi_dmax = 0.97; %diffuser max pressure ratio
pi_n = 0.98; %nozzle pressure ratio
pi_nf = 0.98; %fan nozzle pressure ratio
e_f = 0.89;  %fan polytropic eff
e_cL = 0.89; %low pressure comp polytropic ef
e_cH = 0.9;  %high pressure comp polytropic eff
e_tH = 0.89; %high pressure turbine polytropic eff
e_tL = 0.91; %low pressure turbine polytropic eff
eta_b = 0.98; %combustor efficiency
eta_mL = 0.99;%lp spool mech eff
eta_mH = 0.98; %hp spool mech effic
eta_mPL = 0.98; %lp spool power takeoff mech eff
eta_mPH = 0.98; %hp spool power takeoff mech eff
pi_f = 3.5; %fan pressure ratio
pi_cL = 3.5; %lpc pressure ratio
pi_cH = 4.571; %hpc pressure ratio
alfa = 3.5; %bypass ratio
Tt4 = 1779; %hp turbine inlet temp(K)

% Fonksiyonu çağır ve çıktıları al
[Fovermdot, S, f0, eta_P, eta_TH, rateofV9toa0, rateofV19toa0, Pt9overP9, Pt19overP19, P19overP0, P9overP0, T9overT0, T19overT0, pi_tH, pi_tL, tau_f, tau_cL, tau_cH, tau_tH, tau_tL, tau_lambda, f, eta_f, eta_cL, eta_cH, eta_tH, eta_tL, M_9, M_19] = highbypass(M_0, T_0, P_0, beta, C_TOL, C_TOH, h_PR, epsilon1, epsilon2, pi_b, pi_dmax, pi_n, pi_nf, e_f, e_cL, e_cH, e_tH, e_tL, eta_b, eta_mL, eta_mH, eta_mPL, eta_mPH, pi_f, pi_cL, pi_cH, alfa, Tt4);

% Sonuçları yazdır
fprintf('Specific Thrust (F/m_dot0): %.4f N/(kg/s)\n', Fovermdot);
fprintf('Specific Fuel Consumption (S): %.4f (kg/hr)/N \n', S);
fprintf('Air-fuel ratio (f0): %.4f\n', f0);
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
fprintf('f: %.4f\n', f);
fprintf('Eta_f: %.4f\n', eta_f);
fprintf('Eta_cL: %.4f\n', eta_cL);
fprintf('Eta_cH: %.4f\n', eta_cH);
fprintf('Eta_tH: %.4f\n', eta_tH);
fprintf('Eta_tL: %.4f\n', eta_tL);
fprintf('M_9: %.4f\n', M_9);
fprintf('M_19: %.4f\n', M_19);
