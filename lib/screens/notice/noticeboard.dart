import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sms_parent/util/app_translation.dart';
import 'package:sms_parent/models/notice.dart';
import 'package:sms_parent/dao/apicommondao.dart';

class NoticeBoardScreen extends StatefulWidget {
  NoticeBoard createState() => new NoticeBoard();
}


class NoticeBoard extends State<NoticeBoardScreen> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.indigo.shade700,
          title: new Text(
            AppTranslations.of(context).text("noticeboard_menu"),
            style: TextStyle(fontFamily: 'Myanmar', color: Colors.white),
          )),
        body:  FutureBuilder<List<Notice>>(
        future: new ApiCommonDao().getNoticeList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? NoticeList(notice: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class NoticeList extends StatelessWidget {
  final List<Notice> notice;
  NoticeList({Key key, this.notice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return ListView.builder(
            itemCount: notice.length,
            itemBuilder: (context, index) {
              final item = notice[index];
              return GestureDetector(
                child: Card(
                  child: new Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                      child: new Column(
                        children: <Widget>[
                          new ListTile(
                            title: Text(
                              '${item.title}',
                              style: TextStyle(
                                  fontFamily: 'zawgyi',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: Text(
                              '${item.date}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                      
                          Container(
                            child: new Card(
                              color: Colors.white,
                              elevation: 1.0,
                              margin: EdgeInsets.all(3.0),
                              child: Container(
                                child: new Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    new CachedNetworkImage(
                                      imageUrl:
                                          "https://wallpaperbrowse.com/media/images/3848765-wallpaper-images-download.jpg",
                                      placeholder:
                                          new CircularProgressIndicator(),
                                      errorWidget: new Icon(Icons.error),
                                    ),
                                    new Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: new Text('${item.description}')),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }

}
