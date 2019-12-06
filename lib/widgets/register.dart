import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

import 'package:mongo_dart/mongo_dart.dart' hide State;
import 'package:shrimp_2/blocs/login_bloc.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class Role {
  final String name;
  const Role(this.name);
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _scafoldKey = GlobalKey<ScaffoldState>();
  final _userNameEditController = TextEditingController();
  final _phoneNumberEditController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameEditController = TextEditingController();
  final _addressEditController = TextEditingController();
  bool _showLoading = false;
  Db db;
  LoginBloc accountBloc;

  int _selectedRoleIndex; // role id

  bool _obscureText = true;

  var now = DateTime.now();

  Role _selectedRole;
  List<Role> roles = <Role>[
    const Role('Nông dân'),
    const Role('Đại lý'),
    const Role("Nghiên cứu sinh viên"),
    const Role("Quản trị viên"),
    const Role("Khuyến nông tỉnh")
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    accountBloc = SettingBloc();
  }

  @override
  void dispose() async {
    // TODO: implement dispose
//    accountBloc.disposeRegiter();
//    accountBloc.disposeCreateFarmer();
//    accountBloc.disposeLogin();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child: Text('What the...'),);
  }

//  void _submit() {
//    var isValid = accountBloc.registerValid(
//        _userNameEditController.text,
//        _passwordController.text,
//        _fullNameEditController.text,
//        _phoneNumberEditController.text,
//        _addressEditController.text,
//    );
//    if (isValid) {
//      setState(() {
//        _showLoading = true;
//      });
//      accountBloc.registerRequest(
//        username: _userNameEditController.text,
//        password: _passwordController.text,
//        fullname: _fullNameEditController.text,
//        phonenumber: _phoneNumberEditController.text,
//        address: _addressEditController.text,
//      )
//      .then((data) {
//        Navigator.of(context).pop();
//      })
//      .catchError((err) => print('Error: $err'))
//      .whenComplete(() {
//        setState(() {
//        _showLoading = false;
//      });
//
//      });
//    }
//  }
//
//  //--------------------------------pick image----------------------
//  File _image;
//  //-----------pick image form gallery
//  Future<Null> _pickImageFromGallery() async {
//    final File imageFile =
//        await ImagePicker.pickImage(source: ImageSource.gallery);
//    setState(() {
//      this._image = imageFile;
//    });
//  }
//
//  //-------------pick image from camera
//  Future<Null> _pickImageFromCamera() async {
//    final File imageFile =
//        await ImagePicker.pickImage(source: ImageSource.camera);
//    setState(() {
//      this._image = imageFile;
//    });
//  }
//  //------------- end pick image --------------------------------------
//
//  @override
//  Widget build(BuildContext context) {
//    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
//    ScreenUtil.instance =
//        ScreenUtil(width: 750, height: 1280, allowFontScaling: true);
//    return Scaffold(
//      backgroundColor: Colors.white,
//      resizeToAvoidBottomPadding: true,
//      appBar: new GradientAppBar(
//        title: new Text('Đăng Ký'),
//        centerTitle: true,
//        gradient: LinearGradient(
//          colors: [
//            Color(0xFF012A33),
//            Color(0xff22B1A9),
//          ],
//          stops: [
//            0.1,
//            0.85,
//          ],
//          begin: Alignment.bottomLeft,
//          end: Alignment.topRight,
//        ),
//      ),
//      body: new Stack(
//        fit: StackFit.expand,
//        children: <Widget>[
//          Column(
//            crossAxisAlignment: CrossAxisAlignment.end,
//            children: <Widget>[
//              // Padding(
//              //   padding: EdgeInsets.only(top: 50.0),
//              //   //child: Image.asset("./assets/image_01.png"),
//              // ),
//              Expanded(
//                child: Container(),
//              ),
//              Image.asset("./assets/images/image_02.png")
//            ],
//          ),
//          SingleChildScrollView(
//            child: Padding(
//              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
//              child: Column(
//                children: <Widget>[
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Image.asset(
//                        "./assets/images/logoSTfarm.jpg",
//                        width: ScreenUtil.getInstance().setWidth(300),
//                        height: ScreenUtil.getInstance().setHeight(100),
//                      ),
//                    ],
//                  ),
//                  SizedBox(
//                    height: ScreenUtil.getInstance().setHeight(50),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                    child: StreamBuilder(
//                        stream: accountBloc.regisStream,
//                        builder: (context, snapshot) {
//                          print(snapshot.connectionState);
//                          print("snnap: " + snapshot.hasError.toString());
//                          //if (snapshot.hasError)
//                          return Container(
//                            decoration: BoxDecoration(
//                              border: Border.all(
//                                  style: BorderStyle.solid,
//                                  color: Colors.orange,
//                                  width: 2),
//                              borderRadius: BorderRadius.circular(5),
//                              color: Colors.red[400],
//                            ),
//                            height: snapshot.hasError ? 25 : 0,
//                            child: Text(
//                              snapshot.hasError ? snapshot.error : '',
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontSize: 17,
//                                  fontWeight: FontWeight.w500),
//                            ),
//                          );
//                        }),
//                  ),
//                  //profileImage, //pick image
//
//                  SizedBox(
//                    height: ScreenUtil.getInstance().setHeight(50),
//                  ),
//                  Form(
//                    key: _formKey,
//                    child: Padding(
//                      padding:
//                          EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          //-------------------- username----------------
//                          TextFormField(
//                            controller: _userNameEditController,
//                            validator: (value) {
//                              if (value.isEmpty) {
//                                return "Không được bỏ trống.";
//                              }
//                              return null;
//                            },
//                            decoration: customInputDecoration("Tên đăng nhập"),
//                          ),
//                          SizedBox(
//                            height: 10.0,
//                          ),
//                          //---------------password------------------
//                          TextFormField(
//                            controller: _passwordController,
//                            validator: (value) {
//                              if (value.isEmpty) {
//                                return "Không được bỏ trống.";
//                              }
//                              return null;
//                            },
//                            obscureText: _obscureText,
//                            decoration: InputDecoration(
//                              enabledBorder: UnderlineInputBorder(
//                                borderSide: BorderSide(color: Colors.black),
//                              ),
//                              focusedBorder: UnderlineInputBorder(
//                                  borderSide: BorderSide(color: Colors.green)),
//                              filled: false,
//                              //icon: Icon(Icons.lock),
//                              labelText: "Mật khẩu",
//                              suffixIcon: new GestureDetector(
//                                onTap: () {
//                                  setState(() {
//                                    _obscureText = !_obscureText;
//                                  });
//                                },
//                                child: new Icon(_obscureText
//                                    ? Icons.visibility
//                                    : Icons.visibility_off),
//                              ),
//                            ),
//                          ),
//                          SizedBox(
//                            height: 30.0,
//                          ),
//                          TextFormField(
//                            controller: _fullNameEditController,
//                            validator: (value) {
//                              if (value.isEmpty) {
//                                return "Không được bỏ trống.";
//                              }
//                              return null;
//                            },
//                            decoration: customInputDecoration("Họ tên "),
//                          ),
//                          SizedBox(
//                            height: 30.0,
//                          ),
//                          //---------------- phone number------------------
//                          TextFormField(
//                            controller: _phoneNumberEditController,
//                            textInputAction: TextInputAction.next,
//                            validator: (value) {
//                              if (value.isEmpty) {
//                                return "Không được bỏ trống.";
//                              }
//                              return null;
//                            },
//                            decoration: customInputDecoration("Số điện thoại "),
//                            keyboardType: TextInputType.phone,
//                            maxLength: 10,
//                          ),
//                          SizedBox(
//                            height: 10.0,
//                          ),
//                          //-------------------address-----------------
//                          TextFormField(
//                            controller: _addressEditController,
//                            validator: (value) {
//                              if (value.isEmpty) {
//                                return "Không được bỏ trống.";
//                              }
//                              return null;
//                            },
//                            decoration: customInputDecoration("Địa chỉ"),
//                          ),
//                          SizedBox(
//                            height: 0.0,
//                          ),
//                          //--------dropdownlist role-------from database
//                          // FutureBuilder<List<Role>>(
//                          //   future: ctr.getRole(),
//                          //   builder: (context, snapshot){
//                          //     if(!snapshot.hasData) return CircularProgressIndicator();
//                          //     return DropdownButton<Role>(
//                          //       items: snapshot.data.map((role)=>DropdownMenuItem<Role>(
//                          //          child: Row(
//                          //           children: <Widget>[
//                          //             SizedBox(width: 50,),
//                          //             Text(
//                          //               role.rolename,
//                          //               style:  TextStyle(color: Colors.blue),
//                          //             ),
//                          //           ],
//                          //         ),
//                          //         value: role,
//                          //       )).toList(),
//                          //       onChanged: (Role newValue){
//                          //         setState(() {
//                          //          _currentRole = newValue;
//
//                          //         });
//                          //       },
//                          //       isExpanded: false,
//                          //       // value: _currentRole,
//                          //       hint: Text("chọn vai trò"),
//                          //     );
//                          //   },
//                          // ),
//
//                          //----------------role----------------
//                          // FormField(
//                          //   builder: (FormFieldState state) {
//                          //     return InputDecorator(
//                          //       decoration: InputDecoration(
//                          //           //icon: Icon(Icons.bookmark),
//                          //           //labelText: "Vai trò",
//                          //           ),
//                          //       child: new DropdownButtonHideUnderline(
//                          //         child: new DropdownButton<Role>(
//                          //           hint: Text("Chọn vai trò"),
//                          //           value: _selectedRole,
//                          //           //value: roles[0],
//                          //           onChanged: (Role newValue) {
//                          //             setState(() {
//                          //               _selectedRole = newValue;
//                          //               _selectedRoleIndex =
//                          //                   roles.indexOf(newValue);
//                          //               print(_selectedRoleIndex + 1);
//                          //             });
//                          //           },
//                          //           items: roles.map((Role _role) {
//                          //             return new DropdownMenuItem<Role>(
//                          //               value: _role,
//                          //               child: new Text(
//                          //                 _role.name,
//                          //                 style: new TextStyle(
//                          //                     color: Colors.black),
//                          //               ),
//                          //             );
//                          //           }).toList(),
//                          //         ),
//                          //       ),
//                          //     );
//                          //   },
//                          // ),
//                          //--------------------
//                        ],
//                      ),
//                    ),
//                  ),
//                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
//                  _showLoading
//                      ? LinearProgressIndicator()
//                      : SizedBox(
//                          height: 20,
//                        ),
//                  SizedBox(
//                    height: 20,
//                  ),
//                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      InkWell(
//                        child: Container(
//                          width: ScreenUtil.getInstance().setWidth(330),
//                          height: ScreenUtil.getInstance().setHeight(100),
//                          decoration: BoxDecoration(
//                              gradient: LinearGradient(colors: [
//                                Color(0xFF17ead9),
//                                Color(0xFF6078ea)
//                              ]),
//                              borderRadius: BorderRadius.circular(6.0),
//                              boxShadow: [
//                                BoxShadow(
//                                    color: Color(0xFF6078ea).withOpacity(.3),
//                                    offset: Offset(0.0, 8.0),
//                                    blurRadius: 8.0)
//                              ]),
//                          child: Material(
//                            color: Colors.transparent,
//                            child: InkWell(
//                              onTap: _submit,
//                              child: Center(
//                                child: Text("ĐĂNG KÝ",
//                                    style: TextStyle(
//                                        color: Colors.white,
//                                        fontFamily: "Poppins-Bold",
//                                        fontSize: 18,
//                                        letterSpacing: 1.0)),
//                              ),
//                            ),
//                          ),
//                        ),
//                      )
//                    ],
//                  ),
//                  SizedBox(
//                    height: ScreenUtil.getInstance().setHeight(30),
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text(
//                        "Đã có tài khoản. ",
//                        style: TextStyle(
//                            fontFamily: "Poppins-Medium", fontSize: 18.0),
//                      ),
//                      InkWell(
//                        onTap: () {
//                          Navigator.pushReplacement(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => LoginPage()));
//                        },
//                        child: Text("Đăng nhập",
//                            style: TextStyle(
//                                color: Color(0xFF5d74e3),
//                                fontFamily: "Poppins-Bold",
//                                fontSize: 18.0)),
//                      )
//                    ],
//                  ),
//                  SizedBox(
//                    height: ScreenUtil.getInstance().setHeight(30),
//                  ),
//                ],
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//    // //----------------profile image---------------
//    // var profileImage = new Row(
//    //   mainAxisAlignment: MainAxisAlignment.end,
//    //   children: <Widget>[
//    //     ButtonBar(
//    //       children: <Widget>[
//    //         IconButton(
//    //           icon: Icon(Icons.photo_camera),
//    //           onPressed: _pickImageFromCamera,
//    //           tooltip: "Chụp ảnh mới",
//    //         ),
//    //         IconButton(
//    //           icon: Icon(Icons.photo_library),
//    //           onPressed: _pickImageFromGallery,
//    //           tooltip: "Chọn ảnh từ bộ sưu tập",
//    //         ),
//    //       ],
//    //     ),
//    //     this._image == null
//    //         ? new Center(
//    //             child: new Column(
//    //             crossAxisAlignment: CrossAxisAlignment.center,
//    //             mainAxisAlignment: MainAxisAlignment.center,
//    //             children: <Widget>[
//    //               new Container(
//    //                   width: 100.0,
//    //                   height: 100.0,
//    //                   decoration: new BoxDecoration(
//    //                       shape: BoxShape.circle,
//    //                       border: Border.all(color: Colors.blueAccent),
//    //                       image: new DecorationImage(
//    //                           fit: BoxFit.fill,
//    //                           image: new NetworkImage(
//    //                               "http://icons.iconarchive.com/icons/papirus-team/papirus-apps/256/system-users-icon.png")))),
//    //               new SizedBox(
//    //                 height: 24.0,
//    //               ),
//    //               new Text("Ảnh đại diện", textScaleFactor: 1.0)
//    //             ],
//    //           ))
//    //         : new Container(
//    //             width: 100.0,
//    //             height: 100.0,
//    //             decoration: BoxDecoration(
//    //               shape: BoxShape.circle,
//    //               border: Border.all(color: Colors.blueAccent),
//    //               image: new DecorationImage(
//    //                 fit: BoxFit.cover,
//    //                 image: new ExactAssetImage(_image.path),
//    //               ),
//    //             ),
//    //           )
//    //   ],
//    // );
//    // //----------------end profile image-----------------
//    //----------------------login form---------------
//  }
//
//  TextStyle getTextStyle() {
//    return TextStyle(
//      fontSize: 18,
//      color: Colors.black,
//    );
//  }
//
//  InputDecoration customInputDecoration(String label) {
//    return InputDecoration(
//      //hintText: hint,
//      labelText: label,
//      //icon: Icon(icon),
//      hintStyle: TextStyle(color: Colors.teal),
//      contentPadding: EdgeInsets.all(0),
//      enabledBorder:
//          UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//      focusedBorder: UnderlineInputBorder(
//          borderSide: BorderSide(
//        color: Colors.green,
//      )),
//    );
//  }
}
