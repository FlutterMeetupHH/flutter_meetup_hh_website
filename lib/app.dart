import 'dart:html' as html;
import 'dart:math';

import 'package:flutter/material.dart';

import 'shared/fmh_constrained_container/fmh_constrained_container.dart';
import 'shared/fmh_content_card/fmh_content_card.dart';
import 'shared/fmh_drawer/fmh_drawer.dart';
import 'shared/fmh_meetup_title/fmh_meetup_title.dart';
import 'shared/fmh_navigation/fmh_navigation.dart';
import 'shared/fmh_responsive_wrapper/fmh_responsive_wrapper.dart';
import 'stores/shared/navigation.dart';
import 'types/enums/content_padding.dart';
import 'utils/helper.dart';

const kContentPadding = ContentPadding.none;

class App extends StatelessWidget {
  Widget _leading(BuildContext context) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => Scaffold.of(context).openDrawer(),
        child: Center(
          child: Image.asset(
            'images/menu.png',
            height: 52.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget view = Padding(
      padding: EdgeInsets.symmetric(horizontal: kContentPadding.value),
      child: SizedBox(
        height: min(MediaQuery.of(context).size.height, 1024.0),
        child: ValueListenableBuilder<View>(
          valueListenable: NavigationStore.of(context).currentView,
          builder: (context, view, _) {
            if (html.window.location.pathname != view.url) {
              NavigationStore.of(context).updateCurrentView(
                  Helper.fromURL(html.window.location.pathname));
            }
            return FMHContentCard(
              child: view.widget,
            );
          },
        ),
      ),
    );

    final TextStyle headline = Theme.of(context).textTheme.headline3;

    return FMHResponsiveWrapper(
      responsiveBuilder: (display) => MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Scaffold(
          drawerEnableOpenDragGesture: false,
          appBar: display == Display.mobile
              ? AppBar(
                  toolbarHeight: 72.0,
                  leading: _leading(context),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Flutter',
                              style: headline.copyWith(
                                  fontSize: headline.fontSize * 0.3),
                            ),
                            Text(
                              'Hamburg',
                              style: headline.copyWith(
                                  fontSize: headline.fontSize * 0.3),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 18.0),
                      Image.asset(
                        'images/logo_rounded.png',
                        height: 52.0,
                      ),
                      SizedBox(width: 18.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'and',
                              style: headline.copyWith(
                                  fontSize: headline.fontSize * 0.3),
                            ),
                            Text(
                              'Beyond',
                              style: headline.copyWith(
                                  fontSize: headline.fontSize * 0.3),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    SizedBox(width: 64.0),
                  ],
                )
              : null,
          drawer: display == Display.mobile ? FMHDrawer() : null,
          body: FMHConstraintedContainer(
            child: display == Display.mobile
                ? view
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 550.0,
                        child: Transform.translate(
                          offset: Offset(0, 0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(height: 48.0),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 48.0),
                                      child: FMHMeetupTitle(),
                                    ),
                                    FMHNavigation(),
                                  ],
                                ),
                              ),
                              SizedBox(width: 48.0),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: view),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
