import 'package:dominos_demo_uygulama/menu_secenegi.dart';
import 'package:flutter/material.dart';

class Onerilenler extends StatefulWidget {
  const Onerilenler({Key? key}) : super(key: key);

  @override
  State<Onerilenler> createState() => _OnerilenlerState();
}

class _OnerilenlerState extends State<Onerilenler> {

  var m1 = MenuSecenegi("2ortaboybolmalzemos.jpg", "2 Orta Boy Bol Malzemos", "95.98");
  var m2 = MenuSecenegi("3al1ode.jpg", "3 Al 1 Öde", "129.99");
  var m3 = MenuSecenegi("buyukbolmalzemos.jpg", "Büyük Boy Bol Malzemos", "74.99");
  var m4 = MenuSecenegi("gelal2ortaboybolmalzemos.jpg", "Gel Al - 2 Orta Boy Bol \nMalzemos", "79.99");
  var m5 = MenuSecenegi("gelalortaboycazippizza.jpg", "Gel Al - Orta Boy Cazip Pizza", "34.99");
  var m6 = MenuSecenegi("tekkisilikpizzalar.jpg", "Tek Kişilik Pizzalar", "44.99");
  var m7 = MenuSecenegi("cocacolamenu.jpg", "Coca-Cola Mucize Menü - 2\nBüyük Boy Menü", "129.99");
  var m8 = MenuSecenegi("gelalbuyukboybolmalzemos.jpg", "Gel Al - Büyük Boy Bol \nMalzemos", "64.99");


  Future<List<MenuSecenegi>> verileriGetir() async{

    var Menuler = <MenuSecenegi>[];
    Menuler.add(m1);Menuler.add(m2);Menuler.add(m3);Menuler.add(m4);
    Menuler.add(m5);Menuler.add(m6);Menuler.add(m7);Menuler.add(m8);

    return Menuler;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<MenuSecenegi>> (
        future: verileriGetir(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          var menulerListesi = snapshot.data;

          return ListView.builder(

              itemCount: menulerListesi!.length,
              itemBuilder: (context,indeks){
                return Container(color: Color(0xFF20242d),
                  child: Card(
                    child: SizedBox(height: 137,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(color: Color(0xFF20242d),
                          child: Row(
                            children: [
                              Container(
                                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Image.asset("onerilenler_pictures/${menulerListesi[indeks].menu_resim_ad}",width: 100,height: 100,),
                                    ),
                                  ],
                                ),
                              ),

                              Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Text("${menulerListesi[indeks].menu_ad}",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey,fontSize: 18),),
                                      )
                                    ],

                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text("${menulerListesi[indeks].menu_fiyat} TL",style: TextStyle(color: Color(0xFFcc8f15),fontWeight: FontWeight.bold,fontSize: 20),),
                                          Text("'den başlayan\n fiyatlarla",style: TextStyle(color:Color(0xFFcc8f15), ),)
                                        ],
                                      ),

                                      Container(width: 80,),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 16.0),
                                        child: Container(width: 75,height: 30,
                                          decoration:  BoxDecoration(
                                              border: Border.all(color: Color(0xFF7393F6), width: 2.0),
                                              borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),),
                                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("Sipariş ver",style: TextStyle(color: Color(0xFF7393F6)),),
                                              ],
                                            )),
                                      )
                                    ],
                                  ),
                                ],

                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
    }

          );
        }
        else {
          return Center();
        }
      }
      ),
    );
  }
}
