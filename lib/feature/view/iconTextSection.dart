import 'package:flutter/material.dart';
import 'package:projectwithsqllite/core/helper/extensions.dart';
import 'package:projectwithsqllite/core/routing/route.dart';

class IconAndTextSections extends StatelessWidget {
  const IconAndTextSections({super.key, required this.icon, this.label});

  final IconData icon;
  final String? label;
  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color),
              const SizedBox(
                height: 5,
              ),
              Text(
                label ?? "label",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              )
            ],
          ),
          //For Add More
        ],
      ),
    );
  }
}

class iconAndText extends StatelessWidget {
  const iconAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            context.pushNamed(Routes.addStudent);
          },
          child: const IconAndTextSections(
            label: "Add",
            icon: Icons.add,
          ),
        ),
        InkWell(
          onTap: () {
            context.pushNamed(Routes.listViewbuilder);
          },
          child: const IconAndTextSections(
            label: "List Student",
            icon: Icons.list_alt,
          ),
        ),
        const IconAndTextSections(
          icon: Icons.share,
          label: "Share",
        ),
      ],
    );
  }
}
