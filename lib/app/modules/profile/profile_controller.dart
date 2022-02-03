import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/myprofile.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/repository/profile_repository.dart';
import 'package:starter/utils/helper/text_field_wrapper.dart';
import 'package:starter/utils/loading/loading_utils.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class ProfileController extends GetxController {
  ProfileRepository profileRepository = ProfileRepository();

  RxList<MyProfile> profileDetailList = <MyProfile>[].obs;

  TextFieldWrapper nameWrapper = TextFieldWrapper();
  TextFieldWrapper emailWrapper = TextFieldWrapper();
  TextFieldWrapper statusWrapper = TextFieldWrapper();
  TextFieldWrapper roleWrapper = TextFieldWrapper();
  TextFieldWrapper oragnizationWrapper = TextFieldWrapper();

  var rolesName = <String>[].obs;

  var profilePicture = "".obs;
  var name = "".obs;
  var email = "".obs;
  var status = "".obs;

  Future<void> profileDetails() async {
    rolesName.clear();
    RepoResponse<MyProfile> repoResponse =
        await profileRepository.getAllProfileDetails({
      "Authorization": 'Bearer ${Storage.getUser().access_token}',
    });

    if (repoResponse.error == null) {
      profilePicture.value = repoResponse.data?.profilePicture ?? "";
      nameWrapper.controller.text = repoResponse.data?.name ?? "";
      emailWrapper.controller.text = repoResponse.data?.email ?? "";
      statusWrapper.controller.text = repoResponse.data?.status ?? "";
      oragnizationWrapper.controller.text =
          repoResponse.data?.organization?.name?.toUpperCase() ?? "";

      repoResponse.data?.roles?.forEach((element) {
        rolesName.add(element.name ?? "");
      });

      roleWrapper.controller.text = rolesName.join(", ").toUpperCase();

      // profileDetailList.add(repoResponse.data!);
    }
  }

  Future<void> updateProfile() async {
    LoadingUtils.showLoader();
    final repoResponse = await profileRepository.updaetMyProfile(
      {
        "name": nameWrapper.controller.text,
      },
      {
        "Authorization": 'Bearer ${Storage.getUser().access_token}',
      },
    );

    LoadingUtils.hideLoader();

    if (repoResponse.error == null) {
      print("profile Updated");
      profileDetails();
    }
  }

  @override
  void onInit() {
    profileDetails();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
