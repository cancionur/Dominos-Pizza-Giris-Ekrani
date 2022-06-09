import 'package:dominos_demo_uygulama/ListViewPages/gel_al_dort_kisilik.dart';
import 'package:dominos_demo_uygulama/ListViewPages/gel_al_haftanin_kampanyalari.dart';
import 'package:dominos_demo_uygulama/ListViewPages/gel_al_iki_kisilik.dart';
import 'package:dominos_demo_uygulama/ListViewPages/gel_al_tek_kisilik.dart';
import 'package:dominos_demo_uygulama/ListViewPages/haftanin_kampanyalari.dart';
import 'package:dominos_demo_uygulama/ListViewPages/onerilenler.dart';
import 'package:dominos_demo_uygulama/profile_view.dart';
import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: const Color(0xFF20242d),
        appBar: AppBar(
          leading:Padding(
            padding: const EdgeInsets.only(left: 8,top: 8,bottom: 8),
            child: Image.asset("pictures/pizza_icon.png"),
          ),

          actions: [
            Image.asset("pictures/ev_resim_ikon.png"),
            IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down)),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text("Isparta"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Image.asset("pictures/kalem_ikon.png"),
            ),
            SizedBox(width: 20, child: Container()),
            SizedBox(width: 40,child: Image.asset("pictures/zil_ikon.png")),
            SizedBox(width: 40, child: Container()),
            SizedBox(width: 40, child: Image.asset("pictures/alisveris_ikon.png")),
            Icon(Icons.dehaze, color: Colors.blue),
            SizedBox(width: 10, child: Container()),

          ],
          backgroundColor: const Color(0xFF1b1b1b),
        ),

        body: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, isScrolled){
            return[
              SliverAppBar(
                backgroundColor: const Color(0xFF20242d),
                collapsedHeight: 500,
                expandedHeight: 250,
                flexibleSpace: ProfileView(),
              ),
              SliverPersistentHeader(
                  delegate: MyDelatege(
                    TabBar(
                      isScrollable: true,
                      tabs: [
                        SizedBox(width: 100,child: Tab(text: "Önerilenler",)),
                        SizedBox(width: 100,child: Tab(text: "Gel Al Haftanın\n Kampanyaları",)),
                        Tab(text: "Gel Al Tek Kişilik",),
                        Tab(text: "Gel Al 2-3 Kişilik",),
                        SizedBox(width: 100,child: Tab(text: "Gel Al 4 Kişi ve\n        Üzeri",)),
                        SizedBox(width: 100,child: Tab(text: "     Haftanın\n Kampanyaları",)),
                      ],
                    ),
                  ),
                floating: true,
                pinned: false,
              )
            ];
          }, body: TabBarView(children:[
            Onerilenler(),
            GelAlHaftaninKampanyalari(),
            GelAlTekKisilik(),
            GelAlIkiKisilik(),
            GelAlDortKisilik(),
            HaftaninKampanyalari(),
        ],
        ),
        ),

      ),
    );
  }
}

class MyDelatege extends SliverPersistentHeaderDelegate{

  MyDelatege(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return tabBar;
  }

  @override

  double get maxExtent => tabBar.preferredSize.height;

  @override

  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

}
