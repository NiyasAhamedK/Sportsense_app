import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:sport_app/layout/login.dart';

import 'bottomnav.dart';
import 'draw.dart';
class user_view_profile extends StatefulWidget {
  const user_view_profile({Key? key}) : super(key: key);

  @override
  State<user_view_profile> createState() => _user_view_profileState();
}

class _user_view_profileState extends State<user_view_profile> {
  late List data;
  void List_function() async {
     var url = Uri.parse(login.url+"user/user_view_profile/");
    Response resp1 = await post(url,body: {
      'u_id':login.uid
    });
    data = jsonDecode(resp1.body);
    this.setState(() {
    });
    print(resp1.body);
  }
  @override
  Widget build(BuildContext context) {
    List_function();
    return Scaffold(
      drawer: draw(),
      bottomNavigationBar: botnav(),

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 32, 26, 48),


        // backgroundColor: Colors.pinkAccent.shade200,
        title: Text(
          "SPORTSENSE",
          style: new TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
//           decoration: BoxDecoration(
//   gradient: LinearGradient(
//     begin: Alignment.topRight,
//     end: Alignment.bottomLeft,
//     colors: [
//       Color.fromARGB(255, 32, 26, 48),
//       Color.fromARGB(255, 32, 26, 48),
//       // Colors.grey
//     ],
//   ),
// ),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/local.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            // itemCount: 2,
            itemBuilder: (context, index) {
              return new Padding(
                padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
                child: new Card(
                  elevation: 2.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16.0)
                  ),
                  child: InkWell(
                    onTap: () {
                      print("tapped");
                      //  tap funtion here
                    },
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.all(16.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // Image.network(mainpage.url+"static/"+data[index]['pmr'].toString()),
                              Image.network(login.url+"static/"+data[index]['image'].toString()),
                              // new Text("Material:"+" "+data[index]['meterial'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium,
                              // ),
                              new SizedBox(height: 6.0),

                              new Text("Name : "+" "+data[index]['username'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                              new Text("Email : "+" "+data[index]['email'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                              new Text("Phone Number : "+" "+data[index]['phone'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                              ),
                              new SizedBox(height: 6.0),


                              // new Text(('Time' ).toUpperCase()+" "+data[index]['time'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
      ),
    );

  }
}