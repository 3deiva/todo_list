import 'package:get/get.dart';
import '../models/task_model.dart';
import '../services/database_service.dart';
import '../notifications/notification_service.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  final DatabaseService dbService = DatabaseService();
  final NotificationService notificationService = NotificationService();

  @override
  void onInit() {
    fetchTasks();
    super.onInit();
  }

  void fetchTasks() async {
    tasks.value = await dbService.getTasks();
  }

  void addTask(Task task) async {
    await dbService.insertTask(task);
    await notificationService.showNotification(0, "New Task Added", task.title);
    fetchTasks();
  }

  void updateTask(Task task) async {
    await dbService.updateTask(task);
    fetchTasks();
  }

  void deleteTask(int id) async {
    await dbService.deleteTask(id);
    fetchTasks();
  }
}
