import 'package:codeedex/core/color/color_contansts.dart';
import 'package:codeedex/features/home/viewmodel/home_viewmodel.dart';
import 'package:codeedex/features/home/widgets/category_container.dart';
import 'package:codeedex/features/home/widgets/heading.dart';
import 'package:codeedex/features/home/widgets/product_container.dart';
import 'package:codeedex/features/home/widgets/product_loading.dart';
import 'package:codeedex/features/products_details/view/products_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeEcommerceScreen extends StatefulWidget {
  const HomeEcommerceScreen({super.key});

  @override
  State<HomeEcommerceScreen> createState() => _HomeEcommerceScreenState();
}

class _HomeEcommerceScreenState extends State<HomeEcommerceScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<Homeviewmodel>(context, listen: false).getCategories(context);
    });
  }

  var name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: SvgPicture.asset("assets/svg/logo.svg"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset("assets/svg/notification.svg"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 45,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 5,
                      blurRadius: 10,
                    )
                  ]),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search products',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  color: AppColors.deepBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/png/banner.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmoothPageIndicator(
                controller: PageController(),
                count: 3,
                effect: WormEffect(dotWidth: 10, dotHeight: 10),
                onDotClicked: (index) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            "assets/png/Rectangle 116.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text("Bike Spare Parts"),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            "assets/png/Rectangle 117.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text("Accessories"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 4,
                  blurRadius: 10,
                )
              ]),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      child: Text(
                        'Top Categories',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Consumer<Homeviewmodel>(
                        builder: (context, provider, _) {
                      return ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.categoryList.length,
                        itemBuilder: (context, index) {
                          var category = provider.categoryList[index];
                          return CategoryContainer(
                            title: category['title'],
                            icon: category['image'],
                            onpressed: category['onpressed'],
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Heading(
              label: "All Products",
              onPressed: () {},
            ),
            Consumer<Homeviewmodel>(builder: (context, provider, _) {
              return provider.isLoading
                  ? ProductsLoading()
                  : provider.productList.isEmpty
                      ? Center(child: Text("Products not available."))
                      : provider.errorMessage != ''
                          ? Center(child: Text(provider.errorMessage))
                          : SizedBox(
                              height: 300,
                              child: ListView.separated(
                                itemCount: provider.productList.length,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: 15),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  var item = provider.productList[index];

                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductsDetailsView(
                                            id: item.id.toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: ProductContainer(
                                      image: item.partImage ?? '',
                                      price: item.price ?? '0',
                                      rating: double.tryParse(
                                              item.productRating ?? '0') ??
                                          0,
                                      title: item.partsName ?? 'Not available',
                                    ),
                                  );
                                },
                              ),
                            );
            }),
          ],
        ),
      ),
    );
  }
}
