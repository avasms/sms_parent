import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sms_parent/util/app_translation.dart';
import 'package:sms_parent/models/notice.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/util/config.dart';
import 'package:flutter_html_textview/flutter_html_textview.dart';
import 'dart:core';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

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
      body: FutureBuilder<List<Notice>>(
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

class NoticeList extends StatefulWidget {
  final List<Notice> notice;
  NoticeList({Key key, this.notice}) : super(key: key);

  @override
  NoticeListState createState() {
    return new NoticeListState();
  }
}

class NoticeListState extends State<NoticeList> {
  @override
  Widget build(BuildContext context) {
    List<Notice> notice = widget.notice;

     _launchUrl(String filePath) async {
      var path = Config.BASE_URL + filePath;
      var url = 'http://docs.google.com/viewer?url=$path';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    getImageOrFile(String ftype, String filePath, BuildContext context) {
      if (ftype == '.pdf' || ftype == '.PDF') {
        return Center(
          child: RaisedButton(
              child: Text("Open PDF"),
              onPressed: () {
                _launchUrl(filePath);
                              }
                              //onPressed: ()=>Navigator.push
                              //(context, MaterialPageRoute(builder: (context)=>LoadUrlAsFile(filePath: filePath,))),
                              /*onPressed: ()=>Navigator.push(
                                            context, MaterialPageRoute(builder: (context)=>WebViewShow(file:filePath))),*/
                              /* onPressed: ()=>Navigator.push(
                                            context, MaterialPageRoute(builder: (context)=>LoadUrlAsFile(filePath:filePath))),*/
                              ),
                        );
                      } else {
                        return new CachedNetworkImage(
                         imageUrl: Config.BASE_URL + filePath,
                         //imageUrl:'http://www.hello.com/img_/hellowithwaves.png',
                          placeholder: new CircularProgressIndicator(),
                          errorWidget: new Icon(Icons.error),
                        );
                      }
                    }
    // TODO: implement build
    return ListView.builder(
      itemCount: notice.length,
      itemBuilder: (context, index) {
        final item = notice[index];
        String temp = '';
        String ftype = '';
        if(item.filePath!=null){
          temp = item.filePath.toString();
          ftype = temp.substring(temp.lastIndexOf('.'), temp.length);
        }

        DateTime myDatetime = DateTime.parse(item.date);
        String date="${myDatetime.day}/${myDatetime.month}/${myDatetime.year}";
         
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
                        date,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Container(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          getImageOrFile(ftype, item.filePath, context),
                          new SizedBox(
                            height: 20.0,
                          ),
                          new Container(
                            padding: EdgeInsets.all(10.0),
                            child: new HtmlTextView(
                              data: '${item.description.replaceAll('&nbsp;', ' ')}',
                            ),
                            // child: new Text('${item.description}'),
                          ),
                        ],
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
/*class LoadUrlAsFile extends StatelessWidget {
  final filePath;
  LoadUrlAsFile({this.filePath});
  @override
  Widget build(BuildContext context) {
   return FutureBuilder<File>(
      future: createFileOfPdfUrl(filePath),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? PDFViewerScaffold(
                appBar: AppBar(
                  title: Text("Document"),
                ),
                path: snapshot.data.path)
            : Center(child: CircularProgressIndicator());
      },
   ) ;
   
  }
}*/

/*class PDFScreen extends StatelessWidget {
  String pathPDF = "";
  PDFScreen(this.pathPDF);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
      future: createFileOfPdfUrl(pathPDF),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        //print('AAAA:${snapshot.data}');
        //print('BBB:$pathPDF');
        return snapshot.hasData
            ? PDFViewerScaffold(
                appBar: AppBar(
                  title: Text("Document"),
                ),
                path: snapshot.data.path)
            : Center(child: CircularProgressIndicator());
      },
    );
  }*/

Future<File> createFileOfPdfUrl(String pathPDF) async {
  final url = Config.BASE_URL + pathPDF;
  final filename = url.substring(url.lastIndexOf("/") + 1);
  var request = await HttpClient().getUrl(Uri.parse(url));
  var response = await request.close();
  var bytes = await consolidateHttpClientResponseBytes(response);
  String dir = (await getApplicationDocumentsDirectory()).path;
  File file = new File('$dir/$filename');
  //print('CCCC:$bytes');
  await file.writeAsBytes(bytes);
  return file;
}
