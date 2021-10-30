import 'package:flutter/material.dart';
import 'package:natrium_wallet_flutter/themes.dart';
import 'package:natrium_wallet_flutter/model/setting_item.dart';

enum ThemeOptions { NATRIUM, TITANIUM, INDIUM, NEPTUNIUM, THORIUM, CARBON, NYANOMOBILE }

/// Represent notification on/off setting
class ThemeSetting extends SettingSelectionItem {
  ThemeOptions theme;

  ThemeSetting(this.theme);

  String getDisplayName(BuildContext context) {
    switch (theme) {
      case ThemeOptions.CARBON:
        return "Carbon";
      case ThemeOptions.THORIUM:
        return "Thorium";
      case ThemeOptions.NEPTUNIUM:
        return "Neptunium";
      case ThemeOptions.INDIUM:
        return "Indium";
      case ThemeOptions.TITANIUM:
        return "Titanium";
      case ThemeOptions.NATRIUM:
        return "Natrium";
      case ThemeOptions.NYANOMOBILE:
      default:
        return "Nyano Mobile";
    }
  }

  BaseTheme getTheme() {
    switch (theme) {
      case ThemeOptions.CARBON:
        return CarbonTheme();
      case ThemeOptions.THORIUM:
        return ThoriumTheme();
      case ThemeOptions.NEPTUNIUM:
        return NeptuniumTheme();
      case ThemeOptions.INDIUM:
        return IndiumTheme();
      case ThemeOptions.TITANIUM:
        return TitaniumTheme();
      case ThemeOptions.NATRIUM:
        return NatriumTheme();
      case ThemeOptions.NYANOMOBILE:
      default:
        return NyanoMobileTheme();

    }
  }

  // For saving to shared prefs
  int getIndex() {
    return theme.index;
  }
}
