import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../domain/entities/task.dart';
import '../../../../shared/widgets/custom_line_datepicker/custom_line_datepicker_widget.dart';
import 'update_task_controller.dart';

class UpdateTaskPage extends StatefulWidget {
  final Task task;

  const UpdateTaskPage({Key key, @required this.task}) : super(key: key);
  @override
  _UpdateTaskPageState createState() => _UpdateTaskPageState();
}

class _UpdateTaskPageState
    extends ModularState<UpdateTaskPage, UpdateTaskController> {
  @override
  void initState() {
    super.initState();
    controller.setTask(widget.task);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            onChanged: controller.setDescription,
            initialValue: widget.task.description,
            decoration: InputDecoration(
              labelText: "Descricao",
              labelStyle: TextStyle(color: Theme.of(context).accentColor),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          CustomLineDataPickerWidget(
            context,
            initialValue: widget.task.initTime,
            label: "Data Inicial",
            onChangeDate: controller.setInitDate,
          ),
          CustomLineDataPickerWidget(
            context,
            initialValue: widget.task.endTime,
            label: "Data Final",
            onChangeDate: controller.setEndDate,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () async {
                await controller.updatetask();
              },
              child: Text(
                "Salvar",
                style: TextStyle(color: Theme.of(context).primaryColorLight),
              ),
            ),
          )
        ],
      ),
    );
  }
}
