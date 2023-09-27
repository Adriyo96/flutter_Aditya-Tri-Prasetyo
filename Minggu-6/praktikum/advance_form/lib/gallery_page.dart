import 'package:advance_form/theme_color.dart';
import 'package:advance_form/dummy.dart';
import 'package:advance_form/contact_page.dart';
import 'package:advance_form/preview_image_page.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  static const routeName = 'gallery_page';

  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor().avatarColor,
        title: const Text("Gallery"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 9 / 16,
          crossAxisCount: 2,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
        ),
        itemCount: Dummy.gallery.length,
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
                          return AlertDialog(
                            backgroundColor: ThemeColor().avatarColor,
                            title: const Text("Open image ?"),
                            content: Image.asset(
                              Dummy.gallery[index],
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
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => PreviewImagePage(
                                  //       imageUrl: Dummy.gallery[index],
                                  //     ),
                                  //   ),
                                  // );
                                  Navigator.pushNamed(
                                    context,
                                    PreviewImagePage.routeName,
                                    arguments: PreviewImagePage(
                                      imageUrl: Dummy.gallery[index],
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child:
                          Image.asset(Dummy.gallery[index], fit: BoxFit.cover),
                    ),
                  );
                },
              );
            },
            child: Image.asset(
              Dummy.gallery[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const ContactsPage(),
        //     )),
        onPressed: () =>
            Navigator.pushReplacementNamed(context, ContactPage.routeName),
        backgroundColor: ThemeColor().listColor,
        child: const Icon(Icons.contact_page),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
