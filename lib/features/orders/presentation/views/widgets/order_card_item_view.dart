
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final String date;
  final String? trackingNumber;
  final int quantity;
  final String totalAmount;
  final String status;
  final VoidCallback onDetailsTap;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.date,
    required this.trackingNumber,
    required this.quantity,
    required this.totalAmount,
    required this.status,
    required this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order ID and Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Order №$orderId",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.regular16.copyWith(     
                      color:  AppColors.red,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  date.split(' ')[0], // Extract only the date part
                  style: TextStyles.regular14.copyWith(color: Colors.grey),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          
          // Tracking number
          Row(
            children: [
              Text(
                "Tracking number: ",
                style: TextStyles.regular14.copyWith(color: Colors.grey),
              ),
              Text(
                trackingNumber!,
                style: TextStyles.regular14,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          
          // Quantity and Total Amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Quantity with highlighted badge for first item
             Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                     
                      child: Text(
                        "Quantity: $quantity",
                        style: TextStyles.regular14.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    )
                  ,
              
              // Total Amount
              Row(
                children: [
                  Text(
                    "Total Amount: ",
                    style: TextStyles.regular14.copyWith(color: Colors.grey),
                  ),
                  Text(
                    totalAmount,
                    style:TextStyles.regular14,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          
          // Details button and Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Details button
              OutlinedButton(
                onPressed: onDetailsTap,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 8.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  side: BorderSide(color: Colors.grey[300]!),
                ),
                child: Text(
                  "Details",
                  style: TextStyles.regular14,
                ),
              ),
              
              // Status text
              Text(
                status,
                style: TextStyles.regular14.copyWith(
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
