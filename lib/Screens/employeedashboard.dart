import 'package:coderz_inc/Screens/AddEvent.dart';
import 'package:coderz_inc/dbHelper/mongodb.dart';
import 'package:coderz_inc/utils/EventModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeDashboard extends StatefulWidget {
  const EmployeeDashboard({super.key});

  @override
  State<EmployeeDashboard> createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    getUid() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = prefs.getString('email').toString();
      print(email);
      return email;
    }

    Future<String> uid = getUid();

    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 15),
            height: deviceHeight * 0.18,
            // color: Colors.black,
            child: const CircleAvatar(
              radius: 75,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                radius: 73,
                backgroundColor: Color.fromARGB(255, 66, 163, 242),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(
                    'assets/images/employee.png',
                    // D:\VS STUDIO\Ha\CoderzInc\Images\employee.png
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              "Atharva Kshiragar",
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                // fontFamily:
              ),
            ),
          ),
          Container(
            child: Text("10/10/10",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                  // fontFamily:
                )),
          ),
          Container(
            child: SizedBox(
              height: 20,
              width: 200,
              child: Divider(color: Colors.white),
            ),
          ),
          Container(
              height: deviceHeight * 0.30,
              width: double.infinity,
              // color: Colors.green,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: FutureBuilder(
                  future:
                      MongoDatabase.getUserEvents(getUid().toString().trim()),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasData) {
                        var totalData = snapshot.data.length;
                        print("Total Data" + totalData.toString());
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Task(
                                  EventModel.fromJson(snapshot.data[index]),
                                  deviceHeight,
                                  deviceWidth);
                            });
                      } else {
                        return Center(
                          child: Text("No Data Available."),
                        );
                      }
                    }
                  }))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddEvent()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget Task(EventModel eventModel, double deviceHeight, double deviceWidth) {
    return Container(
      height: deviceHeight * 0.185,
      width: deviceWidth * 0.90,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.date_range_outlined),
          ),
          Text(
            "${eventModel.eventTitle}",
          ),
        ],
      ),
    );
  }
}
