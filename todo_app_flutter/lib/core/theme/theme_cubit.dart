import 'package:bloc/bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  bool isDark = false;

  ThemeCubit() : super(ThemeState(isSystem: true, isDark: false));

  void toggleTheme() {
    isDark = !isDark;
    emit(ThemeState(isSystem: false, isDark: isDark));
  }
}
