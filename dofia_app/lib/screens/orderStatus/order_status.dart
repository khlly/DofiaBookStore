import 'package:dofia_the_book/widgets/orderStatuses/card_detail_wdiget.dart';
import 'package:dofia_the_book/widgets/orderStatuses/card_status_widget.dart';
import 'package:dofia_the_book/widgets/orderStatuses/cart_order_widget.dart';
import 'package:dofia_the_book/widgets/orderStatuses/drop_down_widget.dart';
import 'package:flutter/material.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Order')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              OrderStatusWidget(
                currentStep: 2,
              ),
              CartOrderWidget(),
              CartOrderWidget(),
              CartOrderWidget(),
              TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  onPressed: () {},
                  child: Text("Add More")),

              SizedBox(height: 16),
              //Select delivery method
              Container(
                decoration: BoxDecoration(
                  color: Color(0x00),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Text(
                      "Select delivery method",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropDownWidget(),
                    DropDownWidget(),
                    DropDownWidget(),
                  ],
                ),
              ),

              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Enter your coupon code',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    SizedBox(
                      height: 40,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size(64, 34),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                        onPressed: () {},
                        child: Text("Apply"),
                      ),
                    ),
                  ],
                ),
              ),

              // You can follow up with your order list here
              SizedBox(height: 16),
              Text(
                "Order Summary",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              CardDetailWidget(
                title: "Order Details",
                subTotal: 120.00,
                discount: 10.00,
                tax: 5.00,
                total: 115.00,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
