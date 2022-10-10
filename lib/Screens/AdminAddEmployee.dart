import 'package:flutter/material.dart';

class AdminAddEmployee extends StatefulWidget {
  const AdminAddEmployee({super.key});

  @override
  State<AdminAddEmployee> createState() => _AdminAddEmployee();
}

List<String> items = <String>["Android", "Web", "Flutter", "Management"];
String dropDownValue = "Management";

class _AdminAddEmployee extends State<AdminAddEmployee> {
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
      setState(() {
        date1 = value!;
      });
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
                  Icons.account_circle,
                  size: 190,
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
                            padding:
                                EdgeInsets.only(left: 8, right: 8, top: 12),
                            child: Text(
                              "Employee Name",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 20, left: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: 'Enter Employee Name',
                              ),
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 8, right: 8, top: 12),
                            child: Text(
                              "Email",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: 'Enter Employee Email',
                              ),
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 8, right: 8, top: 12),
                            child: Text(
                              "Contact number",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: 'Enter Contact number',
                              ),
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 8, right: 8, top: 12),
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
                                      dropDownValue = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Password",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: 'Enter password',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Joining Date",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 15, right: 20),
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
