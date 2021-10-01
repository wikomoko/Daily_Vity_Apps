import 'package:hive/hive.dart';
part 'modelCatatan.g.dart';

@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  String judul;
  @HiveField(1)
  String isi;

  Note(this.judul, this.isi);
}
