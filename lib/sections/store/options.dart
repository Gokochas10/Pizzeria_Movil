import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_restaurante/widgets/simple_option.dart';

class Options extends StatefulWidget {
  final List<String> options;

  const Options({required this.options});

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      height: 38,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.options.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: SingleOption(
              text: widget.options[index],
              selected: selectedIndex == index,
            ),
          );
        },
      ),
    );
  }
}
