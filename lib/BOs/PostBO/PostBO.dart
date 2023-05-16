
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class PostBO{
  int? id;
  String? title;
  String? description; 
  DateTime? date;

  PostBO({required this.id,required this.title, required this.description, required this.date,});
}