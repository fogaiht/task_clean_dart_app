import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/widgets/custom_line_datepicker/custom_line_datepicker_widget.dart';
import 'add_task_controller.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends ModularState<AddTaskPage, AddTaskController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            onChanged: controller.setDescription,
            decoration: InputDecoration(
              labelText: "Descricao",
              labelStyle: TextStyle(color: Theme.of(context).accentColor),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          CustomLineDataPickerWidget(
            context,
            label: "Data Inicial",
            onChangeDate: controller.setInitDate,
          ),
          CustomLineDataPickerWidget(
            context,
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
                await controller.addNewtask();
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
