import 'package:campus_mobile_experimental/core/constants/app_constants.dart';
import 'package:campus_mobile_experimental/core/data_providers/cards_data_provider.dart';
import 'package:campus_mobile_experimental/core/data_providers/dining_data_proivder.dart';
import 'package:campus_mobile_experimental/core/models/dining_model.dart';
import 'package:campus_mobile_experimental/ui/cards/dining/dining_list.dart';
import 'package:campus_mobile_experimental/ui/reusable_widgets/card_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiningCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardContainer(
      active: Provider.of<CardsDataProvider>(context).cardStates['dining'],
      hide: () => Provider.of<CardsDataProvider>(context, listen: false)
          .toggleCard('dining'),
      reload: () => Provider.of<DiningDataProvider>(context, listen: false)
          .fetchDiningLocations(),
      isLoading: Provider.of<DiningDataProvider>(context).isLoading,
      titleText: "Dining",
      errorText: Provider.of<DiningDataProvider>(context).error,
      child: () => buildDiningCard(
          Provider.of<DiningDataProvider>(context).diningModels),
      actionButtons: buildActionButtons(context),
    );
  }

  Widget buildDiningCard(List<DiningModel> data) {
    return DiningList(
      listSize: 3,
    );
  }

  Widget buildTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.start,
    );
  }

  List<Widget> buildActionButtons(BuildContext context) {
    List<Widget> actionButtons = List<Widget>();
    actionButtons.add(FlatButton(
      child: Text(
        'View All',
      ),
      onPressed: () {
        Navigator.pushNamed(context, RoutePaths.DiningViewAll);
      },
    ));
    return actionButtons;
  }
}
