import 'package:get/get.dart';
import 'package:tomujin_first_flutter_project/models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    // getTasks();
    super.onReady();
  }

  var taskList = <Task>[].obs;

  // Future<int> addTask({Task? task})  {
  //   // return  DBHelper.insert(task);
  // }

  // void getTasks() async {
  //   List<Map<String, dynamic>> tasks = await DBHelper.query();
  //   taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  // }

  // void delete(Task task) {
  //   DBHelper.delete(task);
  //   getTasks();
  // }

  // void markTaskComplated(int id) async {
  //   await DBHelper.update(id);
  //   getTasks();
  // }
}
