import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tutapp/app/di.dart';
import 'package:tutapp/presentation/common/state_renderer.dart/state_renderer_impl.dart';
import 'package:tutapp/presentation/login/viewmodel/login_viewmodel.dart';

import '../../../app/app_preferences.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _userPasswordController.addListener(
        () => _viewModel.setPassword(_userPasswordController.text));
    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isLoggedIn) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
            _appPreferences.setUserLoggedIn(); // tell viewmodel, start ur job

        Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
      });
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.login();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
        padding: const EdgeInsets.only(top: AppPadding.p100),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Center(
                    child: Image(image: AssetImage(ImageAssets.splashLogo))),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outIsUserNameValid,
                      builder: (context, snapshot) {
                        return TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _userNameController,
                          decoration: InputDecoration(
                              hintText: AppStrings.username,
                              labelText: AppStrings.username,
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : AppStrings.usernameError),
                        );
                      }),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outIsPasswordValid,
                      builder: (context, snapshot) {
                        return TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _userPasswordController,
                          decoration: InputDecoration(
                              hintText: AppStrings.password,
                              labelText: AppStrings.password,
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : AppStrings.passwordError),
                        );
                      }),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outAreAllInputsValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          width: double.infinity,
                          height: AppSize.s40,
                          child: ElevatedButton(
                              onPressed: (snapshot.data ?? false)
                                  ? () {
                                      _viewModel.login();
                                    }
                                  : null,
                              child: const Text(AppStrings.login)),
                        );
                      }),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        top: AppPadding.p8,
                        left: AppPadding.p28,
                        right: AppPadding.p28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.forgotPasswordRoute);
                          },
                          child: Text(AppStrings.forgetPassword,
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.registerRoute);
                          },
                          child: Text(AppStrings.registerText,
                              style: Theme.of(context).textTheme.titleMedium),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
