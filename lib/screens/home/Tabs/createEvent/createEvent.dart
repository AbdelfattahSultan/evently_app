import 'package:evently_app/Extensions/AppExtensions.dart';
import 'package:evently_app/common/CustomTabBar.dart';
import 'package:evently_app/common/Custom_Text_Filed.dart';
import 'package:evently_app/common/custom_button.dart';
import 'package:evently_app/core/design/app_colors.dart';
import 'package:evently_app/db/EventDao.dart';

import 'package:evently_app/db/model/CatgoryModel.dart';
import 'package:evently_app/db/model/Event.dart';
import 'package:evently_app/provider/AuthProvider.dart';
import 'package:evently_app/screens/home/Tabs/createEvent/ChooseLocation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  LatLng? selectedLocation;
  String? selectedLocationName;

  var formKey = GlobalKey<FormState>();

  CategoryModel categoryModel = CategoryModel.categories[0];
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Create Event', style: context.fonts.bodyLarge),
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
                  label: "Event Title",
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
                  label: "Description",
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
                                "Event Date",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              chooseEventDate();
                            },
                            child: Text(
                              selectedDate == null
                                  ? "Choose Date"
                                  : selectedDate!.formatDate,

                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
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
                                "Event Time",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              chooseEventTime();
                            },
                            child: Text(
                              selectedTime == null
                                  ? "Choose Time"
                                  : selectedTime!.format(context),
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
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
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primary),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: context.colors.primary,
                                  ),
                                  child: Icon(
                                    Icons.gps_fixed_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  selectedLocationName == null
                                      ? "Choose Event Location"
                                      : selectedLocationName ?? '',
                                  style: context.fonts.titleMedium?.copyWith(
                                    color: context.colors.primary,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: context.colors.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                      onTap: () {
                        createEvent();
                      },
                      content: "Add Event",
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

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void chooseEventTime() async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    setState(() {
      selectedTime = time;
    });
  }

  void chooseEventDate() async {
    var date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 60)),
    );
    setState(() {
      selectedDate = date;
    });
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

  void createEvent() async {
    if (!isValidate()) {
      return;
    }

    AppAuthProvider userProvider = Provider.of<AppAuthProvider>(
      context,
      listen: false,
    );
    var event = Event(
      title: titleController.text,
      description: descriptionController.text,
      dateTime: selectedDate,
      timeOfDay: selectedTime?.toDateTime(),
      categoryId: CategoryModel.categories[selectedCategoryIndex].id,
      creatorUserId: userProvider.getUser()?.id,
      location: selectedLocation,
    );

    context.showLoadingDialog(message: "Creating Event", isDismissible: false);
    await EventDao.addEvent(event);

    Navigator.pop(context);
  }
}
