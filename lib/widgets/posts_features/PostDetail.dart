import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> item = {
      'name': 'Tên nông dân',
      'place': 'CanTho',
      'time': DateTime.now().toString().substring(5, 11),
      'job': 'Nông dân',
      'title': 'Tiêu đề bài đăng',
      'views': 3210,
      'favorites': 99,
      'content':
          'Nội dung của bài đăng được hiển thị',
      'images': '',
      'avatar':
          'https://i.pinimg.com/236x/c2/fa/02/c2fa025d9937e89c010c5917ce7e555b.jpg'
    };

    _commentTile() {
      return Container(
        child: Row(
          children: <Widget>[
            Text('14'),
            SizedBox(
              width: 12,
            ),
            Container(
              width: 300,
              child: Text.rich(
                TextSpan(
                  text: 'Bình luận...Bình luận...Bình luận...',
                  children: [
                    TextSpan(
                      text: 'Tên tài khoản',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.blue[400],
                      ),
                    ),
                  ],
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            )
          ],
        ),
      );
    }

    _build() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(
                  Icons.arrow_drop_up,
                  size: 30,
                ),
                Text('20'),
                Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                ),
                Icon(
                  Icons.check,
                  color: Colors.green[300],
                  size: 30,
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '10 Answers',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    // elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(item['content'] * 2),
                          Image.network(
                            'https://s.hdnux.com/photos/01/01/06/57/17066975/5/420x0.jpg',
                            fit: BoxFit.contain,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              FlatButton.icon(
                                icon: Icon(Icons.share),
                                label: Text('Share'),
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.open_in_browser),
                                label: Text('Chrome'),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 2,
                            child: Container(
                              color: Colors.black54,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Image.network(
                                      item['avatar'],
                                      height: 50,
                                      fit: BoxFit.contain,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(item['name']),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.people,
                                                color: Color(0xff444444)),
                                            Text(
                                              item['views'].toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xff888888)),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Icon(Icons.favorite,
                                                color: Color(0xffFF0000)),
                                            Text(
                                              item['favorites'].toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xff888888)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Text(
                                  'on ' + item['time'],
                                  style: TextStyle(color: Colors.black26),
                                ),
                              )
                            ],
                          ),
                          Card(
                            elevation: 2,
                            child: SizedBox(
                              height: 2,
                              child: Container(),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              _commentTile(),
                              SizedBox(
                                height: 10,
                              ),
                              _commentTile(),
                              SizedBox(
                                height: 10,
                              ),
                              _commentTile(),
                              SizedBox(
                                height: 10,
                              ),
                              _commentTile(),
                              SizedBox(
                                height: 10,
                              ),
                              _commentTile(),
                              SizedBox(
                                height: 10,
                              ),
                              _commentTile(),
                              SizedBox(
                                height: 10,
                              ),
                              _commentTile(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: GradientAppBar(
        title: Text(item['title'], style: TextStyle(fontSize: 20)),
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
        child: Column(
          children: <Widget>[
            _build(),
            _build(),
            _build(),
          ],
        ),
      ),
    );
  }
}
