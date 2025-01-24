import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_state_management/core/blocs/theme_bloc/theme_bloc.dart';
import 'package:go_egypt_with_state_management/core/helpers/is_current_locale_english.dart';
import 'package:go_egypt_with_state_management/features/home/models/card_model.dart';
import 'package:go_egypt_with_state_management/features/home/widgets/place_item_widget.dart';

import '../models/place_model.dart';

class CardWidget extends StatefulWidget {
  // final int index;
  final CardModel card;
  final PlaceModel place;
  const CardWidget({
    super.key,
    required this.card,
    required this.place,
  });
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: BlocProvider.of<ThemeBloc>(context).darkMode
            ? Colors.grey.shade900
            : Colors.grey.shade300,
      ),
      child: Column(
        children: [
          PlaceItemWidget(
            place: widget.place,
          ),
          Expanded(
            child: Row(
              children: [
                Text(
                  isCurrentLocaleEnglish()
                      ? widget.card.enGovernmentName
                      : widget.card.arGovernmentName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    pressed = !pressed;
                    setState(() {});
                  },
                  icon: Icon(
                      pressed ? Icons.favorite : Icons.favorite_border_outlined,
                      color:
                          pressed ? Theme.of(context).colorScheme.error : null),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
