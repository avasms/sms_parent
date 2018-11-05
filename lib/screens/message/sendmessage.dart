import 'package:flutter/material.dart';

class Send extends StatefulWidget {
  SendMessage createState() => new SendMessage();
}

class AddData {
    final String title;
    final String description;
    AddData({
      this.title,
      this.description,
    });
    
  }

class SendMessage extends State<Send> {
  List<AddData> aa = [];
  TextEditingController _clear1=new TextEditingController();
  TextEditingController _clear2=new TextEditingController();
  var _formkey = new GlobalKey<FormState>();
  String _title, _description;
  String _selectValue = "Please Choose";
  List<String> data = ["One", "Two", "Three", "Four"].toList();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectValue = data.first;
   
  }

  void sendMessage() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      _clear1.clear();
      _clear2.clear();
      
      //aa.add(new AddData("$_title","$_description"));
      print('$_title\n $_selectValue');
      print('${aa.length}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = new TextFormField(
      autofocus: false,
      controller: _clear1,
      onSaved: (value) => _title = value,
      validator: (value) {
        if (value.isEmpty) return 'Please Enter Title';
      },
      decoration: InputDecoration(
        labelText: 'Title',
        isDense: true,
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        labelStyle: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18.0),
        contentPadding: EdgeInsets.all(15.0),
      ),
    );

    final description = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.multiline,
      maxLines: 10,
      textInputAction: TextInputAction.newline,
      onSaved: (value) => _description = value,
      controller: _clear2,
      validator: (value) {
        if (value.isEmpty) return 'Please Enter Description';
      },
      decoration: InputDecoration(
        labelText: 'Description',
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        labelStyle: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18.0),
        contentPadding: EdgeInsets.all(15.0),
      ),
    );

    return new Center(
      child: new Container(
        child: new Card(
          color: Colors.white70,
          child: new Form(
            key: _formkey,
            child: new ListView(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.all(8.0),
                child:new Container(
                  color: Colors.white,
                  width:300.0,
                  height: 50.0,
                 
                  padding: EdgeInsets.all(5.0),
                  child: new DropdownButtonHideUnderline(
                    child: new DropdownButton<String>(
                        value: _selectValue,
                        isDense: true,
                        items: data
                            .map((String item) => new DropdownMenuItem<String>(
                                value: item, child: new Text(item)))
                            .toList(),
                        onChanged: (String s) {
                          setState(() {
                            _selectValue = s;
                          });
                        }),
                  ),
                ),
                ),
                new Padding(
                  padding: EdgeInsets.all(8.0),
                  child: title,
                ),
                new Padding(
                  padding: EdgeInsets.all(8.0),
                  child: description,
                ),
                new Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 48.0,
                    width: 300.0,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      onPressed: () {
                        
                        sendMessage();
                        //_title=null;
                        //_description=null;
                      },
                      color: Colors.blueAccent,
                      child: Text(
                        'Send',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
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
  }
}
