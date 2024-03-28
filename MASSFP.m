function [T_total_over_T, P_total_over_P, MFP] = MASSFP(T_total, f, M)
    [cp_total, R_total, gama_total , a_total,h_total,Pr_total] = FAIR_1(T_total, f);
    g = 9.81; % Yerçekimi ivmesi
    % İlk hız tahmini
    V = (M * a_total) / (1 + ((gama_total - 1) / 2) * M * M);
    while true
        h = h_total - V^2 / 2000; 
        [cp, R, gama, a, T, Pr] = FAIR_2(f, h); % Yeni değerlerin hesaplanması
        V_n = M * a; % Yeni hız hesabı

        if V ~= 0
            V_error = (V - V_n) / V;
        else
            V_error = V - V_n;
        end

        if abs(V_error) < 0.00001 % Hata toleransının kontrolü
            T_total_over_T = T_total / T; % T_oranının hesaplanması
            P_total_over_P = Pr_total / Pr; % P_oranının hesaplanması
          
            MFP = M * sqrt(gama * 1 * T_total / (T * R))/P_total_over_P; % MFP'nin hesaplanması
            % Çıktıların yazdırılması
            %disp(['T_total_over_T: ', num2str(T_total_over_T)]);
            %disp(['P_total_over_P: ', num2str(P_total_over_P)]);
            %disp(['MFP: ', num2str(MFP)]);
            break; % Döngüden çıkış
        end

        V = V_n; % Yeni hızın atanması
    end
end
