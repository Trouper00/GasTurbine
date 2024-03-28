function [pi_tH,tau_tH,T_t4_5,MFP_4]=TURBC(Tt4,f,A4overA45,M_4,M_4_5,eta_tH,T_t4_5i,T_t3,beta,epsilon1,epsilon2)
   [cp_t4, R_t4, gama_t4 , a_t4,h_t4,Pr_t4] = FAIR_1(Tt4, f);
   [T4_total_over_T4, P4_total_over_P4, MFP_4] = MASSFP(Tt4, f, M_4);
   [cp_t3, R_t3, gama_t3 , a_t3,h_t3,Pr_t3] = FAIR_1(T_t3, 0);
   mdotf=f*(1-beta-epsilon1-epsilon2);
   mdot4=(1+f)*(1-beta-epsilon1-epsilon2);
   mdot4_1=(1+f)*(1-beta-epsilon1-epsilon2)+epsilon1;
   mdot4_5=(1+f)*(1-beta-epsilon1-epsilon2)+epsilon1+epsilon2;
   f_4_1=mdotf/(mdot4_1-mdotf);
   f_4_5=mdotf/(mdot4_5-mdotf);
   h_t4_1=(mdot4*h_t4+epsilon1*h_t3)/(mdot4+epsilon1);
   [cp_t4_1, R_t4_1, gama_t4_1 , a_t4_1,T_t4_1,Pr_t4_1] = FAIR_2(f_4_1, h_t4_1);
   T_t4_5=T_t4_5i;
   %iteration=1;
   while true
    [T4_5_total_over_T4_5, P4_5_total_over_P4_5, MFP_4_5] = MASSFP(T_t4_5, f_4_5, M_4_5);
    pi_tH=(mdot4_5*MFP_4*A4overA45)/(mdot4*MFP_4_5)*sqrt(T_t4_5/Tt4);
    [cp_t4_5, R_t4_5, gama_t4_5 , a_t4_5,h_t4_5,Pr_t4_5] = FAIR_1(T_t4_5, f_4_5);
    Pr_t4_4i=pi_tH*Pr_t4_1;
    [cp_t4_4i, R_t4_4i, gama_t4_4i , a_t4_4i,T_t4_4i,h_t4_4i] = FAIR_3(f_4_1, Pr_t4_4i);
    h_t4_4=h_t4_1-eta_tH*(h_t4_1-h_t4_4i);
    tau_tH=h_t4_4/h_t4_1;
    h_t4_5=(mdot4_1*h_t4_4+epsilon2*h_t3)/(mdot4_1+epsilon2);
    [cp_t4_5, R_t4_5, gama_t4_5 , a_t4_5,T_t4_5n,Pr_t4_5] = FAIR_2(f_4_5, h_t4_5);
    if abs(T_t4_5-T_t4_5n)>0.01
       T_t4_5=T_t4_5n;
       continue;
       %iteration=iteration+1;%olmasa da olur.   
   else
       break;
   end
   end
end
