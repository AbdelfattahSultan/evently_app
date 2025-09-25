// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'إيفنتلي';

  @override
  String get onBoardingTitle => 'خصص تجربتك';

  @override
  String get subTitle =>
      'اختر اللغة والثيم المفضلين لديك للبدء بتجربة مريحة ومصممة حسب أسلوبك.';

  @override
  String get letsStart => 'هيا نبدأ';

  @override
  String get language => 'اللغة';

  @override
  String get theme => 'الثيم';
}
