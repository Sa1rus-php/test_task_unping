import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test tast',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool visible = false;
  int _activeStepIndex = 0;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  String dropdownValue_1 = '';
  String dropdownValue_2 = '';
  TextEditingController teamname = TextEditingController();
  TextEditingController teamsize = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController house = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController city = TextEditingController();

  Future userRegistration() async {
    // Getting value from Controll

    // Store all data with Param Name.
    var data = {
      'first_name': firstname.text,
      'last_name': lastname.text,
      'role': dropdownValue_1,
      'industry': dropdownValue_2,
      'team_name': teamname.text,
      'team_size': teamsize.text,
      'address': address.text,
      'house_num': house.text,
      'zip_city': zip.text,
      'city_name': city.text,
    };

    var url = 'http://localhost:5555/index.php';
    var url_2 = 'http://webhook.site/56ba2f21-1a3a-40c5-9dbc-1c675db40a9b';

    // Starting Web API Call.
    var response = await http.post(
      Uri.parse(url),
      body: data,
    );
    var response_2 = await http.post(
      Uri.parse(url_2),
      body: data,
    );

    if (response.statusCode == 200) {
      var message = json.decode(response.body);
      if (message == "Error") {
        Fluttertoast.showToast(
            msg: "This Company Already Exit!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Registation Successful!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    if (response_2.body.isNotEmpty) {
      json.decode(response_2.body);
    }
  }

  StepperType stepperType = StepperType.horizontal;
  switchStepType() {
    setState(() {
      stepperType == StepperType.horizontal
          ? stepperType == StepperType.vertical
          : stepperType = StepperType.horizontal;
    });
  }

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex == 0,
          title: const Text('Info'),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: firstname,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: lastname,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButton<String>(
                  value: dropdownValue_1.isNotEmpty ? dropdownValue_1 : null,
                  hint: const Text("Role in your Company"),
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  icon: Icon(Icons.arrow_drop_down_circle),
                  iconDisabledColor: Colors.yellow,
                  iconEnabledColor: Colors.yellow,
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue_1 = newValue!;
                    });
                  },
                  items: <String>['CEO', 'CTO', 'Employee', 'Assistant']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex == 1,
          title: const Text('Team'),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: teamname,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Team Name',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: teamsize,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Team size',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButton<String>(
                  value: dropdownValue_2.isNotEmpty ? dropdownValue_2 : null,
                  hint: const Text("Industry in your Company"),
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  icon: Icon(Icons.arrow_drop_down_circle),
                  iconDisabledColor: Colors.yellow,
                  iconEnabledColor: Colors.yellow,
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue_2 = newValue!;
                    });
                  },
                  items: <String>['IT', 'Bank', 'Security', 'Restaurant']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ),
        Step(
            state:
                _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex == 2,
            title: const Text('Invoice'),
            content: Container(
              child: Column(
                children: [
                  TextField(
                    controller: address,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Address including street',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: house,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'House number',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: zip,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Zip code',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: city,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'City',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // RaisedButton(
                  //   onPressed: userRegistration,
                  //   color: Colors.green,
                  //   textColor: Colors.white,
                  //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  //   child: Text('Click Here To Register User Online'),
                  // ),
                ],
              ),
            )),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dmitriy Rekhlitskiy'),
        centerTitle: true,
      ),
      body: Stepper(
        currentStep: _activeStepIndex,
        type: StepperType.horizontal,
        steps: stepList(),
        onStepTapped: (step) {
          setState(() {
            _activeStepIndex = step;
          });
        },
        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1)) {
            _activeStepIndex++;
          }
          if (city.text.isEmpty) {
          } else {
            userRegistration();
          }
          setState(() {});
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }
          _activeStepIndex--;
          setState(() {});
        },
      ),
    );
  }
}
