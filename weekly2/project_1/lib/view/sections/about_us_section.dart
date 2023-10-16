import 'package:flutter/material.dart';
import 'package:project_1/core/extensions/double_ext.dart';
import 'package:project_1/core/themes/font_weight.dart';
import 'package:project_1/model/hotel_model.dart';
import 'package:project_1/view/widgets/hotel_card.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<HotelModel> hotels = [
      HotelModel(
        name: 'Novotel Pekanbaru',
        price: 1008819,
        imageUrl:
            "https://ak-d.tripcdn.com/images/02252120008w621u9DDA6_R_960_660_R5_D.jpg",
      ),
      HotelModel(
        name: 'Hotel Pangeran Pekanbaru',
        price: 756500,
        imageUrl:
            "https://pix10.agoda.net/hotelImages/230160/-1/b65bdaa5b116676de74b12ddd8b65c1d.jpg?ca=7&ce=1&s=1024x768&isSkia=true",
      ),
      HotelModel(
        name: 'Premiere Hotel Pekanbaru',
        price: 891152,
        imageUrl:
            "https://pbs.twimg.com/profile_images/1160098428/Profile_Picture_for_account_400x400.jpg",
      ),
      HotelModel(
        name: 'FOX Hotel Pekanbaru',
        price: 615351,
        imageUrl:
            "https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20007000-c8e6b48882bbef18f836846d51c93e6e.jpeg?tr=q-40,c-at_max,w-740,h-500&_src=imagekit",
      ),
      HotelModel(
        name: 'The Zuri Hotel Pekanbaru',
        price: 682681,
        imageUrl:
            "https://media-cdn.tripadvisor.com/media/photo-s/16/b6/53/5a/junior-suite.jpg",
      ),
      HotelModel(
        name: 'Grand Central Hotel Pekanbaru',
        price: 605625,
        imageUrl:
            "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/c1/fd/52/grand-suite-room.jpg?w=700&h=-1&s=1",
      ),
    ];

    return Column(
      children: [
        const Text(
          "About Us",
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FW.medium,
          ),
        ),
        20.0.height,
        const Text(
            "GIRD adalah sebuah aplikasi booking hotel yang dibangun dengan teknologi terbaru dan paling inovatif. Kami terus mengembangkan dan memperbaiki layanan kami untuk memberikan pengalaman yang terbaik bagi pelanggan kami. Kami ingin menjadi partner terpercaya Anda dalam setiap perjalanan."),
        20.0.height,
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.0,
            crossAxisCount: 2,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
          ),
          itemCount: hotels.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return HotelCard(item: hotels[index]);
          },
        ),
        40.0.height,
      ],
    );
  }
}