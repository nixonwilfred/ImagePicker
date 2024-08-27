import 'package:flutter/material.dart';

class Datatableeg extends StatefulWidget {
  const Datatableeg({super.key});

  @override
  State<Datatableeg> createState() => _DatatableegState();
}

class _DatatableegState extends State<Datatableeg> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("Data table",
          style: TextStyle(
            fontFamily: "workSans",
            color:Colors.black
          ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: [
                        DataColumn(
                            label:Text("Movies",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                        ),
                        DataColumn(
                          label:Text("Director",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                      rows: [
                        DataRow(
                          selected:true,
                            cells: [
                              DataCell(Text("Interstellar",)),
                              DataCell(Text("Christopher Nolan"))
                            ]
                        ),
                        DataRow(
                            cells: [
                              DataCell(Text("Dunkirk",)),
                              DataCell(Text("Christopher Nolan"))
                            ]
                        ),
                        DataRow(cells: [
                          DataCell(Text("Bahubali")),
                          DataCell(Text("Rajamouli"))
                        ]
                        ),
                        DataRow(cells: [
                          DataCell(Text("Bahubali 2")),
                          DataCell(Text("Rajamouli"))
                        ]
                        ),
                        DataRow(cells: [
                          DataCell(Text("Aadu Jeevidham")),
                          DataCell(Text("Blessy"))
                        ]
                        ),
                        DataRow(cells: [
                          DataCell(Text("Thanmathra")),
                          DataCell(Text("Blessy"))
                        ]
                        ),
                        DataRow(cells: [
                          DataCell(Text("Wolf of Wall street")),
                          DataCell(Text("Martine Scorsese"))
                        ]
                        ),
                        DataRow(cells: [
                          DataCell(Text("One Cut Of The Dead")),
                          DataCell(Text("Schinichirou Ueda"))
                        ]
                        ),
                        DataRow(
                            cells: [
                              DataCell(Text("Interstellar",)),
                              DataCell(Text("Christopher Nolan"))
                            ]
                        ),
                        DataRow(
                            cells: [
                              DataCell(Text("Dunkirk",)),
                              DataCell(Text("Christopher Nolan"))
                            ]
                        ),
                        DataRow(cells: [
                          DataCell(Text("Bahubali")),
                          DataCell(Text("Rajamouli"))
                        ]
                        ),
                        DataRow(cells: [
                          DataCell(Text("Bahubali 2")),
                          DataCell(Text("Rajamouli"))
                        ]
                        ),
                        DataRow(cells: [
                          DataCell(Text("Aadu Jeevidham")),
                          DataCell(Text("Blessy"))
                        ]
                        ),
                        DataRow(cells: [
                          DataCell(Text("Thanmathra")),
                          DataCell(Text("Blessy"))
                        ]
                        ),
                        DataRow(cells: [
                          DataCell(Text("Wolf of Wall street")),
                          DataCell(Text("Martine Scorsese"))
                        ]
                        ),
                        DataRow(cells: [
                          DataCell(Text("One Cut Of The Dead")),
                          DataCell(Text("Schinichirou Ueda"))
                        ]
                        ),
          
          
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        
      ),
    );
  }
}
