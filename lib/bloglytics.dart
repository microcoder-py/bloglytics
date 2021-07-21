import 'analyticsManager.dart';
import 'analyticsSnapshot.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class keepEye extends StatelessWidget
{
  List<String> keys = [];
  List<Widget> widgets = [];
  List<analyticsManager> am = [];
  analyticsSnapshot snapshot = new analyticsSnapshot();

  keepEye(List<String> keys, List<Widget> widgets)
  {
    this.keys = keys;
    this.widgets = widgets;

    int len = this.keys.length;

    for(int i = 0 ; i < len ; i++)
    {
      am.add(new analyticsManager(keys[i], DateTime.now(), this.snapshot));
    }

  }

  @override
  Widget build(BuildContext context)
  {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;

    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: keys.length,
      itemBuilder: (context, index)
      {
        Widget returnValue = VisibilityDetector(
            key: Key(this.keys[index]),
            child: this.widgets[index],
            onVisibilityChanged:(visibilityInfo){
              this.am[index].whenChangedVisibility();
            }
        );
        return returnValue;
      },
    );
  }
}
