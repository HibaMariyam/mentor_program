import 'package:flutter/material.dart';
import 'package:mentor_program/features/home/views/home_page.dart';

class AddMentor extends StatefulWidget {
  const AddMentor({super.key});

  @override
  State<AddMentor> createState() => _AddMentorState();
}

class _AddMentorState extends State<AddMentor> {
  final _formKey = GlobalKey<FormState>();
  final _experienceController = TextEditingController();
  final _feeController = TextEditingController();
  final _bioController=TextEditingController();
  final _courseController=TextEditingController();
  final _skillsController=TextEditingController();
  String _selectedExperience = 'Select';
  List<String> _experience = ['Select','Years', 'Months','Days'];
  String _selectedFee = 'Select';
  List<String> _fee = ['Select','Free', 'Paid'];


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          elevation: 0,
        ),
        body:  SingleChildScrollView(
          child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Join as a Mentor',
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20,),
                         Text('Bio',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5,),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field cannot be empty';
                            }
                            return null;
                          },
                          controller: _bioController,
                          decoration: InputDecoration(
                            hintText: 'Add your bio',
                            border: OutlineInputBorder(),
          
                          ),
                          maxLines: 3,
                          ),
                        SizedBox(height: 10,),
                         Text('Skills',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5,),
                        TextFormField(
                           validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field cannot be empty';
                            }
                            return null;
                          },
                          controller: _skillsController,
                          decoration: InputDecoration(
                            hintText: 'Add your skills',
                            border: OutlineInputBorder(),
          
                          ),
                          ),
                        SizedBox(height: 10,),
                         Text('Mentorship Focus',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5,),
                        TextFormField(
                           validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field cannot be empty';
                            }
                            return null;
                          },
                          controller: _courseController,
                          decoration: InputDecoration(
                            hintText: 'Enter the course you focus on for mentorship',
                            border: OutlineInputBorder(),
          
                          ),
               
                          ),
                        SizedBox(height: 10,),
                        Text('Mentorship Fee',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        
                        SizedBox(height: 5,),
                        TextFormField(
                           validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field cannot be empty';
                            }
                            return null;
                          },
                          controller: _feeController,
                          decoration: InputDecoration(
                            hintText: 'Enter fee in rupees per hour',
                            border: OutlineInputBorder(),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton<String>(
                                value: _selectedFee,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _feeController.clear();
                                    _selectedFee = newValue!;
                                    if(_selectedFee == 'Free'){
                                      _feeController.text = 'Free';
                                    }else{
                                      _feeController.text = 
                                      '${_feeController.text}/hr'
                                      ;
                                    }
                                  });
                                },
                                items: _fee.map<DropdownMenuItem<String>>((String _feevalue) {
                                  return DropdownMenuItem<String>(
                                    value: _feevalue,
                                    child: Text(_feevalue),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
          
                       
                        SizedBox(height: 10,),
                        Text('Mentoring Experience',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5,),
                        TextFormField(
                           validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field cannot be empty';
                            }
                            return null;
                          },
                          controller: _experienceController,
                          decoration: InputDecoration(
                            hintText: 'Enter experience in number',
                            border: OutlineInputBorder(),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton<String>(
                                value: _selectedExperience,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedExperience = newValue!;
                                  });
                                },
                                items: _experience.map<DropdownMenuItem<String>>((String _value) {
                                  return DropdownMenuItem<String>(
                                    value: _value,
                                    child: Text(_value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                         SizedBox(height: 10,),
                       ElevatedButton(onPressed: (){
                        if(_formKey.currentState!.validate()){
                         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
                        }
                       
                  }, child:  Text('Join',
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
          
                                fontWeight: FontWeight.bold)
                                ),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 40),
                                  backgroundColor: Theme.of(context).colorScheme.primary,
                                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                                  )
                                ),
                                ),
          
                      ],
                    ),
                  ),
                )),
        ),
        ),
      );
    
  }
}