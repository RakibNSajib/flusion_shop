import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/components/drawer.dart';
import 'package:shop_app/enums.dart';
import 'package:animate_do/animate_do.dart';

import '../../constants.dart';
import '../../util/drawer_json.dart';
import '../cart/cart_screen.dart';
import 'components/body.dart';
import 'components/icon_btn_with_counter.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      key: _drawerKey,
      appBar: getAppBar(),
      drawer: getDrawer(),
      body: Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: !showFab,
        child: getFloatingActionButton(),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }

  Widget getAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(75),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 20, right: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage('assets/images/parki.png'),
                    width: 80,
                  ),
                ],
              ),
              Row(
                children: [
                  IconBtnWithCounter(
                    svgSrc: "assets/icons/cart.svg",
                    press: () =>
                        Navigator.pushNamed(context, CartScreen.routeName),
                  ),
                  SizedBox(width: 10),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 8,
                    child: InkWell(
                      onTap: () {
                        _drawerKey.currentState.openDrawer();
                      },
                      child: Ink.image(
                          image: AssetImage(
                            'assets/images/profile_pic.jpg',
                          ),
                          height: 38,
                          width: 38,
                          fit: BoxFit.cover),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getFloatingActionButton() {
    return ZoomIn(
      duration: Duration(milliseconds: 100),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Image(
            image: AssetImage('assets/icons/coupon.png'),
            width: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
