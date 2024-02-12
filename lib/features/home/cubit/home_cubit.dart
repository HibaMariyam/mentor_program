import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_program/common/models/course.dart';
import 'package:mentor_program/common/utils/api_client.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  void getHomeData(
    String search
  )async{
    emit(HomeLoading());
    try {
      final resp =await dioClient.get('/courses', queryParameters: {'search': search});
      final List <Course> courses=[];
      for(final course in resp.data){
        courses.add(Course.fromJson(course));
      }
      emit(HomeLoaded(courses));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
