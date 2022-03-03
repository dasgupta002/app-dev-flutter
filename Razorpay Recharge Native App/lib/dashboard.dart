import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Razorpay _razorpay;

  TextEditingController _contactController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _razorpay = new Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _onPaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _onPaymentFailure);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _checkout() {
    var options = {
      'key': 'rzp_test_yy4mLmjSY8qF2J',
      'amount': num.parse(_amountController.text) * 100,
      'name': 'freeCharge',
      'description': 'Caller Topup',
      'prefill': {'contact': _contactController.text, 'email': ''},
      'external': {
        'wallets': ['paytm', 'phonepe', 'googlepay', 'amazonpay']
      }
    };

    _razorpay.open(options);
  }

  void _onPaymentSuccess(PaymentSuccessResponse response) {
    MotionToast.success(title: Text('Topup succeded!'), description: Text('For reference your payment code is ' + response.paymentId), width: 300).show(context);
    _contactController.clear();
    _amountController.clear();
  }

  void _onPaymentFailure(PaymentFailureResponse response) {
    MotionToast.error(title: Text('Topup failed, try again!'), description: Text(response.message.toString()), width: 300).show(context);
    _contactController.clear(); 
    _amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('freeCharge'),
        elevation: 0,
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.more_vert, 
            color: Colors.white
          )
        ]
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Welcome to freeCharge, fill up your wallet to get free calls. One stop for any carrier without any surcharge for you!',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18.0, 
                  color: Colors.black
                )
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _contactController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter your contact number!',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone)
                )
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter your topup amount!',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.money)
                )
              ),
              SizedBox(height: 20.0),
              Text(
                'Recheck your caller details and pay from any option you love. After payment, wait for a confirmation message from us!',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18.0, 
                  color: Colors.black
                )
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _checkout,
                child: Text(
                  'Recharge now!',
                  style: TextStyle(
                    color: Colors.white
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}  