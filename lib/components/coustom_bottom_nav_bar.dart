import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;
  final Color inActiveIconColor = Color(0xFFB6B6B6);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color.fromARGB(255, 94, 91, 91).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Container(
          // top: false,
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              color: MenuState.home == selectedMenu
                  ? kPrimaryColor
                  : inActiveIconColor,
            ),
            onPressed: () => Navigator.pushNamed(context, HomeScreen.routeName),
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/Heart Icon.svg"),
            onPressed: () {},
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg"),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              color: MenuState.profile == selectedMenu
                  ? kPrimaryColor
                  : inActiveIconColor,
            ),
            onPressed: () =>
                Navigator.pushNamed(context, ProfileScreen.routeName),
          ),
        ],
      )),
    );
  }
}
