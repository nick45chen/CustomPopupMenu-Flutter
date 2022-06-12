# CustomPopupMenu-Flutter

### How to do that

``` dart
GlobalKey actionKey = LabeledGlobalKey(title);

// add golbal key to your cell
void _cell() {
  return GestureDetector(
    key: actionKey,
    child: Container(),
  );
}

// use golbal to get position
void _findMenuPosition() {
  RenderBox? renderBox =
      actionKey.currentContext?.findRenderObject() as RenderBox?;
  if (renderBox != null) {
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }
}

// create menu
OverlayEntry _createFloatingMenu() {
  return OverlayEntry(
    builder: (context) {
      return Positioned(
          left: xPosition,
          top: yPosition + height,
          width: width,
          child: Menu());
    },
  );
}

// add menu
void showMenu() {
  Widdet menu = _OverlayEntry(
    builder: (context) {
      return Positioned(
          left: xPosition,
          top: yPosition + height,
          width: width,
          child: Menu());
    },
  );

  // add to screen
  Overlay.of(context)?.insert(menu);

  // removed
  //menu?.remove();
}
```

### Screenshot

<img src="screenshot.png" alt="Girl in a jacket" width="311" height="640">

