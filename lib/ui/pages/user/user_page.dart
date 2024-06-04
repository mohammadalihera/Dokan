import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_show_case/core/cubits/app/app_cubit.dart';
import 'package:product_show_case/core/cubits/auth/auth_cubit.dart';
import 'package:product_show_case/ui/theme/colors.dart';
import 'package:product_show_case/ui/theme/text_style.dart';

import 'widgets/user_profile_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
          style: semiboldTextStyle.copyWith(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Center(child: UserProfileWidget()),
          const SizedBox(height: 20),
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              if (state is LoadedAppState) {
                return Column(
                  children: [
                    Text(
                      state.user?.user_display_name ?? 'N/A',
                      style: semiboldTextStyle,
                    ),
                    Text(
                      state.user?.user_email ?? 'N/A',
                      style: normalTextStyle.copyWith(color: hintColor),
                    )
                  ],
                );
              }
              return Container();
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              context.read<AuthCubit>().logout();
            },
          )
        ],
      ),
    );
  }
}
