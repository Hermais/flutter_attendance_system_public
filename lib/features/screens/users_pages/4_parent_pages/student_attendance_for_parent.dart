import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/parent_cubit.dart';
import 'package:flutter_attendance_system/core/data/repositories/parent_repository.dart';
import 'package:flutter_attendance_system/core/data/services/parent_web_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/constants_and_statics/shared_vars.dart';
import '../../../widgets/card_widget.dart';

class ParentStudentAttendanceByWeekAndDay extends StatelessWidget {
  // routeName variable decides which page to show of students of a specific course.
  final String day;


  const ParentStudentAttendanceByWeekAndDay({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Attended Lectures of $day'),
        ),
        // TODO: Fetch the list of attended lectures.
        //  from the database.
        body: BlocProvider(
          create: (context) => ParentCubit(parentRepository: ParentRepository(
              parentWebServices: ParentWebServices()))
            ..loadParent(),
          child: BlocBuilder<ParentCubit, ParentState>(
            builder: (context, parentState) {
              if(parentState is ParentInitial){

                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(parentState is ParentLoaded){
              return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InfoCard(
                      isLectureCard: true,
                      isButtonVisible: false,
                      isTopLeftBorderMaxRadius: false,
                      cardThumbnail: const Icon(Icons.book),
                      cardDescription: "Lecture was attended.",
                      cardTitle: "Lecture ${index + 1}",
                    );
                  });}
              return Placeholder();
            },
          ),
        ));
  }
}

class ShowDays extends StatelessWidget {
  const ShowDays({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select a Day'),
        ),
        body: ListView.builder(
          itemCount: days.length,
          itemBuilder: (context, index) {
            return InfoCard(
              isLectureCard: false,
              isButtonVisible: false,
              isTopLeftBorderMaxRadius: false,
              cardThumbnail: const Icon(Icons.person),
              cardDescription: "Show the attendance of the students for ${days[index]}.",
              cardTitle: days[index],
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return ParentStudentAttendanceByWeekAndDay(
                          day: days[index]);
                    }));
              },
            );
          },
        )
    );
  }
}


