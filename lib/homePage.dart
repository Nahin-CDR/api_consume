
import 'package:api_consume/service.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isloading = true;
  List<Album> userList = [];
  apiCall()async{
    userList = await Services.getUserData();
    setState((){
      isloading = false;
    });
  }
   @override
   void initState() {
     super.initState();
     apiCall();
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(isloading ? "Loading.." : "Api Consume"),
        ),
        body:ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return Container(
              height: 100.0,
              width: MediaQuery. of(context). size. width-50,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: const LinearGradient(
                      colors: [
                        Color(0xFFB3E5FC),
                        Colors.white
                      ]
                  ),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey ,
                        blurRadius: 2.0,
                        offset: Offset(2.0,2.0)
                    )
                  ]
              ),
              child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Text(userList[index].title,style:const TextStyle(fontSize: 20.0)),
                  )
              )
            );
          },
        ),
      ),
    );
  }
}