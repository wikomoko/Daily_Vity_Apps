import 'package:daily_vity/appearance/colorLib.dart';
import 'package:daily_vity/ui/userAvatarPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserPreferencesPageName extends StatefulWidget {
  const UserPreferencesPageName({ Key? key }) : super(key: key);

  @override
  _UserPreferencesPageNameState createState() => _UserPreferencesPageNameState();
}

class _UserPreferencesPageNameState extends State<UserPreferencesPageName> {

  TextEditingController myController = TextEditingController();
  String fromTextField = "";
  
  Future stepSaver(String userName) async {
     SharedPreferences pref = await SharedPreferences.getInstance();
     pref.setString('userName', userName);
     pref.setInt('passPage', 2);
      print("masuk step 2 dan nama");
      movePage();
  }

  void movePage(){
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => UserPreferencesPageAvatar()),
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
            fontSize: 20,
            color: ColorLib.dailyVityWhite
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Nama Pengguna',
              style: GoogleFonts.fredokaOne(fontSize: 24,color: ColorLib.dailyVityBlack),
              ),
              SizedBox(height: 18,),
               Text(
              'Siahkan isi nama pengguna sebelum menggunakan aplikasi',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 16 ,color: ColorLib.dailyVityBlack),
              ), 
              SizedBox(height: 31,), 
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: myController,
                      decoration: InputDecoration(
                        hintText: '...nama anda...',   
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorLib.dailyVityBlack),
                          borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    )
              ),
              SizedBox(height: 8,),
              InkWell(
                onTap: (){
                stepSaver(myController.text.toString());
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(16),
                  height: 50,
                  width: double.infinity,
                  child: Text(
                    'Selesai',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.fredokaOne(fontSize: 24,color: ColorLib.dailyVityWhite),
                  ),
                  decoration: BoxDecoration(
                    color: ColorLib.dailyVityBlue,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}