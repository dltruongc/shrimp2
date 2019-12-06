import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold();
  }
//   final TextEditingController contentController = TextEditingController();
//   final TextEditingController titleController = TextEditingController();
//   List<File> _images = [];
//   List<File> _movies = [];
//   Address _address = Address();
//   var locationStream = MyLocation();
//   Map newFeed;
//   Map currentUser;
//   NewFeedBloc newFeedBloc;
//   bool showProgress = false;

//   Future _takePhoto() {
//     ImagePicker.pickImage(source: ImageSource.camera).then((value) {
//       setState(() {
//         value != null ? _images.add(value) : null;
//       });
//     }).catchError((err) {
//       print(err.toString());
//     });
//   }

//   Future _getImage() {
//     ImagePicker.pickImage(source: ImageSource.gallery).then((value) {
//       setState(() {
//         value != null ? _images.add(value) : null;
//       });
//     }).catchError((err) {
//       print(err.toString());
//     });
//   }

//   Future _takeMovie() {
//     ImagePicker.pickVideo(source: ImageSource.camera).then((value) {
//       setState(() {
//         value != null ? _movies.add(value) : null;
//       });
//     }).catchError((err) {
//       print(err.toString());
//     });
//   }

//   Future _getMovie() {
//     ImagePicker.pickVideo(source: ImageSource.gallery).then((value) {
//       setState(() {
//         value != null ? _movies.add(value) : null;
//       });
//     }).catchError((err) {
//       print(err.toString());
//     });
//   }

//   _submitFeed(Map account) async {
//     var newfeed = {
//       // 'title': titleController.text,
//       'newfeedContent': contentController.text,
//       'accountId': account['id'],
//       'createdAt': DateTime.now().toString().substring(0, 10),
//       'newfeedLocation': _address.featureName +
//           ', ' +
//           _address.subAdminArea +
//           ', ' +
//           _address.adminArea,
//       'updatedAt': 'NULL',
//     };

//     MyApp.of(context).location = _address.featureName + ', ' + _address.subAdminArea + ', ' + _address.adminArea;
//     setState(() {
//       showProgress = true;
//     });
//     try {
//       newFeedBloc
//         .postNewFeed(newfeed, imgs: _images, videos: _movies)
//         .then((data) {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => PostPage(),
//         ),
//       );
//     }).catchError((err) {
//       print('err');
//     });
//     } catch (err) {
//       print('err $err');
//     }
//   }

//   @override
//   void dispose() {
//     locationStream.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     newFeedBloc = NewFeedBloc();
//     locationStream.listen();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: GradientAppBar(
//         title: Text('Bài viết mới'),
//         actions: <Widget>[
//           MaterialButton(
//             child: Text(''),
//             onPressed: () =>
//                 _submitFeed(currentUser = MyApp.of(context).loginAccount),
//           )
//         ],
//         gradient: LinearGradient(
//           colors: [Color(0xff518596), Color(0xff8AB8B2)],
//           stops: [
//             0.4,
//             1,
//           ],
//           begin: Alignment.bottomLeft,
//           end: Alignment.topRight,
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           TextField(
//             controller: contentController,
//             decoration: InputDecoration(
//               hintText: 'Nhập nội dung',
//             ),
//             maxLines: 30,
//             minLines: 10,
//           ),
//           SizedBox(height: 4),
//           TextField(
//             controller: titleController,
//             decoration: InputDecoration(
//               hintText: 'Tiêu đề',
//             ),
//             maxLines: 5,
//             minLines: 1,
//           ),
//           showProgress
//               ? LinearProgressIndicator()
//               : SizedBox(
//                   height: 4,
//                 ),
//           StreamBuilder(
//             stream: newFeedBloc.newFeedStream,
//             builder: (context, snap) {
//               if (snap.hasError) {
//                 return Text(snap.error);
//               } else {
//                 showProgress = false;
//                 return SizedBox();
//               }
//             },
//           ),
//           SizedBox(height: 4),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   // _bottomSheet.mainBottomSheet(context);
//                   // setState(() {
//                   //   // TODO
//                   // });
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(),
//                   child: StreamBuilder(
//                     stream: locationStream.location,
//                     builder: (context, snap) {
//                       if (snap.hasData) {
//                         _address = snap.data;
//                       }
//                       return Text(
//                         // TODO: pick location
//                         snap.hasData
//                             ? _address.featureName +
//                                 ', ' +
//                                 _address.subAdminArea +
//                                 ', ' +
//                                 _address.adminArea
//                             : 'Đang tải dữ liệu',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.lightBlue,
//                           decoration: TextDecoration.underline,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),

//           // Image picker review
//           Container(
//             height: 100,
//             width: MediaQuery.of(context).size.width,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: _images != null
//                     ? _images.map((item) => Image.file(item)).toList()
//                     : [Text('')],
//               ),
//             ),
//           ),

//           // video picker review
// //          Container(
// //            height: 100,
// //            width: MediaQuery.of(context).size.width,
// //            child: SingleChildScrollView(
// //              scrollDirection: Axis.horizontal,
// //              child: Row(
// //                children: _movies != null
// //                    ? _movies.map((item) {
// ////                      return VideoPlayerController.;
// //                    })
// //                    : [Text('')],
// //              ),
// //            ),
// //          ),
//           Expanded(
//             child: SingleChildScrollView(
//               reverse: true,
//               padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
//               child: Column(
//                 children: <Widget>[
//                   buildListTile('Thêm nhãn dán', Icons.tag_faces, () {}),
//                   SizedBox(
//                     height: 1,
//                     child: Container(
//                       color: Colors.black12,
//                     ),
//                   ),
//                   buildListTile('Chụp ảnh mới', Icons.camera_alt, _takePhoto),
//                   SizedBox(
//                     height: 1,
//                     child: Container(
//                       color: Colors.black12,
//                     ),
//                   ),
//                   buildListTile('Thêm ảnh có sẵn', Icons.image, _getImage),
//                   SizedBox(
//                     height: 1,
//                     child: Container(
//                       color: Colors.black12,
//                     ),
//                   ),
//                   buildListTile('Video mới', Icons.video_call, _takeMovie),
//                   // TODO
//                   SizedBox(
//                     height: 1,
//                     child: Container(
//                       color: Colors.black12,
//                     ),
//                   ),
//                   buildListTile(
//                       'Thêm video có sẵn', Icons.video_library, _getMovie),
//                   SizedBox(
//                     height: 1,
//                     child: Container(
//                       color: Colors.black12,
//                     ),
//                   ),
//                   buildListTile('Đính kèm tệp', Icons.link, () {}),
//                   //TODO
//                   SizedBox(
//                     height: 1,
//                     child: Container(
//                       color: Colors.black12,
//                     ),
//                   ),
//                   buildListTile('Vị trí', Icons.location_on, () {}),
//                   //TODO
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   ListTile buildListTile(String title, IconData icon, Function onTap) {
//     return ListTile(
//       leading: Icon(icon),
//       title: Text(title),
//       onTap: onTap,
//     );
//   }
}
