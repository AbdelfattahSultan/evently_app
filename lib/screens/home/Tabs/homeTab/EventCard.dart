import 'package:evently_app/Extensions/AppExtensions.dart';
import 'package:evently_app/db/Event.dart';
import 'package:evently_app/core/design/app_colors.dart';
import 'package:evently_app/core/design/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventCard extends StatefulWidget {
  final Event eventModel;
  const EventCard({super.key, required this.eventModel});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(widget.eventModel.image??"")),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
    
        children: [
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.eventModel.day??"",
                  style: context.fonts.titleSmall?.copyWith(
                    color: AppColors.primary,
                    
                  ),
                ),
                Text(
                  widget.eventModel.month??"",
                  style: context.fonts.titleSmall?.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
        Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.eventModel.description??"",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.fonts.titleSmall,
            ),
          ),
    
          IconButton(
            onPressed: () {
              setState(() {
                widget.eventModel.isFav = !widget.eventModel.isFav;
              });
            },
            icon: SvgPicture.asset(
              widget.eventModel.isFav?
              AppImages.loveFill:AppImages.heart,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    ),
          
        ],
      ),
    );
  }
}
