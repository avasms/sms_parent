import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sms_parent/util/app_translation.dart';
import 'package:sms_parent/models/notice.dart';
import 'package:sms_parent/dao/apicommondao.dart';
import 'package:sms_parent/util/config.dart';
import 'package:flutter_html_textview/flutter_html_textview.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'dart:core';

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

    getImageOrFile(String ftype, String filePath, BuildContext context) {
    if (ftype == '.pdf' || ftype == '.PDF') {
    createFileOfPdfUrl(filePath).then((f) {
      setState(() {
           filePath = f.path;   
            });
        
       // print(filePath);
      });
    
    return  Center(
        child: RaisedButton(
          child: Text("Open PDF"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PDFScreen(filePath)),
          ),
        ),
      );
    } else {
      return new CachedNetworkImage(
        imageUrl: Config.BASE_URL + filePath,
        placeholder: new CircularProgressIndicator(),
        errorWidget: new Icon(Icons.error),
      );
    }
  }
  
    // TODO: implement build
    return ListView.builder(
      itemCount: widget.notice.length,
      itemBuilder: (context, index) {
        final item = widget.notice[index];
        String temp = item.filePath.toString();
        String ftype = temp.substring(temp.lastIndexOf('.'), temp.length);
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
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          getImageOrFile(ftype,item.filePath,context),
                          new SizedBox(
                            height: 20.0,
                          ),
                          new Container(
                            padding: EdgeInsets.all(10.0),
                            child: new HtmlTextView(
                              data: '${item.description}',
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

  Future<File> createFileOfPdfUrl(String filePath) async {
    final url =  Config.BASE_URL + filePath;
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }
}
class PDFScreen extends StatelessWidget {
  String pathPDF = "";
  PDFScreen(this.pathPDF);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Document"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: pathPDF);
  }
}
