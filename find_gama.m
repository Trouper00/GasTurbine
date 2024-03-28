function gama = find_gama(T)
    % Verilen tablo verileri
    T_sicaklik = [0 60 78.79 81.61 100 120 140 160 180 200 220 240 260 273.2 280 288.7 300 320 340 360 380 400 500 600 700 800 900 1100 1500 1900];
    gama_values = [0 1.621 1.839 1.452 1.428 1.415 1.411 1.410 1.407 1.406 1.404 1.404 1.403 1.403 1.402 1.402 1.402 1.400 1.400 1.398 1.397 1.396 1.387 1.375 1.365 1.354 1.344 1.329 1.311 1.301];

    % İnterpolasyon yaparak gama değerini bul
    gama = interp1(T_sicaklik, gama_values, T, 'linear', 'extrap');
end