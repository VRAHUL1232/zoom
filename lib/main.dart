import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
    final DatabaseReference _slot1 = FirebaseDatabase.instance
      .ref()
      .child('slot1');
    final DatabaseReference _slot2 = FirebaseDatabase.instance
      .ref()
      .child('slot2');
    final DatabaseReference _slot3 = FirebaseDatabase.instance
      .ref()
      .child('slot3');
    final DatabaseReference _slot4 = FirebaseDatabase.instance
      .ref()
      .child('slot4');
    final DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref();
    
    late bool slot1Value;
    late bool slot2Value;
    late bool slot3Value;
    late bool slot4Value;

  @override
  void initState() {
    slot1Value = true;
    slot2Value = true;
    slot3Value = true;
    slot4Value = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _slot1.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          bool value = event.snapshot.value as bool;
          slot1Value = value;
        });
      }
    });
     _slot2.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          bool value = event.snapshot.value as bool;
          slot2Value = value;
        });
      }
    });
     _slot3.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          bool value = event.snapshot.value as bool;
          slot3Value = value;
        });
      }
    });
     _slot4.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          bool value = event.snapshot.value as bool;
          slot4Value = value;
        });
      }
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(    
          title: const Center(
              child: Text(
            "SPMS PROJECT",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 150, left: 30, right: 30),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: (slot1Value) ? Colors.green : Colors.red,
                        borderRadius:BorderRadius.all(Radius.circular(15))),
                    child: Center(
                        child: Text("Slot 1",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: (slot2Value) ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Center(
                        child: Text("Slot 2",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: (slot3Value) ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Center(
                        child: Text("Slot 3",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: (slot4Value) ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Center(
                        child: Text("Slot 4",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 18,
                            height: 18,
                            child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.red))),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Occupied",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 18,
                            height: 18,
                            child: DecoratedBox(
                                decoration:
                                    BoxDecoration(color: Colors.green))),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Vacant",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

