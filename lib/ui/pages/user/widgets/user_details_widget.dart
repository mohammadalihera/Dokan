import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:product_show_case/core/cubits/app/app_cubit.dart';
import 'package:product_show_case/ui/widgets/index.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.nameController,
    required this.addressController,
    required this.suiteController,
    required this.zipController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController suiteController;
  final TextEditingController zipController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Form(
        key: _formKey,
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            if (state is LoadedAppState) {
              emailController.text = state.user?.user_email ?? '';
              nameController.text = state.user?.user_display_name ?? '';

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BorderCustomTextField(
                    controller: emailController,
                    hintText: state.user?.user_email ?? 'email',
                    label: 'Email',
                  ),
                  const SizedBox(height: 20),
                  BorderCustomTextField(
                    controller: nameController,
                    hintText: state.user?.user_display_name ?? 'name',
                    label: 'Full Name',
                  ),
                  const SizedBox(height: 20),
                  BorderCustomTextField(
                    controller: addressController,
                    hintText: '465 Nolan Causeway Suite 079',
                    label: 'Street Address',
                  ),
                  const SizedBox(height: 20),
                  BorderCustomTextField(
                    controller: suiteController,
                    hintText: 'Unit 512',
                    label: 'Apt, Suite, Bldg (optional)',
                  ),
                  const SizedBox(height: 20),
                  BorderCustomTextField(
                    controller: zipController,
                    hintText: '77017',
                    label: 'Zip Code',
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      const Expanded(child: CustomCancelButton()),
                      const SizedBox(width: 10),
                      CustomSecondaryButton(label: 'Save', onPressed: () {})
                    ],
                  )
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
