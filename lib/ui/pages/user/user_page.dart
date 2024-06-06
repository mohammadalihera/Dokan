import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:product_show_case/core/cubits/app/app_cubit.dart';
import 'package:product_show_case/ui/pages/user/widgets/profile_card_widget.dart';
import 'package:product_show_case/ui/pages/user/widgets/user_details_widget.dart';
import 'package:product_show_case/ui/shared/image_path.dart';
import 'package:product_show_case/ui/theme/colors.dart';
import 'package:product_show_case/ui/theme/text_style.dart';
import 'package:product_show_case/ui/theme/thems.dart';
import 'package:product_show_case/ui/widgets/index.dart';

import 'widgets/user_profile_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool accountOpen = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController suiteController = TextEditingController();
  TextEditingController zipController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
          style: semiboldTextStyle.copyWith(fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                        style: boldTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Text(
                        state.user?.user_email ?? 'N/A',
                        style: regularTextStyle.copyWith(color: hintColor),
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [Themes.commonShadow()],
              ),
              child: Column(
                children: [
                  ProfileCard(
                    label: 'Account',
                    icon: ImagePath.user,
                    open: accountOpen,
                    onTap: () {
                      setState(() {
                        accountOpen = !accountOpen;
                      });
                    },
                    widget: UserDetailsWidget(
                      formKey: _formKey,
                      emailController: emailController,
                      nameController: nameController,
                      addressController: addressController,
                      suiteController: suiteController,
                      zipController: zipController,
                    ),
                  ),
                  const CommonBorder(),
                  ProfileCard(
                    label: 'Password',
                    icon: ImagePath.lock,
                    open: false,
                    onTap: () {},
                  ),
                  const CommonBorder(),
                  ProfileCard(
                    label: 'Notification',
                    icon: ImagePath.notification,
                    open: false,
                    onTap: () {},
                  ),
                  const CommonBorder(),
                  ProfileCard(
                    label: 'Wishlist(00)',
                    icon: ImagePath.heart,
                    open: false,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
