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
                      Navitem(
                        title: "Dashboard",
                        changeSelectedPage: (value) =>
                            widget.changeSelectedPage(value),
                        icon: Icons.dashboard,
                        isSelected: widget.selectedPage == "dashboard",
                      ),
                      Navitem(
                        title: "Sales",
                        changeSelectedPage: (value) =>
                            widget.changeSelectedPage(value),
                        icon: Icons.device_hub,
                        isSelected: widget.selectedPage == "sales",
                      ),
                      Navitem(
                        title: "Stock",
                        changeSelectedPage: (value) =>
                            widget.changeSelectedPage(value),
                        icon: Icons.device_hub,
                        isSelected: widget.selectedPage == "stock",
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
                      // const AnimatedButton(),
                      Container(
                        color: Colors.blue,
                        padding: const EdgeInsets.all(
                          10,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    snapshot.data!.photo_uri,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${snapshot.data!.fname} ${snapshot.data!.lname}",
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${snapshot.data!.email}",
                                    style: GoogleFonts.nunito(
                                      color: Colors.white60,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                _loginBloc!.logout();
                              },
                              icon: const Icon(
                                Icons.logout,
                                size: 15,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : const Text("No data");
          }),
    );
  }
}
