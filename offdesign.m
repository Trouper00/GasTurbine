function [F,mdot_0,Fovermdot0,percentageNL,percentageNH,pi_c, S, f0, eta_P, alfa, eta_TH, rateofV9toa0, rateofV19toa0, P_total9_over_P9, P_total19_over_P19, P19overP0, P9overP0, T9overT0, T19overT0,pi_f,pi_cL,pi_cH, pi_tH, pi_tL, tau_f, tau_cL, tau_cH, tau_tH, tau_tL, tau_lambda, f,tau_m1,tau_m2, M_9, M_19] = offdesign(M_0, T_0, P_0, beta, P_TOL, P_TOH, epsilon1, epsilon2,h_PR,pi_b, pi_dmax, pi_n, pi_nf, eta_f,eta_cL,eta_cH,eta_tH, eta_tL, eta_b, eta_mL, eta_mH, eta_mPL, eta_mPH,pi_cmax,Tt4,M_0R, T_0R, P_0R, betaR, C_TOLR, C_TOHR, h_PRR, epsilon1R, epsilon2R, pi_bR, pi_dmaxR, pi_nR, pi_nfR, e_fR, e_cLR, e_cHR, e_tHR, e_tLR, eta_bR, eta_mLR, eta_mHR, eta_mPLR, eta_mPHR, pi_fR, pi_cLR, pi_cHR, alfaR, Tt4R,mdot_0R)
 
[FovermdotR, SR,h_0R,f0R, eta_PR, eta_THR, rateofV9toa0R, rateofV19toa0R, Pt9overP9R, Pt19overP19R, P19overP0R, P9overP0R, T9overT0R, T19overT0R, pi_tHR, pi_tLR, tau_fR, tau_rR,tau_cLR, tau_cHR, tau_tHR, tau_tLR, tau_lambdaR, tau_m1R,tau_m2R,fR, eta_fR, eta_cLR, eta_cHR, eta_tHR, eta_tLR, M_9R, M_19R,A_4,A_4_5,A_9,A_19,pi_rR,pi_dR,pi_cLR,pi_cHR,MFP_4R] = highbypass2(M_0R, T_0R, P_0R, betaR, C_TOLR, C_TOHR, h_PRR, epsilon1R, epsilon2R, pi_bR, pi_dmaxR, pi_nR, pi_nfR, e_fR, e_cLR, e_cHR, e_tHR, e_tLR, eta_bR, eta_mLR, eta_mHR, eta_mPLR, eta_mPHR, pi_fR, pi_cLR, pi_cHR, alfaR, Tt4R,mdot_0R);
    
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
                % Setting reference values(on design inputs/outputs)
    pi_tH=pi_tHR;%on design output
    pi_tL=pi_tLR;%on design output
    tau_tH=tau_tHR;%on design output
    tau_tL=tau_tLR;%on design output
    pi_f=pi_fR;% on design input
    pi_cL=pi_cLR;% on design input
    pi_cH=pi_cHR;% on design input
    tau_f=tau_fR;%on design output
    tau_cL=tau_cLR;%on design output
    tau_cH=tau_cHR;%on design output
    tau_m1=tau_m1R;%on design output
    tau_m2=tau_m2R;%on design output
    alfa=alfaR;% on design input
    mdot_0=mdot_0R;%on design output
    f=fR;%on design output
    M_9=M_9R;%on design output
    M_19=M_19R;%on design output
    M_4=1;
    M_4_5=1;
   %   CALCULATIONS
    [cp_t4, R_t4, gama_t4 , a_t4,h_t4,Pr_t4] = FAIR_1(Tt4, f);
    h_t4_5=h_t4*tau_m1*tau_tH*tau_m2;
    f_4_5=f*(1-beta-epsilon1-epsilon2)/(1-beta);
    [cp_t4_5, R_t4_5, gama_t4_5 , a_t4_5,T_t4_5i,Pr_t4_5] = FAIR_2(f_4_5, h_t4_5);
    h_t5=h_t4_5*tau_tL;
    [cp_t5, R_t5, gama_t5 , a_t5,T_t5i,Pr_t5] = FAIR_2(f_4_5, h_t5);
            % Başlangıç değerleri
 mdoterror_tol = 0.001;
 alfa_tol = 0.001;
 iterasyon_devam_ediyor_outer = true;
  while iterasyon_devam_ediyor_outer
      iterasyon_devam_ediyor=true;
   while iterasyon_devam_ediyor
    h_t3=ht0*tau_cL*tau_cH;
    [cp_t3, R_t3, gama_t3 , a_t3,T_t3,Pr_t3] = FAIR_2(0, h_t3);
    [cp_t4, R_t4, gama_t4 , a_t4,h_t4,Pr_t4] = FAIR_1(Tt4, f);
    f_4_5=f*(1-beta-epsilon1-epsilon2)/(1-beta);
    [pi_tH,tau_tH,T_t4_5,MFP_4]=TURBC(Tt4,f,(A_4/A_4_5),M_4,M_4_5,eta_tH,T_t4_5i,T_t3,beta,epsilon1,epsilon2);
    [pi_tL,tau_tL,T_t5]=TURB(T_t4_5,f_4_5,(A_4_5/A_9*pi_n),M_4_5,M_9,eta_tL,T_t5i);
    tau_lambda=h_t4/h_0;
    tau_f=1+((1-tau_tL)*eta_mL*((1-beta-epsilon1-epsilon2)*(1+f)*tau_lambda*tau_tH/tau_r+(epsilon1*tau_tH+epsilon2)*tau_cL*tau_cH)-(1+alfa)*P_TOL/(tau_r*eta_mPL*mdot_0*(h_0*1000)))/((tau_cLR-1)/(tau_fR-1)+alfa);
    tau_cL=1+(tau_f-1)*(tau_cLR-1)/(tau_fR-1);
    tau_cH=1+(1-tau_tH)*eta_mH*((1-beta-epsilon1-epsilon2)*(1+f)*tau_lambda/(tau_r*tau_cL)+epsilon1*tau_cH)-(1+alfa)*P_TOH/(tau_r*tau_cL*eta_mPH*mdot_0*(h_0*1000));
    h_t2=ht0;
    Pr_t2=Pr_total0;
    h_t13=h_t2*tau_f;
    h_t2_5=h_t2*tau_cL;
    h_t3=h_t2_5*tau_cH;
    h_t13i=h_t2*(1+eta_f*(tau_f-1));
    h_t2_5i=h_t2*(1+eta_cL*(tau_cL-1));
    h_t3i=h_t2_5*(1+eta_cH*(tau_cH-1));
    [cp_t13, R_t13, gama_t13 , a_t13,T_t13,Pr_t13] = FAIR_2(0, h_t13);
    [cp_t13i, R_t13i, gama_t13i , a_t13i,T_t13i,Pr_t13i] = FAIR_2(0, h_t13i);
    [cp_t2_5, R_t2_5, gama_t2_5 , a_t2_5,T_t2_5,Pr_t2_5] = FAIR_2(0, h_t2_5);
    [cp_t2_5i, R_t2_5i, gama_t2_5i, a_t2_5i,T_t2_5i,Pr_t2_5i] = FAIR_2(0, h_t2_5i);
    [cp_t3, R_t3, gama_t3, a_t3,T_t3,Pr_t3] = FAIR_2(0, h_t3);
    [cp_t3i, R_t3i, gama_t3i, a_t3i,T_t3i,Pr_t3i] = FAIR_2(0, h_t3i);
    pi_f=Pr_t13i/Pr_t2;
    pi_cL=Pr_t2_5i/Pr_t2;
    pi_cH=Pr_t3i/Pr_t2_5;
    pi_c=pi_cL*pi_cH;
    tau_c=tau_cL*tau_cH;
    ftemp = f;
    while true
        [cp_t4, R_t4, gama_t4, a_t4, h_t4, Pr_t4] = FAIR_1(Tt4, f);
        f_new = (h_t4 - h_t3) / (h_PR * eta_b - h_t4);
        if abs(f_new - ftemp) <= 0.00001
            break; % Tolerans sağlandığında döngüden çık
        end
        f = f_new; % Yeni f değerini güncelle
        ftemp = f_new; % ftemp'i güncelle
    end
    Pt19overP0=pi_r*pi_d*pi_f*pi_nf;
    [M_19, T_total19_over_T0, P_total19_over_P0, MFP_19] = RGCOMPR(3, T_t13, 0, Pt19overP0);
    if M_19>1
        M_19=1;
        [M_19, T_total19_over_T19, P_total19_over_P19, MFP_19] = RGCOMPR(1, T_t13, 0, M_19);
        P0overP19=P_total19_over_P19/P_total19_over_P0;
        T_19=T_t13/T_total19_over_T19;
    else
        P0overP19=1;
        P_total19_over_P19=P_total19_over_P0;
        T_19=T_t13/T_total19_over_T0;
    end
    [cp_19, R_19, gama_19, a_19, h_19, Pr_19] = FAIR_1(T_19, 0);
    alfa_new=(1-beta-epsilon1-epsilon2)*(1+f)*pi_f*pi_nf/(pi_cL*pi_cH*pi_b)*sqrt(Tt4/T_t13)*MFP_19*A_19/(A_4*MFP_4);
    alfa_error=(alfa-alfa_new)/alfaR;
    if abs(alfa_error) > alfa_tol
        alfa=alfa_new;
        continue; 
    end
    Pt9overP0=pi_r*pi_d*pi_cL*pi_cH*pi_b*pi_tH*pi_tL*pi_n;
    [M_9, T_total9_over_T0, P_total9_over_P0, MFP_9] = RGCOMPR(3, T_t5, f_4_5, Pt9overP0);
    if M_9>1
      M_9=1;
    [M_9, T_total9_over_T9, P_total9_over_P9, MFP_9] = RGCOMPR(1, T_t5, f_4_5, M_9);
    P0overP9=P_total9_over_P9/P_total9_over_P0;
    T_9=T_t5/T_total9_over_T9;
    else
        P0overP9=1;
        P_total9_over_P9=P_total9_over_P0;
        T_9=T_t5/(T_total9_over_T0);
    end
    [cp_9, R_9, gama_9, a_9,h_9,Pr_9] = FAIR_1(T_9, f_4_5);
    [M_4, T_total4_over_T4, P_total4_over_P4, MFP_4] = RGCOMPR(1, Tt4, f, M_4); 
    mdot_0_new=(P_0*pi_r*pi_d*pi_cL*pi_cH)*(1+alfa)*mdot_0R*sqrt(Tt4R/Tt4)/(P_0R*(1+alfaR)*pi_rR*pi_dR*pi_cLR*pi_cHR);
    mdot_0_error=(mdot_0_new-mdot_0)/mdot_0R;
    if abs(mdot_0_error) > mdoterror_tol
        mdot_0=mdot_0_new;
        continue;
    end
        iterasyon_devam_ediyor = false;  
   end
    if pi_c > pi_cmax || pi_c<0        
        Tt4 = Tt4 - 10; % Tt4 değerini azaltabilirsiniz, burada 10 ile gösterdim

        continue;
    else
        break;
    end
  end
    V_9=M_9*a_9;
    V_19=M_19*a_19;
    f0=f*(1-beta-epsilon1-epsilon2)/(1+alfa);
    Fovermdot0=a_0/(1*(1+alfa))*((1+f0*(1+alfa)-beta)*(V_9/a_0)+alfa*V_19/a_0-(1+alfa)*M_0+(1+f0*(1+alfa)-beta)*R_9*T_9/(R_0*T_0*(V_9/a_0))*(1-P0overP9)/gama_0+alfa*R_19*T_19/(R_0*T_0*(V_19/a_0))*(1-(P0overP19))/gama_0);
    F=mdot_0*(Fovermdot0);
    S=f0/Fovermdot0*3600;
    eta_P=(2*1*M_0*(1+alfa)*Fovermdot0/a_0)/((1+f0*(1+alfa)-beta)*(V_9/a_0)^2+alfa*(V_19/a_0)^2-(1+alfa)*M_0^2);
    eta_TH = ((((1 + f0 * (1 + alfa) - beta) * V_9^2 + alfa * V_19^2)/(1+alfa) - V_0^2) + (C_TOLR + C_TOHR) * (h_0*1000)) / (2 * 1 * f0 * (h_PR*1000));
    [M_0, T_total0_over_T0, P_total0_over_P0, MFP_0] = RGCOMPR(1, T_total0, 0, M_0); 
    percentageNL=100*sqrt((h_0*tau_r*(tau_f-1))/(h_0R*tau_rR*(tau_fR-1)));
    percentageNH=100*sqrt((h_0*tau_r*tau_cL*(tau_cH-1))/(h_0R*tau_rR*tau_cLR*(tau_cHR-1)));
    T19overT0=T_19/T_0;
    T9overT0=T_9/T_0;
    P9overP0=1/P0overP9;
    P19overP0=1/P0overP19;
    rateofV9toa0=V_9/a_0;
    rateofV19toa0=V_19/a_0;
end
