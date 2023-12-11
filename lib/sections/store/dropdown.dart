import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:proyecto_restaurante/services/user_services.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DropDown createState() => _DropDown();
}
  String? index;
class _DropDown extends State<DropDown> {
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
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Select Item',
            style: TextStyle(
              fontSize: 14,
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
              index=selectedValue?.split(' ')[1].toString();
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
    );
  }
}