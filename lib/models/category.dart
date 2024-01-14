import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  final int id;
  final String name;
  final String image;
  final dynamic icon;
  Category(this.id, this.name, this.image, {this.icon});
}

final List<Category> categories = [
  Category(9, "General Knowledge", 'assets/images/General Knowledge.png',
      icon: FontAwesomeIcons.earthAsia),
  Category(13, "Musicals & Theatres", 'assets/images/Musicals & Theatres.png',
      icon: FontAwesomeIcons.masksTheater),
  Category(11, "Film", 'assets/images/Film.png', icon: FontAwesomeIcons.video),
  Category(12, "Music", 'assets/images/Music.png',
      icon: FontAwesomeIcons.music),
  Category(14, "Television", 'assets/images/Television.png',
      icon: FontAwesomeIcons.tv),
  Category(15, "Video Games", 'assets/images/Video Games.png',
      icon: FontAwesomeIcons.gamepad),
  Category(16, "Board Games", 'assets/images/Board Games.png',
      icon: FontAwesomeIcons.chessBoard),
  Category(17, "Science & Nature", 'assets/images/Science & Nature.png',
      icon: FontAwesomeIcons.microscope),
  Category(18, "Computer", 'assets/images/Computer.png',
      icon: FontAwesomeIcons.laptopCode),
  Category(10, "Books", 'assets/images/book.png',
      icon: FontAwesomeIcons.bookOpen),
  // Category(19,"Maths", 'assets/images/book.png', icon: FontAwesomeIcons.arrowDown19),
  // Category(20,"Mythology",'assets/images/book.png', ),
  // Category(21,"Sports",'assets/images/book.png',  icon: FontAwesomeIcons.football),
  // Category(22,"Geography",'assets/images/book.png',  icon: FontAwesomeIcons.mountain),
  // Category(23,"History",'assets/images/book.png',  icon: FontAwesomeIcons.monument),
  // Category(24,"Politics",'assets/images/book.png', ),
  // Category(25,"Art",'assets/images/book.png',  icon: FontAwesomeIcons.paintbrush),
  // Category(26,"Celebrities",'assets/images/book.png', ),
  // Category(27,"Animals",    'assets/images/book.png',  icon: FontAwesomeIcons.dog),
  // Category(28,"Vehicles",  'assets/images/book.png', icon: FontAwesomeIcons.carRear),
  // Category(29,"Comics",     'assets/images/book.png', ),
  // Category(30,"Gadgets",   'assets/images/book.png', icon: FontAwesomeIcons.mobileScreenButton),
];
