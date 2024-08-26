import 'package:cred_assign/models/data_model.dart';
import 'package:cred_assign/services/json_services.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  bool _isGridView = false;
  bool get isGridView => _isGridView;
  ListItem? _selectedItem;
  ListItem? get selectedItem => _selectedItem;

  void toggleView(bool value) {
    _isGridView = value;
    notifyListeners();
  }

  void selectItem(ListItem item) {
    _selectedItem = item;
    notifyListeners();
  }

List<SectionModel> get sections {
    final jsonResponse = JsonService.getJsonResponse();
    final sections = jsonResponse['sections'] as List<dynamic>;

    return sections.map((section) {
      final templateProperties = section['template_properties'] ?? section[" "];
      final header = templateProperties['header'];
      final items = templateProperties['items'] as List<dynamic>;

      return SectionModel(
        title: header['title'],
        items: items.map((item) {
          final displayData = item['display_data'];
          return ListItem(
            name: displayData['name'],
            description: displayData['description'],
            imageUrl: displayData['icon_url'],
            identifier: item['identifier']
          );
        }).toList(),
      );
    }).toList();
  }
}

