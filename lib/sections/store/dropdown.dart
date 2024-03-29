import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:proyecto_restaurante/services/user_services.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyWidgetState createState() => _MyWidgetState();
}

String? index;

class _MyWidgetState extends State<MyWidget> {
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    fetchTableData();
  }

  fetchTableData() async {
    List<dynamic> tables = await UserServices().getTables();
    setState(() {
      items = tables.map((table) => 'Mesa ${table['id']}').toList();
    });
  }

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Mesas Disponibles',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: items
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                  index = selectedValue?.split(' ')[1].toString();
                  print(index);
                });
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                width: 140,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: fetchTableData,
          ),
        ],
      ),
    );
  }
}
