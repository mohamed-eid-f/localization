import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_pure/feature/presentation/cubit/cubit/locale_cubit.dart';
import '../../../core/localization/app_localizations.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("setting".tr(context)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
            builder: (context, state) {
              return DropdownButton<String>(
                value: state.locale.languageCode,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: ["ar", "en"]
                    .map(
                      (String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;
                  context.read<LocaleCubit>().changeLanguage(value);
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
