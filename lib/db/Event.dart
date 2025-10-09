class Event {
  final String? month;
  final String? day;
  final String? image;
  final String? description;
   bool isFav;

  Event({
    required this.month,
    required this.day,
    required this.image,
    required this.description,
    this.isFav=false,
  });
}
