part of 'menu_list_cell.dart';

OverlayEntry _createFloatingMenu(double startX, double startY, double height, double width, VoidCallback onDismiss) {
  return OverlayEntry(builder: (context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onDismiss,
          child: Container(
            color: Colors.black12,
          ),
        ),
        Positioned(
          left: startX,
          top: startY + height,
          width: width,
          child: const Material(
            color: Colors.transparent,
            child: Menu(),
          ),
        ),
      ],
    );
  });
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        const Align(
          alignment: Alignment(-0.85, 0.0),
          child: Arrow(color: Colors.amber),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Container(
            height: 200,
            color: Colors.amber,
            child: Column(
              children: [
                const Expanded(child: Center(child: Icon(Icons.info_outline))),
                Row(
                  children: [
                    Expanded(
                      child: _textButton(
                        label: '測試1',
                        backgroundColor: Colors.greenAccent,
                        onTap: () => _showMessage(context, '測試1'),
                      ),
                    ),
                    Expanded(
                      child: _textButton(
                        label: '測試2',
                        backgroundColor: Colors.deepOrangeAccent,
                        onTap: () => _showMessage(context, '測試2'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _textButton({
    required String label,
    required Color backgroundColor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        height: 40,
        child: Center(child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 16.0))),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
