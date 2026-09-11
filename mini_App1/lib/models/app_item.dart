class AppItem {
  final String id;
  final String title;
  final String? description;

  const AppItem({
    required this.id,
    required this.title,
    this.description,
  });

  factory AppItem.fromJson(Map<String, dynamic> json) {
    return AppItem(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      if (description != null) 'description': description,
    };
  }
}
