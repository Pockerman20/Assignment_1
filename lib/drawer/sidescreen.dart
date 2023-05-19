import 'package:assignment_infoware/screens/music_screen.dart';
import 'package:assignment_infoware/screens/product_screen.dart';
import 'package:flutter/material.dart';

import '../screens/form_screen.dart';
import 'drawer_head.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  final List drawerMenuListname = const [
    {
      "leading": Icon(
        Icons.shopping_cart,
        color: Colors.black87,
      ),
      "title": "All Products",
      "trailing": Icon(
        Icons.chevron_right,
      ),
      "action_id": 1,
    },
    {
      "leading": Icon(
        Icons.format_list_bulleted_add,
        color: Colors.black87,
      ),
      "title": "User Form",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 2,
    },
    {
      "leading": Icon(
        Icons.music_note_rounded,
        color: Colors.black87,
      ),
      "title": "Want to Listen Music?",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 280,
        child: Drawer(
          child: ListView(
            children: [
              const MyHeaderDrawer(),
              const SizedBox(
                height: 1,
              ),
              ...drawerMenuListname.map((sideMenuData) {
                return ListTile(
                  leading: sideMenuData['leading'],
                  title: Text(
                    sideMenuData['title'],
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal),
                  ),
                  trailing: sideMenuData['trailing'],
                  onTap: () {
                    Navigator.pop(context);
                    if (sideMenuData['action_id'] == 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductScreen(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 2) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FormScreen(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 3) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AudioPlayerWidget(),
                        ),
                      );
                    }
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
