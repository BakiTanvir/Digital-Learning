import 'package:biddabd/Data/catagory.dart';
import 'package:biddabd/Data/admission_test_course.dart';
import 'package:biddabd/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AdmissionTest extends StatefulWidget {
  final classes = AdmissionTestCourse.getAdmsn();

  @override
  State<AdmissionTest> createState() => _AdmissionTestState();
}

class _AdmissionTestState extends State<AdmissionTest> {
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: 150,
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.classes.length,
            itemBuilder: (context,index)=>
                Card(
                  elevation: 3,
                  child: Container(
                    height: size.height*.12,
                    width: size.height*.16,
                    margin: EdgeInsets.only(right: 10),

                    child: Column(
                      children: [
                        Expanded(
                            flex:15,
                            child:Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(image: AssetImage(widget.classes[index].addsImg.toString()),fit: BoxFit.cover)

                              ),) ),
                        Expanded(
                          flex:5,
                          child:Container(
                            alignment: Alignment.center,
                            child: CustomText(title: widget.classes[index].addsTitle.toString(),size: 15,fw: FontWeight.w700,),
                          ),),
                      ],
                    ),
                  ),
                )
        ),
      ),
    );
  }
}
