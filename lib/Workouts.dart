import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'WorkoutList.dart';

class WorkoutsPage extends StatefulWidget {
  @override
  _WorkoutsPageState createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  List<Workout> workouts = [];

  void _addWorkout() async {
    final String? newName = await showDialog<String>(
      context: context,
      builder: (BuildContext context) => AddWorkoutDialog(),
    );

    if (newName != null && newName.isNotEmpty) {
      setState(() {
        workouts.add(Workout(id: DateTime.now().toString(), name: newName, isCompleted: false));
      });
    }
  }

  void _clearCompletedWorkouts() {
    setState(() {
      workouts.removeWhere((workout) => workout.isCompleted);
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Completed workouts cleared")));
  }

  void _navigateToMusclesWorkedPage() {
    Navigator.pushNamed(context, '/m');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Workouts"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_sweep),
            onPressed: _clearCompletedWorkouts,
            tooltip: 'Clear Completed Workouts',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          final workout = workouts[index];
          return Dismissible(
            key: Key(workout.id),
            onDismissed: (direction) {
              setState(() {
                workouts.removeAt(index);
              });

              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("${workout.name} deleted")));
            },
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(workout.name),
              trailing: Switch(
                value: workout.isCompleted,
                onChanged: (bool newValue) {
                  setState(() {
                    workout.isCompleted = newValue;
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
        child: FloatingActionButton(
          onPressed: _addWorkout,
          child: Icon(Icons.add),
          tooltip: 'Add Workout',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.fitness_center),
              onPressed: _navigateToMusclesWorkedPage,
            ),
          ],
        ),
      ),
    );
  }
}

class AddWorkoutDialog extends StatefulWidget {
  @override
  _AddWorkoutDialogState createState() => _AddWorkoutDialogState();
}

class _AddWorkoutDialogState extends State<AddWorkoutDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Workout'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: "Workout Name"),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text('Add'),
          onPressed: () => Navigator.of(context).pop(_controller.text),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
