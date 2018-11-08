import 'dart:async';
import 'package:sms_parent/models/admin.dart';
import 'package:flutter/material.dart';

class Send extends StatefulWidget {
  final List<AdminStaff> adminList;

  const Send({Key key, this.adminList}) : super(key: key);

  ViewPage createState() => new ViewPage();

}

class ViewPage extends State<Send> {

  List<DropdownMenuItem<int>> dropItemList = [];
   TextEditingController _clear1=new TextEditingController();
  TextEditingController _clear2=new TextEditingController();
  var _formkey = new GlobalKey<FormState>();
  String _title, _description;
  int _selectValue;
  
      @override
      Widget build(BuildContext context) {

   
    final _dropDownList = 
    new DropdownButtonHideUnderline(
      child:  new DropdownButton(
        value: _selectValue,
        items: widget.adminList.map((data) => new DropdownMenuItem<int>(
          child: new Text(data.name),
          value: data.id

        )).toList(),
        onChanged: (int v){
          _selectValue = v;
        },
        ),
    );
   
    
    final _titleForm = new TextFormField(
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
   
       final _descriptionForm = TextFormField(
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
                         child: _dropDownList,
                   ),
                      
                       new Padding(
                         padding: EdgeInsets.all(8.0),
                         child: _titleForm,
                   ),
                   new Padding(
                     padding: EdgeInsets.all(8.0),
                     child: _descriptionForm,
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
                            print(widget.adminList[0].name);
                          // sendMessage();
                           
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

