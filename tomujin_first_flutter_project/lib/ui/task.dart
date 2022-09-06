import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tomujin_first_flutter_project/controller/task_controller.dart';
import 'package:tomujin_first_flutter_project/models/task.dart';
import 'package:get/get.dart';
import 'package:tomujin_first_flutter_project/ui/add_task_bar.dart';
import 'package:tomujin_first_flutter_project/ui/widget/button.dart';
import 'package:tomujin_first_flutter_project/ui/widget/task_tile.dart';

// ignore: prefer_typing_uninitialized_variables

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());

  @override
  void initState() {
    super.initState();

    setState(() {
      print("I am here");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _addDateBar(),
          SizedBox(
            height: 10,
          ),
          _showTasks(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskPage()),
          );
        },
      ),
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, index) {
              Task task = _taskController.taskList[index];

              if (task.repeat == 'Daily') {
                DateTime date =
                    Intl.withLocale('en', () => new DateFormat("HH:mm"))
                        .parse(task.startTime.toString());
                var myTime = DateFormat("HH:mm").format(date);

                return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: TaskTile(task),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              if (task.date == DateFormat.yMd().format(_selectedDate)) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: TaskTile(task),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            });
      }),
    );
  }

  _addDateBar() {
    return Container(
      padding: EdgeInsets.only(top: 80),
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: DatePicker(
        DateTime.now(),
        height: 80,
        width: 60,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.blue,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.pressStart2p(
          textStyle: const TextStyle(
              fontSize: 8, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        dayTextStyle: GoogleFonts.pressStart2p(
          textStyle: const TextStyle(
              fontSize: 8, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        monthTextStyle: GoogleFonts.pressStart2p(
          textStyle: const TextStyle(
              fontSize: 8, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        onDateChange: (date) {
          setState(() {
            _selectedDate = date;
          });
        },
      ),
    );
  }
}
