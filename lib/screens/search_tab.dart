import 'package:native_looking_store/components/search_bar.dart';
import 'package:native_looking_store/providers/app_state_provider.dart';
import 'package:native_looking_store/components/product_row_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  _SearchTabState createState() {
    return _SearchTabState();
  }
}

class _SearchTabState extends State<SearchTab> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  String _terms = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SearchBar(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppStateProvider>(context);
    final results = model.search(_terms);

    return SafeArea(
      child: Column(
        children: [
          _buildSearchBox(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ProductRowItem(
                product: results[index],
                lastItem: index == results.length - 1,
              ),
              itemCount: results.length,
            ),
          ),
        ],
      ),
    );
  }
}
