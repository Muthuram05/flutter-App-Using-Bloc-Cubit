
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part  'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState>{
  ThemeCubit() : super(ThemeInitial());
  bool _isDark = false;
  bool get isDark => _isDark;
  void toogleTheme(){
    _isDark = !_isDark;
    emit(ThemeChanges());
    if(_isDark){
      emit(ThemeDark(message: "Theme is Dark"));
    }
    if(!_isDark){
      emit(ThemeLight(message: "Theme is Light"));
    }
  }
}

