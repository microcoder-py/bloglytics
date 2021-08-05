# bloglytics

A Flutter tool for quickly analysing how much time users are spending on each widget of your blog

## Who is this for?

This is for people who have created a ListView of widgets to build blog like content, and want to understand how much time the user spent on each widget to make estimations of reading time, scroll depth etc

## Where to find?

[https://pub.dev/packages/bloglytics](https://pub.dev/packages/bloglytics)

## How to install?

Refer [https://pub.dev/packages/bloglytics/install](https://pub.dev/packages/bloglytics/install)

Or simply execute the command 
1. ``flutter pub add bloglytics`` in your terminal, then run 
2. ``flutter pub get``

## The Basics

This package enables you to 

1. Track which widget was seen
2. Duration for which each widget was seen along with timestamps
3. Create stats which you can either consume in the flutter code directly or send to backend as JSON

## To Use

1. Import ``bloglytics.dart``
2. Create a ``keepEye`` object which takes a list of names for widgets and the widgets themselves as input
3. It returns a ``ListView`` object which you can use in your flutter application

## Analytics

The analytics tracked here are the first created timestamps of each widget, and then when they were viewed again as well as the time spent on each view with the schema

```
{ 
      'widget_name': {
            'createdAt': timeStamp,
            'usedWhen_howLong': [{'started':'usedFor'},{'started':'usedFor'},{'started':'usedFor'} ... ]
}
 ```

To get the analytics, call 
1. ``keepEyeInstance.snapshot.encodeStatstoJSON()`` which returns a serialised JSON string, or
2. ``keepEyeInstance.snapshot.getStats()`` which will return a Map object 

If you want summary statistics of what happens in the end, just call this function at whatever point in the widget lifecycle you see fit, such as when it is being disposed, or when it is being thrown out of view. 
