import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/Component/tab_item.dart';
import 'package:quran_app/Pages/Tabs/doa_tab.dart';
import 'package:quran_app/Pages/Tabs/dzikir_tab.dart';
import 'package:quran_app/Pages/Tabs/surah_tab.dart';
import 'package:quran_app/theme.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}

AppBar _appBar() => AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/svg/menu_icon.svg"),
      ),
      title: Text(
        'Quran App',
        style: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w600, color: primary),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svg/search_icon.svg"))
      ],
    );

BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: [
        _bottomNavigationBarItem(
            icon: 'assets/svg/quran_icon.svg', label: 'Quran'),
        _bottomNavigationBarItem(icon: 'assets/svg/doa_icon.svg', label: 'Doa'),
        _bottomNavigationBarItem(
            icon: 'assets/svg/bookmark_icon.svg', label: 'Bookmark'),
      ],
    );

BottomNavigationBarItem _bottomNavigationBarItem(
        {required String icon, required String label}) =>
    BottomNavigationBarItem(
        icon: SvgPicture.asset(icon, color: secondary),
        activeIcon: SvgPicture.asset(icon, color: primary),
        label: label);

DefaultTabController _body() => DefaultTabController(
    length: 3,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          SliverToBoxAdapter(
            child: _salam(),
          ),
          SliverAppBar(
            pinned: true,
            elevation: 0,
            automaticallyImplyLeading: false,
            shape: Border(
                bottom: BorderSide(
              width: 3,
              color: Colors.grey.withOpacity(0.5),
            )),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: TabBar(
                  labelColor: primary,
                  indicatorColor: primary,
                  indicatorWeight: 3,
                  tabs: [
                    itemTab(label: "Surah"),
                    itemTab(label: "Dzikr"),
                    itemTab(label: "Dua")
                  ]),
            ),
          )
        ],
        body: TabBarView(children: [TabSurah(), TabDzikir(), TabDoa()]),
      ),
    ));
Column _salam() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Assalamualaikum",
          style: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.w600, color: secondary),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Dzikra',
          style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 40,
        ),
        Stack(
          children: [
            Container(
              height: 131,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xffdf98fa), Color(0xff9055ff)],
                  )),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset('assets/svg/quran_banner.svg'),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/book.svg'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Last Read",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Al-Fatihah",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    "Ayat No: 1",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
