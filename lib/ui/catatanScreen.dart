

import 'package:daily_vity/appearance/colorLib.dart';
import 'package:daily_vity/ui/formTambahDataScreenPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CatatanScreen extends StatefulWidget {
  const CatatanScreen({ Key? key }) : super(key: key);

  @override
  _CatatanScreenState createState() => _CatatanScreenState();
}

class _CatatanScreenState extends State<CatatanScreen> {
  late final Box containNote;

  @override
  void initState() {

    containNote = Hive.box('noteBox');
    super.initState();
  }
   hapusData(int index) {
    containNote.deleteAt(index);
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
             color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          title: Text(
            'DailyVity',
            style: GoogleFonts.fredokaOne(
                fontSize: 20, color: Colors.white),
          ),
          elevation: 0,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FormTambahData(),
          ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child:  ValueListenableBuilder(
        valueListenable: containNote.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return Center(
              child: Text('Wah Kosong ya...'),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var currentBox = box;
                var personData = currentBox.getAt(index)!;

                return InkWell(
                  child: ListTile(
                    title: Text(personData.judul),
                    subtitle: Text(personData.isi),
                    trailing: IconButton(
                      onPressed: (){
                        hapusData(index);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    )
      
    );
  }
}