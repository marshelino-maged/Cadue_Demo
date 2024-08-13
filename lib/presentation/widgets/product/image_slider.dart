import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key, required this.images});
  final List<String> images;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  var current = 0;

  // final List<String> images = [
  //   "https://cadaeu.s3.eu-central-1.amazonaws.com/development/GJiYFHTT4-b0smxl94ef5A_1722428310.png",
  //   "https://cadaeu.s3.eu-central-1.amazonaws.com/development/GJiYFHTT4-b0smxl94ef5A_1722428310.png",
  //   "https://cadaeu.s3.eu-central-1.amazonaws.com/development/GJiYFHTT4-b0smxl94ef5A_1722428310.png"
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 340.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                current = index;
              });
            },
          ),
          items: widget.images.map((image) {
            return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(image,
                    fit: BoxFit.cover, width: double.infinity, height: 320));
          }).toList(),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i=0; i<widget.images.length; i++)
              Row(
                children: [
                  Container(
                    width: 18,
                    height: 6,
                    color: i==current? AppColors.orange: AppColors.grey213,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              )
          ],
        ),
      ],
    );
  }
}
