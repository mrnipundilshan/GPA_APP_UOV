import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Subject extends StatefulWidget {
  final Function(SubjectState) onSubjectStateCreated;
  final String subname;
  final String type;
  final double credit;
  late SubjectState subjectState;

  Subject(
      {Key? key,
      required this.subname,
      required this.type,
      required this.credit,
      required this.onSubjectStateCreated})
      : super(key: key);

  void resetDropdownValue() {
    subjectState.resetDropdownValue();
  }

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  SubjectState createState() {
    subjectState = SubjectState();
    onSubjectStateCreated(subjectState);
    return subjectState;
  }
}

class SubjectState extends State<Subject> {
  String? dropdownValue = null;

  void resetDropdownValue() {
    setState(() {
      grademarkscheck = 0.0;
      dropdownValue = null;
    });
  }

  double grademarks = 0.0;
  double grademarkscheck = 0.0;
  double aftermultiple = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 380,
      decoration: const BoxDecoration(
        color: Color.fromARGB(64, 97, 149, 91),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Text(
            widget.subname,
            style: const TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.type,
                style: const TextStyle(fontSize: 20.0),
              ),
              Text(
                "   Credit = ${widget.credit}",
                style: const TextStyle(fontSize: 20.0),
              ),
              DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue;
                    if (dropdownValue == "A+ / A") {
                      grademarks = 4.0;
                    }
                    if (dropdownValue == "A-") {
                      grademarks = 3.7;
                    }
                    if (dropdownValue == "B+") {
                      grademarks = 3.3;
                    }
                    if (dropdownValue == "B") {
                      grademarks = 3.0;
                    }
                    if (dropdownValue == "B-") {
                      grademarks = 2.7;
                    }
                    if (dropdownValue == "C+") {
                      grademarks = 2.3;
                    }
                    if (dropdownValue == "C") {
                      grademarks = 2.0;
                    }
                    if (dropdownValue == "C-") {
                      grademarks = 1.7;
                    }
                    if (dropdownValue == "D+") {
                      grademarks = 1.3;
                    }
                    if (dropdownValue == "D") {
                      grademarks = 1.0;
                    }
                    if (dropdownValue == "E") {
                      grademarks = 0.0;
                    }

                    grademarkscheck = 1.0;
                    aftermultiple = grademarks * widget.credit;
                  });
                },
                items: <String>[
                  'A+ / A',
                  'A-',
                  'B+',
                  'B',
                  'B-',
                  'C+',
                  'C',
                  'C-',
                  'D+',
                  'D',
                  'E',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: const Text(
                  'Result',
                  style: TextStyle(fontSize: 20.0),
                ), // Set hint text
              ),
            ],
          ),
        ],
      ),
    );
  }
}
