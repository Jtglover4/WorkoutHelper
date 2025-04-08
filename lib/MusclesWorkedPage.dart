import 'package:flutter/material.dart';
import 'selections.dart';

class MusclesWorkedPage extends StatefulWidget {
  @override
  _MusclesWorkedPageState createState() => _MusclesWorkedPageState();
}

class _MusclesWorkedPageState extends State<MusclesWorkedPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Muscles Worked"),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset('assets/Diagram.png'),
            ...Info.musclePositions.entries.map((entry) {
              return Positioned(
                top: entry.value.dy,
                left: entry.value.dx,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Info.selectedMuscles[entry.key] = !(Info.selectedMuscles[entry.key] ?? false);
                    });
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Info.selectedMuscles[entry.key] ?? false ? Colors.green : Colors.transparent,
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}



