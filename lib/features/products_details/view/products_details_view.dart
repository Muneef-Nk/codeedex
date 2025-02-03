import 'package:codeedex/core/color/color_contansts.dart';
import 'package:codeedex/core/global/loading.dart';
import 'package:codeedex/features/products_details/viewmodel/products_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProductsDetailsView extends StatefulWidget {
  final String id;
  const ProductsDetailsView({super.key, required this.id});

  @override
  State<ProductsDetailsView> createState() => _ProductsDetailsViewState();
}

class _ProductsDetailsViewState extends State<ProductsDetailsView> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductsDetailsViewmodel>(context, listen: false)
        .getProductsDetails(context, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset("assets/svg/notification.svg"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child:
            Consumer<ProductsDetailsViewmodel>(builder: (context, provider, _) {
          return provider.isLoading
              ? Center(child: Loading())
              : Column(
                  children: [
                    Image.network(
                      provider.productDetailsModel?.partImage ?? '',
                      height: 300,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        provider.productDetailsModel?.description ?? '0',
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      spacing: 10,
                      children: [
                        RatingBar.builder(
                          initialRating: double.tryParse(provider
                                      .productDetailsModel?.productRating
                                      .toString() ??
                                  '0') ??
                              0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 25,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Text(
                          provider.productDetailsModel?.productRating ?? '0',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Highlights",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      spacing: 5,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "• Type ${provider.productDetailsModel?.partsCat}",
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "• Offer ${provider.productDetailsModel?.offerPrice ?? 0}",
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "• Brand ${provider.productDetailsModel?.vBrand ?? 0}",
                          ),
                        ),
                      ],
                    )
                  ],
                );
        }),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 5,
              blurRadius: 10,
            )
          ],
        ),
        child:
            Consumer<ProductsDetailsViewmodel>(builder: (context, provider, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "₹${provider.productDetailsModel?.price ?? '0'}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.deepBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
