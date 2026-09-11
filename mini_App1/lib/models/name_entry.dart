class NameEntry {
  final String id;
  final String name;
  final int? rating;

  const NameEntry({
    required this.id,
    required this.name,
    this.rating,
  });

  NameEntry copyWith({int? rating}) {
    return NameEntry(
      id: id,
      name: name,
      rating: rating ?? this.rating,
    );
  }
}
