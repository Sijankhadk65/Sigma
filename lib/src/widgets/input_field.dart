import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.onChanged,
    required this.fieldHint,
    required this.fieldLabel,
  }) : super(key: key);

  final String fieldLabel;
  final String fieldHint;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              fieldLabel,
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                border: Border.all(
                  color: Colors.black26,
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: fieldHint,
                  hintStyle: GoogleFonts.nunito(),
                ),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
