import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;

  static const int settings = 2;

  Function onDrawerItemClick;

  HomeDrawer({required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1),
          color: Theme.of(context).primaryColor,
          child: Text(
            'News App!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            onDrawerItemClick(HomeDrawer.categories);
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  Icons.list, color: Colors.white, // Specify the color here
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "categories",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onDrawerItemClick(HomeDrawer.settings);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(
                  Icons.settings, color: Colors.white, // Specify the color here
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Settings",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

// class HomeDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.green,
//             ),
//             child: Text('Menu'),
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.list,
//               color: Colors.white, // Specify the color here
//             ),
//             title: Text(
//               'Categories',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             onTap: () {
//               Navigator.pop(context); // Close the drawer
//               Navigator.pushNamed(context, 'category');
//             },
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.settings,
//               color: Colors.white, // Specify the color here
//             ),
//             title: Text(
//               'Settings',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             onTap: () {
//               Navigator.pop(context); // Close the drawer
//               Navigator.pushNamed(context, 'settings');
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
