import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

//navigate to another page, but keep previous ones.
void navigateTo(
  BuildContext context, {
  required Widget page,
  PageTransitionType type = PageTransitionType.leftToRight,
}) =>
    Navigator.of(context).push(
      PageTransition(child: page, type: type),
    );

//navigate to another page and get rid of previous ones.
void navigateAndReplace(
  BuildContext context, {
  required Widget page,
  PageTransitionType type = PageTransitionType.bottomToTop,
}) =>
    Navigator.of(context).pushReplacement(
      PageTransition(child: page, type: type),
    );

void navigateAndRemove(
  BuildContext context, {
  required Widget page,
  PageTransitionType type = PageTransitionType.bottomToTop,
}) =>
    Navigator.of(context).pushAndRemoveUntil(
        PageTransition(child: page, type: type), (route) => false);
