import 'package:flutter/material.dart';
import 'package:movie_db/constant/Constant.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.contacts,
            text: 'Movie',
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(MOVIE_CONTAINER_SCREEN);
            },
          ),
          _createDrawerItem(
            icon: Icons.event,
            text: 'TVShows',
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(TVSHOW_CONTAINER_SCREEN);
            },
          ),
          _createDrawerItem(
            icon: Icons.note,
            text: 'People',
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(PEOPLE_CONTAINER_SCREEN);
            },
          ),
          Divider(),
//          _createDrawerItem(icon: Icons.collections_bookmark, text: 'Steps'),
//          _createDrawerItem(icon: Icons.face, text: 'Authors'),
//          _createDrawerItem(
//              icon: Icons.account_box, text: 'Flutter Documentation'),
//          _createDrawerItem(icon: Icons.stars, text: 'Useful Links'),
//          Divider(),
//          _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
//          ListTile(
//            title: Text('0.0.1'),
//            onTap: () {},
//          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(color: Colors.pink),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Flutter Step-by-Step",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
