import 'package:siti/views/dataH/users.dart';
import 'package:siti/views/modelH/user.dart';
import 'package:siti/views/utilsH.dart';
import 'package:siti/views/widgetH/scrollable_widget.dart';
import 'package:siti/views/widgetH/text_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:siti/views/widgetH/dropdown.dart';

class EditablePage2 extends StatefulWidget {
  @override
  _EditablePageState createState() => _EditablePageState();
}

class _EditablePageState extends State<EditablePage2> {
  List<Machine> machines;

  @override
  void initState() {
    super.initState();

    this.machines = List.of(allMachines);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: ScrollableWidget(child: buildDataTable()),
  );

  Widget buildDataTable() {
    final columns = ['Debut', 'Temps Total', 'Cause'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(machines),

    );

  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      //final isAge = column == columns[2];

      return DataColumn(
        label: Text(column),
        //numeric: isAge,
      );
    }).toList();
  }

  List<DataRow> getRows(List<Machine> machines) => machines.map((Machine machine) {
    final cells = [machine.debut, machine.total, machine.cause];

    return DataRow(
      cells: Utils.modelBuilder(cells, (index, cell) {
        final showEditIcon = index == 2;

        return DataCell(
          Text('$cell'),



          showEditIcon: showEditIcon,
          onTap: () {
            switch (index) {
              case 2:
                editCause(machine);
                break;

            }
          },
        );
      }),
    );
  }).toList();

  Future editCause(Machine editMachine) async {
    final cause = await showTextDialog(
      context,
      title: "Sélectionner la cause de l'arret",
      value: editMachine.cause,

    );



    setState(() => machines = machines.map((machine) {
      final isEditedMachine = machine == editMachine;

      return isEditedMachine ? machine.copy(cause: cause) : machine;
    }).toList());
  }


}


