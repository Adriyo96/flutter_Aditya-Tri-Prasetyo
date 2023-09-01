class Course {
  String title;
  String description;

  Course(this.title, this.description);
}

class Student {
  String name;
  String className;
  List<Course> courses = [];

  Student(this.name, this.className);

  void addCourse(Course course) {
    courses.add(course);
  }

  void removeCourse(Course course) {
    courses.remove(course);
  }

  void viewCourses() {
    if (courses.isEmpty) {
      print("Student $name belum memiliki course apapun.");
    } else {
      print("Courses yang dimiliki oleh Student $name ($className):");
      for (var course in courses) {
        print("- ${course.title}: ${course.description}");
      }
    }
  }
}

void main() {
  Course course1 = Course("Matematika", "Aljabar");
  Course course2 = Course("Biologi", "Mikroorganisme");
  Course course3 = Course("Ekonomi", "Ekonomi Syariah");

  Student student1 = Student("Adit", "Kelas 10A");

  student1.addCourse(course1);
  student1.addCourse(course2);
  student1.addCourse(course3);

  student1.viewCourses();

  student1.removeCourse(course2);

  student1.viewCourses();
}