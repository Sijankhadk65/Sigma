import 'package:rxdart/rxdart.dart';
import 'package:sigma_app/src/models/user.dart';
import 'package:sigma_app/src/server/repository.dart';

class LoginBloc {
  static final LoginBloc _loginBloc = LoginBloc._internal();
  final _repo = Repository();

  User? _loggedUser;
  User? get loggedUser => _loggedUser;

  final BehaviorSubject<String> _userNameSubject = BehaviorSubject<String>();
  Stream<String> get userName => _userNameSubject.stream;
  Function(String) get changeUserName => _userNameSubject.sink.add;

  final BehaviorSubject<String> _passwordSubject = BehaviorSubject<String>();
  Stream<String> get password => _passwordSubject.stream;
  Function(String) get changePassword => _passwordSubject.sink.add;

  final BehaviorSubject<User?> _currentUserSubject = BehaviorSubject<User?>();
  Stream<User?> get currentUser => _currentUserSubject.stream;
  Function(User?) get changeCurrentUser => _currentUserSubject.sink.add;

  final BehaviorSubject<bool> _isLogginInSubject = BehaviorSubject<bool>();
  Stream<bool> get isLogginIn => _isLogginInSubject.stream;
  Function(bool) get changeisLogginIn => _isLogginInSubject.sink.add;

  void dispose() {}

  void login() {
    changeisLogginIn(true);
    _repo
        .login(
      _userNameSubject.value,
      _passwordSubject.value,
    )
        .listen((user) {
      changeCurrentUser(user);
      _loggedUser = user;
      changeisLogginIn(false);
    });
  }

  void logout() {
    changeCurrentUser(null);
    _loggedUser = null;
  }

  static LoginBloc get instance => _loginBloc;

  LoginBloc._internal() {
    changeCurrentUser(null);
    changeisLogginIn(false);
  }
}
