import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _counterName;
  List countersList = [];

  @override
  void initState(){
    super.initState();

    countersList.addAll(["1", "2", "3"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список счетчиков'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: countersList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(countersList[index]),
                child: Card(
                  child: ListTile(title: Text(countersList[index]),),
                ),
              onDismissed: (direction){
                  setState(() {
                    countersList.removeAt(index);
                  });
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text("Создание счетчика"),
              content: TextField(
                onChanged: (String value){
                  _counterName = value;
                },
              ),


              actions: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    countersList.add(_counterName);
                  });
                  Navigator.of(context).pop();
                }, child: Text('Создать'))
              ],

            );
          });
        },
        child: const Icon(
          Icons.add_circle,
          color: Colors.white
        )
      ),
    );
  }
}

