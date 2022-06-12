import 'package:dominos_demo_uygulama/kategoriler.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  Kategoriler k1 = Kategoriler("Kampanya", "kampanya.png");
  Kategoriler k2 = Kategoriler("Pizza", "pizza.png");
  Kategoriler k3 = Kategoriler("İçecekler", "icecekler.png");
  Kategoriler k4 = Kategoriler("Dürümler", "durumler.png");
  Kategoriler k5 = Kategoriler("Ekmek Arası", "ekmekarasi.png");
  Kategoriler k6 = Kategoriler("Tavuklar", "tavuklar.png");

  Future<List<Kategoriler>> verileriGetir() async{

    var kategoriler = <Kategoriler>[];
    kategoriler.add(k1);kategoriler.add(k2);kategoriler.add(k3);kategoriler.add(k4);kategoriler.add(k5);kategoriler.add(k6);

    return kategoriler;

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Kategoriler>>(
        future: verileriGetir(),
        builder: (context, snapshot){
          if(snapshot.hasData){

            var ulkelerListesi = snapshot.data;


            return Center( //return ekle
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: const[
                        DominosPics(),
                        DominosPics(),
                        DominosPics(),
                      ],
                    ),
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(width: 15,),
                      const Text("Dominos\n Ayrıcalıkları",style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center,),
                      Container(width: 20,),
                      const Text("Pizza\n Yolculuğu",style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center,),
                      Container(width: 20,),
                      const Text("Pizza\n Gurmeleri",style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center,),

                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Image.asset("pictures/dominos_kampanya2.jpg",width: 375,),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 15),
                    child: Row(
                      children: [
                        const Text("Her 5 Siparişte 1 Pizza Bedava!",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        Container(width: 100,),
                        const Text("Detaylar",style: TextStyle(color: Color(0xFF7394f4)),),
                        const Icon(Icons.arrow_forward_ios_outlined,color: Color(0xFF7394f4),),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      width: 325,height: 50, decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2.0),
                      borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),
                    ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("pictures/ye_kazan_resim.jpg"),
                          Image.asset("pictures/ye_kazan_resim.jpg"),
                          Image.asset("pictures/ye_kazan_resim.jpg"),
                          Image.asset("pictures/ye_kazan_resim.jpg"),
                          Image.asset("pictures/ye_kazan_resim.jpg"),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16,top: 8),
                    child: SizedBox(height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: ulkelerListesi!.length, //! gerekir nullable olaydan dolayı
                          itemBuilder: (context,indeks){
                            return GestureDetector(
                              onTap: (){

                              },
                              child: Card(
                                color: const Color(0xFF20242d),
                                child: Container(decoration:  BoxDecoration(
                                  border: Border.all(color: Colors.black45, width: 2.0),
                                  borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),
                                ),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 6.0),
                                        child: Image.asset("kategoriler_pictures/${ulkelerListesi[indeks].kategori_resim_ad}",height: 50,width: 50,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 5),
                                        child: Text(ulkelerListesi[indeks].kategori_ad,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );

                          }
                      ),
                    ),
                  ),
                ],
              ),

            );
          }
          else{
            return const Center();
          }
        }

    );
  }
}

class DominosPics extends StatelessWidget { //Hikaye kısmındaki görsel nesneleri bu widget'tan türettik!
  const DominosPics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue,width: 2),shape: BoxShape.circle
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image.asset("pictures/pizza_icon.png"),
        ),
      ),
    );
  }
}