import 'package:daily_vity/appearance/colorLib.dart';
import 'package:daily_vity/model/modelWeather.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherDetailScreenPage extends StatefulWidget {
  final OpenWeather weather;
  const WeatherDetailScreenPage({Key? key, required this.weather})
      : super(key: key);

  @override
  _WeatherDetailScreenPageState createState() =>
      _WeatherDetailScreenPageState();
}

class _WeatherDetailScreenPageState extends State<WeatherDetailScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLib.dailyVityBlue,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          '${widget.weather.name}',
          style: GoogleFonts.fredokaOne(
              fontSize: 20, color: ColorLib.dailyVityWhite),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Image.network(
              'http://openweathermap.org/img/wn/${widget.weather.weather[0].icon}@2x.png',
              height: 100,
              width: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        '${widget.weather.name}',
                        maxLines: 2,
                        style: GoogleFonts.fredokaOne(
                            fontSize: 28, color: ColorLib.dailyVityWhite),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        '${widget.weather.weather[0].description}',
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: ColorLib.dailyVityWhite),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                          '${widget.weather.main.temp.round()} C',
                          style: GoogleFonts.poppins(
                              fontSize: 30, color: ColorLib.dailyVityWhite),
                        ),
                ),
              ],
            ),
            SizedBox(height: 25,),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: ColorLib.dailyVityWhite,
                borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(50),
                   topRight: Radius.circular(50)
                )
              ),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                    Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                          'Kelembapan Udara',
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: ColorLib.dailyVityBlack),
                        ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                          '${widget.weather.main.humidity} %',
                          style: GoogleFonts.fredokaOne(
                              fontSize: 30, color: ColorLib.dailyVityBlack),
                        ),
                ),
                Divider(),
                 Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                          'Jarak Pandang',
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: ColorLib.dailyVityBlack),
                        ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                          '${widget.weather.visibility/1000} km',
                          style: GoogleFonts.fredokaOne(
                              fontSize: 30, color: ColorLib.dailyVityBlack),
                        ),
                ),
                   Divider(),
                   Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                          'Kecepatan Angin',
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: ColorLib.dailyVityBlack),
                        ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                          '${widget.weather.wind.speed} m/s',
                          style: GoogleFonts.fredokaOne(
                              fontSize: 30, color: ColorLib.dailyVityBlack),
                        ),
                ),
                 Divider(),
                   Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                          'Kode Negara',
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: ColorLib.dailyVityBlack),
                        ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                          '${widget.weather.sys.country}',
                          style: GoogleFonts.fredokaOne(
                              fontSize: 30, color: ColorLib.dailyVityBlack),
                        ),
                ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
