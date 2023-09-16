import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled8/screens/product_screen.dart';
import '../data/models/product_model.dart';

class ListScreen extends StatefulWidget {
  ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Future<List<ProductData>> getData() async{
    final res = await http.get(Uri.parse('https://dummyjson.com/products'));
    List<ProductData> dataA = [];
    if(res.statusCode == 200){
      Map<String, dynamic> responseData = jsonDecode(res.body);
      for(var item in responseData['products']){
        dataA.add(ProductData.fromjson(item));
      }
    }
    return dataA;
  }

  List<ProductData> myList =[];
  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    Future.delayed(
        Duration.zero,
        () async{
          var data = await getData();
          setState(() {
            myList = data;
            isLoading = false;
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.teal,
      body: isLoading ?
      const Center(
        child: CircularProgressIndicator(),
      ) :
      SafeArea(
          child: GridView.builder(
            itemCount: myList.length,
            itemBuilder: (context,index){
              return InkWell(
                  onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(
                        product: myList[index],
                      ),
                    ));
              },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    color: const Color(0x0fffffff),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.network(
                          myList[index].image,
                      ).image,
                    )
                  ),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          myList[index].name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${myList[index].price.toString()} EGP',
                          style: const TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),

          ),
        ),
      );
  }
}

