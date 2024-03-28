function [pi_tL,tau_tL,T_t5]=TURB(T_t4_5,f,AioverAe,M_4_5,M_9,eta_tL,T_t5i)
 [cp_t4_5, R_t4_5, gama_t4_5 , a_t4_5,h_t4_5,Pr_t4_5] = FAIR_1(T_t4_5, f);
 [T4_5_total_over_T4_5, P4_5_total_over_P4_5, MFP_4_5] = MASSFP(T_t4_5, f, M_4_5);
 T_t5=T_t5i;
 while true
  [T5_total_over_T5, P5_total_over_P5, MFP_5] = MASSFP(T_t5, f, M_9);
  [cp_t5, R_t5, gama_t5 , a_t5,h_t5,Pr_t5] = FAIR_1(T_t5, f);
  pi_tL=MFP_4_5/MFP_5*AioverAe*sqrt(T_t5/T_t4_5);
  Pr_tei=pi_tL*Pr_t4_5;
  [cp_tei, R_tei, gama_tei , a_tei,T_tei,h_tei] = FAIR_3(f, Pr_tei);
  h_t5=h_t4_5-eta_tL*(h_t4_5-h_tei);
  tau_tL=h_t5/h_t4_5;
  [cp_t5, R_t5, gama_t5 , a_t5,T_t5n,Pr_t5] = FAIR_2(f, h_t5);
  if abs(T_t5-T_t5n)>0.01
     T_t5=T_t5n;
     continue;
  else
      break;
  end
  end


end