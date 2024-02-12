

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_program/common/models/course.dart';

part 'add_mentor_state.dart';

class AddMentorCubit extends Cubit<AddMentorState> {
  AddMentorCubit() : super(AddMentorInitial());
  void addMentor({
    required String bio,
    required String skills,
    required String courseName,
    required double fee,
    required int experience,
  }
  )async{
  emit(AddMentorLoading());
  try {
    
  } catch (e) {
    
  }
  }


}
