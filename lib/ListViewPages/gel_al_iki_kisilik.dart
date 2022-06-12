import 'package:dominos_demo_uygulama/menu_secenegi.dart';
import 'package:flutter/material.dart';

class GelAlIkiKisilik extends StatefulWidget {
  const GelAlIkiKisilik({Key? key}) : super(key: key);

  @override
  State<GelAlIkiKisilik> createState() => _GelAlIkiKisilikState();
}

class _GelAlIkiKisilikState extends State<GelAlIkiKisilik> {

  var m1 = MenuSecenegi("2buyukboy1litre.jpg", "Gel Al - 2 Büyük Boy\n Pizza + Cola 1 Lt", "82.98");
  var m2 = MenuSecenegi("2buyukboy1litre2tavuk.jpg", "Gel Al - 2 Büyük Boy Pizza\n Cola 1 Lt", "137.99");
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

              return Container(color: const Color(0xFF20242d),
                child: ListView.builder(
                  //separatorBuilder: (context,index) => Divider(color: Color(0xFF20242d) ,),

                    itemCount: menulerListesi!.length,
                    itemBuilder: (context,indeks){
                      return Container(color: const Color(0xFF20242d),
                        child: Card(
                          child: Container(color: const Color(0xFF20242d),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16,top: 16),
                                      child: Image.asset("onerilenler_pictures/${menulerListesi[indeks].menu_resim_ad}",width: 100,height: 100,),
                                    ),
                                  ],
                                ),

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10.0),
                                              child: Text(menulerListesi[indeks].menu_ad,style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey,fontSize: 18),),
                                            )
                                          ],

                                        ),
                                        Container(height: 30,),
                                        //Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 8.0),
                                          child: Row(mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text("${menulerListesi[indeks].menu_fiyat} TL",style: const TextStyle(color: Color(0xFFcc8f15),fontWeight: FontWeight.bold,fontSize: 20),),
                                                  const Text("'den başlayan\n fiyatlarla",style: TextStyle(color:Color(0xFFcc8f15), ),)
                                                ],
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 16.0),
                                                child: Container(width: 75,height: 30,
                                                    decoration:  BoxDecoration(
                                                      border: Border.all(color: const Color(0xFF7393F6), width: 2.0),
                                                      borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),),
                                                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                                      children: const[
                                                        Text("Sipariş ver",style: TextStyle(color: Color(0xFF7393F6)),),
                                                      ],
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }

                ),
              );
            }
            else {
              return const Center();
            }
          }
      ),
    );
  }
}
