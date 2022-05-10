
import 'package:flavors_task/bloc/contacts/events.dart';
import 'package:flavors_task/bloc/themes/states.dart';
import 'package:flavors_task/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_themes.dart';

class ThemeBloc extends Bloc<ThemeEvent,ThemeState>
{
  ThemeBloc() : super(ThemeInitState())
  {
    on<ThemeEvent>((event, emit) async {
      if(event is SetDarkTheme) {
        await _setDarkThemeData(emit);
      }else if(event is SetLightTheme) {
        _setWhiteThemeData(emit);
      }
    });
  }

  Future<void> _setDarkThemeData(Emitter emit) async {
      emit(ThemeDoneState(AppThemes.appThemeData[AppTheme.darkTheme],Constants.dark));
  }

  Future<void> _setWhiteThemeData(Emitter emit) async {
    emit(ThemeDoneState(AppThemes.appThemeData[AppTheme.lightTheme],Constants.light));
  }

}