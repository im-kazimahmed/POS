import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:pos/constant/constants.dart';
import 'package:pos/model/store.dart';
import 'package:pos/util/responsive.dart';

class StepperWidget extends StatelessWidget {
  final int activeStep;
  final Store? store;
  final Function(int) onStepChange;

  const StepperWidget({
    super.key,
    required this.activeStep,
    required this.store,
    required this.onStepChange,
  });

  Color _getStepBackgroundColor(BuildContext context, int stepIndex) {
    bool isMobile = Responsive.isMobile(context);
    if (activeStep >= stepIndex) {
      return isMobile
          ? Colors.white // Mobile active step color
          : store?.primaryColor ?? primaryColor; // Default active color
    } else {
      return isMobile
          ? primaryColor // Mobile inactive step color
          : store?.secondaryColor ?? secondaryColor; // Default inactive color
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Connected steps progress bar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: EasyStepper(
                enableStepTapping: false,
                activeStep: activeStep,
                lineStyle: LineStyle(
                  lineLength: width * 0.1,
                  lineSpace: 0,
                  lineType: LineType.normal,
                  defaultLineColor: Colors.white,
                  finishedLineColor: _getStepBackgroundColor(context, activeStep),
                ),
                defaultStepBorderType: BorderType.normal,
                activeStepBorderColor: _getStepBackgroundColor(context, activeStep),
                activeStepTextColor: _getStepBackgroundColor(context, activeStep),
                finishedStepTextColor: Colors.green,
                unreachedStepBackgroundColor: Colors.white,
                internalPadding: 0,
                showLoadingAnimation: true,
                stepRadius: 10,
                showStepBorder: true,
                steps: [
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 8,
                      backgroundColor: _getStepBackgroundColor(context, 0),
                      // backgroundColor: activeStep >= 0
                      //     ? store?.primaryColor ?? primaryColor
                      //     : store?.secondaryColor ?? secondaryColor,
                    ),
                    title: 'Store Details',
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 8,
                      backgroundColor: _getStepBackgroundColor(context, 1),
                      // backgroundColor: activeStep >= 1
                      //     ? store?.primaryColor ?? primaryColor
                      //     : Colors.white,
                    ),
                    title: 'Theme Setup',
                    topTitle: true,
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 8,
                      backgroundColor: _getStepBackgroundColor(context, 2),
                      // backgroundColor: activeStep >= 2
                      //     ? store?.primaryColor ?? primaryColor
                      //     : Colors.white,
                    ),
                    title: 'Account Setup',
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 8,
                      backgroundColor: _getStepBackgroundColor(context, 3),
                      // backgroundColor: activeStep >= 1
                      //     ? store?.primaryColor ?? primaryColor
                      //     : Colors.white,
                    ),
                    title: 'Activate Plan',
                    topTitle: true,
                  ),
                ],
                onStepReached: onStepChange,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
