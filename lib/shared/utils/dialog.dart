import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokebook/generated/l10n.dart';

class DialogUtil {
  static void showLoadingDialog(BuildContext context,
      {String? text, String? image}) {
    showGeneralDialog(
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 200),
      context: context,
      pageBuilder: (_, __, ___) {
        return Material(
          type: MaterialType.transparency,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(28.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                  10.verticalSpace,
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      text?.isEmpty == true || text == null
                          ? S.current.loading
                          : text,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void dismissLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
