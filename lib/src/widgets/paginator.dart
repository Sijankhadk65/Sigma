import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Paginator extends StatefulWidget {
  const Paginator({super.key});

  @override
  State<Paginator> createState() => _PaginatorState();
}

class _PaginatorState extends State<Paginator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  5,
                ),
                bottomLeft: Radius.circular(
                  5,
                ),
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Page 1",
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                  5,
                ),
                bottomRight: Radius.circular(
                  5,
                ),
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
