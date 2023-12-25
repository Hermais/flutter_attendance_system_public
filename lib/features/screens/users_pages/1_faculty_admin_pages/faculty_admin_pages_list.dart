import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/internet_cubit.dart';
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
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          UserCubit(
              userRepository:
              UserRepository(userWebService: UserWebService()))
            ..loadUsers,
        ),
        BlocProvider(
          create: (context) => InternetCubit(connectivity: Connectivity()),
        ),
      ],
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is UserInitial) {
            BlocProvider.of<UserCubit>(context).loadUsers();

            return Center(
              child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
            );
          }
          if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                return InfoCard.blank(
                  cardTitle: 'Dr. ${state.users[index].name}',
                  cardThumbnail: const CustomIcon(icon: Icons.account_box),
                  margin: margin,
                  cardDescription: 'Email: ${state.users[index].email}\n'
                      'Phone: ${state.users[index].phone}\n',
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
