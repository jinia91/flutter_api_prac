
class Dirt {
  int pm10;
  int pm25;
  int khai;
  String dataTime;

  Dirt(this.pm10, this.pm25, this.khai, this.dataTime);

  factory Dirt.fromJson(Map<String, dynamic> data) {
    return Dirt(
        int.tryParse(data["pm10Value"] ?? "") ?? 0,
      int.tryParse(data["pm25Value"] ?? "") ?? 0,
      int.tryParse(data["khaiGrade"] ?? "") ?? 0,
      data["dataTime"] ?? "");
  }
}