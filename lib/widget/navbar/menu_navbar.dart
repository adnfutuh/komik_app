import 'package:flutter/material.dart';
import 'package:komik_app/const/text/text.dart';

import '../../util/util.dart';

class MenuNavbar extends StatelessWidget {
  final Function(int) changeIndex;
  final int activeIndex;

  const MenuNavbar({
    super.key,
    required this.changeIndex,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    Util util = Util(context);
    List<NavItem> navItems = [
      NavItem(name: 'Info'),
      NavItem(name: 'Sinopsis'),
    ];

    return Row(
      mainAxisAlignment: util.isPhone
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceAround,
      children: List.generate(
        navItems.length,
        (index) {
          return Semantics(
            label: 'Navigasi ke ${navItems[index].name}',
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                changeIndex(index);
              },
              child: AnimatedContainer(
                duration: const Duration(
                  milliseconds: 200,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: index == activeIndex ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  navItems[index].name,
                  style: defaultTxt.copyWith(
                    color: index == activeIndex ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NavItem {
  final String name;
  NavItem({required this.name});
}
