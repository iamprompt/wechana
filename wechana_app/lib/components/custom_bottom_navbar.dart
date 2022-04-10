import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottonNavBar extends StatelessWidget {
  const CustomBottonNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentRoute = GoRouter.of(context).location;

    return Container(
      padding: EdgeInsets.only(
        left: 35,
        right: 35,
        top: 10,
        bottom: 15,
      ),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.amber,
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(20),
        // ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -7),
            blurRadius: 33,
            color: Color(0xFF6DAED9).withOpacity(0.11),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavItem(
            onPressed: () => context.go('/'),
            icon: Icons.near_me,
            label: 'Nearby',
            isActive: currentRoute == '/',
          ),
          NavItem(
            onPressed: () => context.go('/explore'),
            icon: Icons.explore,
            label: 'Explore',
            isActive: currentRoute == '/explore',
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  final String label;
  final bool isActive;

  const NavItem({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: isActive ? Colors.black : Colors.white,
      ),
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(icon),
          SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }
}
