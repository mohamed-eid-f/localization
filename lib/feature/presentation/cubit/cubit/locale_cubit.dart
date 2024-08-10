import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:localization_pure/core/localization/language_cache_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState(locale: const Locale("en")));

  Future<void> getSavedLanguage() async {
    // get cached language code
    String savedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    // emit state
    emit(ChangeLocaleState(locale: Locale(savedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    // cache new language code
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    // emit state
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
