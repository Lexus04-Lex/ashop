import 'package:a_shop/common/widgets/categories.dart';
import 'package:a_shop/common/widgets/samsung.dart';
import 'package:a_shop/common/widgets/searchbar.dart';
import 'package:a_shop/common/widgets/store_heading.dart';
import 'package:flutter/material.dart';

import '../../utilis/constants/colors.dart';
import '../../utilis/constants/image_strings.dart';
import '../../utilis/constants/size.dart';
import 'customtabbar.dart';
import 'modified_grid.dart';

class ANestedScroll extends StatelessWidget {
  const ANestedScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(headerSliverBuilder: (_, innerBoxScrolled){
      return [
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          floating: true,
          backgroundColor: AColors.white,
          expandedHeight: 400,
          flexibleSpace: Padding(padding: EdgeInsets.all(ASizes.sm),
              child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Searchbar(),
                    SizedBox(height: ASizes.md),
                    FeaturedBrands(),
                    SizedBox(height: ASizes.md),
                    ModifiedGrid(url: AImages.popularImage1, name: 'Nokia', itemCount: 4, mainAxisExtent: 60)
                  ]
              )
          ),
          bottom: CustomTabBar(tabs: [
            Tab(child: Text('Phones'),),
            Tab(child: Text('Computers')),
            Tab(child: Text('Laptops')),
            Tab(child: Text('TVs')),
            Tab(child: Text('SolarPanels')),
            Tab(child: Text('Electrical Appliances')),
            Tab(child: Text('Woofers')),
          ],),
        ),

      ];
    },
        body: TabBarView(children:[
          Phones(),
          Samsung(),
          Samsung(),
          Samsung(),
          Samsung(),
          Samsung(),
          Samsung(),

        ],
        )

    );
  }
}