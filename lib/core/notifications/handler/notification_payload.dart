enum NotiPayLoad { normalPayParking }

extension NotiPayLoadExtension on NotiPayLoad {
  String get value {
    switch (this) {
      case NotiPayLoad.normalPayParking:
        return 'normalPayParking';
    }
  }
}
