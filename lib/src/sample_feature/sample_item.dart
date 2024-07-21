/// A placeholder class that represents an entity or model.
class SampleItem {
  const SampleItem(this.title, this.time, this.description, this.link);

  final String title;
  final String time;
  final String description;
  final String link;

  factory SampleItem.fromMap(Map<String, dynamic> map) {
    return SampleItem(
      map['title'] ?? "",
      map['time'] ?? "",
      map['description'] ?? "",
      map['link'] ?? "",
    );
  }

  Map<String, dynamic> toMap() => {
    'title': title,
    'time': time,
    'description': description,
    'link': link,
  };
}
