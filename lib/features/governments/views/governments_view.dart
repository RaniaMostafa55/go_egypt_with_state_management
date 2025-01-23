import 'package:flutter/material.dart';
import 'package:go_egypt_with_state_management/features/governments/models/governments_model.dart';
import 'package:go_egypt_with_state_management/features/governments/views/widgets/government_card_item.dart';
import 'package:go_egypt_with_state_management/generated/l10n.dart';

class GovernmentsView extends StatelessWidget {
  const GovernmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildGovernmentsViewAppBar(context),
      body: Stack(
        children: [
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: Governorate.governorates.length,
            itemBuilder: (context, index) {
              final governorate = Governorate.governorates[index];
              return GovernmentCardItem(governorate: governorate);
            },
          ),
        ],
      ),
    );
  }

  AppBar buildGovernmentsViewAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        S.of(context).governments_of_egypt,
      ),
    );
  }
}
