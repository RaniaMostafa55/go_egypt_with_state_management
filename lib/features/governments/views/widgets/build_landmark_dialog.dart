import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_egypt_with_state_management/core/helpers/is_current_locale_english.dart';
import 'package:go_egypt_with_state_management/features/governments/models/landmarks_model.dart';
import 'package:go_egypt_with_state_management/generated/l10n.dart';

Future<dynamic> buildLandmarkDialog(
  BuildContext context,
  LandmarksModel landmark,
  String governorate,
) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: CachedNetworkImage(
              imageUrl: landmark.image,
              height: 300,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isCurrentLocaleEnglish() ? landmark.enName : landmark.arName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  isCurrentLocaleEnglish()
                      ? "Discover the beauty and history of ${isCurrentLocaleEnglish() ? landmark.enName : landmark.arName}, located in the heart of $governorate. This landmark is one of the most visited attractions in the region and offers a glimpse into the rich cultural heritage of Egypt."
                      : "اكتشف جمال وتاريخ ${isCurrentLocaleEnglish() ? landmark.enName : landmark.arName}، الواقع في قلب $governorate. هذا المعلم هو واحد من أكثر الأماكن زيارة في المنطقة ويقدم نظرة على التراث الثقافي الغني لمصر.",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(S.of(context).close),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
