import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:lamphun_application/config/app.dart';
import 'package:lamphun_application/services/banner_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> banners = [];

  @override
  void initState() {
    super.initState();
    BannerService().fetchBanners().then((value) {
      setState(() {
        banners = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: banners.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Swiper(
                    autoplay: true,
                    itemCount: banners.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        '$API_URL/${banners[index]['imageUrl']}',
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
