import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function screenRoute) {
    return ListTile(
      onTap: screenRoute,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          fontFamily: 'OpenSans',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Text(
              'Let\'s Shopping',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Home', Icons.home, null),
          buildListTile('Setting', Icons.settings, null),
        ],
      ),
    );
  }
}
