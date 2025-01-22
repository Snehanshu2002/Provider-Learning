import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management1/list_map_provider.dart';
import 'package:state_management1/theme_provider.dart';

class AddDataPage extends StatelessWidget {
  const AddDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
        actions: [
          Consumer<ThemeProvider>(builder: (_,provider,__){
            return Switch.adaptive(
                value: provider.getThemeValue(),
                onChanged: (newValue){
                  provider.updateTheme(value: newValue);
                });
          })
        ],
      ),
      body: Center(
        child: IconButton(
            onPressed: (){
              context.read<ListMapProvider>().addData({
                "Name":"Snehanshu Sekhar",
                "Mob No":"7735382544",
              });
            },
            icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
