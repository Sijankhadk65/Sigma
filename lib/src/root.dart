import 'package:flutter/src/widgets/async.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/login_bloc.dart';
import 'package:sigma_app/src/home.dart';
import 'package:sigma_app/src/screen/login_screen.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  LoginBloc? _loginBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loginBloc = LoginBloc.instance;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _loginBloc!.currentUser,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? const Home(title: "Sigma App")
            : const LoginScreen();
      },
    );
  }
}
