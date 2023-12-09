import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/data/repositories/example_repository.dart';
import 'package:flutter_attendance_system/core/data/services/example_web_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/user_cubit.dart';
import '../../../widgets/card_widget.dart';

List<Widget> provideWidgetOptions() => <Widget>[
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InfoCard(
              isLectureCard: false,
              isButtonVisible: false,
              isTopLeftBorderMaxRadius: false,
              cardThumbnail: const Icon(Icons.table_chart),
              cardDescription:
                  "Here a small description of the timetable is supplied.",
              cardTitle: "Timetable 1",
            ),
            InfoCard(
              isLectureCard: false,
              isButtonVisible: false,
              isTopLeftBorderMaxRadius: false,
              cardThumbnail: const Icon(Icons.table_chart),
              cardDescription:
                  "Here a small description of the timetable is supplied.",
              cardTitle: "Timetable 2",
            ),
            InfoCard(
              isLectureCard: false,
              isButtonVisible: false,
              isTopLeftBorderMaxRadius: false,
              cardThumbnail: const Icon(Icons.table_chart),
              cardDescription:
                  "Here a small description of the timetable is supplied.",
              cardTitle: "Timetable 3",
            ),
            InfoCard(
              isLectureCard: false,
              isButtonVisible: false,
              isTopLeftBorderMaxRadius: false,
              cardThumbnail: const Icon(Icons.table_chart),
              cardDescription:
                  "Here a small description of the timetable is supplied.",
              cardTitle: "Timetable 4",
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocProvider(
              create: (context) => UserCubit(
                  userRepository:
                      UserRepository(userWebService: UserWebService()))..loadUsers,
              child: BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (state is UserInitial) {
                    BlocProvider.of<UserCubit>(context).loadUsers();

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is UserLoaded) {
                    return Column(children: [
                      for (var user in state.users)
                        InfoCard.blank(
                          cardTitle: "Instructor ${user.name}",
                          cardDescription: user.email,
                        ),
                    ]);
                  }
                  return const Center(
                    child: Text('Something went wrong!'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ];
