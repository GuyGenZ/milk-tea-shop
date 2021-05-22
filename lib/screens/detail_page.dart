import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:milk_tea_shop/models/menu_of_the_week_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key key, this.menuOfTheWeekModel}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState(menuOfTheWeekModel);
  final MenuOfTheWeekModel menuOfTheWeekModel;
}

class _DetailPageState extends State<DetailPage> {
  final MenuOfTheWeekModel menuOfTheWeekModel;

  _DetailPageState(this.menuOfTheWeekModel);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: menuOfTheWeekModel.color,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Container(
                width: size.width,
                margin: EdgeInsets.only(top: size.height * .50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(26),
                    topRight: Radius.circular(26),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // หัวข้อระยะเวลาในการทำ
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ระยะเวลาในการทำ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "5 นาที",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(height: 10),
                      // รายละเอียด ส่วนประผสม
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ส่วนผสม",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 40,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Ingredient(
                                  color: menuOfTheWeekModel.color,
                                  title: "น้ำชาใต้หวัน",
                                ),
                                Ingredient(
                                  color: menuOfTheWeekModel.color,
                                  title: "คาราเมล",
                                ),
                                Ingredient(
                                  color: menuOfTheWeekModel.color,
                                  title: "น้ำตาล",
                                ),
                                Ingredient(
                                  color: menuOfTheWeekModel.color,
                                  title: "นมข้นหวาน",
                                ),
                                Ingredient(
                                  color: menuOfTheWeekModel.color,
                                  title: "นมสด",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 100),
                      // ปุ่มสั่งซื้อสินค้า
                      GestureDetector(
                        onTap: () => _bottomSheet(),
                        child: Container(
                          alignment: Alignment.center,
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff7E7E7E),
                          ),
                          child: Text(
                            "สั่งซื้อ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ไอคอนกากบาท กลับหน้าแรก
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                        ),
                        child: FaIcon(FontAwesomeIcons.times),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // ชื่อสินค้าและไอคอน
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            "${menuOfTheWeekModel.name}",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Color(0xffE8E8E8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    // ไอคอนแสดงคะแนนสินค้า จำนวนลูกค้าที่ให้คะแนน และภาพสินค้า
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ไอคอนแสดงคะแนน
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xff454545),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 5,
                                      top: 12,
                                      child: Text(
                                        "4.2",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xffdddddd)),
                                      ),
                                    ),
                                    Positioned(
                                      right: 10,
                                      bottom: 12,
                                      child: Text(
                                        "/5",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff969696)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              // ไอคอนแสดงจำนวนลูกค้าที่ให้คะแนน
                              Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 85,
                                      ),
                                      Positioned(
                                        left: 40,
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/avatar.jpg"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 20,
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/avatar2.jpg"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/avatar3.jpg"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text("+27 คะแนน"),
                                ],
                              ),
                            ],
                          ),
                          // ภาพสินค้า
                          Container(
                            height: 250,
                            width: 180,
                            child:
                                Image.asset("${menuOfTheWeekModel.imagePath}"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _bottomSheet() {
    showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
          ),
        ),
        child: Column(
          children: [
            // Cancel Icon on BottomSheet
            Stack(
              children: [
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 5,
                  indent: 120,
                  endIndent: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        icon: FaIcon(FontAwesomeIcons.times),
                        onPressed: () => Navigator.pop(context))
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // หัวข้อ ขนาดแก้ว
                  Row(
                    children: [
                      Text(
                        "ขนาดแก้ว",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.black.withOpacity(.36),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "M",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            FaIcon(
                              FontAwesomeIcons.chevronDown,
                              size: 10,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  // จำนวน
                  Row(
                    children: [
                      Text(
                        "จำนวน",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(width: 10),
                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.black.withOpacity(.26),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.minus,
                          size: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "2",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.black.withOpacity(.26),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.plus,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48,
            ),
            // ไอคอน หัวข้อ และ จำนวนส่วนผสม
            IconWithTitleAndIngredient(
              iconData: FontAwesomeIcons.cubes,
              title: "น้ำตาล",
              ingredientCount: "2",
            ),
            IconWithTitleAndIngredient(
              iconData: FontAwesomeIcons.cube,
              title: "คาราเมล",
              ingredientCount: "3",
            ),

            SizedBox(
              height: 48,
            ),
            // total price with buttom order
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ส่วนราคารวม
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ราคารวม",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "45.00฿",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffEA7E39)),
                      )
                    ],
                  ),
                  //ส่วนของปุ่ม
                  Container(
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.center,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xff7E7E7E),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "ยืนยันการสั่งซื้อ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconWithTitleAndIngredient extends StatelessWidget {
  const IconWithTitleAndIngredient({
    Key key,
    this.iconData,
    this.title,
    this.ingredientCount,
  }) : super(key: key);
  final IconData iconData;
  final String title;
  final String ingredientCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FaIcon(
                iconData,
                color: Colors.grey,
                size: 30,
              ),
              Text(
                "$title",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 8),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Color(0xffA6795C),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.minus,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "$ingredientCount ถ้วย",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 8),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Color(0xffA6795C),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// ส่วนผสม การ์ดไอเทม
class Ingredient extends StatelessWidget {
  const Ingredient({
    Key key,
    this.title,
    this.color,
  }) : super(key: key);

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            color: Colors.black.withOpacity(.16),
            blurRadius: 6,
          )
        ],
      ),
      child: Text("$title"),
    );
  }
}
