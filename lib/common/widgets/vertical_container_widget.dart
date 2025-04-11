import 'package:flutter/material.dart';
import '../../utilis/constants/colors.dart';
import '../../utilis/constants/image_strings.dart';
import '../../utilis/constants/size.dart';

class VerticalWidget extends StatelessWidget {
  const VerticalWidget({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return AGridView(url: AImages.popularImage7,dark: dark, itemCount: 10);
  }
}

class AGridView extends StatelessWidget {
  const AGridView({
    super.key,
    required this.dark,
    required this.itemCount,
    this.padding = EdgeInsets.zero,
    this.shrinkWrap = true,
    this.physics = const NeverScrollableScrollPhysics(),
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
    this.childAspectRatio = 0.6, required this.url, this.minCrossAxisExtent, this.minAxisExtent,

  });

  final bool dark;
  final int itemCount;
  final EdgeInsets padding;
  final bool shrinkWrap;
  final ScrollPhysics physics;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final int? minCrossAxisExtent;
  final String url;
  final int? minAxisExtent;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: padding,
      itemCount: itemCount,
      shrinkWrap: shrinkWrap,
      physics: physics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => SizedBox(
        height: 180, // Constrain height
        child: AProductCard(dark: dark, imageUrl: url),
      ),
    );
  }
}
class AProductCard extends StatelessWidget {
  const AProductCard({
    super.key,
    required this.dark, required this.imageUrl,
  });

  final bool dark;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.only(top: ASizes.productImageRadius),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AColors.darkGrey.withAlpha(10),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3)),
          ],
          borderRadius: BorderRadius.circular(ASizes.productImageRadius),
          color: dark ? AColors.darkGrey : Colors.grey,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                  BorderRadius.circular(ASizes.productImageRadius),
                  child: SizedBox(
                    height: 170,
                    width: 140,
                    child: Image(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 20,
                    width: 60,
                    decoration: const BoxDecoration(
                      color: AColors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                      ),
                    ),
                    margin: const EdgeInsets.only(left: 4),
                    child: const Center(child: Text('20% Off')),
                  ),
                ),
                const Positioned(
                  top: -10,
                  right: -12,
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                  color: AColors.darkGrey,
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text('Samsung S23'),
                        Icon(Icons.verified),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('\$174'),
                        FloatingActionButton(
                          onPressed: () {},
                          mini: true,
                          elevation: 0,
                          child:Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}