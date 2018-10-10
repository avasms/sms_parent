import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'cupertino_navigation_demo.dart' show coolColorNames;

const double _kPickerSheetHeight = 216.0;
const double _kPickerItemHeight = 32.0;

class ViewLeaveScreen extends StatefulWidget {
  static const String routeName = '/cupertino/picker';
  final parentId;

  const ViewLeaveScreen({Key key, this.parentId}) : super(key: key);

  @override
  _CupertinoPickerDemoState createState() => new _CupertinoPickerDemoState();
}

class _CupertinoPickerDemoState extends State<ViewLeaveScreen> {
  int _selectedColorIndex = 0;

  Duration timer = new Duration();

  Widget _buildMenu(List<Widget> children) {
    return new Container(
      decoration: const BoxDecoration(
        color: CupertinoColors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
          bottom: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
        ),
      ),
      height: 44.0,
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: new SafeArea(
          top: false,
          bottom: false,
          child: new DefaultTextStyle(
            style: const TextStyle(
              letterSpacing: -0.24,
              fontSize: 17.0,
              color: CupertinoColors.black,
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorPicker() {
    final FixedExtentScrollController scrollController =
      new FixedExtentScrollController(initialItem: _selectedColorIndex);
    return new CupertinoPicker(
      scrollController: scrollController,
      itemExtent: _kPickerItemHeight,
      backgroundColor: CupertinoColors.white,
      onSelectedItemChanged: (int index) {
        setState(() {
          _selectedColorIndex = index;
        });
      },
      children: new List<Widget>.generate(3, (int index) {
        return new Center(child:
        new Text("data"),
        );
      }),
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return new Container(
      height: _kPickerSheetHeight,
      color: CupertinoColors.white,
      child: new DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: new GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: new SafeArea(
            child: picker,
          ),
        ),
      ),
    );
  }

  Widget _buildCountdownTimerPicker(BuildContext context) {
    return new GestureDetector(
      onTap: () async {
        await showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
         
          },
        );
      },
      child: _buildMenu(
          <Widget>[
            const Text('Countdown Timer'),
            new Text(
              "${timer.inHours}:"
                "${(timer.inMinutes % 60).toString().padLeft(2,'0')}:"
                "${(timer.inSeconds % 60).toString().padLeft(2,'0')}",
              style: const TextStyle(color: CupertinoColors.inactiveGray),
            ),
          ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      body: new DefaultTextStyle(
        style: const TextStyle(
          fontFamily: '.SF UI Text',
          fontSize: 17.0,
          color: CupertinoColors.black,
        ),
        child: new DecoratedBox(
          decoration: const BoxDecoration(color: Color(0xFFEFEFF4)),
          child: new ListView(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 32.0)),
              new GestureDetector(
                onTap: () async {
                  await showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return _buildBottomPicker(_buildColorPicker());
                    },
                  );
                },
                child: _buildMenu(
                    <Widget>[
                      const Text('Favorite Color'),
                      new Text(
                        "text",
                       // coolColorNames[_selectedColorIndex],
                        style: const TextStyle(
                            color: CupertinoColors.inactiveGray
                        ),
                      ),
                    ]
                ),
              ),
              _buildCountdownTimerPicker(context),
            ],
          ),
        ),
      ),
    );
  }
}