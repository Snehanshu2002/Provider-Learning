import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management1/counter_provider.dart';

class ProviderClass extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body:  Center(
        child: Consumer<CounterProvider>(
          builder: (ctx,_,__){
            return Text(
              //'${Provider.of<CounterProvider>(ctx, listen: true).getCount()}',
              '${ctx.watch<CounterProvider>().getCount()}',
              style: TextStyle(fontSize: 25),
            );
          },
        )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: (){
               //Provider.of<CounterProvider>(context,listen: false).increment();
                context.read<CounterProvider>().increment(5);
                },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 20,),
          FloatingActionButton(
              onPressed: (){
                context.read<CounterProvider>().decrement(10);
              },
              child:Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
