import 'package:book/view/order_success.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String image;
  final double price;
  final String size;
  final String color;
  int quantity;
  CartItem({
    required this.name,
    required this.image,
    required this.price,
    required this.size,
    required this.color,
    this.quantity = 1,
  });
}

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> _cartItems = [
    CartItem(
      name: "Men's Harrington Jacket",
      image: "assets/images/man.png",
      price: 148.00,
      size: "M",
      color: "Lemon",
    ),
    CartItem(
      name: "Men's Coaches Jacket",
      image: "assets/images/man.png",
      price: 52.00,
      size: "M",
      color: "Black",
    ),
  ];

  double get subtotal => _cartItems.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );

  double get shippingCost => 8.00;
  double get tax => 0.00;
  double get total => subtotal + shippingCost + tax;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: _cartItems.isEmpty ? _buildEmptyCart() : _buildCartItems(),
            ),
            if (_cartItems.isNotEmpty) _buildOrderSummary(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(width: 8),
              Text(
                'Cart',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() => _cartItems.clear());
            },
            child: Text(
              'Remove All',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Text('Your cart is empty'),
    );
  }

  Widget _buildCartItems() {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: _cartItems.length,
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemBuilder: (context, index) {
        final item = _cartItems[index];
        return Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            item.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          '\$${item.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Size - ${item.size}     Color - ${item.color}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildQuantityButton(
                              icon: Icons.remove,
                              onPressed: () {
                                if (item.quantity > 1) {
                                  setState(() => item.quantity--);
                                }
                              },
                            ),
                            SizedBox(width: 16),
                            Text(
                              '${item.quantity}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 16),
                            _buildQuantityButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() => item.quantity++);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: 16, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Column(
        children: [
          _buildSummaryRow('Subtotal', subtotal),
          SizedBox(height: 8),
          _buildSummaryRow('Shipping Cost', shippingCost),
          SizedBox(height: 8),
          _buildSummaryRow('Tax', tax),
          SizedBox(height: 8),
          _buildSummaryRow('Total', total, isTotal: true),
          SizedBox(height: 16),
          _buildCouponInput(),
          SizedBox(height: 16),
          _buildCheckoutButton(),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isTotal ? Colors.black : Colors.grey[600],
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
            fontSize: isTotal ? 16 : 14,
          ),
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
            fontSize: isTotal ? 16 : 14,
          ),
        ),
      ],
    );
  }

  Widget _buildCouponInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(Icons.local_offer_outlined, color: Colors.grey),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Coupon Code',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward, color: Colors.deepPurple),
            onPressed: () {
              // Handle coupon application
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle checkout
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OrderPlacedScreen()));
        },
        child: Text('Checkout'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
