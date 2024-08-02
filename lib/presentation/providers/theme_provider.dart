import 'package:flutter_la_garrita/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDarkModeProvider = StateProvider(
  (ref) => false,
);

final selectedColorProvider = StateProvider(
  (ref) => 0,
);

final colorListProvider = Provider(
  (ref) => colorList,
);

// AppTheme Custom
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier <AppTheme> {
  ThemeNotifier(): super(AppTheme());

  void toggleDarkMode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
  
  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }
}
