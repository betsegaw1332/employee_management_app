import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RolesSlidingPanel extends StatefulWidget {
  final PanelController controller;
  final Widget panelBody;
  final Function(String) onTap;
  const RolesSlidingPanel(
      {super.key, required this.controller, required this.panelBody,required this.onTap});

  @override
  State<RolesSlidingPanel> createState() => _RolesSlidingPanelState();
}

class _RolesSlidingPanelState extends State<RolesSlidingPanel> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        
        minHeight: 0,
        maxHeight: .255.sh,
        controller: widget.controller,
        backdropEnabled: true,
        backdropOpacity: .4,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp)),
        panel: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
              AppStrings.selectRoles.length,
              (index) => GestureDetector(
                    onTap: () {
                      widget.onTap( AppStrings.selectRoles[index]);
                      widget.controller.close();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 13.h),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 1.5,
                              color: index != AppStrings.selectRoles.length - 1
                                  ? AppColors.greyLighterColor
                                  : Colors.white),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppStrings.selectRoles[index],
                          style: TextStyle(
                              color: AppColors.lightBlackColor,
                              fontSize: 13.sp),
                        ),
                      ),
                    ),
                  )),
        ),
        collapsed: const SizedBox(),
        body: widget.panelBody);
  }
}
