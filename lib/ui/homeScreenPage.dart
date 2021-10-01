import 'package:daily_vity/appearance/colorLib.dart';
import 'package:daily_vity/ui/aboutScreenPage.dart';
import 'package:daily_vity/ui/dasboardScreenPage.dart';
import 'package:daily_vity/ui/settingScreenPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

import 'catatanScreen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    DasboardScreenPage(),
    CatatanScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String userPicture = 'smile.png';
  String userName = 'dada';
  List<Color> myColor = [ColorLib.dailyVityBlack, ColorLib.dailyVityBlue];

  Future stepReader() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var getPicData = pref.getString('userAvatar');
    var getNameData = pref.getString('userName');
    if (getPicData != null) {
      setState(() {
        userPicture = getPicData;
      });
    }
    if (getNameData != null) {
      setState(() {
        userName = getNameData;
      });
    }
  }

  Future clearShared() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    SystemNavigator.pop();
  }

  @override
  void initState() {
    super.initState();
    stepReader();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorLib.dailyVityBlue,
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Image.asset('assets/$userPicture'),
                      Divider(),
                      Text(
                        '$userName',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: GoogleFonts.fredokaOne(
                            fontSize: 24, color: ColorLib.dailyVityWhite),
                      ),
                    ],
                  ),
                )),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(
                  Icons.home_filled,
                  color: myColor[1],
                ),
                title: Text('Beranda',
                    maxLines: 2,
                    style:
                        GoogleFonts.poppins(fontSize: 16, color: myColor[1])),
              ),
            ),
            Divider(color: Colors.grey,),
            //=======================================
            InkWell(
              onTap: () {
                setState(() {
                                 Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SettingScreenPage()));
                });
              },
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: myColor[1],
                ),
                title: Text('Pengaturan',
                    maxLines: 2,
                    style:
                        GoogleFonts.poppins(fontSize: 16, color: myColor[1])),
              ),
            ),
             Divider(color: Colors.grey,),
//=======================================
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutScreenPage()));
                });
              },
              child: ListTile(
                leading: Icon(
                  Icons.help,
                  color: myColor[1],
                ),
                title: Text('Tentang',
                    maxLines: 2,
                    style:
                        GoogleFonts.poppins(fontSize: 16, color: myColor[1])),
              ),
            ),
             Divider(color: Colors.grey,),
            //=======================================
            InkWell(
              onTap: () async {
              ArtDialogResponse response =  await ArtSweetAlert.show(
                          barrierDismissible: false,
                          context: context,
                          artDialogArgs: ArtDialogArgs(
                            denyButtonText: "Batal",
                            title: "Keluar Aplikasi?",
                            text: "Anda akan keluar daru aplikasi dan akun!",
                            confirmButtonText: "Yakin",
                            type: ArtSweetAlertType.warning
                          )
                        );

                        if(response.isTapConfirmButton) {
                          clearShared();
                          
                        }
                
              },
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: myColor[1],
                ),
                title: Text('Keluar',
                    maxLines: 2,
                    style:
                        GoogleFonts.poppins(fontSize: 16, color: myColor[1])),
              ),
            ),
          ],
        ),
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorLib.dailyVityBlue,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: ColorLib.dailyVityBlack,
                spreadRadius: 0,
                blurRadius: 0.2),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: ColorLib.dailyVityBlue,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books_rounded),
                label: 'Catatan',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: ColorLib.dailyVityWhite,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
