import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import '../blocs/login_bloc.dart';
import '../events/login_event.dart';
import '../models/user_model.dart';
import '../widgets/register.dart';
import '../widgets/settings.dart';

class LoginPage extends StatelessWidget {
  bool fromSetting = false;

  LoginPage({this.fromSetting});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      appBar: new GradientAppBar(
        title: new Text('Đăng nhập'),
        centerTitle: true,
        gradient: LinearGradient(
          colors: [
            Color(0xFF012A33),
            Color(0xff22B1A9),
          ],
          stops: [
            0.1,
            0.85,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      body: SingleChildScrollView(
        child: LoginView(
          fromSetting: fromSetting,
        ),
      ),
    );
  }
}

class LoginView extends StatefulWidget {
  bool fromSetting = false;

  LoginView({this.fromSetting});

  @override
  State<StatefulWidget> createState() {
    return LoginPageState(fromSetting: fromSetting);
  }
}

class LoginPageState extends State<LoginView> {
  TextEditingController _emailInput = TextEditingController();
  TextEditingController _passWordInput = TextEditingController();
  bool _showPassword = true;
  bool _showLoading = false;
  LoginBloc _loginBloc;
  bool fromSetting = false;

  LoginPageState({this.fromSetting});

  Widget _showPasswordFnc() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showPassword = !_showPassword;
        });
      },
      child:
          _showPassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _loginBloc = LoginBloc();
    super.initState();
  }

  Widget _loggedIn() {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'Bạn đã đăng nhập\n',
          children: [
            TextSpan(
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              text: 'Chuyển sang trang chủ',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).popUntil(
                      ModalRoute.withName(Navigator.defaultRouteName));
                },
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    // ScreenUtil.instance =
    //     ScreenUtil(width: 750, height: 1280, allowFontScaling: true);
    return Provider.of<LoginBloc>(context).user.id != null
        ? _loggedIn()
        : Padding(
            padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  "./assets/images/logoSTfarm.jpg",
                  fit: BoxFit.cover,
                  height: 70,
                ),
                SizedBox(
                  height: 50,
                ),
                // ----------Error notification---------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                    child: StreamBuilder(
                        stream: _loginBloc.stream,
                        builder: (context, snapshot) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                style: BorderStyle.solid,
                                color: Colors.orange,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red[400],
                            ),
                            height: snapshot.hasError ? 25 : 0,
                            child: Text(
                              snapshot.hasError ? snapshot.error : '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          );
                        }),
                  ),
                ),
                // // ----------End Error notification---------------
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  // height: ScreenUtil.getInstance().setHeight(450),
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 15.0),
                          blurRadius: 15.0,
                        ),
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, -10.0),
                          blurRadius: 10.0,
                        )
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          controller: _emailInput,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            filled: false,
                            prefixIcon: Icon(Icons.account_circle),
                            labelText: "Tên đăng nhập",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        // height: ScreenUtil.getInstance().setHeight(50)),
                        TextFormField(
                          controller: _passWordInput,
                          obscureText: !_showPassword,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            filled: false,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: _showPasswordFnc(),
                            labelText: "Mật khẩu",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                // SizedBox(height: ScreenUtil.getInstance().setHeight(50)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        // width: ScreenUtil.getInstance().setWidth(330),
                        // height: ScreenUtil.getInstance().setHeight(100),
                        height: 60,
                        width: 250,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                            borderRadius: BorderRadius.circular(6.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFF6078ea).withOpacity(.3),
                                  offset: Offset(0.0, 8.0),
                                  blurRadius: 8.0)
                            ]),
                        child: InkWell(
                          onTap: () {
                            var isValid = _loginBloc.loginValid(LoginEvent(
                                _emailInput.text, _passWordInput.text));
                            if (isValid) {
                              setState(() {
                                _showLoading = true;
                              });
                              _loginBloc
                                  .loginQuest(
                                      _emailInput.text, _passWordInput.text)
                                  .then((data) {
                                fromSetting
                                    ? Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SettingPage()))
                                    : Navigator.of(context).pop();
                              }).catchError((err) {
                                print(err);
                              }).whenComplete(() {
                                setState(() {
                                  _showLoading = false;
                                });
                              });
                            }
                          },
                          child: Center(
                            child: Text("ĐĂNG NHẬP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: 18,
                                    letterSpacing: 1.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  // height: ScreenUtil.getInstance().setHeight(30),
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Chưa có tài khoản? ",
                      style: TextStyle(
                          fontFamily: "Poppins-Medium", fontSize: 18.0),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpForm()));
                      },
                      child: Text("Đăng ký tài khoản",
                          style: TextStyle(
                              color: Color(0xFF5d74e3),
                              fontFamily: "Poppins-Bold",
                              fontSize: 18.0)),
                    )
                  ],
                )
              ],
            ),
          );
  }
}
