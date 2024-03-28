function [cp_output, R_output, gama_output , a_output,T_output,Pr_output] = FAIR_2(f, h)
    % Fonksiyon çağrıldığında T ve f değerleriyle cp, cv, gama değerlerini hesaplayacak
    T=interpolate_Th(f,h);
    cp = find_cp(T);
    cv = find_cv(T);
    gama = find_gama(T);

    % Diğer gerekli sabit değerler
    R = 0.287; % Sabit gaz sabiti(kJ)
    
    % Sabit değerler
    N = 1.016;
    eta0 = 2.465;
    eta1 = 0.0003129;
    eta2 = 77210;
    
    % R hesabı
    R_output = R * (1 + N * f) / (1 + f);
    
    % cp hesabı
    cp_output = cp * (1 + f * (eta0 + eta1 * T - eta2 / (T * T))) / (1 + f);
    
    % gama hesabı
    if f~=0
      gama_output = cp_output / (cp_output - R_output);
    else
      gama_output=gama;
    end    
    % a hesabı
    a_output = sqrt(gama_output * R_output * T*1000);
   % Pr ve T hesabı
    Pr_output= interpolate_Pr(f,T);
    T_output=T;
end
