import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/src/providers/page_provider.dart';
import 'package:vertical_landing_page/src/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        setState(() {
          isOpen = !isOpen;
          isOpen ? controller.forward() : controller.reverse();
        });
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 308 : 50,
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),
              if (isOpen)
                ...[
                  CustomMenuItem(
                    text: 'Home',
                    onPressed: () => pageProvider.goTo(0),
                  ),
                  CustomMenuItem(
                    delay: 20,
                    text: 'About',
                    onPressed: () => pageProvider.goTo(1),
                  ),
                  CustomMenuItem(
                    delay: 40,
                    text: 'Pricing',
                    onPressed: () => pageProvider.goTo(2),
                  ),
                  CustomMenuItem(
                    delay: 60,
                    text: 'Contact',
                    onPressed: () => pageProvider.goTo(3),
                  ),
                  CustomMenuItem(
                    delay: 80,
                    text: 'Location',
                    onPressed: () => pageProvider.goTo(4),
                  ),
                  const SizedBox(height: 8)
                ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          Text(
            'Menu',
            style: GoogleFonts.roboto(fontSize: 18, color: Colors.white),
          ),
          const Spacer(),
          AnimatedIcon(
              progress: controller,
              icon: AnimatedIcons.menu_close,
              color: Colors.white)
        ],
      ),
    );
  }
}
