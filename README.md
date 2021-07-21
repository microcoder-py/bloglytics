# bloglytics

A tool for quickly analysing how much time users are spending on each widget of your blog

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

``{ 'widget_name': {
      'createdAt': timeStamp,
      'usedWhen_howLong': [{'started':'usedFor'},{'started':'usedFor'},{'started':'usedFor'} ... ]
  }``

To get the analytics, in the ``dispose()`` function of the parent widget, call 
1. ``keepEyeInstance.snapshot.encodeStatstoJSON()`` which returns a serialised JSON string, or
2. ``keepEyeInstance.snapshot.getStats()`` which will return a Map object 

