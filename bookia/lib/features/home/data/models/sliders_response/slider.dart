class Slider {
  String? image;

  Slider({this.image});

  factory Slider.fromJson(Map<String, dynamic> json) =>
      Slider(image: json['image'] as String?);

  Map<String, dynamic> toJson() => {'image': image};
}
