import 'package:daily_vity/appearance/colorLib.dart';
import 'package:daily_vity/ui/userPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class IntroScreenPage extends StatefulWidget {
  const IntroScreenPage({ Key? key }) : super(key: key);

  @override
  _IntroScreenPageState createState() => _IntroScreenPageState();
}

class _IntroScreenPageState extends State<IntroScreenPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  bool autoMove = false;

  void _onIntroEnd(context) {
    stepSaver();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => UserPreferencesPageName()),
    );
  }

   Future stepSaver() async {
     SharedPreferences pref = await SharedPreferences.getInstance();
     pref.setInt('passPage', 1);
      print("masuk");
  }




  @override
  Widget build(BuildContext context) {
    final bodyStyle = GoogleFonts.poppins(fontSize: 14);

    final pageDecoration =  PageDecoration(
      titleTextStyle: GoogleFonts.fredokaOne(fontSize: 24),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            //child: _buildImage('flutter.png', 100),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Prakiraan Cuacah",
          body:
              "Dapatkan informasi terkait prekiraan cuaah di slokasi anda dengan sistem pelacakan posisi otomatis",
          image: Image.asset('assets/awan_intro.png',width: 200,),
          decoration: pageDecoration,
        ),
         PageViewModel(
          title: "Informasi Covid Nasional",
          body:
              "Ketahui jumlah seluruh Positif, Sembuh, dan Meninggal pada kasus Covid di Indonesia",
          image: Image.asset('assets/covid.png',width: 150,),
          decoration: pageDecoration,
        ),
          PageViewModel(
          title: "Pencatan Agenda",
          body:
              "Tidak perlu khawatir kehialangan kenangan maupun ide-ide briliant anda, catat kapanpun dan dimanapun dengan sangat praktis dan cepat",
          image: Image.asset('assets/note.png',width: 120,),
          decoration: pageDecoration,
        ),
       
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Lewati'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Selesai', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator:  DotsDecorator(
        size: Size(10.0, 10.0),
        color: ColorLib.dailyVityBlue,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator:  ShapeDecoration(
        color: ColorLib.dailyVityWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
    
  }
}