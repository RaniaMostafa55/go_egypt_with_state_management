import 'package:flutter/material.dart';
import 'package:go_egypt_with_state_management/core/helpers/is_current_locale_english.dart';
import 'package:go_egypt_with_state_management/features/home/models/place_model.dart';

class PlaceItemWidget extends StatelessWidget {
  final int index;
  const PlaceItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              PlaceModel.places[index].imagePath,
              width: screenWidth * 0.8,
              height: screenHeight * 0.24,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            isCurrentLocaleEnglish()
                ? PlaceModel.places[index].enName
                : PlaceModel.places[index].arName,
            style: const TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
