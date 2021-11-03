import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/local/cashe_helper.dart';
import 'package:news_app/shared/sharedcubit/stateSh.dart';

class ShareCubit extends Cubit<ShareStates> {
  ShareCubit() : super(ShareInitialState());

  static ShareCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: "isDark", value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }


  
}
