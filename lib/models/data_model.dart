class SectionModel {
  final String title;
  final List<ListItem> items;

  SectionModel({required this.title, required this.items});
}

class ListItem {
  final String name;
  final String description;
  final String imageUrl;
  final String identifier;

  ListItem({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.identifier
  });
}

