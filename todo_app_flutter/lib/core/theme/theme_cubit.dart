import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {

  bool isDark = false;

  ThemeCubit() : super(ThemeState(isDark: false));

  void toggleTheme(){
    isDark = !isDark;
    emit(ThemeState(isDark: isDark));
  }

}
