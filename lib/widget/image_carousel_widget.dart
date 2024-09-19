import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class StaticImageCarousel extends StatelessWidget {
  final List<String> imageUrls; // List of image URLs

  const StaticImageCarousel({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
       height: 175,
                  enlargeCenterPage: true,
                  autoPlay: true,
                 
                  viewportFraction: Platform.isIOS ? 0.88 : 0.89,// Control the size of each item in the carousel
      ),
      items: imageUrls.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 6,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
