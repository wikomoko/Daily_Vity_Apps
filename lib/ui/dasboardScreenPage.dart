import 'package:daily_vity/appearance/colorLib.dart';
import 'package:daily_vity/model/modelKorona.dart';
import 'package:daily_vity/model/modelWeather.dart';
import 'package:daily_vity/network/apiKorona.dart';
import 'package:daily_vity/network/apiOpenWeather.dart';
import 'package:daily_vity/ui/searchCityScreenPage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DasboardScreenPage extends StatefulWidget {
  const DasboardScreenPage({Key? key}) : super(key: key);

  @override
  _DasboardScreenPageState createState() => _DasboardScreenPageState();
}

class _DasboardScreenPageState extends State<DasboardScreenPage> {
  String userPicture = 'smile.png';
  String userName = '';
  String lat = "";
  String lon = "";
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

  void _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        // _currentPosition = position;
        lat = position.latitude.toString();
        lon = position.longitude.toString();
      });
      print(position.toString());
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    stepReader();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.notes_rounded,
              size: 40,
              color: ColorLib.dailyVityWhite,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          title: Text(
            'DailyVity',
            style: GoogleFonts.fredokaOne(
                fontSize: 20, color: ColorLib.dailyVityWhite),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                size: 38,
                color: ColorLib.dailyVityWhite,
              ),
              onPressed: () {
                 showSearch(context: context, delegate: SearchCityScreenPage());
              },
            ),
            SizedBox(
              width: 8,
            )
          ],
          elevation: 0,
        ),
        body: SafeArea(
          child: Center(
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  color: ColorLib.dailyVityBlue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Hallo,',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              fontSize: 18, color: ColorLib.dailyVityWhite),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          '$userName',
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          style: GoogleFonts.fredokaOne(
                              fontSize: 24, color: ColorLib.dailyVityWhite),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 70,
                      color: ColorLib.dailyVityBlue,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(16, 24, 16, 24),
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: Colors.black)]),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder<OpenWeather>(
                                future:
                                    ApiOpenWeather().getWeatherData(lat, lon),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Image.network(
                                            'http://openweathermap.org/img/wn/${snapshot.data!.weather[0].icon}@2x.png',
                                            width: 50),
                                        Column(
                                          children: [
                                            Text('Kecamatan : '),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '${snapshot.data!.name}',
                                              style: GoogleFonts.fredokaOne(
                                                  fontSize: 20,
                                                  color:
                                                      ColorLib.dailyVityBlack),
                                            ),
                                            Text(
                                              '${snapshot.data!.weather[0].description}',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color:
                                                      ColorLib.dailyVityBlack),
                                            )
                                          ],
                                        ),
                                        Text(
                                          '${snapshot.data!.main.temp.round()} C',
                                          style: GoogleFonts.poppins(
                                              fontSize: 24,
                                              color: ColorLib.dailyVityBlack),
                                        )
                                      ],
                                    );
                                  }
                                  return Center(
                                      child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(),
                                          SizedBox(width: 12),
                                          Text('Melacak Posisi ')
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        '!!! PASTIKAN GPS HIDUP !!! ',
                                        style: TextStyle(
                                            color: ColorLib.dailyVityRed),
                                      )
                                    ],
                                  ));
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                                child: Text(
                              " lat : $lat , lon : $lon",
                              style: TextStyle(fontSize: 8),
                            )),
                            Center(
                                child: Text(
                              " Sumber : https://openweathermap.org/api",
                              style: TextStyle(fontSize: 8),
                            )),
                          ]),
                    )
                  ],
                ),
                Container(
                  height: 145,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black)]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Kasus Corona Indonesia',
                        style: GoogleFonts.fredokaOne(
                            textStyle: TextStyle(
                                fontSize: 20, color: ColorLib.dailyVityBlack)),
                      ),
                      Divider(
                        color: ColorLib.dailyVityBlack,
                      ),
                      Expanded(
                        child: FutureBuilder<List<Corona>>(
                            future: ApiKorona().getDataCorona(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Positif',
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontSize: 16,
                                                        color: ColorLib
                                                            .dailyVityBlack)),
                                              ),
                                              Text(
                                                snapshot.data![index].positif
                                                    .toString(),
                                                style: GoogleFonts.fredokaOne(
                                                    fontSize: 20,
                                                    color:
                                                        ColorLib.dailyVityRed),
                                              ),
                                            ],
                                          ),
                                          VerticalDivider(color: Colors.grey),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Sembuh',
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontSize: 16,
                                                        color: ColorLib
                                                            .dailyVityBlack)),
                                              ),
                                              Text(
                                                snapshot.data![index].sembuh
                                                    .toString(),
                                                style: GoogleFonts.fredokaOne(
                                                    fontSize: 20,
                                                    color: ColorLib
                                                        .dailyVityGreen),
                                              )
                                            ],
                                          ),
                                          VerticalDivider(color: Colors.grey),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Meninggal',
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontSize: 16,
                                                        color: ColorLib
                                                            .dailyVityBlack)),
                                              ),
                                              Text(
                                                snapshot.data![index].meninggal
                                                    .toString(),
                                                style: GoogleFonts.fredokaOne(
                                                    fontSize: 20,
                                                    color: ColorLib
                                                        .dailyVityBlack),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }
                              return Center(child: CircularProgressIndicator());
                            }),
                      ),
                      Text(
                        'sumber :https://kawalcorona.com/',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
