import 'package:first_app_flutter/config/global.params.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.blue
                      ]
                  )
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/profile-amine.jpeg'),
                      radius: 30,

                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/profil2.jpeg'),
                      radius: 50,

                    ),
                  ],
                ),
              )),
          ...(GlobalParams.menus as List).map((item) {
            return Column(
              children: [
                ListTile(
                  title: Text('${item['title']}',style: TextStyle(fontSize: 22),),
                  leading: item['icon'],
                  trailing: Icon(Icons.arrow_right),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '${item['route']}');
                  },

                ),
                Divider(height: 3,)

              ],
            );

          })

        ],
      ),
    );
  }
}