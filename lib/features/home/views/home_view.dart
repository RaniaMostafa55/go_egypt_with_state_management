import 'package:flutter/material.dart';
import 'package:go_egypt_with_state_management/features/home/models/card_model.dart';
import 'package:go_egypt_with_state_management/features/home/widgets/card_widget.dart';
import 'package:go_egypt_with_state_management/features/home/widgets/place_item_widget.dart';
import 'package:go_egypt_with_state_management/generated/l10n.dart';

class HomeView extends StatelessWidget {
  static const String routeName = 'home';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          S.of(context).suggested_places_to_visit,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: size.height * 0.4,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) =>
                      PlaceItemWidget(index: index),
                  itemCount: 5,
                ),
              ),
              Text(
                S.of(context).popular_places,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(
                height: size.height * 0.4,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CardWidget(
                    card: CardModel.cards[index],
                    index: index,
                  ),
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
