import 'package:bilgi_oyunu/soru.dart';
import 'package:bilgi_oyunu/main.dart';
import 'dart:math';

class SoruList {
  int _soruIndex = 0;

  List<Soru> _SoruBankasi = [
    Soru('Zehra Dünyanın en güzel kızıdır.', true),
    Soru('Zehra Dünyanın en kötü insanıdır', false),
    Soru('Zehra Dünyanın en becerikli insanıdır', true),
    Soru('zehra itgalyalıdır', false),
    Soru('Zehra Dünyanın en zeki kızıdır', true),
    Soru('zehra 21 yaşındadır', true),
    Soru('Zehra 1 temmuz doğumludur', false),
    Soru('Zehra Dünyanın en harika insanıdır', true)
  ];

  String getSoruMetni() {
    return _SoruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti() {
    return _SoruBankasi[_soruIndex].soruYaniti;
  }

  //parametre döndürmicek o yuzden void
  void sonrakiSoru() {
    if (_soruIndex < _SoruBankasi.length - 1) {
      _soruIndex++;
    }
  }

  bool TestBittiMi() {
    if (_soruIndex >= _SoruBankasi.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void TestiSifirla() {
    _soruIndex = 0;
  }
}

/* class Rastegelesayi extends SoruList {
  @override
  void sonrakiSoru() {
    for (int i = 0; i < _SoruBankasi.length - 1; i++) {
      _soruIndex = Random().nextInt(_SoruBankasi.length - 1);
    }
  }
}
*/
