import 'package:flutter/material.dart';

class ShowApidataCard extends StatelessWidget {
  ShowApidataCard(
      {super.key,
      required this.cardNumer,
      required this.userId,
      required this.title});
  String cardNumer;
  String userId;
  String title;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      padding: EdgeInsets.all(20),
      height: 200,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            const BoxShadow(
              color: Colors.black,
              blurRadius: 0.8,
              spreadRadius: 0.5,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(

            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const[
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 0.8,
                        spreadRadius: 0.5,
                      )
                    ]),
                child: const Center(
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                    size: 80,
                  ),
                ),
              ),
              SizedBox(width: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Card Id : $cardNumer",style: TextStyle(color: Colors.black,fontSize: 28),),
                  Text("User Id: $userId",style: TextStyle(color: Colors.black,fontSize: 28),),
                ],
              )
            ],
          ),
          SizedBox(height: 10,),
          Text(title.toString(),style: TextStyle(color: Colors.grey,fontSize: 16),),
        ],
      ),
    );
  }
}