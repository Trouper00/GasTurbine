# High bypass GasTurbine Off design calculation
![image](https://github.com/Trouper00/GasTurbine/assets/165286766/c5c98c64-5e8f-4cb0-9d23-89c70a5b1022)

![image](https://github.com/Trouper00/GasTurbine/assets/165286766/4c748879-b811-4260-8de1-e48790c64070)


Bu MATLAB fonksiyonlar grubu high bypass gaz türbinlerinin off-design koşulları için geliştirilmiştir. Kodların büyük kısmı ve yukarıdaki iki ekran görüntüsü Jack D. Mattingly'nin Aircraft Engine Design 2nd Edition kitabından alınmıştır. Ayrıyeten Selçuk Can Uysal'ın HIGH BY-PASS RATIO TURBOFAN ENGINES AEROTHERMODYNAMIC 
DESIGN AND OPTIMIZATION tezinden de oldukça fazla kez yararlanılmıştır.

-> FAIR_1, girilen T ve f değerlerine göre hava-yakıt karışımının  cp, R, gama , a,h,Pr değerlerini buldurur.

-> FAIR_2, girilen f ve h değerlerine göre hava-yakıt karışımının cp, R, gama, a, T,Pr değerlerini buldurur.

-> FAIR_3, girilen f ve Pr değerlerine göre hava-yakıt karışımının cp, R, gama, a, T,h değerlerini buldurur.

-> Burada eğer f(fuel-to air ratio) sıfırdan farklıysa f oranına bağlı cp, R, gama değerleri değişecektir onun için de ![image](https://github.com/Trouper00/GasTurbine/assets/165286766/0c944b2f-c70e-49cd-bf4d-2bd7e222d7f1) denklemleri kullanılacaktır. Bu denklemler Guha Abhijit (2001), “An Efficient Generic Method for Calculating the 
Properties of Combustion Products”, IMechE, Proc. Inst. of Mechanical 
Engineers, Vol. 215, Part A, pp.375-387'den alınmıştır ve denklemlerdeki sabitler kerosene yakıtı içindir.

-> find_cp,find_cv,find_gama fonksiyonları girilen sıcaklık değerlerine göre bu değerleri buldurur.

-> interpolate_Pr,interpolate_h  interpolate_Th, interpolate_Tpr fonksiyonları verilen girdilere göre interpolasyonla değerleri buldurur. Buradaki f ve T sayılarına göre entalpi(h) ve kısmi basınç(Pr) değerleri Jack D. Mattingly'nin Elements of Propulsion: Gas Turbines and Rockets kitabındaki veriler tek tek yazılarak oluşturulmuştur.

-> Buradaki diğer fonksiyonlar Jack D. Mattingly'nin Aircraft Engine Design 2nd Edition kitabına göre yazılmıştır. 
