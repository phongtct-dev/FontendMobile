import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  final List<dynamic> banners; // Truyền list banner hardcode
  const BannerSlider({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {

    if (banners.isEmpty) {
      return const SizedBox(height: 180, child: Center(child: Text("Đang tải banner...")));
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.width * 0.45,
        autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction: 0.65,
        aspectRatio: 16/9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      items: banners.map((banner) {
        return Container(
          margin: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              image: NetworkImage(banner.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(banner.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                Text(banner.subtitle, style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}