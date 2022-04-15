import 'package:flutter/material.dart';
import 'package:project/Classes/Coin.dart';

class CoinDetail extends StatefulWidget {
  Coin coin;

  CoinDetail(this.coin);

  @override
  State<CoinDetail> createState() => _CoinDetailState();
}

class _CoinDetailState extends State<CoinDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coin.name),
      ),
      body: Center(
        child: Text(widget.coin.name),
      ),
    );
  }
}
