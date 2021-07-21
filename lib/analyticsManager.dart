import 'analyticsSnapshot.dart';

class analyticsManager
{
  bool isVisible = false;
  bool flag = false;
  String key = "";
  DateTime whenCreated = DateTime.now();
  analyticsSnapshot snapshot = new analyticsSnapshot();
  analyticsManager(String key, DateTime whenCreated, analyticsSnapshot snapshot)
  {
    this.key = key;
    this.whenCreated = whenCreated;
    this.snapshot = snapshot;
  }

  DateTime whenStarted = DateTime.now();

  Stopwatch watch = new Stopwatch();

  void whenChangedVisibility()
  {

    if(this.isVisible == false)
    {
      if(this.flag == false)
      {
        this.snapshot.addNewObject(this.key, this.whenCreated);
        this.flag = true;
      }

      this.isVisible = true;
      this.watch.start();
      this.whenStarted = DateTime.now();
    }

    else
    {
      this.isVisible = false;
      Duration spentReading = this.watch.elapsed;
      this.watch.stop();
      this.watch.reset();
      this.snapshot.addNewUsageStat(this.key, this.whenStarted, spentReading);
    }
  }
}

