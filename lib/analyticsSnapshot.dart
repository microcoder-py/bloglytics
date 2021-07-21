import 'dart:convert';

class analyticsSnapshot
{

  Map analytics = new Map();

  void addNewObject(String key, DateTime whenCreated)
  {
    this.analytics[key] = {'createdAt': whenCreated, 'usedWhen_howLong':[]};
  }

  void addNewUsageStat(String key, DateTime whenStarted, Duration usedFor)
  {
    List listOfUsage = this.analytics[key]['usedWhen_howLong'];
    Map newUsageStat = {'started':whenStarted, 'usedFor': usedFor.inSeconds};
    listOfUsage.add(newUsageStat);
    this.analytics[key]['usedWhen_howLong'] = listOfUsage;
  }

  String encodeStatsToJSON()
  {
    return json.encode(analytics);
  }

  Map getStats()
  {
    return this.analytics;
  }
}