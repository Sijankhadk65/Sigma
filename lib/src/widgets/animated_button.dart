import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      decoration: BoxDecoration(
          color: isHover ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(
            10,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(
                0,
                isHover ? 5 : 1,
              ),
              blurRadius: isHover ? 5 : 1,
            )
          ]),
      child: MouseRegion(
        onEnter: (enter) => setState(() {
          isHover = true;
        }),
        onExit: (exit) => setState(() {
          isHover = false;
        }),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(
            10,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(
              10,
            ),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: Text(
                "Logout",
                style: GoogleFonts.josefinSans(
                  color: isHover ? Colors.white : Colors.black38,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
