import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/data/repositories/example_repository.dart';
import 'package:flutter_attendance_system/core/data/services/example_web_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/user_cubit.dart';
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
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocProvider(
            create: (context) => UserCubit(
                userRepository:
                    UserRepository(userWebService: UserWebService()))
              ..loadUsers,
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
}
