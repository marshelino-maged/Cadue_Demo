import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/data/models/occasion_model.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class OccasionItem extends StatelessWidget {
  OccasionItem({super.key, required OccasionModel occasion, required this.onOccasionClicked})
      : image = occasion.banner!,
        title = occasion.name!,
        description = occasion.description!,
        icon = occasion.icon!;
  final void Function() onOccasionClicked;
  final String image;
  final String title;
  final String description;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: Stack(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(image),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 230,
          ),
          Container(
            width: double.infinity,
            height: 230,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0),
                  Color.fromRGBO(0, 0, 0, 0.8),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 20,
            child: Row(
              children: [
                Image(image: NetworkImage(icon), width: 30, height: 30),
                const SizedBox(width: 10),
                SizedBox(
                  width: 250,
                  height: 30,
                  child: StyledText(
                    title,
                    fontSize: 22,
                    color: ColorsGetter.white255,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: SizedBox(
              width: 200,
              height: 40,
              child: Text(
                description,
                style: GoogleFonts.jost(
                    fontSize: 14,
                    color: ColorsGetter.white255,
                    fontWeight: FontWeight.w400),
                maxLines: 2,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: TextButton(
              onPressed: onOccasionClicked,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(ColorsGetter.orange),
                fixedSize: WidgetStateProperty.all(
                  const Size(105, 30),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: StyledText(
                'View',
                fontSize: 12,
                color: ColorsGetter.white255,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
