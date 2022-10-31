import 'package:flutter/material.dart';
import 'package:test_project/core/const_text_styles.dart';
import 'package:test_project/ui/gallery_screen/asset_viewer.dart';

class AssetCard extends StatefulWidget {
  final String? username;
  final String? thumb;
  final String? description;
  final String? full;

  const AssetCard(
      {super.key, this.username, this.thumb, this.description, required this.full});

  @override
  State<AssetCard> createState() => _AssetCardState();
}

class _AssetCardState extends State<AssetCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).bottomAppBarColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AssetViewer(full: widget.full),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(widget.thumb!),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.username!,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                const SizedBox(width: 32),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}