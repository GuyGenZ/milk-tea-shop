import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:milk_tea_shop/constans.dart';
import 'package:milk_tea_shop/models/menu_of_the_week_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Header(size: size),
              SizedBox(height: 20),
              // titleเมนูประจำสัปดาห์
              CustomTitle(title: "เมนูประจำสัปดาห์"),
              SizedBox(height: 20),
              SizedBox(
                height: 320,
                child: ListView.builder(
                  itemCount: menuoftheweekItems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ItemCard(
                    menuOfTheWeekModel: menuoftheweekItems[index],
                  ),
                ),
              ),
              SizedBox(height: 30),
              CustomTitle(title: "เมนูอื่นๆ"),
              SizedBox(
                height: 310,
                child: ListView.builder(
                  itemCount: othermenuItems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ItemCard2(
                    menuOfTheWeekModel: othermenuItems[index],
                  ),
                ),
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}

// ItemCard2
class ItemCard2 extends StatelessWidget {
  const ItemCard2({
    Key key,
    this.size,
    @required this.menuOfTheWeekModel,
  }) : super(key: key);

  final Size size;
  final MenuOfTheWeekModel menuOfTheWeekModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            height: 310,
            width: 140,
            child: Stack(
              children: [
                Positioned(
                  top: 75,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context, detailRoute(menuOfTheWeekModel)),
                    child: Container(
                      height: 180,
                      width: 140,
                      padding: EdgeInsets.only(left: 16, right: 10),
                      decoration: BoxDecoration(
                        color: menuOfTheWeekModel.color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50),
                          Text(
                            "${menuOfTheWeekModel.shopname}",
                            style: TextStyle(color: Colors.black38),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${menuOfTheWeekModel.name}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Text(
                                "${menuOfTheWeekModel.price.toStringAsFixed(2)}฿",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Container(
                                alignment: Alignment.center,
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: Color(0xffE8E8E8),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.solidHeart,
                                  size: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 50,
                  child: Container(
                    height: 75,
                    width: 45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("${menuOfTheWeekModel.imagePath}"),
                      ),
                    ),
                  ),
                ),
                // custom order button
                Positioned(
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Color(0xff7E7E7E),
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                    child: Text(
                      "สั่งซื้อตอนนี้",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ItemCard
class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    this.size,
    @required this.menuOfTheWeekModel,
  }) : super(key: key);

  final Size size;
  final MenuOfTheWeekModel menuOfTheWeekModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            height: 320,
            width: 160,
            child: Stack(
              children: [
                Positioned(
                  top: 75,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context, detailRoute(menuOfTheWeekModel)),
                    child: Container(
                      height: 180,
                      width: 160,
                      padding: EdgeInsets.only(left: 16, right: 10),
                      decoration: BoxDecoration(
                        color: menuOfTheWeekModel.color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50),
                          Text(
                            "${menuOfTheWeekModel.shopname}",
                            style: TextStyle(color: Colors.black38),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${menuOfTheWeekModel.name}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Text(
                                "${menuOfTheWeekModel.price.toStringAsFixed(2)}฿",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Color(0xffE8E8E8),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.solidHeart,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 50,
                  child: Container(
                    height: 85,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("${menuOfTheWeekModel.imagePath}"),
                      ),
                    ),
                  ),
                ),
                // custom order button
                Positioned(
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Color(0xff7E7E7E),
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                    child: Text(
                      "สั่งซื้อตอนนี้",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key key,
    @required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            "$title",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          Spacer(),
          Text(
            "ดูทั้งหมด",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black.withOpacity(.35)),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(26),
          bottomRight: Radius.circular(26),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.16),
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ยินดีต้อนรับ, กาย",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "เลือกรสชาติที่ดีที่สุดสำหรับคุณ",
                style: TextStyle(color: Colors.black.withOpacity(.3)),
              ),
              SizedBox(height: 10),
              Text(
                "ง่ายต่อการตัดสินใจของคุณ",
                style: TextStyle(color: Colors.black.withOpacity(.3)),
              ),
            ],
          ),
          Spacer(),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/avatar3.jpg"),
          ),
        ],
      ),
    );
  }
}
