import 'package:biddabd/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

class LanguageLearning extends StatelessWidget {
  const LanguageLearning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height *.18,
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context,index)=>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Container(
                      height: size.height*.15,
                      width: size.height*.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey,
                      ),

                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Expanded(
                            flex:6,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)


                              ),),
                          ),
                          Expanded(
                            flex:4,child:Container(
                            child: Center(
                              child: CustomText(title:"L1",size: 14,),
                            ),
                          ),),
                        ],
                      ),

                    ),

                  ],
                )
        ),
      ),
    );
  }
}
