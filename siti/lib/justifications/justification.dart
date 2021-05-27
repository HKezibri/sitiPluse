import 'package:flutter/material.dart';
import 'user.dart';

class DataTableDemo extends StatefulWidget {
  DataTableDemo() : super();

  final String title = "Data Table Flutter Demo";

  @override
  DataTableDemoState createState() => DataTableDemoState();
}

class DataTableDemoState extends State<DataTableDemo> {
  List<User> users;
  List<User> selectedUsers;
  bool sort;

  @override
  void initState() {
    sort = false;
    selectedUsers = [];
    users = User.getUsers();
    super.initState();
  }
  List<String> ratingList = <String>["le rouleau est terminé", "probleme mecanique", "Le thé est terminé ", 'Autre'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Justification des arrets'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: [
              DataColumn(
                label: Text("FIRST NAME"),
                numeric: false,
                tooltip: "This is First Name",
              ),
              DataColumn(
                label: Text("LAST NAME"),
                numeric: false,
                tooltip: "This is Last Name",
              ),
              DataColumn(
                label: Text("RATING"),
                numeric: false,
                tooltip: "This is their rating.",
              ),
            ],
            rows: users
                .map(
                  (user) => DataRow(cells: [
                DataCell(
                  Text(user.debut),
                ),
                DataCell(
                  Text(user.fin),
                ),
                DataCell(DropdownButton<String>(
                  value: user.justification,
                  onChanged: (String newValue) {
                    setState(() {
                      //help!
                    });
                  },
                  items: ratingList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ))
              ]),
            )
                .toList(),
          ),
        ));
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.debut.compareTo(b.fin));
      } else {
        users.sort((a, b) => b.debut.compareTo(a.fin));
      }
    }
  }

  onSelectedRow(bool selected, User user) async {
    setState(() {
      if (selected) {
        selectedUsers.add(user);
      } else {
        selectedUsers.remove(user);
      }
    });
  }

  deleteSelected() async {
    setState(() {
      if (selectedUsers.isNotEmpty) {
        List<User> temp = [];
        temp.addAll(selectedUsers);
        for (User user in temp) {
          users.remove(user);
          selectedUsers.remove(user);
        }
      }
    });
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
              label: Text("DEBUT DE L'ARRET"),
              numeric: false,
              tooltip: "This is the start time",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }),
          DataColumn(
            label: Text("FIN DE L'ARRET"),
            numeric: false,
            tooltip: "This is the end time",
          ),
        ],
        rows: users
            .map(
              (user) => DataRow(
              selected: selectedUsers.contains(user),
              onSelectChanged: (b) {
                print("Onselect");
                onSelectedRow(b, user);
              },
              cells: [
                DataCell(
                  Text(user.debut),
                  onTap: () {
                    print('Selected ${user.debut}');
                  },
                ),
                DataCell(
                  Text(user.fin),
                ),
              ]),
        )
            .toList(),
      ),
    );
  }
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: dataBody(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('SELECTED ${selectedUsers.length}'),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('DELETE SELECTED'),
                  onPressed: selectedUsers.isEmpty
                      ? null
                      : () {
                    deleteSelected();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }*/
}