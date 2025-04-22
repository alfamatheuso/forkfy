import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginRepository repository;
  _LoginControllerBase(this.repository);

  @observable
  bool loading = false;

  @observable
  String error = '';

  @action
  Future<bool> login(String email, String password) async {
    loading = true;
    error = '';
    bool result = await repository.authenticate(LoginModel(email: email, password: password));
    loading = false;
    if (!result) error = 'Credenciais inválidas';
    return result;
  }
}