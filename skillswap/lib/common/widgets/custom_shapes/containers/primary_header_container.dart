import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.accent,
        // size is finite
        child: Stack(
          children: [
            const Positioned(
              top: -160,
              right: -250,
              child: TCircularContainer(
                backgroundColor: TColors.secondary,
              ),
            ),
            Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: TColors.secondary.withOpacity(0.5),
                )),
            child,
          ],
        ),
      ),
    );
  }
}
