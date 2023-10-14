import 'package:flutter/material.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/category/category_fragment.dart';
import 'package:news_app/home/home_drawer.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/myTheme.dart';
import 'package:news_app/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: searchBar,
          child: searchBarVisibile
              ? Container(
                  decoration: BoxDecoration(
                    color: MyTheme.whiteColor,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: searchBarController,
                    decoration: InputDecoration(
                      hintText: 'Search ',
                      hintStyle: TextStyle(color: MyTheme.primaryLightColor),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.cancel,
                            color: MyTheme.primaryLightColor),
                        onPressed: () {
                          searchBarVisibile = false;
                          searchBarController.clear();
                          setState(() {});
                        },
                      ),
                    ),
                    autofocus: true,
                    onChanged: (value) {
                      // Handle search query
                    },
                  ),
                )
              : Text(
                  selectedDrawerItem == HomeDrawer.settings
                      ? 'Settings'
                      : selectedCategory == null
                          ? 'News App'
                          : selectedCategory!.title,
                  style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
      drawer: HomeDrawer(
        onDrawerItemClick: onDrawerItemClick,
      ),
      body: selectedDrawerItem == HomeDrawer.settings
          ? SettingsTab()
          : selectedCategory == null
              ? CategoryFragment(onCategoryClick: onCategoryClick)
              : CategoryDetails(category: selectedCategory!),
    );
  }

  Category? selectedCategory;

  void onCategoryClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedDrawerItem = HomeDrawer.categories;

  void onDrawerItemClick(int newSelectedDrawerItem) {
    selectedDrawerItem = newSelectedDrawerItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }

  TextEditingController searchBarController = TextEditingController();
  bool searchBarVisibile = false;

  void searchBar() {
    setState(() {
      searchBarVisibile = !searchBarVisibile;
      if (!searchBarVisibile) {
        searchBarController.clear();
      }
    });
  }
}

//=========================================
// appBar: AppBar(
//   centerTitle: true,
//   title: Text(
//       selectedDrawerItem == HomeDrawer.settings
//           ? 'Settings'
//           : selectedCategory == null
//               ? 'News App'
//               : selectedCategory!.title,
//       style: Theme.of(context).textTheme.titleLarge),
// ),

// appBar: AppBar(
//   centerTitle: true,
//   title: Text(
//       selectedDrawerItem == HomeDrawer.settings
//           ? 'Settings'
//           : selectedCategory == null
//               ? 'News App'
//               : selectedCategory!.title,
//       style: Theme.of(context).textTheme.titleLarge),
// ),

// Drawer(
//   child: ListView(
//     padding: EdgeInsets.zero,
//     children: [
//       DrawerHeader(
//         decoration: BoxDecoration(
//           color: Colors.green,
//         ),
//         child: Text('Menu'),
//       ),
//       ListTile(
//         title: Text('Categories'),
//         onTap: () {
//           Navigator.pop(context); // Close the drawer
//           Navigator.pushNamed(context, 'category');
//         },
//       ),
//       ListTile(
//         title: Text('Settings'),
//         onTap: () {
//           Navigator.pop(context); // Close the drawer
//           Navigator.pushNamed(context, 'settings');
//         },
//       ),
//     ],
//   ),
// ),
