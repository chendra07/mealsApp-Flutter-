import 'package:flutter/material.dart';

//routes
import '../routes/routes_config.dart';

class MainDrawer extends StatelessWidget {
  // final Function onTapHandler;
  const MainDrawer({
    Key key,
    // this.onTapHandler,
  }) : super(key: key);

  Widget buildListTileBuilder(
    String title,
    IconData icon,
    Function onTapHandler,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildListTileBuilder("Meals", Icons.restaurant, () {
            Navigator.of(context)
                .pushReplacementNamed(RoutesConfig.tabHomeScreen);
          }),
          buildListTileBuilder("Settings", Icons.settings, () {
            Navigator.of(context)
                .pushReplacementNamed(RoutesConfig.filterScreen);
          }),
        ],
      ),
    );
  }
}
