import 'package:flutter/material.dart';
import 'subject.dart';

class myhomepage extends StatefulWidget {
  const myhomepage({Key? key}) : super(key: key);

  @override
  State<myhomepage> createState() => _myhomepageState();
}

class _myhomepageState extends State<myhomepage> {
  String finalre = "4.0";
  int decimalPlaces = 2;

  late SubjectState subjectState1;
  late SubjectState subjectState2;
  late SubjectState subjectState3;
  late SubjectState subjectState4;
  late SubjectState subjectState5;
  late SubjectState subjectState6;
  late SubjectState subjectState7;
  late SubjectState subjectState8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 94, 167, 88),
          centerTitle: true,
          title: const Text(
            "GPA CALCULATOR UOV IT",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(13),
          width: 420,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 38, 46, 37),
          ),
          alignment: Alignment.topCenter,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Subject(
                subname: "Fundamentals of Information Technology",
                type: "Theory    ",
                credit: 2,
                onSubjectStateCreated: (subjectState) {
                  this.subjectState1 = subjectState;
                },
              ),
              SizedBox(height: 20), // Add some spacing between the subjects
              Subject(
                subname: "Fundamentals of Information Technology",
                type: "Practical",
                credit: 1,
                onSubjectStateCreated: (subjectState) {
                  this.subjectState2 = subjectState;
                },
              ),
              SizedBox(height: 20), // Add some spacing between the subjects
              Subject(
                subname: "Foundation of Mathematics",
                type: "Theory    ",
                credit: 2,
                onSubjectStateCreated: (subjectState) {
                  this.subjectState3 = subjectState;
                },
              ),
              SizedBox(height: 20), // Add some spacing between the subjects
              Subject(
                subname: "Fundamentals of Programming",
                type: "Theory    ",
                credit: 2,
                onSubjectStateCreated: (subjectState) {
                  this.subjectState4 = subjectState;
                },
              ),
              SizedBox(height: 20), // Add some spacing between the subjects
              Subject(
                subname: "Fundamentals of Programming",
                type: "Practical",
                credit: 2,
                onSubjectStateCreated: (subjectState) {
                  this.subjectState5 = subjectState;
                },
              ),
              SizedBox(height: 20), // Add some spacing between the subjects
              Subject(
                subname: "Fundamentals of Web Programming",
                type: "Theory    ",
                credit: 2,
                onSubjectStateCreated: (subjectState) {
                  this.subjectState6 = subjectState;
                },
              ),
              SizedBox(height: 20), // Add some spacing between the subjects
              Subject(
                subname: "Fundamentals of Web Programming",
                type: "Practical",
                credit: 2,
                onSubjectStateCreated: (subjectState) {
                  this.subjectState7 = subjectState;
                },
              ),
              SizedBox(height: 20), // Add some spacing between the subjects
              Subject(
                subname: "Essentials of Statistics",
                type: "Theory    ",
                credit: 2,
                onSubjectStateCreated: (subjectState) {
                  this.subjectState8 = subjectState;
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  button1(context),
                  button2(context),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 50,
          child: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 94, 167, 88)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "FINAL GPA",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(54, 10, 31, 8),
                    ),
                    child: Text(
                      finalre,
                    )),
              ],
            ),
          ),
        ));
  }

  Container button2(BuildContext context) {
    return Container(
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          if (subjectState1.grademarkscheck == 1 &&
                  subjectState2.grademarkscheck == 1 &&
                  subjectState3.grademarkscheck == 1 &&
                  subjectState4.grademarkscheck == 1 &&
                  subjectState5.grademarkscheck == 1 &&
                  subjectState6.grademarkscheck == 1 &&
                  subjectState7.grademarkscheck == 1
              // subjectState8.grademarkscheck == 1
              ) {
            setState(() {
              double itgpa =
                  (subjectState1.aftermultiple + subjectState2.aftermultiple) /
                      3;
              String formattedValue = itgpa.toStringAsFixed(decimalPlaces);
              finalre = formattedValue;
            });
          } else {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                backgroundColor: Color.fromARGB(64, 97, 149, 91),
                title: const Text(
                  "Alert",
                  textAlign: TextAlign.center,
                ),
                content: const Text(
                  "Fill all subjects results",
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: Color.fromARGB(255, 94, 167, 88),
                      padding: const EdgeInsets.all(14),
                      child: const Text(
                        "OK",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          print("pressed");
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green, // Background color
        ),
        child: const Text('View GPA'),
      ),
    );
  }

  Container button1(BuildContext context) {
    return Container(
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            subjectState1.resetDropdownValue();
            subjectState2.resetDropdownValue();
            subjectState3.resetDropdownValue();
            subjectState4.resetDropdownValue();
            subjectState5.resetDropdownValue();
            subjectState6.resetDropdownValue();
            subjectState7.resetDropdownValue();
            //subjectState8.resetDropdownValue();
          });
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green, // Background color
        ),
        child: const Text('Reset Results'),
      ),
    );
  }
}
