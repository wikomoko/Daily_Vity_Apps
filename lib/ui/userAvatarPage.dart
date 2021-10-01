import 'package:daily_vity/appearance/colorLib.dart';
import 'package:daily_vity/ui/homeScreenPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferencesPageAvatar extends StatefulWidget {
  const UserPreferencesPageAvatar({Key? key}) : super(key: key);

  @override
  _UserPreferencesPageAvatarState createState() =>
      _UserPreferencesPageAvatarState();
}

class _UserPreferencesPageAvatarState extends State<UserPreferencesPageAvatar> {
 

    Future stepSaver(String userName) async {
     SharedPreferences pref = await SharedPreferences.getInstance();
     pref.setString('userAvatar', userName);
     pref.setInt('passPage', 3);
      print("masuk step 2 dan nama");
      movePage();
  }

void movePage(){
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomePageScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'DailyVity',
          style: GoogleFonts.fredokaOne(
              fontSize: 20, color: ColorLib.dailyVityWhite),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Avatar Pengguna',
              style: GoogleFonts.fredokaOne(
                  fontSize: 24, color: ColorLib.dailyVityBlack),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Siahkan pilih avatar pengguna sesuai yang anda sukai',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 16, color: ColorLib.dailyVityBlack),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(child: Image.asset('assets/smile.png'),onTap: (){stepSaver('smile.png');},),
                InkWell(child: Image.asset('assets/cool.png'),onTap: (){stepSaver('cool.png');},),
                InkWell(child: Image.asset('assets/sick.png'),onTap: (){stepSaver('sick.png');},)
              ],
            ),
            SizedBox(height: 40,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(child: Image.asset('assets/yummy.png'),onTap: (){stepSaver('yummy.png');},),
                InkWell(child: Image.asset('assets/xixi.png'),onTap: (){stepSaver('xixi.png');},),
                InkWell(child: Image.asset('assets/brrr.png'),onTap: (){stepSaver('brrr.png');},)
              ],
            ),
            SizedBox(height: 40,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(child: Image.asset('assets/alien.png'),onTap: (){stepSaver('alien.png');},),
                InkWell(child: Image.asset('assets/catty.png'),onTap: (){stepSaver('catty.png');},),
                InkWell(child: Image.asset('assets/robo.png'),onTap: (){stepSaver('robo.png');},)
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
