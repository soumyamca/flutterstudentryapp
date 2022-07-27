import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());


}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var list=[];
  var rollno=[];
  var admsno=[];

  TextEditingController name=TextEditingController();
  TextEditingController roll=TextEditingController();
  TextEditingController admn=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("STUDAPP"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
            controller: name,
                  decoration: InputDecoration(
            hintText: "enter name",
                    labelText: "enter name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      )
                    )
                  ),
                SizedBox(
                  height: 20,
                ),

                TextField(
                    controller: roll,
                    decoration: InputDecoration(
                        hintText: "enter rollno",
                        labelText: "enter rollno",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    controller: admn,
                    decoration: InputDecoration(
                        hintText: "enter admission no",
                        labelText: "enter admission no",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                      color: Colors.blue,
                      child: Text("ADD",style: TextStyle(
                          color: Colors.white,
                          fontSize: 30
                      ),),
                      onPressed:(

                          ){

                      var getName=name.text;
                      var getRoll=roll.text;
                      var getAdmn=admn.text;
                      setState(() {
                        list.add(getName);
                        rollno.add(getRoll);
                        admsno.add(getAdmn);
                      });

                      print(getName);
                      print(getRoll);
                      print(getAdmn);
                      }),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length==null?0:list.length,
                    itemBuilder:(context,index){
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.account_box,color: Colors.deepOrange,size: 30,),
                        trailing: GestureDetector(
                            onTap: (){
                              setState(() {
                                list.removeAt(index);
                                rollno.removeAt(index);
                                admsno.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete,color: Colors.blue,size: 20,)),
                        title: Text(list[index]),
                        subtitle: Text(rollno[index]+"\n"+"admission no "+admsno[index]),
                      ),
                    );
                    },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
