import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? cardTitle;
  final String? cardDescription;
  final Function? onTap;
  final double? cardHeight;
  final Widget? cardThumbnail;
  final double? thumbnailRadius;
  final String? buttonText;
  final bool? isButtonVisible;
  final bool? bordersVisible;
  final bool? isLectureCard;
  final String? durationStartsAt;
  final String? durationEndsAt;
  final bool? isTopLeftBorderMaxRadius;

  const CustomCard(
      {super.key,
      this.cardTitle,
      this.onTap,
      this.cardHeight,
      this.cardThumbnail,
      this.thumbnailRadius,
      this.buttonText,
      this.isButtonVisible,
      this.bordersVisible,
      this.cardDescription,
      this.isLectureCard,
      this.durationStartsAt,
      this.durationEndsAt, this.isTopLeftBorderMaxRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        splashColor: Theme.of(context).primaryColor.withAlpha(200),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(65),
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)),
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Container(
          height: cardHeight ?? 180,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius:  BorderRadius.only(
                topRight: Radius.circular((isTopLeftBorderMaxRadius ?? true)?65:10),
                topLeft: const Radius.circular(10),
                bottomRight: const Radius.circular(10),
                bottomLeft: const Radius.circular(10)),
            border: (bordersVisible ?? false)
                ? Border.all(width: 2, color: Colors.black38)
                : null,
            color: Theme.of(context).primaryColor.withAlpha(50),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: thumbnailRadius ?? 50,
                            width: thumbnailRadius ?? 50,
                            decoration: cardThumbnail == null
                                ? null
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: (bordersVisible ?? false)
                                        ? Border.all(
                                            width: 2, color: Colors.black38)
                                        : null,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withAlpha(200),
                                  ),
                            child: cardThumbnail,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    cardTitle ?? "Card Title",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  cardDescription ??
                                      "This is a short description"
                                          " of the card. This should appear if the the property"
                                          "is set to null. The text is meant to be a little long"
                                          "for test purposes.",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  maxLines: 5,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isLectureCard ?? true,
                child: const Expanded(
                  flex:1,
                  child: Divider(
                    color: Colors.black38,
                    thickness: 1,
                  )
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(mainAxisSize: MainAxisSize.max,
                    children: [
                  Visibility(
                    visible: isLectureCard ?? true,
                    child: Row(
                      children: [
                        const Icon(Icons.access_time_outlined, size: 20,),
                        const SizedBox(width: 3),
                        Text(durationStartsAt ?? "00:00AM",
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.timelapse_outlined, size: 20,),
                        const SizedBox(width: 3),

                        Text(durationEndsAt ?? "00:00AM"),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Visibility(
                      visible: isButtonVisible ?? true,
                      child: TextButton(
                          onPressed: () {
                            if (onTap != null) {
                              onTap!();
                            }
                          },
                          child: Text(buttonText ?? "Go to page")),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
