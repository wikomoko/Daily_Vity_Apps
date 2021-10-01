
import 'package:daily_vity/appearance/colorLib.dart';
import 'package:daily_vity/ui/userAvatarPage.dart';
import 'package:daily_vity/ui/userPreferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreenPage extends StatefulWidget {
  const SettingScreenPage({Key? key}) : super(key: key);

  @override
  _SettingScreenPageState createState() => _SettingScreenPageState();
}

class _SettingScreenPageState extends State<SettingScreenPage> {
  String userPicture = 'smile.png';
  String userName = 'dada';
  double _currentSliderValue = 0;

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

  @override
  void initState() {
    super.initState();
    stepReader();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorLib.dailyVityWhite,
            ),
            onPressed: () => Navigator.pop(context)),
        centerTitle: true,
        title: Text(
          'Pengaturan',
          style: GoogleFonts.fredokaOne(
              fontSize: 20, color: ColorLib.dailyVityWhite),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Image.asset('assets/$userPicture',height: 100.0),
            Text(
              '$userName',
              textAlign: TextAlign.center,
              style: GoogleFonts.fredokaOne(
                fontSize: 24,
                color: ColorLib.dailyVityBlue,
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => UserPreferencesPageAvatar()));
              },
              child: ListTile(
                  leading: Icon(
                  Icons.photo,
                  color: ColorLib.dailyVityBlack,
                ),
                title: Text(
                  'Ganti Gambar Avatar',
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                      fontSize: 18, color: ColorLib.dailyVityBlack),
                ),
              ),
            ),
             Divider(),
            InkWell(
              onTap: () {
                  Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => UserPreferencesPageName()));
              },
              child: ListTile(
                  leading: Icon(
                  Icons.person,
                  color: ColorLib.dailyVityBlack,
                ),
                title: Text(
                  'Ganti Nama Pengguna',
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                      fontSize: 18, color: ColorLib.dailyVityBlack),
                ),
              ),
            ),
              Divider(),
              
          ],
        ),
      ),
    );
  }
}
