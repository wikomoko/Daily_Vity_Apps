import 'package:daily_vity/appearance/colorLib.dart';
import 'package:daily_vity/model/modelWeather.dart';
import 'package:daily_vity/network/apiOpenWeather.dart';
import 'package:daily_vity/ui/weatherDetailScreenPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchCityScreenPage extends SearchDelegate {
  List<String> kota = [];

  void tambah(masuk) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    kota.insert(0, masuk);
    pref.setStringList('memory', kota);
  }

  void dapat() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    kota.clear();
    var getDatas = pref.getStringList('memory');
    if (getDatas != null) {
      kota.addAll(getDatas);
    }
    print(kota);
  }

  @override
  String? get searchFieldLabel => "cari nama kota";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final saran = kota.where((namax) {
      return namax.toLowerCase().contains(query.toLowerCase());
    });

    if (saran.isEmpty) {
      tambah(query);
    }
    return FutureBuilder<OpenWeather>(
        future: ApiOpenWeather().getWeatherCity(query),
            builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: 1,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(
                         builder: (context){
                          return WeatherDetailScreenPage(weather: snapshot.data!);
                         }
                       ));
                    },
                    child: ListTile(
                      leading: Image.network(
                        'http://openweathermap.org/img/wn/${snapshot.data!.weather[0].icon}@2x.png',
                      ),
                      title: Text(
                        '${snapshot.data!.name}',
                        style: GoogleFonts.fredokaOne(
                            fontSize: 20, color: ColorLib.dailyVityBlack),
                      ),
                      subtitle: Text(
                        '${snapshot.data!.weather[0].description}',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: ColorLib.dailyVityBlack),
                      ),
                      trailing: Text(
                        '${snapshot.data!.main.temp.round()} C',
                        style: GoogleFonts.poppins(
                            fontSize: 24, color: ColorLib.dailyVityBlack),
                      ),
                    ),
                  );
                });
            // return Text(snapshot.data!.name);
          } else {
            print("ekosng");
          }
          return Center(child: CircularProgressIndicator());
        }
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    dapat();
    final saran = kota.where((namax) {
      return namax.toString().toLowerCase().contains(query.toLowerCase());
    });
    print(saran.length);
    return ListView.builder(
      itemCount: saran.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            query = saran.elementAt(index);
          },
          child: ListTile(
            leading: Icon(Icons.history),
            title: Text(saran.elementAt(index)),
            trailing: Icon(Icons.north_west),
          ),
        );
      },
    );
  }
}
