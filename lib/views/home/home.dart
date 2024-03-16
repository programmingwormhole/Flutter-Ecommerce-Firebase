import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pw_ecommerce/utils/colors.dart';
import 'package:pw_ecommerce/widgets/custom_app_bar.dart';
import 'package:pw_ecommerce/widgets/custom_single_product_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> sliders = [
      'https://t3.ftcdn.net/jpg/04/65/46/52/360_F_465465254_1pN9MGrA831idD6zIBL7q8rnZZpUCQTy.jpg',
      'https://c8.alamy.com/comp/2H4RC9Y/ecommerce-web-banner-with-3d-smartphone-illustration-with-shopping-bags-wallet-and-credit-card-icons-pump-out-of-screen-2H4RC9Y.jpg',
      'https://static.vecteezy.com/system/resources/previews/004/299/835/original/online-shopping-on-phone-buy-sell-business-digital-web-banner-application-money-advertising-payment-ecommerce-illustration-search-free-vector.jpg',
    ];

    List<String> categories = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
      'assets/images/4.png',
      'assets/images/5.png',
    ];

    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello Flora 👋',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Text(
                'Let’s start shopping!',
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CarouselSlider.builder(
                itemCount: sliders.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(sliders[itemIndex]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                options: CarouselOptions(
                  height: 140,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColors.catBackground,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black.withOpacity(.1),
                          width: 2,
                        ),
                      ),
                      child: Image.asset(categories[index]),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: .9
                ),
                itemBuilder: (_, index) {
                  return const CustomSingleProductGrid();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
