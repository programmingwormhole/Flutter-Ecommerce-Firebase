import 'package:flutter/material.dart';
import 'package:pw_ecommerce/utils/colors.dart';

class CustomSingleProductGrid extends StatelessWidget {
  const CustomSingleProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.catBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/product1.png'),
              const Text(
                'Redmi Note 4',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '\$500',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$550',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black.withOpacity(.5),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
                  child: Text(
                    '50% Discount',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(.5),
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.favorite_border,
                    size: 20,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
