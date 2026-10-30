import 'teacher.dart';
import 'student.dart';
import 'subjects.dart';

void main() {
  
  Teacher teacher = Teacher(
    fullName: 'Tony Stark',
    age: 35,
    isMarried: true,
    experience: 10,
  );
  teacher.introduce();

  print('');

  
  Student student1 = Student(
    fullName: 'Mary Smith',
    age: 17,
    isMarried: false,
    marks: {
      Subjects.math: 90,
      Subjects.physics: 85,
      Subjects.english: 92,
    },
  );
  student1.introduce();
  student1.showMarks();

  print('');

 
  Student student2 = Student(
    fullName: 'Scarlett Johansson',
    age: 18,
    isMarried: false,
    marks: {
      Subjects.math: 88,
      Subjects.history: 95,
      Subjects.english: 90,
    },
  );
  student2.introduce();
  student2.showMarks();

   print('');

  Student student3 = Student(
    fullName: 'Vivien Leigh',
    age: 16,
    isMarried: false,
    marks: {
      Subjects.math: 89,
      Subjects.history: 98,
      Subjects.english: 90,
    },
  );
  student3.introduce();
  student3.showMarks();

}