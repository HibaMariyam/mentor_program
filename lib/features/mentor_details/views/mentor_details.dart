import 'package:flutter/material.dart';
import 'package:mentor_program/common/models/course.dart';
import 'package:mentor_program/features/home/views/home_page.dart';

class MentorDetails extends StatefulWidget {
  MentorDetails({super.key,required this.course});
 final Course course;
  @override
  State<MentorDetails> createState() => _MentorDetailsState();
}

class _MentorDetailsState extends State<MentorDetails> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight= MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [            
             Stack(
               children: [
                ClipRRect(
                 borderRadius: BorderRadius.circular(35),
                 child: Container(
                  height: deviceHeight*0.6,
                  width: double.infinity,
                  child: Image.network(widget.course.mentor.image,
                  fit: BoxFit.cover,
                  ),
                 ),
               ),
               
                Positioned(
                  top: 20,
                  child: IconButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                  }, icon:Icon(Icons.arrow_back_ios_new,color:Theme.of(context).colorScheme.tertiary),)),
               Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                 child: Padding(
                   padding: const EdgeInsets.symmetric(
                    horizontal: 15
                   ),
                   child: Container(
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.surface
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(15),
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(widget.course.mentor.fullName,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                              ),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text('Experience',
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                      ),
                                      ),
                               
                                      Text('2 Years',
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ],
                                  ),
                                   Container(
                                  height: 30, 
                                  child: VerticalDivider(
                                  color: Theme.of(context).colorScheme.onBackground,
                                     thickness: 1,
                                           ),
                                              ),
                                 Row(
                                  children: [
                                    Icon(Icons.star,
                                    size: 18,
                                    color: Colors.amber,),
                                  TextButton(child: Text('15 Reviews',
                                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                 fontWeight: FontWeight.bold
                                 ),
                                 ),
                                 onPressed: (){},)
                                  ],
                                 ),
                                   Container(
                                  height: 30, 
                                  child: VerticalDivider(
                                  color: Theme.of(context).colorScheme.onBackground,
                                     thickness: 1,
                                           ),
                                              ),
                                    Row(
                                      children: [
                                         Icon(
                                         Icons.payment,
                                         size: 18,
                                        color: Theme.of(context).colorScheme.onBackground
                          ),
                               if(widget.course.isFree)
                                    Text('Free',
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Colors.green,
                                    fontWeight: FontWeight.bold
                                    ),
                                    )
                                    else
                                    Text('82/hr',
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold
                                    ),
                                    ),
                                      ],
                                    )
                                ]
                              ),
                          ElevatedButton(
                            onPressed: (){}, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.send,color: Theme.of(context).colorScheme.onBackground,),
                              SizedBox(width: 5,),
                              Text('Connect',
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold)
                              ),
                            ],
                                                ),
                          style: ElevatedButton.styleFrom(
                            maximumSize: Size(double.infinity, 80),
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            )
                          ),
                          )
                            
                        ],
                       ),
                     ),
                   ),
                 ) 
               ),
               ]
             ),
             SizedBox(height: 20,),
            Text("About",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 5,),
            Text(widget.course.mentor.bio,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
            ),
            ),
            ],
          ),
        )),
      ),
    );
  }
}