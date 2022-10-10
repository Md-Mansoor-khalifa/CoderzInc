// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bson/src/classes/object_id.dart';
import 'package:coderz_inc/dbHelper/mongodb.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UpdateEmployee extends StatefulWidget {
  String email;
  UpdateEmployee({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<UpdateEmployee> createState() => _UpdateEmployeeState();
}

// ############################################################################
// ############################################################################
class PieChatPage extends StatelessWidget {
  const PieChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData("10/10/10", 50, 15, 30, 5),
      ChartData("11/10/10", 60, 15, 20, 5),
      ChartData("12/10/10", 70, 15, 10, 5),
      ChartData("13/10/10", 15, 50, 5, 30),
    ];

    Map<String, double> dataMap_ThatDay = {
      "Meeting": 50,
      "Break": 15,
      "Work": 30,
      "Others": 5,
    };
    Map<String, double> dataMap_AfterDay = {
      "Meeting": 50,
      "Break": 15,
      "Work": 30,
      "Others": 5,
    };
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // // color: Colors.blue[200],
          decoration: BoxDecoration(
            color: Colors.blue[100],
            // borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Current Day"),
              ),
              PieChart(
                dataMap: dataMap_ThatDay,
                chartRadius: MediaQuery.of(context).size.width / 1.9,
                chartValuesOptions: ChartValuesOptions(
                  showChartValuesInPercentage: true,
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Previous Day"),
              ),
              PieChart(
                dataMap: dataMap_AfterDay,
                chartRadius: MediaQuery.of(context).size.width / 1.9,
                chartValuesOptions: ChartValuesOptions(
                  showChartValuesInPercentage: true,
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                legend: Legend(
                  isVisible: true,
                  title: LegendTitle(
                      text: 'Events',
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900)),
                  // Templating the legend item
                  // legendItemBuilder: (String name, dynamic series,
                  //     dynamic point, int index) {
                  //   return ;
                  // }
                ),
                series: <ChartSeries>[
                  StackedColumnSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData ch, _) => ch.x,
                      yValueMapper: (ChartData ch, _) => ch.y1),
                  StackedColumnSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData ch, _) => ch.x,
                      yValueMapper: (ChartData ch, _) => ch.y2),
                  StackedColumnSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData ch, _) => ch.x,
                      yValueMapper: (ChartData ch, _) => ch.y3),
                  StackedColumnSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData ch, _) => ch.x,
                      yValueMapper: (ChartData ch, _) => ch.y4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String x;
  final int y1;
  final int y2;
  final int y3;
  final int y4;

  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
}

// #####################################################################
// #####################################################################

class _UpdateEmployeeState extends State<UpdateEmployee> {
  @override
  Widget build(BuildContext context) {
    var name = "name",
        email = "email",
        phone = "phone",
        date = "joining date",
        department = "department";
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    MongoDatabase.getOneUser(widget.email).then((value) {
      setState(() {
        name = value[0]['name'].toString();
        email = value[0]['email'].toString();
        phone = value[0]['phoneNumber'].toString();
        date = value[0]['joiningDate'].toString();
        department = value[0]['department'].toString();
      });
    });

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: Colors.blue[200],
            child: Column(children: [
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
                  height: deviceHeight * 0.30,
                  width: double.infinity,
                  // color: Colors.green,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: LayoutBuilder(builder: (ctx, constraints) {
                    return Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   height: constraints.maxHeight * 0.01,
                          // ),
                          // Text('Please enter the details below to continue',),
                          Container(
                            height: constraints.maxHeight * 0.185,
                            width: deviceWidth * 0.90,
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.account_box),
                                ),
                                Text(
                                  "$name",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.01,
                          ),
                          Container(
                            height: constraints.maxHeight * 0.185,
                            width: deviceWidth * 0.90,
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.email),
                                ),
                                Text(
                                  email,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: constraints.maxHeight * 0.01,
                          ),

                          Container(
                            height: constraints.maxHeight * 0.185,
                            width: deviceWidth * 0.90,
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.phone),
                                ),
                                Text(
                                  phone.toString(),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: constraints.maxHeight * 0.01,
                          ),

                          Container(
                            height: constraints.maxHeight * 0.185,
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
                                  date,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: constraints.maxHeight * 0.01,
                          ),

                          Container(
                            height: constraints.maxHeight * 0.185,
                            width: deviceWidth * 0.90,
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.password),
                                ),
                                Text(
                                  department,
                                ),
                              ],
                            ),
                          ),
                        ]);
                  })),

              SizedBox(
                height: deviceHeight * 0.01,
              ),

              // THis is where Charts start
              // ########################################################################

              Card(
                elevation: 8,
                shadowColor: Colors.black,
                child: Container(
                  height: deviceHeight * 0.40,
                  width: deviceWidth * 0.95,
                  color: Colors.blue[100],
                  child: PieChatPage(),
                  // decoration: BoxDecoration(
                  //   // color: Colors.blue[400],
                  //   borderRadius: BorderRadius.circular(25),
                  // ),
                ),
              ),

              // #########################################################################

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 60,
                  width: deviceWidth * 0.70,
                  // margin: EdgeInsets.only(
                  //   top: 0,
                  // ),
                  // color: Colors.red,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        )),
                  ),

                  // child: Container(
                  //   color: Colors.green,
                  //   height: deviceHeight * 0.05,
                  // ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    ));
  }
}
