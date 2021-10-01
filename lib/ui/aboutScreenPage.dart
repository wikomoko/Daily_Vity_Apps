import 'package:daily_vity/appearance/colorLib.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreenPage extends StatelessWidget {
  const AboutScreenPage({Key? key}) : super(key: key);

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
          'Tentang Aplikasi',
          style: GoogleFonts.fredokaOne(
              fontSize: 20, color: ColorLib.dailyVityWhite),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 18,
            ),
            Text(
              'DailyVity',
              textAlign: TextAlign.center,
              style: GoogleFonts.fredokaOne(
                fontSize: 24,
                color: ColorLib.dailyVityBlue,
              ),
            ),
            Divider(),
             Padding(
               padding: const EdgeInsets.fromLTRB(46, 18, 46, 0),
               child: Text(
                'DailyVity adalah aplikasi sederhana yang sedikit menunjang aktivitas para penggunanya, aplikasi ini menampilkan informasi berupa cuacah dan suhu udaranya menggunakan pelacakan GPS pada ponsel. Selain itu  aplikasi ini juga memberikan informasi terkait Covid di Indonesia. Aplikasi ini juga dapat menyimpan jadwal kegiatan para penggunanya',
                 textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: ColorLib.dailyVityBlack,
                ),
            ),
             ),
          ],
        ),
      ),
    );
  }
}
