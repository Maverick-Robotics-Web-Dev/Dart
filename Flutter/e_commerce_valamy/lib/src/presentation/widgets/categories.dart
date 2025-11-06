import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryModel {
  final String name;
  final String? svgSrc, route;

  CategoryModel({required this.name, this.svgSrc, this.route});
}

List<CategoryModel> demoCategories = [
  CategoryModel(name: "All Categories"),
  CategoryModel(
    name: "On Sale",
    svgSrc: "assets/icons/Sale.svg",
    // route: onSaleScreenRoute,
  ),
  CategoryModel(name: "Man's", svgSrc: "assets/icons/Man.svg"),
  CategoryModel(name: "Woman’s", svgSrc: "assets/icons/Woman.svg"),
  CategoryModel(
    name: "Kids",
    svgSrc: "assets/icons/Child.svg",
    // route: kidsScreenRoute,
  ),
];

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({
    super.key,
    required this.category,
    this.svgSrc,
    required this.isActive,
    required this.press,
  });

  final String category;
  final String? svgSrc;
  final bool isActive;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: isActive ? primaryColor : Colors.transparent,
          border: Border.all(
            color:
                isActive ? Colors.transparent : Theme.of(context).dividerColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(
          children: [
            if (svgSrc != null)
              SvgPicture.asset(
                svgSrc!,
                height: 20,
                colorFilter: ColorFilter.mode(
                  isActive ? Colors.white : Theme.of(context).iconTheme.color!,
                  BlendMode.srcIn,
                ),
              ),
            if (svgSrc != null) const SizedBox(width: 16.0 / 2),
            Text(
              category,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color:
                    isActive
                        ? Colors.white
                        : Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            demoCategories.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 16.0 : 16.0 / 2,
                right: index == demoCategories.length - 1 ? 16.0 : 0,
              ),
              child: CategoryBtn(
                category: demoCategories[index].name,
                svgSrc: demoCategories[index].svgSrc,
                isActive: index == 0,
                press: () {
                  if (demoCategories[index].route != null) {
                    Navigator.pushNamed(context, demoCategories[index].route!);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
