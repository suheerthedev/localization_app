import 'package:stacked/stacked.dart';
import 'package:localization_app/services/localization_service.dart';
import 'package:localization_app/app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
  final LocalizationService _localizationService = locator<LocalizationService>();

  String get title => _localizationService.translate("title");
  String get message => _localizationService.translate("message");
  String get switchLanguageLabel => _localizationService.translate("switch_language");
  String get aboutUs => _localizationService.translate("about_us");

  Future<void> switchLanguage() async {
    _localizationService.switchLanguage();
    notifyListeners();
  }

  LocalizationService get localizationService => _localizationService;
}
