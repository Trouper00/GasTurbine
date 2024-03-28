function [Fovermdot, S, f0, eta_P, eta_TH, rateofV9toa0, rateofV19toa0, Pt9overP9, Pt19overP19, P19overP0, P9overP0, T9overT0, T19overT0, pi_tH, pi_tL, tau_f, tau_cL, tau_cH, tau_tH, tau_tL, tau_lambda, f, eta_f, eta_cL, eta_cH, eta_tH, eta_tL, M_9, M_19] = highbypass(M_0, T_0, P_0, beta, C_TOL, C_TOH, h_PR, epsilon1, epsilon2, pi_b, pi_dmax, pi_n, pi_nf, e_f, e_cL, e_cH, e_tH, e_tL, eta_b, eta_mL, eta_mH, eta_mPL, eta_mPH, pi_f, pi_cL, pi_cH, alfa, Tt4)
    % Constants
    g = 9.81;
    f = 0;
    [cp_0, R_0, gama_0 , a_0, h_0, Pr_0] = FAIR_1(T_0, f);
    V_0 = M_0 * a_0; %m/s
    ht0 = h_0 + (V_0 * V_0) / 2000;
    [cp_total0, R_total0, gama_total0 , a_total0, T_total0, Pr_total0] = FAIR_2(f, ht0);
    tau_r = ht0 / h_0;
    pi_r = Pr_total0 / Pr_0;
    if M_0 <= 1
        eta_r = 1;
    elseif M_0 > 1 && M_0 < 5
        eta_r = 1 - 0.075 * (M_0 - 1)^(1.35);
    end

                         %diffuser
    f=0;
    pi_d=pi_dmax*eta_r;
    h_t2=ht0;
    Pr_t2=Pr_total0;
                     %fan exit
    Pr_t13=Pr_t2*(pi_f)^(1/e_f);
    [cp_t13, R_t13, gama_t13 , a_t13,T_t13,h_t13] = FAIR_3(f, Pr_t13);
    tau_f=h_t13/h_t2;
    Pr_t13i=Pr_t2*pi_f;
    [cp_t13i, R_t13i, gama_t13i, a_t13i,T_t13i,h_t13i] = FAIR_3(f, Pr_t13i);
    eta_f=(h_t13i-h_t2)/(h_t13-h_t2);


                %low pressure compressor
    Pr_t2_5=Pr_t2*(pi_cL^(1/e_cL));
    [cp_t2_5, R_t2_5, gama_t2_5, a_t2_5,T_t2_5,h_t2_5] = FAIR_3(f, Pr_t2_5);
    tau_cL=h_t2_5/h_t2;
    Pr_t2_5i=Pr_t2*pi_cL;
    [cp_t2_5i, R_t2_5i, gama_t2_5i, a_t2_5i,T_t2_5i,h_t2_5i] = FAIR_3(f, Pr_t2_5i);
    eta_cL=(h_t2_5i-h_t2)/(h_t2_5-h_t2);

             %high pressure compressor
    Pr_t3=Pr_t2_5*(pi_cH^(1/e_cH));
    [cp_t3, R_t3, gama_t3, a_t3,T_t3,h_t3] = FAIR_3(f, Pr_t3);
    tau_cH=h_t3/h_t2_5;
    Pr_t3i=Pr_t2_5*pi_cH;
    [cp_t3i, R_t3i, gama_t3i, a_t3i,T_t3i,h_t3i] = FAIR_3(f, Pr_t3i);
    eta_cH=(h_t3i-h_t2_5)/(h_t3-h_t2_5);
              %burner
    f4i=0.1;
    [cp_t4, R_t4, gama_t4 , a_t4,h_t4,Pr_t4] = FAIR_1(Tt4, f4i);
    f = (h_t4 - h_t3) / (eta_b * h_PR - h_t4);
    while abs(f - f4i) > 0.00001
        f4i=f;
        [cp_t4, R_t4, gama_t4 , a_t4,h_t4,Pr_t4] = FAIR_1(Tt4, f4i);
        f = (h_t4 - h_t3) / (eta_b * h_PR - h_t4);
    end
    
    tau_lambda=h_t4/h_0;
                %coolant mixer
    tau_m1=((1-beta-epsilon1-epsilon2)*(1+f)+(epsilon1*tau_r*tau_cL*tau_cH/tau_lambda))/((1-beta-epsilon1-epsilon2)*(1+f)+epsilon1);

                % before high pressure turbine
    tau_tH = 1 - (tau_r * tau_cL * (tau_cH - 1) + (1 + alfa) * C_TOH / eta_mPH) / (eta_mH * tau_lambda * ((1 - beta - epsilon1 - epsilon2) * (1 + f) + (epsilon1 * tau_r * tau_cL * tau_cH / tau_lambda)));
    h_t4_1=h_t4*tau_m1;
    f_4_1=f/(1+f+epsilon1/(1-beta-epsilon1-epsilon1));
    [cp_t4_1, R_t4_1, gama_t4_1 , a_t4_1,T_t4_1,Pr_t4_1] = FAIR_2(f_4_1, h_t4_1);

                %high pressure turbine
    h_t4_4=h_t4_1*tau_tH;
    [cp_t4_4, R_t4_4, gama_t4_4 , a_t4_4,T_t4_4,Pr_t4_4] = FAIR_2(f_4_1, h_t4_4);
    pi_tH=(Pr_t4_4 / Pr_t4_1)^(1/e_tH);
    Pr_t4_4i=pi_tH*Pr_t4_1;
    [cp_t4_4i, R_t4_4i, gama_t4_4i , a_t4_4i,T_t4_4i,h_t4_4i] = FAIR_3(f_4_1, Pr_t4_4i);
    eta_tH=(h_t4_1-h_t4_4)/(h_t4_1-h_t4_4i);

                %coolant mixer
    tau_m2=((1-beta-epsilon1-epsilon2)*(1+f)+epsilon1+(epsilon2*tau_r*tau_cL*tau_cH/(tau_lambda*tau_m1*tau_tH)))/((1-beta-epsilon1-epsilon2)*(1+f)+epsilon1+epsilon2);
    h_t4_5=h_t4_4*tau_m2;
    f_4_5=f/(1+f+(epsilon1+epsilon2)/(1-beta-epsilon1-epsilon1));
    [cp_t4_5, R_t4_5, gama_t4_5 , a_t4_5,T_t4_5,Pr_t4_5] = FAIR_2(f_4_5, h_t4_5);

                %low pressure turbine
    tau_tL = 1 - (tau_r *( (tau_cL - 1) + alfa * (tau_f - 1)) + (1 + alfa) * C_TOL / eta_mPL) / (eta_mH * (tau_lambda * tau_tH) * ((1 - beta - epsilon1 - epsilon2) * (1 + f) + (epsilon1 + epsilon2 / tau_tH) * tau_r * tau_cL * tau_cH / tau_lambda));
    h_t5=h_t4_5*tau_tL;
    [cp_t5, R_t5, gama_t5 , a_t5,T_t5,Pr_t5] = FAIR_2(f_4_5, h_t5);
    pi_tL=(Pr_t5/Pr_t4_5)^(1/e_tL);
    Pr_t5i=pi_tL*Pr_t4_5;
    [cp_t5i, R_t5i, gama_t5i , a_t5i,T_t5i,h_t5i] = FAIR_3(f_4_5, Pr_t5i);
    eta_tL=(h_t4_5-h_t5)/(h_t4_5-h_t5i);
    ht_9=h_t5;
    T_t9=T_t5;
    Pr_t9=Pr_t5;
    f_9=f_4_5;
    M_9=1;
    [M_9, Tt9overT9, Pt9overP9, MFP_9] = RGCOMPR(1, T_t9, f_9, M_9);
    Pt9overP0=pi_r*pi_d*pi_cL*pi_cH*pi_b*pi_tH*pi_tL*pi_n;
    if Pt9overP0 >= Pt9overP9
        T_9=T_t9/Tt9overT9;
        [cp_9, R_9, gama_9 , a_9,h_9,Pr_9] = FAIR_1(T_9, f_9);
        P0overP9=Pt9overP9/Pt9overP0;
    else
        Pr_9=Pr_t9/Pt9overP0;
        [cp_9, R_9, gama_9 , a_9,T_9,h_9] = FAIR_3(f_9, Pr_9);
        P0overP9=1;
    end
    V_9=sqrt(2000*(ht_9-h_9));
    rateofV9toa0=V_9/a_0;
    M_9=V_9/a_9;
    h_t19=h_t13;
    T_t19=T_t13;
    Pr_t19=Pr_t13;
    f_19=0;
    M_19=1;
    [M_19, Tt19overT19, Pt19overP19, MFP_19] = RGCOMPR(1, T_t19, f_19, M_19);
    Pt19overP0=pi_r*pi_d*pi_f*pi_nf;
    if Pt19overP0 >= Pt9overP9
        T_19=T_t19/Tt19overT19;
        [cp_19, R_19, gama_19 , a_19,h_19,Pr_19] = FAIR_1(T_19, f_19);
        P0overP9=Pt9overP9/Pt9overP0;
    else
        Pr_19=Pr_t19/(P_t19/P0);
        [cp_19, R_19, gama_19 , a_19,T_19,h_19] = FAIR_3(f_19, Pr_19);
        P0overP9=1;
    end
    P0overP19=Pt19overP19/Pt19overP0;
    P19overP0=Pt19overP0/Pt19overP19;
    P9overP0=1/P0overP9;
    T9overT0=T_9/T_0;
    T19overT0=T_19/T_0;
    V_19=sqrt(2000*(h_t19-h_19));
    rateofV19toa0=V_19/a_0;
    M_19=V_19/a_19;
    f0=f*(1-beta-epsilon1-epsilon2)/(1+alfa);
    %Fovermdot=(1+f0-beta/(1+alfa))*V_9/a_0-M_0+(1+f0-beta/(1+alfa))*R_9*T9overT0*(1-P0overP9)/(R_0*rateofV9toa0*gama_0);
    Fovermdot=a_0/(1*(1+alfa))*((1+f0*(1+alfa)-beta)*(V_9/a_0)+alfa*V_19/a_0-(1+alfa)*M_0+(1+f0*(1+alfa)-beta)*R_9*T_9/(R_0*T_0*(V_9/a_0))*(1-P0overP9)/gama_0+alfa*R_19*T_19/(R_0*T_0*(V_19/a_0))*(1-(P0overP19))/gama_0);
    S=f0/Fovermdot*3600;
    eta_P=(2*g*M_0*(1+alfa)*Fovermdot/a_0)/((1+f0*(1+alfa)-beta)*(V_9/a_0)^2+alfa*(V_19/a_0)^2-(1+alfa)*M_0^2);
    eta_TH = (((1 + f0 * (1 + alfa) - beta) * V_9^2 + alfa * V_19^2)/(1+alfa) - (V_0^2 + (C_TOL + C_TOH) * (h_0*1000))) / (2 * 1 * f0 * (h_PR*1000));


    
end
