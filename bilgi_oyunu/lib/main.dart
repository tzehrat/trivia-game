import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:bilgi_oyunu/soruList.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];

  SoruList list1 = SoruList();
  void butonFonksiyonu(bool secilenButon) {
    if (list1.TestBittiMi() == true) {
      //aletrdiolog göster

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("testibititrdin!!"),
            // content: new Text("You are awesome!"),
            actions: <Widget>[
              new ElevatedButton(
                child: new Text("başa dön"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    list1.TestiSifirla();

                    secimler = [];
                  });
                },
              ),
            ],
          );
        },
      );
      //son sorunun ikonunu göstermyior

      //indexleri sıfırla
      //secimleri sıfırla

    } else {
      setState(() {
        list1.getSoruYaniti() == secilenButon
            ? secimler.add(kDogruIcon)
            : secimler.add(kYanlisIcon);
        list1.sonrakiSoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                list1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 16,
          spacing: 13,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(12),
                              textStyle: TextStyle(color: Colors.white60),
                              backgroundColor: Colors.red),
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            butonFonksiyonu(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(12),
                              textStyle: TextStyle(color: Colors.white60),
                              backgroundColor: Colors.green),
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            butonFonksiyonu(true);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}

const Icon kDogruIcon = Icon(Icons.mood, color: Colors.green);
const Icon kYanlisIcon = Icon(Icons.mood, color: Colors.red);
