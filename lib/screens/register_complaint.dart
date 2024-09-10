import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RegisterComplaintPage extends StatefulWidget {
  const RegisterComplaintPage({super.key});

  @override
  _RegisterComplaintPageState createState() => _RegisterComplaintPageState();
}

class _RegisterComplaintPageState extends State<RegisterComplaintPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contact1Controller = TextEditingController();
  final TextEditingController _contact2Controller = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _complaintDetailsController = TextEditingController();
  
  String _selectedCategory = 'Microwave';

  // Function to submit complaint to the API
  Future<void> _submitComplaint() async {
    if (_formKey.currentState!.validate()) {
      final dio = Dio();
      final url = 'https://glamgas.online/api/complaints';
      
      try {
        final response = await dio.post(
          url,
          data: {
            "customer_name": _nameController.text,
            "contact1": _contact1Controller.text,
            "contact2": _contact2Controller.text,
            "address": _addressController.text,
            "product_category": _selectedCategory,
            "barcode": _barcodeController.text,
            "complaint_details": _complaintDetailsController.text,
            "status": "active"
          },
          options: Options(
            headers: {'Content-Type': 'application/json'},
          ),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Complaint submitted successfully!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to submit complaint. Please try again.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error occurred: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Complaint'),
        backgroundColor: Colors.orange, // Give AppBar an orange color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Customer Name Field
              _buildTextField(
                controller: _nameController,
                labelText: 'Customer Name',
                validator: (value) => value!.isEmpty ? 'Please enter customer name' : null,
              ),
              
              // Contact 1 Field
              _buildTextField(
                controller: _contact1Controller,
                labelText: 'Contact no1',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter contact number';
                  }
                  if (value.length != 11) {
                    return 'Contact number must be 11 digits';
                  }
                  return null;
                },
              ),
              
              // Contact 2 Field (Optional)
              _buildTextField(
                controller: _contact2Controller,
                labelText: 'Contact no2 (Optional)',
              ),
              
              // Address Field
              _buildTextField(
                controller: _addressController,
                labelText: 'Address',
                validator: (value) => value!.isEmpty ? 'Please enter address' : null,
              ),
              
              // Product Category Dropdown
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                items: [
                  'Hob (stove)', 'Hood (chimney/turbo)', 'Cooking range',
                  'Hot plate (Electric Stove)', 'Microwave', 'Built in oven',
                  'Water heater', 'Sink', 'Faucet (tab)', 'Glass washer'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCategory = newValue!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Product Category'),
                style: const TextStyle(fontSize: 16.0, color: Colors.black),
                validator: (value) => value == null ? 'Please select a product category' : null,
              ),
              
              // Barcode Field
              _buildTextField(
                controller: _barcodeController,
                labelText: 'Barcode',
                validator: (value) => value!.isEmpty ? 'Please enter barcode' : null,
              ),
              
              // Complaint Details Field
              _buildTextField(
                controller: _complaintDetailsController,
                labelText: 'Complaint Details',
                validator: (value) => value!.isEmpty ? 'Please enter complaint details' : null,
                maxLines: 4, // Multiline for complaint details
              ),
              
              // Submit Button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: _submitComplaint,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15.0),
                    // primary: const LinearGradient(
                    //   colors: [Color(0xFFFFA726), Color(0xFFF57C00)],
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    // ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5, // Shadow for button
                  ),
                  child: const Text('Submit Complaint'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build text fields with consistent design
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: validator,
        maxLines: maxLines,
      ),
    );
  }
}
