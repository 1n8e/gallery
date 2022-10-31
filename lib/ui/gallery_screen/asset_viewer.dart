
import 'package:flutter/material.dart';

class AssetViewer extends StatelessWidget {
  final String? full;

  const AssetViewer({Key? key, this.full}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        InteractiveViewer(
          minScale: 1,
          maxScale: 4,
          child: Image.network(full!),
        ),
        Positioned(
          left: 20,
          top: 35,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xff2c2c2e).withOpacity(.7),
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: const Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
