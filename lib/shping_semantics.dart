import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShpingSemantics extends StatelessWidget {
  final String? automationId;
  final String? label;
  final Widget? child;

  const ShpingSemantics({
    super.key,
    this.automationId,
    this.label,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final accessibleNavigation = MediaQuery.of(context).accessibleNavigation;
    return Semantics(
      container: true,
      label: accessibleNavigation ? label : automationId,
      explicitChildNodes: !accessibleNavigation,
      child: child,
    );
  }
}

// Just playing around semantics render here

// class ShpingMergeSemantics extends SingleChildRenderObjectWidget {
//   const ShpingMergeSemantics({super.key, super.child});

//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return RenderMergeSemantics();
//   }
// }

// class RenderMergeSemantics extends RenderProxyBox {
//   /// Creates a render object that merges the semantics from its descendants.
//   RenderMergeSemantics({RenderBox? child}) : super(child);

//   @override
//   void describeSemanticsConfiguration(SemanticsConfiguration config) {
//     super.describeSemanticsConfiguration(config);
//     config
//       ..attributedValue = AttributedString("Test 2")
//       ..textDirection = TextDirection.ltr
//       ..isSemanticBoundary = true
//       ..isInMutuallyExclusiveGroup = true
//       ..isMergingSemanticsOfDescendants = true;
//     //..isSemanticBoundary = true
//     //..isMergingSemanticsOfDescendants = true;
//   }
// }
