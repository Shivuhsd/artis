import 'dart:developer';

import 'package:artis/controller/productcon.dart';
import 'package:artis/repos/productrepo.dart';
import 'package:flutter/material.dart';
import 'package:artis/detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final d = Product();
    // d.getProduct();
    final d = Cart();
    d.getCart();
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: FutureBuilder(
        future: ProductController().getProduct(),
        builder: (context, snapshot) {
          snapshot.data;

          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final produ = snapshot.data!;

          return ListView.builder(
            itemCount: produ.length,
            itemBuilder: (context, index) {
              return Center(
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading:
                            Image.network(produ[index].productImage.toString()),
                        title: Text(produ[index].pName.toString()),
                        trailing: Text("H"),
                        subtitle:
                            Text(produ[index].productDescription.toString()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: Text("Details"),
                            onPressed: () {
                              /* ... */
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Details(produ, index)),
                              );
                            },
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('Buy'),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              );
              //return Text(produ[index].productDescription.toString());

              //return ListTile(
              //leading: Image.network(produ[index].productImage.toString()),
              //title: Text(produ[index].pName.toString()),
              //subtitle: Text(produ[index].productDescription.toString()),
              // trailing: Text(produ[index].price.toString()),
              // tileColor: Color.fromARGB(87, 130, 133, 133),
              // );

              // return InkWell(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => Details(produ, index)),
              //     );
              //   },
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Container(
              //         child: Text(
              //             "${produ[index].pName.toString()}\nPrice: ${produ[index].price}"),
              //       ),
              //       Container(
              //         color: Color.fromARGB(100, 119, 127, 247),
              //         height: 100,
              //         width: 150,
              //         child: Image.network(
              //           produ[index].productImage.toString(),
              //           width: 150,
              //           height: 100,
              //           fit: BoxFit.contain,
              //         ),
              //       ),
              //     ],
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}
