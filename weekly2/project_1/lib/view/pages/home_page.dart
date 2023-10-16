import 'package:flutter/material.dart';
import 'package:project_1/core/extensions/double_ext.dart';
import 'package:project_1/core/themes/images.dart';
import 'package:project_1/view/sections/about_us_section.dart';
import 'package:project_1/view/sections/contact_us_section.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home-page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GIRD"),
        leading: Image.asset(AppImages.logo),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://asset.kompas.com/crops/BraddfIZmVVlO1coTQnSxt0phcs=/0x0:719x479/750x500/data/photo/2021/07/29/61021b10f16fc.jpg",
              width: MediaQuery.of(context).size.width,
              height: 250.0,
              fit: BoxFit.cover,
            ),
            30.0.height,
            const ContactUsSection(),
            50.0.height,
            const AboutUsSection(),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://ak-d.tripcdn.com/images/02252120008w621u9DDA6_R_960_660_R5_D.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(),
            ),
            ListTile(
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}