import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management1/add_data_page.dart';
import 'package:state_management1/list_map_provider.dart';
import 'package:state_management1/main.dart';
import 'package:state_management1/settings_page.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
        actions: [
          PopupMenuButton(itemBuilder: (_){
            return [
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 11,),
                      Text("Settings"),
                    ],
                  ),
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>SettingsPage(),));
                },
              )
            ];
          })
        ],
      ),
      body: Consumer<ListMapProvider>(
          builder: (ctx,provider,__){
            var allData = provider.getData();
            return allData.isNotEmpty ?
            ListView.builder(
              itemCount: allData.length,
                itemBuilder: (_,index){
              return ListTile(
                title: Text('${allData[index]['Name']}'),
                subtitle: Text('${allData[index]['Mob No']}'),
                trailing: SizedBox(
                  width: 100,child: Row(
                  children: [
                    IconButton(onPressed: (){
                      context.read<ListMapProvider>().updateData({
                        "Name":"Om Satapathy",
                        "Mob No":"7326868047",
                      }, index);
                    }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: (){
                      context.read<ListMapProvider>().deleteData(index);
                    }, icon: Icon(Icons.delete,color: Colors.red,)),
                  ],
                ),),
              );
            })
                :Center(child: Text('No Contacts yet'),);
          },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            // context.read<ListMapProvider>().addData({
            //   "Name":"Snehanshu Sekhar",
            //   "Mob No":"7735382544",
            // });
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddDataPage()));
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddDataPage()));
          },
        child: Icon(Icons.add),
      ),
    );
  }
}
