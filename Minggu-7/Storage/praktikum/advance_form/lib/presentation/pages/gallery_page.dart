import 'package:advance_form/core/colors.dart';
import 'package:advance_form/presentation/pages/contact_page.dart';
import 'package:advance_form/presentation/pages/preview_image_page.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  static const routeName = 'gallery_page';

  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List gallery = [
      'assets/images/cheetah.jpg',
      'assets/images/dolphin.jpg',
      'assets/images/elang.jpg',
      'assets/images/gajah.jpg',
      'assets/images/harimau.jpg',
      'assets/images/hyena.jpg',
      'assets/images/katak.jpg',
      'assets/images/kelinci.jpg',
      'assets/images/kucing.jpg',
      'assets/images/monyet.jpg',
      'assets/images/nemo.jpg',
      'assets/images/rusa.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 9 / 16,
          crossAxisCount: 2,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
        ),
        itemCount: gallery.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Hero(
                            tag: gallery[index],
                            child: AlertDialog(
                              title: const Text("Open image ?"),
                              content: Image.asset(
                                gallery[index],
                                fit: BoxFit.cover,
                              ),
                              actions: [
                                TextButton(
                                  child: const Text("Tidak"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: const Text("Ya"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                      context,
                                      PreviewImagePage.routeName,
                                      arguments: PreviewImagePage(
                                        imageUrl: gallery[index],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Image.asset(gallery[index], fit: BoxFit.cover),
                    ),
                  );
                },
              );
            },
            child: Hero(
              tag: gallery[index],
              child: Image.asset(
                gallery[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ContactsPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween =
                  Tween(begin: const Offset(-0.5, 0), end: Offset.zero);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        ),
        backgroundColor: AppColors.card,
        child: const Icon(Icons.contact_page),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}