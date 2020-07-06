import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_concept/constants.dart';
import 'package:shop_app_concept/providers/product_provider.dart';
import 'package:shop_app_concept/providers/products_class.dart';
import 'package:shop_app_concept/widgets/appbar_title.dart';

class EditProductScreen extends StatefulWidget {
  static const idPage = 'edit_product_screen';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();
  final _imageController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _isInit = true;
  var _editedProduct =
      Product(id: null, title: '', price: 0, imageUrl: '', description: '');
  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };
  @override
  void initState() {
    _imageFocusNode.addListener(_updateImage);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;

      if (productId != null) {
        _editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        _initValues = {
          'title': _editedProduct.title,
          // 'imageUrl': _editedProduct.imageUrl, wont work with the controller
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),
        };
        _imageController.text = _editedProduct.imageUrl;
      }
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  void _updateImage() {
    if (!_imageFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    if (_editedProduct.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
    } else {
      Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    }
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _imageFocusNode.removeListener(_updateImage);
    _priceFocusNode.dispose();
    _descFocusNode.dispose();
    _imageController.dispose();
    _imageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        title: AppBarTitle(
          text1: 'Edit',
          text2: 'Product',
        ),
        actions: [
          // Text(
          //   'SAVE',
          //   style: TextStyle(color: Colors.black),
          // ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => _saveForm(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [kBoxShadow],
        ),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _initValues['title'],
                decoration: kTextFieldDecoration.copyWith(
                  labelText: 'Title',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter your title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    title: value,
                    price: _editedProduct.price,
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                  );
                },
              ),
              SizedBox(height: 12.0),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: kTextFieldDecoration.copyWith(
                  labelText: 'Price',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  if (double.tryParse(value) <= 0) {
                    return 'Please enter a price greater than zero';
                  }
                  return null;
                },
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descFocusNode);
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    price: double.parse(value),
                    title: _editedProduct.title,
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
              ),
              SizedBox(height: 12.0),
              TextFormField(
                initialValue: _initValues['description'],
                decoration: kTextFieldDecoration.copyWith(
                  labelText: 'Description',
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 2,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter product description';
                  }
                  if (value.length < 10) {
                    return 'Description is short';
                  }
                  return null;
                },
                focusNode: _descFocusNode,
                onSaved: (value) {
                  _editedProduct = Product(
                    price: _editedProduct.price,
                    title: _editedProduct.title,
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                    description: value,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: size.height * 0.1,
                    width: size.width * 0.24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: kSecondaryColor),
                      boxShadow: [kBoxShadow],
                    ),
                    child: _imageController.text.isEmpty
                        ? Text('Enter Url')
                        : FittedBox(
                            child: Image.network(
                              _imageController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: TextFormField(
                      initialValue: _initValues['imageUrl'],
                      controller: _imageController,
                      decoration: kTextFieldDecoration.copyWith(
                        labelText: 'Image Url',
                      ),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          price: _editedProduct.price,
                          title: _editedProduct.title,
                          id: _editedProduct.id,
                          isFavorite: _editedProduct.isFavorite,
                          description: value,
                          imageUrl: value,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
