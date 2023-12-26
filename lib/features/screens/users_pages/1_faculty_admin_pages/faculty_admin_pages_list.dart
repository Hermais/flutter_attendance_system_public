import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/instructor_cubit.dart';
import 'package:flutter_attendance_system/core/cubits/internet_cubit.dart';
import 'package:flutter_attendance_system/core/data/repositories/example_repository.dart';
import 'package:flutter_attendance_system/core/data/services/example_web_services.dart';
import 'package:flutter_attendance_system/features/widgets/loading_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/user_cubit.dart';
import '../../../../core/data/repositories/instructor_repository.dart';
import '../../../../core/data/services/instructor_web_services.dart';
import '../../../../shared/constants_and_statics/shared_vars.dart';
import '../../../widgets/card_widget.dart';
import '../../../widgets/icons_widget.dart';

List<Widget> provideWidgetOptions(BuildContext context) {
  const margin = 5.0;

  return <Widget>[
    ListView.builder(
      itemCount: academicYears.length,
      itemBuilder: (context, index) {
        return InfoCard.blank(
          cardTitle: academicYears[index],
          cardThumbnail: const CustomIcon(icon: Icons.account_box),
          margin: margin,
          onTap: () {
            Navigator.pushNamed(context, adminTimetables,
                arguments: academicYears[index]);
          },
        );
      },
    ),

    /// This widget will show the instructors and some info about them. NOTHING ELSE DAMMIT.
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => InstructorCubit(
                instructorRepository: InstructorRepository(
                    instructorWebServices: InstructorWebServices()))
              ..loadInstructor()),
        BlocProvider(
          create: (context) => InternetCubit(connectivity: Connectivity()),
        ),
      ],
      child: BlocConsumer<InstructorCubit, InstructorState>(
        listener: (context, state) {},
        builder: (context, instructorState) {
          if (instructorState is InstructorInitial) {

            return const Center(child: LoadingIndicator());
          }
          if (instructorState is InstructorLoaded) {
            return ListView.builder(
              itemCount: instructorState.instructors.length,
              itemBuilder: (context, index) {
                return InfoCard.blank(
                  cardTitle: 'Dr. ${instructorState.instructors[index].firstName}'
                      ' ${instructorState.instructors[index].lastName}',
                  cardThumbnail: const CustomIcon(icon: Icons.account_box),
                  margin: margin,
                  cardDescription: 'Email: ${instructorState.instructors[index].emailId}\n'
                  'Department: ${instructorState.instructors[index].department}\n',
                  descriptionMaxLines: 2,
                );
              },
            );
          }
          return const Center(
            child: Text('Something went wrong!'),
          );
        },
      ),
    ),
  ];
}
