import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              backgroundColor: Colors.grey[300],
              appBar: new GradientAppBar(
                title: new Text('Cài đặt'),
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
              body: new SettingsScreen());
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

void getImages() {}
void updateInfo() {}

class _SettingsScreenState extends State<SettingsScreen> {

  Map<String, String> userInfo = {
    'userName': 'Đồng Thị Hồng Anh',
    'city': 'Can Tho',
    'company': 'Can Tho University',
    'email': 'anhb1605260@gmail.com',
    'phone': '0789549663',
    'joinDate': DateTime(2019, 10, 6).toString(),
    'coverImage': 'https://wallpaperplay.com/walls/full/8/2/b/72402.jpg',
    'avatar':
        'https://timesofindia.indiatimes.com/thumb/msid-67586673,width-800,height-600,resizemode-4/67586673.jpg'
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Setting page'));
//    return StreamBuilder(
//        stream: settingBloc.getDataStream,
//        builder: (context, snapshot) {
//          switch (snapshot.connectionState) {
//            case ConnectionState.active:
//              return SingleChildScrollView(
//                  child: Container(
//                      // Cover image
//                      decoration: BoxDecoration(
//                          image: DecorationImage(
//                        alignment: AlignmentDirectional.topStart,
//                        image: NetworkImage(
//                          userInfo['coverImage'],
//                        ),
//                        fit: BoxFit.contain,
//                      )),
//                      child: Column(
//                        children: <Widget>[
//                          // Overlay cover image
//                          SizedBox(
//                              height:
//                                  MediaQuery.of(context).size.width * 4 / 7),
//                          // User info
//                          Container(
//                            padding: EdgeInsets.all(16.0),
//                            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
//                            decoration: BoxDecoration(
//                              color: Colors.white,
//                              borderRadius: BorderRadius.circular(5.0),
//                            ),
//                            child: ListTile(
//                              leading: Image.network(
//                                  snapshot.data['farmerProfilePhoto'] ?? '',
//                                  fit: BoxFit.cover),
//                              contentPadding: EdgeInsets.zero,
//                              title: Text(snapshot.data['farmerFullname'] ?? '',
//                                  style: Theme.of(context).textTheme.title),
//                            ),
//                          ),
//                          SizedBox(
//                            height: 16.0,
//                          ),
//                          // User detail
//                          Container(
//                            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
//                            decoration: BoxDecoration(
//                              color: Colors.white,
//                              borderRadius: BorderRadius.circular(5.0),
//                            ),
//                            child: Column(
//                              children: <Widget>[
//                                Padding(
//                                  padding:
//                                      const EdgeInsets.fromLTRB(0, 16, 0, 16),
//                                  child: Text(
//                                    'Thông tin cá nhân',
//                                    style: TextStyle(
//                                      fontSize: 18.0,
//                                      fontWeight: FontWeight.w500,
//                                    ),
//                                  ),
//                                ),
//                                SizedBox(
//                                    height: 0.3,
//                                    child: Container(color: Color(0x66666666))),
//                                buildListTile('Số điện thoại', Icons.phone,
//                                        snapshot.data['farmerPhoneNumber']) ??
//                                    '',
//                                buildListTile('Địa chỉ', Icons.location_on,
//                                    snapshot.data['farmerAddress'] ?? ''),
//                                buildListTile(
//                                    'Ngày đăng ký',
//                                    Icons.calendar_today,
//                                    snapshot.data['createdAt'] ?? ''),
//                              ],
//                            ),
//                          ),
//                          Container(
//                            width: 200,
//                            margin: EdgeInsets.only(top: 16.0),
//                            child: RaisedButton(
//                              child: Text(
//                                'Đăng xuất',
//                                style: TextStyle(fontSize: 18.0),
//                              ),
//                              onPressed: () {
//                                settingBloc.logout(context);
//                                Navigator.popUntil(
//                                    context,
//                                    ModalRoute.withName(
//                                        Navigator.defaultRouteName));
//                              },
//                              color: Color(0xFF012A33),
//                              splashColor: Colors.transparent,
//                              highlightColor: new Color(0xff8d93a0),
//                              textColor: Colors.white,
//                              elevation: 5.0,
//                              shape: RoundedRectangleBorder(
//                                borderRadius: new BorderRadius.circular(25.0),
//                                //side: BorderSide(color: Colors.red)
//                              ),
//                            ),
//                          ),
//                        ],
//                      )));
//            case ConnectionState.none:
//              return Center(
//                child: CircularProgressIndicator(),
//              );
//            case ConnectionState.waiting:
//            default:
//              return Center(child: Text('Empty'));
//          }
//        });
  }

  ListTile buildListTile(String title, IconData icon, String subtitle) {
    return ListTile(
      title: Text(title) ?? '',
      subtitle: Text(subtitle) ?? '',
      leading: Icon(icon, color: Colors.blue[500]),
    );
  }
}
