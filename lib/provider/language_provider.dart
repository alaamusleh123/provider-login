
import 'package:flutter/foundation.dart';
import 'package:untitled/pref/shared_pref_controller.dart';

class LanguageProvider extends ChangeNotifier {

  String language= SharedPrefController().language;

  void changeLanguage(){
    language=language =='en' ? 'ar' : 'en';
    notifyListeners();
    SharedPrefController().changeLanguage(language);
  }

}