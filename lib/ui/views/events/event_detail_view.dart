import 'package:campus_mobile_experimental/core/models/events_model.dart';
import 'package:campus_mobile_experimental/ui/reusable_widgets/container_view.dart';
import 'package:campus_mobile_experimental/ui/reusable_widgets/image_loader.dart';
import 'package:campus_mobile_experimental/ui/reusable_widgets/time_range_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailView extends StatelessWidget {
  const EventDetailView({Key key, @required this.data}) : super(key: key);
  final EventModel data;
  @override
  Widget build(BuildContext context) {
    return ContainerView(
      child: ListView(
        children: buildDetailView(context),
      ),
    );
  }

  List<Widget> buildDetailView(BuildContext context) {
    return [
      Center(
        child: ImageLoader(
          url: data.imageHQ,
          fullSize: true,
        ),
      ),
      Text(
        data.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.title,
      ),
      Divider(),
      Text(
        data.location,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
      TimeRangeWidget(time: data.startTime + ' - ' + data.endTime),
      Divider(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          data.description,
          style: TextStyle(fontSize: 18),
        ),
      ),
      FlatButton(
          child: Text('Learn More'),
          onPressed: () {
            launch(data.url);
          })
    ];
  }
}
