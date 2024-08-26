import 'package:cred_assign/feature/categories/widgets/category_item.dart';
import 'package:cred_assign/models/data_model.dart';
import 'package:cred_assign/provider/category_provider.dart';
import 'package:cred_assign/utils/colors.dart';
import 'package:cred_assign/utils/font_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategorySectionWidget extends StatelessWidget {
  final SectionModel section;
  const CategorySectionWidget({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section.title,
          style: TextStyle(
            fontSize: AppFontSize.body3.fontSize,
            fontWeight: FontWeight.w800,
            color: AppColor.textSecondary,
          ),
        ),
        const SizedBox(height: 15),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return child;
          },
          child: provider.isGridView
              ? listView(context, section.items)
              : gridView(context, section.items),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget listView(BuildContext context, List<ListItem> items) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CategoryItemWidget(
          imageUrl: item.imageUrl,
          name: item.name,
          description: item.description,
          isGridView: false,
          identifier: item.identifier,
          onTap: () {
            Provider.of<CategoryProvider>(context, listen: false).selectItem(item);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  Widget gridView(BuildContext context, List<ListItem> items) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 0,
        crossAxisSpacing: MediaQuery.of(context).size.width * 0.06,
        childAspectRatio: 1 / 1.8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CategoryItemWidget(
          imageUrl: item.imageUrl,
          name: item.name,
          description: item.description,
          isGridView: true,
          identifier: item.identifier,
          onTap: () {
            Provider.of<CategoryProvider>(context, listen: false).selectItem(item);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
