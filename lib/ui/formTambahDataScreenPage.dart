
import 'package:daily_vity/model/modelCatatan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class FormTambahData extends StatefulWidget {
  const FormTambahData({Key? key}) : super(key: key);

  @override
  _FormTambahDataState createState() => _FormTambahDataState();
}

class _FormTambahDataState extends State<FormTambahData> {
  final _judulController = TextEditingController();
  final _isiController = TextEditingController();
  final _noteFormKey = GlobalKey<FormState>();

  late final Box box;

  tambahData() async {
    Note catatanBaru =
        Note(_judulController.text.toString(), _isiController.text.toString());
    box.add(catatanBaru);
  }

  @override
  void initState() {
    super.initState();

    box = Hive.box('noteBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
            'DailyVity',
            style: GoogleFonts.fredokaOne(
                fontSize: 20, color: Colors.white),
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _noteFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Judul Catatan'),
              TextFormField(
                controller: _judulController,
              ),
              SizedBox(height: 24.0),
              Text('Isi Catatan'),
              TextFormField(
                controller: _isiController,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_noteFormKey.currentState!.validate()) {
                        tambahData();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Tambah Catatan'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorLib {
}
