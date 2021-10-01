import 'package:daily_vity/appearance/colorLib.dart';
import 'package:daily_vity/ui/homeScreenPage.dart';
import 'package:daily_vity/ui/introScreenPage.dart';
import 'package:daily_vity/ui/userAvatarPage.dart';
import 'package:daily_vity/ui/userPreferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({ Key ? key }) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  var listPage = [IntroScreenPage(),UserPreferencesPageName(),UserPreferencesPageAvatar(),HomePageScreen()];
  int pointer = 0;

  Future stepReader() async {
     SharedPreferences pref = await SharedPreferences.getInstance();
     var getStepData = pref.getInt('passPage');
     print(getStepData);
     if(getStepData!=null){
       setState(() {
                pointer = getStepData;
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
    return SplashScreenView(
      navigateRoute: listPage[pointer],
      duration: 100,
      imageSize: 100,
      imageSrc: "assets/logo_group.png",
      backgroundColor: ColorLib.dailyVityBlue,
       text: "Loading... ",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 18.0,
      ),
      colors: [
        ColorLib.dailyVityBlack,
        ColorLib.dailyVityGreen,
        ColorLib.dailyVityRed
      ],
    );
  }
}