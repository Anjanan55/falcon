import 'package:flutter/material.dart';

class PhotoCardScreen extends StatefulWidget {
  final List<Map<String, dynamic>> photoDetails;

  const PhotoCardScreen(
      {super.key, required this.photoDetails, required String title});

  @override
  // ignore: library_private_types_in_public_api
  _PhotoCardScreenState createState() => _PhotoCardScreenState();
}

class _PhotoCardScreenState extends State<PhotoCardScreen> {
  List<Map<String, dynamic>> filteredPhotos = [];
  TextEditingController searchController = TextEditingController();
  String filterBy = 'name'; // Default filter by name

  @override
  void initState() {
    super.initState();
    filteredPhotos = widget.photoDetails;
    searchController.addListener(_filterPhotos);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterPhotos() {
    String query = searchController.text.toLowerCase();

    setState(() {
      filteredPhotos = widget.photoDetails.where((photo) {
        if (filterBy == 'name') {
          return photo['name'].toLowerCase().contains(query);
        } else if (filterBy == 'districtCode') {
          return photo['districtCode'].toLowerCase().contains(query);
        } else if (filterBy == 'status') {
          bool statusFilter = query == 'true' || query == 'active';
          return photo['status'] == statusFilter;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        actions: [
          DropdownButton<String>(
            value: filterBy,
            items: const [
              DropdownMenuItem(value: 'name', child: Text('Name')),
              DropdownMenuItem(
                  value: 'districtCode', child: Text('District Code')),
              DropdownMenuItem(value: 'status', child: Text('Status')),
            ],
            onChanged: (value) {
              setState(() {
                filterBy = value!;
                _filterPhotos();
              });
            },
            underline: const SizedBox(),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 photos per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: filteredPhotos.length,
              itemBuilder: (context, index) {
                final photo = filteredPhotos[index];
                return PhotoCard(
                  imageUrl: photo['image'],
                  name: photo['name'],
                  fatherName: photo['fatherName'],
                  id: photo['id'],
                  districtCode: photo['districtCode'],
                  status: photo['status'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String fatherName;
  final String id;
  final String districtCode;
  final bool status;

  const PhotoCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.fatherName,
    required this.id,
    required this.districtCode,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: $name',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Father: $fatherName'),
                Text('ID: $id'),
                Text('District: $districtCode'),
                Row(
                  children: [
                    const Text('Status: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Icon(
                      status ? Icons.check_circle : Icons.cancel,
                      color: status ? Colors.green : Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PhotoCardScreen(
      photoDetails: [
        {
          'image': 'https://example.com/photo1.jpg',
          'name': 'John Doe',
          'fatherName': 'Mr. Doe',
          'id': '123456',
          'districtCode': 'DC001',
          'status': true
        },
        {
          'image': 'https://example.com/photo2.jpg',
          'name': 'Jane Doe',
          'fatherName': 'Mr. Doe',
          'id': '123457',
          'districtCode': 'DC002',
          'status': false
        },
        // Add more photo entries here
      ],
      title: '',
    ),
  ));
}
