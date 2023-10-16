import 'package:advance_form/core/colors.dart';
import 'package:advance_form/presentation/bloc/contact_bloc.dart';
import 'package:advance_form/presentation/cubit/contact_cubit.dart';
import 'package:advance_form/presentation/pages/contact_page.dart';
import 'package:advance_form/presentation/pages/gallery_page.dart';
import 'package:advance_form/presentation/pages/preview_image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyMaterialApp());

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactBloc(),
        ),
        BlocProvider(
          create: (context) => ContactCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            color: AppColors.backgroundColor,
            centerTitle: true,
          ),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        initialRoute: ContactsPage.routeName,
        routes: {
          ContactsPage.routeName: (context) => const ContactsPage(),
          // FormPickerPage.routeName: (context) => const FormPickerPage(),
          GalleryPage.routeName: (context) => const GalleryPage(),
          PreviewImagePage.routeName: (context) => const PreviewImagePage(),
        },
      ),
    );
  }
}