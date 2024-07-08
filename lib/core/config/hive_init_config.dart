import 'package:hive_flutter/adapters.dart';
 Box? box;
openHive() async{
  await Hive.initFlutter();
 box =await Hive.openBox('access_token');
}