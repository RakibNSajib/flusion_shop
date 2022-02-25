import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:animate_do/animate_do.dart';
import '../../util/drawer_json.dart';
import '../screens/sign_in/sign_in_screen.dart';

bool isNotify = true;
int selectedIndex = 0;

class getDrawer extends StatefulWidget {
  // const getDrawer({ Key? key }) : super(key: key);

  @override
  _getDrawerState createState() => _getDrawerState();
}

class _getDrawerState extends State<getDrawer> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  splashRadius: 15,
                  iconSize: 20,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/profile_pic.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Title(
                        color: Colors.black,
                        child: Text(
                          'Elon Musk',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              Column(
                children: List.generate(drawerMenus.length, (index) {
                  return SlideInLeft(
                    duration:
                        Duration(milliseconds: drawerMenus[index]['duration']),
                    child: ListTile(
                        onTap: () {},
                        title: Row(
                          children: [
                            SvgPicture.asset(
                              drawerMenus[index]['imageUrl'],
                              height: 20,
                            ),
                            SizedBox(width: 15),
                            Text(drawerMenus[index]['name'])
                          ],
                        ),
                        trailing: drawerMenus[index]['isAction']
                            ? Switch(
                                value: isNotify,
                                onChanged: (value) {
                                  // Navigator.pushNamed(
                                  //     context, SignInScreen.routeName);
                                  setState(() {
                                    isNotify = value;
                                  });
                                },
                              )
                            : null),
                  );
                }),
              ),
              Expanded(
                child: SlideInLeft(
                  duration: Duration(milliseconds: 750),
                  child: Container(
                    alignment: FractionalOffset.bottomCenter,
                    child: ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 10),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, SignInScreen.routeName);
                            },
                            child: Text(
                              "Logout",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
