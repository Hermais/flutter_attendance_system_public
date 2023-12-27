import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/auth_cubit.dart';
import '../../../../core/cubits/lecture_cubit.dart';
import '../../../../core/cubits/student_cubit.dart';
import '../../../../core/data/repositories/lecture_repository.dart';
import '../../../../core/data/repositories/student_repository.dart';
import '../../../../core/data/services/lecture_web_services.dart';
import '../../../../core/data/services/student_web_services.dart';
import '../../../../main.dart';
import '../../../../shared/constants_and_statics/shared_vars.dart';
import '../../../widgets/card_widget.dart';



class StudentTimetable extends StatelessWidget {

   final String day;
  const StudentTimetable({super.key ,required this.day });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lecture of $day'),
        ),

        body: BlocProvider(
          create: (context) => LectureCubit(
              lectureRepository:
              LectureRepository(lectureWebServices: LectureWebServices()))
            ..loadLectureTimeTableByDay((authCubit.state as AuthSuccess).authGet.id,day),
          child: BlocBuilder<LectureCubit, LectureState>(
            builder: (context, lectureState){

              if(lectureState is LectureInitial){

                return Center(
                  child: CircularProgressIndicator(color: Theme
                      .of(context)
                      .primaryColor,),
                );
              }
              if (lectureState is LectureLoaded){
                return ListView.builder(
                    itemCount: lectureState.lectureList.length,
                    itemBuilder: (context, index) {
                      return InfoCard(
                        isLectureCard: true,
                        isButtonVisible: false,
                        isTopLeftBorderMaxRadius: false,
                        cardThumbnail: const Icon(Icons.book),
                        cardDescription:
                        "Lecture of ${day} will be shown here.",
                        cardTitle: "Lecture ${lectureState.lectureList[0].lectureID}",
                      );
                    });}
              return Placeholder();
            },
          ),
        ));
  }
}
