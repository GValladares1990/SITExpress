import 'package:flutter/material.dart';

class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold(
      {super.key,
      required this.wide,
      required this.narrow,
      this.resizeToAvoidBottomInset});

  final Widget wide;
  final Widget narrow;

  final bool? resizeToAvoidBottomInset;

  factory AdaptiveScaffold.single({required Widget single}) {
    return AdaptiveScaffold(wide: single, narrow: single);
  }

  factory AdaptiveScaffold.multi({
    required Widget wide,
    required Widget narrow,
  }) {
    return AdaptiveScaffold(wide: wide, narrow: narrow);
  }

  Widget scaffoldWrapper({required Widget body}) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: body,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      if (constraints.isTablet) {
        return scaffoldWrapper(body: wide);
      } else {
        return scaffoldWrapper(body: narrow);
      }
    });
  }
}

extension BreakpointUtils on BoxConstraints {
  bool get isTablet => maxWidth > 600;
}
