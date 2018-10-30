import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NoticeBoard extends StatefulWidget {
  NoticeBoardP createState() => new NoticeBoardP();
}

class Title {
  Title(this.title, this.date, this.information,
      [this.children = const <Title>[]]);

  final String title;
  final String date;
  final String information;
  final List<Title> children;
}

final List<Title> card = <Title>[
  Title('Aung NetAung NetAung NetAung Net', '1/10/2018',
      'Hello sis, how are u doing? I have a cute dog.He name is Joe Lay.'),
  Title('Aung NetAung NetAung Net', '2/10/2018',
      'Hello sis, how are u doing? I have a cute dog.He name is Joe Lay.'),
  Title('Aung NetAung NetAung NetAung Net', '1/10/2018',
      'Hello sis, how are u doing? I have a cute dog.He name is Joe Lay.'),
  Title('Aung NetAung NetAung Net', '2/10/2018',
      'Hello sis, how are u doing? I have a cute dog.He name is Joe Lay.'),
  Title('Aung NetAung NetAung NetAung Net', '1/10/2018',
      'Hello sis, how are u doing? I have a cute dog.He name is Joe Lay.'),
  Title('Aung NetAung NetAung Net', '2/10/2018',
      'Hello sis, how are u doing? I have a cute dog.He name is Joe Lay.'),
  Title('Aung NetAung NetAung NetAung Net', '1/10/2018',
      'Hello sis, how are u doing? I have a cute dog.He name is Joe Lay.'),
  Title('Aung NetAung NetAung Net', '2/10/2018',
      'Hello sis, how are u doing? I have a cute dog.He name is Joe Lay.'),
  Title('Aung NetAung NetAung NetAung Net', '1/10/2018',
      'Hello sis, how are u doing? I have a cute dog.He name is Joe Lay.'),
  Title('Aung NetAung NetAung Net', '2/10/2018',
      'Hello sis, how are u doing? I have a cute dog.He name is Joe Lay.'),
  Title('Aung NetAung NetAung NetAung Net', '1/10/2018',
      'Hello sis, how are u doing? I have a cute dog.He name is Joe Lay.'),
  Title('Aung NetAung NetAung Net', '2/10/2018',
      'Hello sis, how are u doing? I have a cute dog.He name is Joe Lay.'),
  Title('Aung NetAung NetAung NetAung Net', '1/10/2018',
      'Hello sis, how are u doing? I have a cute dog.He name is Joe Lay.'),
  Title('Aung NetAung NetAung Net', '2/10/2018',
      'Hello sis, how are u doing? I have a cute dog.He name is Joe Lay.'),
];

void container(Title item) {
  return;
}

class NoticeBoardP extends State<NoticeBoard> {
  List<Title> aa = [];

  //List<Widget> card = new List.generate(10, (i) => new CardData());

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text('NoticeBoard'),
        ),
        body: new Container(
          color: Colors.white12,
          child: ListView.builder(
            itemCount: card.length,
            itemBuilder: (context, index) {
              final item = card[index];
              return GestureDetector(
                //onTap: onTapedShow(item),
                child: Card(
                  child: new Padding(
                    padding: EdgeInsets.all(5.0),
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          //listTitle,
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
                          new Container(
                            child: new Card(
                              color: Colors.white,
                              elevation: 1.0,
                              margin: EdgeInsets.all(3.0),
                              child: new Container(
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
                                        child: new Text('${item.information}')),
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
          ),
        ),
      ),
    );
  }
}

onTapedShow(Title item) {
  Fluttertoast.showToast(
      msg: "${item.date.toString()}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 0,
      bgcolor: "#e74c3c",
      textcolor: '#ffffff');
}
