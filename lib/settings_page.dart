import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management1/theme_provider.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Consumer<ThemeProvider>(
          builder: (ctx,provider,__){
            return SwitchListTile.adaptive(
              title: Text("Dark Mode"),
              subtitle: Text("Change Theme Mode Here"),
              onChanged: (value){
                provider.updateTheme(value: value);
              },
              value: provider.getThemeValue(),
            );
          },
      )
    );
  }
}
