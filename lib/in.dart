// import 'package:Botinfo/chat_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';

// import 'commonWidget.dart';

// class InAppPurchases extends StatefulWidget {
//   const InAppPurchases({super.key});

//   @override
//   State<InAppPurchases> createState() => _InAppPurchasesState();
// }

// var primiumColor = 0;

// class _InAppPurchasesState extends State<InAppPurchases> {
//   @override
//   void initState() {
//     // TODO: implement initState


//     initInApp(Provider);

//     super.initState();


//     primiumColor = 0;
//   }

//   initInApp(Provider) async{
//     await Provider.initInApp();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 0.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Spacer(),
//                 SizedBox(height: 15.0),
//                 Column(
//                   children: [
//                     Container(
//                       child: Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               children: [
//                                 Container(
//                                   width: (270),
//                                   child: Padding(
//                                       padding: const EdgeInsets.all(0.0),
//                                       child:
//                                        Text(
//                                           'Let the genie out of the bottle',
//                                           style: TextStyle(
//                                             fontSize: 30.0,
//                                             fontFamily: 'Poppins',
//                                             color: Colors.white,
//                                           ))),
//                                 ),
//                               ],
//                             ),
//                             // SizedBox(width: (20)),
//                             // Spacer(),
//                             GestureDetector(
//                               onTap: () {
//                                 Get.to(ChatScreen());
//                               },
//                               child: Text('Skip',
//                                   style: TextStyle(
//                                     fontSize: 15.0,
//                                     fontFamily: 'Poppins',
//                                     color: Colors.grey,
//                                   )),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('GET ACCESS TO',
//                               style: TextStyle(
//                                 fontSize: 17.0,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.grey,
//                               ))
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.grey.shade700,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.shade700,
//                               blurRadius: 7,
//                             ),
//                           ],
//                         ),
//                         child: Center(
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.fromLTRB(15, 15, 15, 7),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           10, 0, 15, 0),
//                                       child: Image.asset(
//                                         "assets/images/check.png",
//                                         height: 25,
//                                         color: fromHex('#3FE8B5'),
//                                       ),
//                                     ),
//                                     Text('Unlimited Questions & Answer',
//                                         style: TextStyle(
//                                           fontSize: 15.0,
//                                           fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.fromLTRB(15, 7, 15, 7),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           10, 0, 15, 0),
//                                       child: Image.asset(
//                                         "assets/images/check.png",
//                                         height: 25,
//                                         color: fromHex('#3FE8B5'),
//                                       ),
//                                     ),
//                                     Text('Highet Word Limit',
//                                         style: TextStyle(
//                                           fontSize: 15.0,
//                                           fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.fromLTRB(15, 7, 15, 15),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           10, 0, 15, 0),
//                                       child: Image.asset(
//                                         "assets/images/check.png",
//                                         height: 25,
//                                         color: fromHex('#3FE8B5'),
//                                       ),
//                                     ),
//                                     Text('Most Advanced AI Model ChatGPT',
//                                         style: TextStyle(
//                                           fontSize: 15.0,
//                                           fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                     //
//                   ],
//                 ),
//                 SizedBox(
//                   height: 160.0,
//                 ),
//                 Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           primiumColor = 1;
//                         });
//                         // Get.to(ChatScreen());

//                         // Get.to(ChatScreen2());
//                       },
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
//                           child: Container(
//                             height: 50.0,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: primiumColor == 1
//                                       ? fromHex('#3FE8B5')
//                                       : Colors.grey.shade700),
//                               color: primiumColor == 1
//                                   ? fromHex('#1F5B48')
//                                   : Colors.transparent,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30)),
//                             ),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                                     child:
//                                         Text("3 days for free,then \$6.99/week",
//                                             style: TextStyle(
//                                               fontSize: 15.0,
//                                               fontFamily: 'Poppins',
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.white,
//                                             )),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           primiumColor = 0;
//                         });

//                         // Get.to(ChatScreen());

//                         // Get.to(ChatScreen2());
//                       },
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
//                           child: Container(
//                             height: 50.0,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: primiumColor == 0
//                                       ? fromHex('#3FE8B5')
//                                       : Colors.grey.shade700),
//                               color: primiumColor == 0
//                                   ? fromHex('#1F5B48')
//                                   : Colors.transparent,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30)),
//                             ),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                                     child: Text("\$69.99/year",
//                                         style: TextStyle(
//                                           fontSize: 15.0,
//                                           fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                         )),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                         child: Image.asset(
//                           "assets/images/lock.png",
//                           height: 17,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       Text('Secured with iTunes.Cancel anytime ',
//                           style: TextStyle(
//                             fontSize: 15.0,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey,
//                           ))
//                     ],
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {});

//                         // Get.to(ChatScreen());

//                         // Get.to(ChatScreen2());
//                       },
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
//                           child: Container(
//                             height: 60.0,
//                             decoration: BoxDecoration(
//                               border: Border.all(color: fromHex('#3FE8B5')),
//                               color: fromHex('#3FE8B5'),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10)),
//                             ),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                     child: Image.asset(
//                                       "assets/images/lock.png",
//                                       height: 17,
//                                       color: Colors.transparent,
//                                     ),
//                                   ),
//                                   Text("Continue",
//                                       style: TextStyle(
//                                         fontSize: 20.0,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black,
//                                       )),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.fromLTRB(0, 0, 20, 0),
//                                     child: Image.asset(
//                                       "assets/images/next.png",
//                                       height: 25,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 // RichText(
//                 //     text: TextSpan(
//                 //         text: 'advanced language model at',
//                 //         style: TextStyle(fontSize: 20.0),
//                 //         children: [
//                 //       // TextSpan(text: 'advanced language model at your fingertips')
//                 //     ])),
//                 // RichText(
//                 //     text: TextSpan(
//                 //         text: ' your fingertips',
//                 //         style: TextStyle(fontSize: 20.0),
//                 //         children: [
//                 //       // TextSpan(text: 'advanced language model at your fingertips')
//                 //     ])),

//                 // GestureDetector(
//                 //   onTap: () {
//                 //     print("*************APPPID****${_appId}");

//                 //     // Get.to(ChatScreen());

//                 //     Get.to(InAppPurchases());
//                 //     // Get.to(ChatScreen2());
//                 //   },
//                 //   child: Container(
//                 //     height: 50.0,
//                 //     width: 200.0,
//                 //     decoration: BoxDecoration(
//                 //       border: Border.all(
//                 //         color: Color.fromRGBO(0, 111, 255, 1),
//                 //       ),
//                 //       color: Color.fromRGBO(0, 111, 255, 1),
//                 //       borderRadius: BorderRadius.all(Radius.circular(20)),
//                 //     ),
//                 //     child: Center(
//                 //         child: Text(
//                 //       'GET STARTED',
//                 //       style: TextStyle(
//                 //           fontSize: 15.0,
//                 //           fontFamily: 'Poppins',
//                 //           color: Colors.white,
//                 //           fontWeight: FontWeight.bold),
//                 //     )),
//                 //   ),
//                 // ),

//                 // GestureDetector(
//                 //   onTap: () {
//                 //     print("*****${AppReview.requestReview.then(log)}");
//                 //     print("**l***${log}");
//                 //     print("**a***${appID}");
//                 //     print("**o***${output}");

//                 //     if (output == "Success: true") {
//                 //       AppReview.storeListing.then(log);

//                 //       print("(****)");
//                 //     } else {
//                 //       AppReview.requestReview.then(log);
//                 //     }
//                 //   },
//                 //   child: Container(
//                 //       child: Text('RATE US',
//                 //           style: TextStyle(
//                 //             fontSize: 15.0,
//                 //             fontFamily: 'Poppins',
//                 //             color: Colors.white,
//                 //           ))),
//                 // ),

//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.center,
//                 //   children: [
//                 //     Image.asset(
//                 //       'assets/images/app-icon-black-bg.png',
//                 //       height: 20.0,
//                 //     ),
//                 //     SizedBox(
//                 //       width: 5.0,
//                 //     ),
//                 //     Text('BOTINFO',
//                 //         style: TextStyle(
//                 //           fontSize: 15.0,
//                 //           fontFamily: 'Poppins',
//                 //           color: Colors.white,
//                 //         ))
//                 //   ],
//                 // ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
