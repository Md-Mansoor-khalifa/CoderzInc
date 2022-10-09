import 'dart:async';

import 'package:coderz_inc/AdminDashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

List<String> items = <String>["Work", "Meeting", "Break", "Other"];
String dropDownValue = "Work";

class _AddEventState extends State<AddEvent> {
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay time1 = TimeOfDay.now();
  DateTime date1 = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((value) {
      date1 = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin:
              const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
          // color: Color.fromARGB(255, 172, 172, 172),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 100,
                child: Icon(
                  Icons.edit_calendar,
                  size: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  color: const Color.fromARGB(255, 206, 206, 206),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Event title",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 20, left: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: 'Enter event title',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Event Description",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: 'Enter event Description',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Event type",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                DropdownButton(
                                  value: dropDownValue,
                                  items: items.map(
                                    (String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Duration of event",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.alarm),
                                TextButton(
                                  onPressed: () async {
                                    TimeOfDay? newTime = await showTimePicker(
                                        context: context, initialTime: time);
                                    if (newTime == null) return;
                                    setState(() => time = newTime);
                                  },
                                  child: Text('${time.hour}:${time.minute}'),
                                ),
                                const Text("To"),
                                TextButton(
                                  onPressed: () async {
                                    TimeOfDay? newTime = await showTimePicker(
                                        context: context, initialTime: time);
                                    if (newTime == null) return;
                                    setState(() => time1 = newTime);
                                  },
                                  child: Text('${time1.hour}:${time1.minute}'),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Day of event",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 20),
                                  child: Icon(Icons.calendar_month),
                                ),
                                TextButton(
                                  onPressed: _showDatePicker,
                                  child: Text(
                                      '${date1.day}/${date1.month}/${date1.year}'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
