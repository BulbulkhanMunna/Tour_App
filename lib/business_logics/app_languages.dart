import 'package:get/route_manager.dart';

import '../ui/languages/ban.dart';
import '../ui/languages/eng.dart';

class AppLanguages extends Translations{
  @override
  Map<String,Map<String,String>>get keys=>{
    'en_US':eng,
    'bn_BD':ban,
  };
}