import 'package:evently_app/Extensions/AppExtensions.dart';
import 'package:evently_app/common/CustomTabBar.dart';
import 'package:evently_app/common/Custom_Text_Filed.dart';
import 'package:evently_app/common/EventInfoTile.dart';
import 'package:evently_app/common/custom_button.dart';
import 'package:evently_app/core/design/app_colors.dart';
import 'package:evently_app/db/EventDao.dart';
import 'package:evently_app/db/model/CatgoryModel.dart';
import 'package:evently_app/db/model/Event.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/screens/home/Tabs/createEvent/ChooseLocation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({super.key});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  LatLng? selectedLocation;
  String? selectedLocationName;
  Event? event;
  bool _isLoaded = false;

  var formKey = GlobalKey<FormState>();

  CategoryModel categoryModel = CategoryModel.categories[0];
  int selectedCategoryIndex = 0;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isLoaded) {
      event = ModalRoute.of(context)!.settings.arguments as Event;
      titleController.text = event!.title ?? '';
      descriptionController.text = event!.description ?? '';
      selectedDate = event!.dateTime;
      selectedTime = event!.timeOfDay != null
          ? TimeOfDay.fromDateTime(event!.timeOfDay!)
          : null;

      selectedCategoryIndex = CategoryModel.categories.indexWhere(
        (cat) => cat.id == event!.categoryId,
      );
      if (selectedCategoryIndex == -1) {
        selectedCategoryIndex = 0;
      }
      categoryModel = CategoryModel.categories[selectedCategoryIndex];

      _isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    if (!_isLoaded || event == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          l10n.editEvent,
          style: context.fonts.bodyLarge?.copyWith(color: AppColors.primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16),
                    child: Image.asset(categoryModel.image ?? ""),
                  ),
                ),
                SizedBox(height: 16),
                CustomTabBar(
                  categories: CategoryModel.categories,

                  onCategoryClick: (category, index) {
                    categoryModel = category;
                    selectedCategoryIndex = index;
                    setState(() {});
                  },
                ),
                CustomTextFiled(
                  icon: Icons.edit,
                  label: l10n.eventTitle,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter title";
                    }
                    return null;
                  },
                  controller: titleController,
                ),
                SizedBox(height: 5),
                CustomTextFiled(
                  controller: descriptionController,
                  label: l10n.eventDesc,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter description";
                    }
                    return null;
                  },
                  maxLines: 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_month_outlined),
                              SizedBox(width: 8),
                              Text(
                                l10n.eventDate,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              chooseEventDate();
                            },
                            child: Text(
                              selectedDate!.formatDate,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: AppColors.primary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.timer_outlined),
                              SizedBox(width: 8),
                              Text(
                                l10n.eventTime,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              chooseEventTime();
                            },
                            child: Text(
                              selectedTime!.format(context),
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: AppColors.primary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChooseLocation(),
                          ),
                        );
                        if (result != null) {
                          setState(() {
                            selectedLocation = result['latLng'];
                            selectedLocationName = result['address'];
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: EventInfoTile(
                          prefixIcon: Icons.gps_fixed_sharp,
                          suffixIcon: Icons.arrow_forward,
                          text: selectedLocationName ?? l10n.updateEventLocation,
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    CustomButton(
                      onTap: () {
                        updateEvent();
                      },
                      content: l10n.updateEvent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void chooseEventTime() async {
    var time = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  void chooseEventDate() async {
    var date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 30)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  bool isValidate() {
    var invalidate = formKey.currentState?.validate() ?? false;

    if (selectedDate == null) {
      context.showMessageDialog("Please choose date");
      invalidate = false;
    } else if (selectedTime == null) {
      invalidate = false;
      context.showMessageDialog("Please choose Time");
    }
    return invalidate;
  }

  void updateEvent() async {
    if (!isValidate()) {
      return;
    }

    var updatedEventData = Event(
      id: event!.id,
      title: titleController.text,
      description: descriptionController.text,
      dateTime: selectedDate,
      timeOfDay: selectedTime?.toDateTime(),
      categoryId: CategoryModel.categories[selectedCategoryIndex].id,
      creatorUserId: event!.creatorUserId,
      location: selectedLocation ?? event!.location,
    );

    context.showLoadingDialog(message: "Updating Event", isDismissible: false);
    await EventDao.editEvent(updatedEventData);

    Navigator.pop(context);
    Navigator.pop(context);
  }
}
