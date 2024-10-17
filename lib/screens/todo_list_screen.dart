import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../controllers/task_controller.dart';
import '../models/task_model.dart';

class TodoListScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());
  final TextEditingController taskControllerInput = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool showCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        actions: [
          IconButton(
            icon: Icon(showCompleted ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              showCompleted = !showCompleted;
              taskController.tasks.refresh(); // Refresh UI
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDate,
            firstDay: DateTime.now().subtract(Duration(days: 30)),
            lastDay: DateTime.now().add(Duration(days: 30)),
            onDaySelected: (selectedDay, focusedDay) {
              selectedDate = selectedDay;
              taskController.tasks.refresh(); // Refresh tasks
            },
          ),
          Expanded(
            child: Obx(() {
              final tasks = taskController.tasks.where((task) =>
              (task.dueDate.isAtSameMomentAs(selectedDate) || task.dueDate.isAfter(selectedDate)) &&
                  (showCompleted || !task.isCompleted)).toList();

              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index].title),
                    subtitle: Text("Due: ${tasks[index].dueDate.toLocal()}"),
                    trailing: Checkbox(
                      value: tasks[index].isCompleted,
                      onChanged: (value) {
                        tasks[index].isCompleted = value!;
                        taskController.updateTask(tasks[index]);
                      },
                    ),
                    onLongPress: () {
                      taskController.deleteTask(tasks[index].id!);
                    },
                  );
                },
              );
            }),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskControllerInput,
                    decoration: InputDecoration(labelText: 'New Task'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (taskControllerInput.text.isNotEmpty) {
                      final newTask = Task(
                        title: taskControllerInput.text,
                        dueDate: selectedDate,
                      );
                      taskController.addTask(newTask);
                      taskControllerInput.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
