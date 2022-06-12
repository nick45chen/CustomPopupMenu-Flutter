part of 'menu_list_cell.dart';

OverlayEntry _createFloatingMenu({
  required String title,
  required double startX,
  required double startY,
  required double height,
  required double width,
  VoidCallback? onDismiss,
}) {
  const padding = 16.0;
  return OverlayEntry(
    builder: (context) {
      return Stack(
        children: [
          GestureDetector(
            onTap: onDismiss,
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            left: startX + padding,
            top: startY + height,
            width: width - padding * 2,
            child: Material(
              color: Colors.transparent,
              child: Menu(title: title),
            ),
          ),
        ],
      );
    },
  );
}

class Menu extends StatelessWidget {
  final String title;

  const Menu({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 2),
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
                Expanded(
                  child: Center(child: Text(title, style: const TextStyle(fontSize: 24, color: Colors.white))),
                ),
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
