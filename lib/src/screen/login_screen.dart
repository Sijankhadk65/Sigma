import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigma_app/src/bloc/login_bloc.dart';
import 'package:sigma_app/src/models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(builder: (context, constraints) {
          return StreamBuilder<User?>(
            stream: _loginBloc.currentUser,
            builder: (context, snapshot) {
              return Container(
                width: constraints.maxWidth * 0.3,
                height: constraints.maxHeight * 0.5,
                child: Material(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Login",
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: GoogleFonts.nunito(),
                          ),
                          onChanged: (value) {
                            _loginBloc.changeUserName(value);
                          },
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: GoogleFonts.nunito(),
                          ),
                          onChanged: (value) {
                            _loginBloc.changePassword(value);
                          },
                        ),
                        SizedBox.fromSize(
                          size: const Size.fromHeight(
                            10,
                          ),
                        ),
                        StreamBuilder<bool>(
                          stream: _loginBloc.isLogginIn,
                          builder: (context, loginSnapshot) {
                            return loginSnapshot.data == false
                                ? ElevatedButton(
                                    onPressed: () {
                                      // _loginBloc.changeisLogginIn(true);
                                      _loginBloc.login();
                                    },
                                    child: Text(
                                      "Login",
                                      style: GoogleFonts.nunito(),
                                    ),
                                  )
                                : const CircularProgressIndicator();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
