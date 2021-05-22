import 'package:flutter/material.dart';
import 'package:milk_tea_shop/models/menu_of_the_week_model.dart';
import 'package:milk_tea_shop/screens/detail_page.dart';

final String assetName1 = 'assets/svgs/1.svg';
final String assetName2 = 'assets/svgs/2.svg';
final String assetName3 = 'assets/svgs/3.svg';
final String assetName4 = 'assets/svgs/4.svg';

// custom Item Model

final List<MenuOfTheWeekModel> menuoftheweekItems = [
  MenuOfTheWeekModel(
    imagePath: "assets/images/1.png",
    shopname: "ชาช้าง",
    name: "ชานม",
    price: 19,
    color: Color(0xffDBB38C),
  ),
  MenuOfTheWeekModel(
    imagePath: "assets/images/2.png",
    shopname: "นั่งเล่น",
    name: "ชานมใต้หวัน",
    price: 19,
    color: Color(0xffDBC179),
  ),
  MenuOfTheWeekModel(
    imagePath: "assets/images/3.png",
    shopname: "ชิวชิว",
    name: "ชานมคาราเมล",
    price: 35,
    color: Color(0xffFF924B),
  ),
  MenuOfTheWeekModel(
    imagePath: "assets/images/4.png",
    shopname: "ชิวชิว",
    name: "ชาเขียวนมสด",
    price: 35,
    color: Color(0xffC4D2C8),
  ),
  MenuOfTheWeekModel(
    imagePath: "assets/images/5.png",
    shopname: "ชิวชิว",
    name: "สตอเบอร์รี่นมสด",
    price: 35,
    color: Color(0xffEAA4A2),
  ),
];

final List<MenuOfTheWeekModel> othermenuItems = [
  MenuOfTheWeekModel(
    imagePath: "assets/images/6.png",
    shopname: "ชาช้าง",
    name: "นมสด",
    price: 35,
    color: Color(0xffFFEBB1),
  ),
  MenuOfTheWeekModel(
    imagePath: "assets/images/7.png",
    shopname: "นั่งเล่น",
    name: "นมเย็นใต้หวัน",
    price: 19,
    color: Color(0xffEFDAE0),
  ),
  MenuOfTheWeekModel(
    imagePath: "assets/images/8.png",
    shopname: "ชิวชิว",
    name: "โกโก้นมสด",
    price: 19,
    color: Color(0xffA6795C),
  ),
];

// Custom PageRoute

Route detailRoute(MenuOfTheWeekModel menuOfTheWeekModel) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => DetailPage(
      menuOfTheWeekModel: menuOfTheWeekModel,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
