import '../models/app_item.dart';

/// A placeholder service for data/business logic.
/// Swap the in-memory implementation for real API/DB calls later.
class AppService {
  Future<List<AppItem>> fetchItems() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const [
      AppItem(id: '1', title: 'First item'),
      AppItem(id: '2', title: 'Second item'),
    ];
  }
}
