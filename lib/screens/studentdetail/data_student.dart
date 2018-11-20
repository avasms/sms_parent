import 'package:flutter/material.dart';
class Student{
  int id;
  String name;
  List<String> subName;
  String runningYear;
  String studentNo;
  String admissionNo;
  String schoolName;
  String photoPath;
  String rollNo;
  String className;
  int classLevelId;
  int sectionId;
  // date;
  Student({
    this.id,
    this.name,
    this.studentNo,
    this.admissionNo,
    this.schoolName,
    this.photoPath,
    this.rollNo,
    this.runningYear,
    this.className,
    this.classLevelId,
    this.sectionId,
    //this.date
 });
}


final List<Student> students=<Student>[
  Student(
   id: 1,
   admissionNo: "1",
   classLevelId: 1,
   className: "Grade1",
   name: "Si Thu",
   photoPath:"aa", 
   rollNo: '1',
   runningYear:'2018', 
   schoolName: 'PAN SONE',
   sectionId: 1,
   studentNo: '1234r5',
   //date:['ha ha','he he','ho ho'].toList(),
  ),
  Student(
   id: 2,
   admissionNo: "2",
   classLevelId: 2,
   className: "Grade2",
   name: "Myo Thu",
   photoPath:"aa", 
   rollNo: '2',
   runningYear:'2018', 
   schoolName: 'PAN SONE',
   sectionId: 2,
   studentNo: '1234r5',
   //date:['ha ha','he he','ho ho']
  ),
  Student(
   id: 3,
   admissionNo: "3",
   classLevelId: 3,
   className: "Grade3",
   name: "May Thu",
   photoPath:"aa", 
   rollNo: '3',
   runningYear:'2018', 
   schoolName: 'Hledan',
   sectionId: 3,
   studentNo: '1234r5',
   //date:['ha ha','he he','ho ho'   ]
  ),
  Student(
   id: 4,
   admissionNo: "4",
   classLevelId: 4,
   className: 'Grade4',
   name: "Lay Phu",
   photoPath:"aa", 
   rollNo: '4',
   runningYear:'2018', 
   schoolName: 'Hling ',
   sectionId: 4,
   studentNo: '1234r5',
   //date:['ha ha','he he','ho ho'   ]
  ),
  
];


class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

final List<Entry> data = <Entry>[
  Entry(
    'Dogs',
    <Entry>[
      Entry(
        ' Aung Net',
        <Entry>[
          Entry('Aung Net1'),
          Entry('Aung Net2'),
          Entry('Aung Net3'),
        ],
      ),
      Entry('Nyi Kyar',
      <Entry>[
          Entry('Nyi Kyar1'),
          Entry('Nyi Kyar2'),
          Entry('Nyi Kyar3'),
        ],
      ),
      Entry('Bo Ni'),
    ],
  ),
  Entry(
    'Cats',
    <Entry>[
      Entry('Puusi'),
      Entry('Mi Nyaung'),
    ],
  ),
  Entry(
    'Human',
    <Entry>[
      Entry('Ma Ma'),
      Entry('Hla Hla '),
      Entry(
        'Yoon Eaint Muu ',
        <Entry>[
          Entry('Kalayar Swe'),
          Entry('Nay Nyo Thawe'),
          Entry('Nyo Chaw'),
          Entry('Moe Pwint Maung'),
        ],
      ),
    ],
  ),
];
