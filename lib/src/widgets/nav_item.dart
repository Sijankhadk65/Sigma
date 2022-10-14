import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navitem extends StatefulWidget {
  const Navitem({
    Key? key,
    required this.title,
    required this.changeSelectedPage,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);
  final String title;
  final ValueSetter<String> changeSelectedPage;
  final IconData icon;
  final bool isSelected;

  @override
  State<Navitem> createState() => _NavitemState();
}

class _NavitemState extends State<Navitem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 5,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: widget.isSelected
                  ? const Color.fromARGB(25, 0, 255, 0)
                  : Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                onTap: () {
                  widget.changeSelectedPage(
                    widget.title.toLowerCase(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        widget.icon,
                        color:
                            widget.isSelected ? Colors.green : Colors.black45,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        widget.title,
                        style: GoogleFonts.josefinSans(
                          color:
                              widget.isSelected ? Colors.black87 : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
