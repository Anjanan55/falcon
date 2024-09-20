import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/caseform.dart';
import 'package:flutter_application_1/screens/photocard.dart';
import 'package:flutter_application_1/screens/profileform.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Falcon'),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        children: [
          SpeedDialChild(
              backgroundColor: Colors.blue,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileForm()));
              },
              child: const Icon(Icons.person_2_rounded),
              label: 'Add Profile'),
          SpeedDialChild(
              backgroundColor: Colors.amber,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CaseForm()));
              },
              child: const Icon(Icons.padding),
              label: 'Add Cases'),
          SpeedDialChild(
              backgroundColor: Colors.blue.shade200,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileForm()));
              },
              child: const Icon(Icons.add_task_rounded),
              label: 'Profile Updation'),
          SpeedDialChild(
              backgroundColor: Colors.amber.shade200,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileForm()));
              },
              child: const Icon(
                Icons.add_alert_rounded,
              ),
              label: 'Cases Updation'),
          SpeedDialChild(
              backgroundColor: Colors.green,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileForm()));
              },
              child: const Icon(Icons.data_exploration),
              label: 'Reports'),
        ],
      ),
      body: ListView(shrinkWrap: true, children: [
        Container(
          width: double.infinity,
          height: 200,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 145, 37, 29),
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(color: Colors.blueGrey, blurRadius: 19.5)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'D Team \n Rowdies',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhotoCardScreen(
                                photoDetails: [],
                                title: 'D Team',
                              )),
                    );
                  },
                  child: Image.asset('assets/images/mach.png'),
                ),
              )
            ],
          ),
        ),
        GridView.count(
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 198, 134),
                  border: Border.all(width: 3),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.blueGrey, blurRadius: 19.5)
                  ]),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/pistol.png', width: 100),
                  const Text('A - Arms',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 244, 244),
                  border: Border.all(width: 3),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.blueGrey, blurRadius: 19.5)
                  ]),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/drug.png',
                    width: 100,
                  ),
                  const Text('B - Narcotics',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 136, 239, 242),
                  border: Border.all(width: 3),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.blueGrey, blurRadius: 19.5)
                  ]),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/cheating.png',
                    width: 100,
                  ),
                  const Text('C - Cheating',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 242, 171),
                  border: Border.all(width: 3),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.blueGrey, blurRadius: 19.5)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/money.png',
                    width: 70,
                  ),
                  const Text(
                    'E - \n Economics',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
                child: Row(
              children: [Icon(Icons.person_outlined), Text('Anjanakumar')],
            )),
            Card(
              child: ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.admin_panel_settings),
                title: const Text("Admin"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
