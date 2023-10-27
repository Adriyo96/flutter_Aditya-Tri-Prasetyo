import 'package:flutter/material.dart';
import 'result.dart';
import 'package:flutter_openai/services/recommendation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerPrice = TextEditingController();
  final TextEditingController _controllerCamera = TextEditingController();
  final TextEditingController _controllerStorage = TextEditingController();
  bool isLoading = false;

  void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationService.getRecommendations(
          price: _controllerPrice.value.text,
          camera: _controllerCamera.value.text,
          storage: _controllerStorage.value.text);

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ResultScreen(gptResponseData: result);
          },
        ));
      }
    } catch (e) {
      const snackBar = SnackBar(
          content: Text('Failed to send a request. Please try again.'));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Phone Recommendation'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  heightFactor: 4,
                  child: Text(
                    'Phone Recommendation by OpenAI',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Price in IDR (Number Only)'),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _controllerPrice,
                  decoration: const InputDecoration(
                    hintText: "Enter a  price (in IDR)",
                  ),
                  validator: (String? value) {
                    bool isInvalid = value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null;

                    if (isInvalid) {
                      return "Please enter valid numbers";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Camera Specification'),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextFormField(
                  controller: _controllerCamera,
                  decoration: const InputDecoration(
                    hintText:
                        "i.e. '64 MP Main Camera' or 'with 3 Camera'",
                  ),
                  validator: (String? value) {
                    bool isInvalid = value == null || value.isEmpty;

                    if (isInvalid) {
                      return "Please enter valid value";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Minimum Storage'),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextFormField(
                  controller: _controllerStorage,
                  decoration: const InputDecoration(
                    hintText: "Enter your desired storage, i.e. 64GB",
                  ),
                  validator: (String? value) {
                    bool isInvalid = value == null || value.isEmpty;

                    if (isInvalid) {
                      return "Please enter valid value";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: isLoading && _formKey.currentState!.validate() != false
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: _getRecommendations,
                        child: const Center(
                          child: Text('Get Recommendations'),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
