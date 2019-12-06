import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:shrimp_2/blocs/weather_bloc.dart';
import '../blocs/login_bloc.dart';
import 'components/alert_dialog.dart';
import 'login.dart';
import 'posts_features/PostDetail.dart';
import 'posts_features/new_post.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  // limit number of posts load on device
  int _limit = 20;

  _loginCheck(BuildContext context) {
    Provider.of<LoginBloc>(context).loginUser == null
        ? MyAlertDialog.show(
            context: context,
            title: 'Bạn chưa đăng nhập',
            content: 'Vui lòng đăng nhập để sử dụng tính năng này.',
            actions: [
              FlatButton(
                child: Text('Đăng nhập'),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          )
        : Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewPostPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        leading: Icon(Icons.search, color: Colors.white),
        title: TextFormField(
          decoration: InputDecoration(
            hintText: 'Tìm kiếm',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
          ),
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _loginCheck(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: ListView.builder(
        // itemCount: _postCounter,
        itemBuilder: (BuildContext context, int idx) {
          if (idx <= _limit - 1) {
            return _getPost(idx);
          } else
            return null;
        },
      ),
    );
  }

  Widget _getPost(int idx) {
    List<String> _images = [
      'https://i.ytimg.com/vi/jpsGLsaZKS0/maxresdefault.jpg',
      'https://www.communitycatspodcast.com/wp-content/uploads/2019/09/CatInNews.jpg',
      'https://i.ytimg.com/vi/jpsGLsaZKS0/maxresdefault.jpg',
      'https://www.communitycatspodcast.com/wp-content/uploads/2019/09/CatInNews.jpg',
    ];

    Map<String, dynamic> item = {
      'name': 'Tên nông dân',
      'place': Provider.of<WeatherBloc>(context).weatherData['data'].first.areaName,
      'time': DateTime.now().toString().substring(5, 11),
      'job': 'Nông dân',
      'title': 'Tiêu đề bài đăng',
      'views': 3210,
      'favorites': 99,
      'content': 'Nội dung của bài đăng được hiển thị'
          'Nội dung của bài đăng được hiển thị'
          'Nội dung của bài đăng được hiển thị'
          'Nội dung của bài đăng được hiển thị'
          'Nội dung của bài đăng được hiển thị'
          'Nội dung của bài đăng được hiển thị'
          'Nội dung của bài đăng được hiển thị'
          'Nội dung của bài đăng được hiển thị'
          'Nội dung của bài đăng được hiển thị'
          'Nội dung của bài đăng được hiển thị'
          'Nội dung của bài đăng được hiển thị'
          'Nội dung của bài đăng được hiển thị',
      'images': _images,
      'avatar':
          'https://i.pinimg.com/236x/c2/fa/02/c2fa025d9937e89c010c5917ce7e555b.jpg'
    };

    bool isOverflowPostContent = item['content'].length > 300 ? true : false;

    // post info
    final Row postInfo = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // avatar
        Container(
          margin: EdgeInsets.all(8),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(item['avatar']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Details
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item['name'],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            Text(
              item['place'] + ', ngày ' + item['time'],
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54),
            ),
            Text(
              '#' + item['job'],
              style: TextStyle(
                  letterSpacing: 1.1,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
          ],
        ),
      ],
    );

    // post detail
    final Column postDetail = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          item['title'],
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFFEF7A85)),
        ),
        SizedBox(
          height: 2,
        ),
        // Row(
        //   children: <Widget>[
        //     Icon(Icons.people, color: Color(0xff444444)),
        //     Text(
        //       item['views'].toString(),
        //       style: TextStyle(fontSize: 16, color: Color(0xff888888)),
        //     ),
        //     SizedBox(
        //       width: 20,
        //     ),
        //     Icon(Icons.favorite, color: Color(0xffFF0000)),
        //     Text(
        //       item['favorites'].toString(),
        //       style: TextStyle(fontSize: 16, color: Color(0xff888888)),
        //     ),
        //   ],
        // ),
        SizedBox(
          height: 3,
        )
      ],
    );

    // post interactive
    final Stack postInteractive = Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Align(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Align(
              alignment: AlignmentDirectional.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PostDetail()));
                },
                child: Text(
                  'Tham gia thảo luận',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
              ),
            ),
          ),
        ),
        Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Icon(
              Icons.chat,
              size: 40,
              color: Colors.blue[300],
            )),
      ],
    );

    // post images - multi images
    int images = item['images'].length;
    final ListView postImages = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, idx) {
        if (idx < images) {
          return Padding(
            padding: idx < images - 1
                ? EdgeInsets.fromLTRB(0, 0, 10, 0)
                : EdgeInsets.zero,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(3, 2),
                      blurRadius: 2,
                      color: Colors.black12),
                ],
              ),
              child: Image.network(
                item['images'][idx],
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          );
        } else
          return null;
      },
    );

    // post image -- single image
    final Center postImage = Center(
      child: Image.network(
        item['images'][0],
        fit: BoxFit.cover,
      ),
    );

    return Container(
      padding: EdgeInsets.zero,
      child: Column(
        children: <Widget>[
          // post info
          Container(
            height: 100,
            child: postInfo,
            // color: Color(0xff2E87A7),
            color: Color(0xffFFFFFF),
          ),

          // post detail
          Flexible(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 1, 0, 0),
              child: postDetail,
            ),
          ),

          // post images
          Container(
            height: 200,
            color: Colors.white,
            child: images == 1 ? postImage : postImages,
          ),

          // post content
          Container(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Text(
              item['content'],
              softWrap: true,
              maxLines: isOverflowPostContent ? 4 : 100,
              overflow: isOverflowPostContent
                  ? TextOverflow.clip
                  : TextOverflow.visible,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),

          // show more text (post content)
          GestureDetector(
            onTap: () {
              // TODO
            },
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: EdgeInsets.only(right: 8, bottom: 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PostDetail()));
                },
                child: isOverflowPostContent
                    ? Text('còn tiếp ',
                        style:
                            TextStyle(color: Color(0xEE00A7DA), fontSize: 16))
                    : Container(
                        height: 0,
                      ),
              ),
            ),
          ),

          // interactive
          GestureDetector(
            onTap: () {
              // TODO:
              print('tap');
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: postInteractive,
              color: Color(0xFFEFEFEF),
            ),
          ),
          SizedBox(
            height: 0.4,
            child: Container(
              color: Colors.black45,
            ),
          ),
          SizedBox(
            height: 10,
            child: Container(
              color: Colors.black12,
            ),
          ),
        ],
      ),
    );
  }
}
