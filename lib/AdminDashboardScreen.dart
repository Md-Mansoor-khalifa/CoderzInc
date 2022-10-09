import 'package:coderz_inc/employee_profile_screen.dart';
import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

String dropdownvalue = 'Item 1';

// List of items in our dropdown menu
final items = ['Name', 'Department'];

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  Widget BuildScaffoldCard() => Padding(
        padding: EdgeInsets.only(top: 12, bottom: 0, left: 12, right: 12),
        child: Container(
          height: 100,
          child: Card(
            color: Color.fromARGB(255, 206, 206, 206),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmployeeProfileScreen(),
                  ),
                );
              },
              splashColor: Colors.blue.withAlpha(30),
              child: Row(
                children: [
                  Container(
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: CircleAvatar(
                        radius: 35,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: const Text(
                              "Mohammed Mansoor Khalifa",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: const [
                              Text("mohammedmansoor.khalifa20@vit,edu"),
                              Text("Software Developer 1")
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Employees"),
        leading: const BackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
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
              icon: const Icon(Icons.filter_alt),
              iconEnabledColor: Colors.white,
              isExpanded: false,
            ),
          ),
        ],
      ),
      body: Column(
        children: [BuildScaffoldCard()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
