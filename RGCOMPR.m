    function [M, T_total_over_T, P_total_over_P, MFP] = RGCOMPR(Item, Tt, f, varargin)
        switch Item
            case 1
                M = varargin{1};
                [T_total_over_T, P_total_over_P, MFP] = MASSFP(Tt, f, M);
                            % Çıktıları ekrana yazdır
                disp('T_total_over_T:');
                disp(T_total_over_T);
                disp('P_total_over_P:');
                disp(P_total_over_P);
                disp('MFP:');
                disp(MFP);
    
            case 2
                Tt_over_T_known = varargin;
                [cp_total, R_total, gama_total, a_total, h_total, Pr_total] = FAIR_1(Tt,f);
                T = Tt / Tt_over_T_known;
                [cp, R, gama , a,h,Pr] = FAIR_1(T,f);
                V2 = 2 * (h_total - h) * 9.81;
                if V2 < 0
                    M = 0;
                    T = Tt;
                else
                    M = sqrt(V2) / a;
                end
                [T_total_over_T, P_total_over_P, MFP] = MASSFP(Tt, f, M);            
                % Çıktıları ekrana yazdır
                disp('T_total_over_T:');
                disp(T_total_over_T);
                disp('P_total_over_P:');
                disp(P_total_over_P);
                disp('MFP:');
                disp(MFP);
            case 3
                Pt_over_P_known = varargin;
                [cp_total, R_total, gama_total, a_total, h_total, Pr_total] = FAIR_1(Tt,f);
                Pr = Pr_total / Pt_over_P_known;
                [cp,R,gama,a,T,h] = FAIR(3, f, Tt, h_total, Pr);
                V2 = 2 * (h_total - h) * 9.81;
                if V2 < 0
                    M = 0;
                    T = Tt;
                else
                    M = sqrt(V2) / a;
                end
                [T_total_over_T, P_total_over_P, MFP] = MASSFP(Tt, f, M);            
                % Çıktıları ekrana yazdır
                disp('T_total_over_T:');
                disp(T_total_over_T);
                disp('P_total_over_P:');
                disp(P_total_over_P);
                disp('MFP:');
                disp(MFP);
        end
    end
