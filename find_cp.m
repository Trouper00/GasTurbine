function cp = find_cp(T)
    % Verilen tablo verileri
    T_sicaklik = [0 60 78.79 81.61 100 120 140 160 180 200 220 240 260 273.2 280 288.7 300 320 340 360 380 400 500 600 700 800 900 1100 1500 1900];
    cp_values = [0 1.901 1.933 1.089 1.040 1.022 1.014 1.011 1.008 1.007 1.006 1.006 1.006 1.006 1.006 1.006 1.006 1.007 1.009 1.010 1.012 1.014 1.030 1.051 1.075 1.099 1.121 1.159 1.210 1.241];

    % İnterpolasyon yaparak cp değerini bul
    cp = interp1(T_sicaklik, cp_values, T, 'linear', 'extrap');
end
