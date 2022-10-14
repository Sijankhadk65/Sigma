import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem<T> extends StatelessWidget {
  const SummaryItem({
    Key? key,
    this.childStream,
    required this.childLabel,
    this.placeholder,
    this.child,
  }) : super(key: key);

  final Stream<String>? childStream;
  final String childLabel;
  final Widget? child;
  final String? placeholder;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              childLabel,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(137, 0, 0, 0),
                fontSize: 15,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            child: child != null
                ? child!
                : StreamBuilder<String>(
                    stream: childStream,
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.hasData ? snapshot.data! : placeholder!,
                        textAlign: TextAlign.end,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color:
                              snapshot.hasData ? Colors.black : Colors.black54,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
