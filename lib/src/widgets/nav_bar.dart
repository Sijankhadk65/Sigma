import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigma_app/src/bloc/login_bloc.dart';
import 'package:sigma_app/src/models/user.dart';
import 'package:sigma_app/src/widgets/animated_button.dart';
import 'package:sigma_app/src/widgets/nav_item.dart';

class Navbar extends StatefulWidget {
  const Navbar({
    Key? key,
    required this.changeSelectedPage,
    required this.selectedPage,
  }) : super(key: key);
  final ValueSetter<String> changeSelectedPage;
  final String selectedPage;

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  LoginBloc? _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: StreamBuilder<User?>(
          stream: _loginBloc!.currentUser,
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text("Error: ${snapshot.error}");
            return snapshot.hasData
                ? Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${snapshot.data!.fname} ${snapshot.data!.lname}",
                        style: GoogleFonts.josefinSans(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(161, 18, 148, 65),
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: Text(
                            "admin",
                            style: GoogleFonts.playfairDisplay(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Navitem(
                        title: "Dashboard",
                        changeSelectedPage: (value) =>
                            widget.changeSelectedPage(value),
                        icon: Icons.dashboard,
                        isSelected: widget.selectedPage == "dashboard",
                      ),
                      Navitem(
                        title: "Tickets",
                        changeSelectedPage: (value) =>
                            widget.changeSelectedPage(value),
                        icon: Icons.airplane_ticket,
                        isSelected: widget.selectedPage == "tickets",
                      ),
                      Navitem(
                        title: "Transactions",
                        changeSelectedPage: (value) =>
                            widget.changeSelectedPage(value),
                        icon: Icons.money_rounded,
                        isSelected: widget.selectedPage == "transactions",
                      ),
                      Navitem(
                        title: "Customers",
                        changeSelectedPage: (value) {},
                        icon: Icons.people,
                        isSelected: widget.selectedPage == "customers",
                      ),
                      Navitem(
                        title: "Workers",
                        changeSelectedPage: (value) =>
                            widget.changeSelectedPage(value),
                        icon: Icons.work,
                        isSelected: widget.selectedPage == "workers",
                      ),
                      Navitem(
                        title: "Accounts",
                        changeSelectedPage: (value) =>
                            widget.changeSelectedPage(value),
                        icon: Icons.work,
                        isSelected: widget.selectedPage == "accounts",
                      ),
                      const Spacer(),
                      const AnimatedButton(),
                    ],
                  )
                : const Text("No data");
          }),
    );
  }
}
