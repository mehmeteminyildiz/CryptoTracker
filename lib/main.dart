import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/Classes/Coin.dart';
import 'package:project/Pages/CoinDetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Coin>> getCoinList() async {
    var coinList = <Coin>[];
    Coin c1 = new Coin(
      "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/1024/Bitcoin-BTC-icon.png",
      "BTC",
      20000,
      12,
    );
    Coin c2 = new Coin(
        "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Ethereum-icon-purple.svg/480px-Ethereum-icon-purple.svg.png",
        "ETH",
        1500,
        1);
    Coin c3 = new Coin(
        "https://www.citypng.com/public/uploads/preview/-316210035915mqt5kbcm8.png",
        "DOGE",
        0.580,
        -5);
    Coin c4 = new Coin(
        "https://cdn4.iconfinder.com/data/icons/crypto-currency-and-coin-2/256/neo_neocoin-512.png",
        "NEO",
        0.058,
        22);

    coinList.add(c1);
    coinList.add(c2);
    coinList.add(c3);
    coinList.add(c4);

    return coinList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Tracker'),
      ),
      body: FutureBuilder<List<Coin>>(
        future: getCoinList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var coinList = snapshot.data;

            return ListView.builder(
              itemCount: coinList!.length,
              itemBuilder: (context, index) {
                Coin coin = coinList[index];
                return GestureDetector(
                  onTap: () {
                    print("Tıklandı : ${coin.name}");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CoinDetail(coin)));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.network(coin.imageName),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 100,
                            child: Center(
                              child: Text(
                                "${coin.name}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 100,
                            child: Center(
                              child: Text(
                                "${coin.price}",
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 100,
                            child: Center(
                              child: Text(
                                "${coin.change}",
                                style: TextStyle(
                                    color: coin.change >= 0
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text("DATA YOK"),
            );
          }
        },
      ),
    );
  }
}
