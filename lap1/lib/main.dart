import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Person {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Person> _persons = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person List'),
      ),
      body: ListView.builder(
        itemCount: _persons.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                _persons[index].name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Age: ${_persons[index].age}, Address: ${_persons[index].address}',
                style: TextStyle(fontSize: 14),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _editPerson(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deletePerson(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPerson,
        tooltip: 'Add Person',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addPerson() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newName = '';
        int newAge = 0;
        String newAddress = '';
        return AlertDialog(
          title: Text('Add New Person'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newName = value;
                },
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  newAge = int.tryParse(value) ?? 0;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  newAddress = value;
                },
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _persons.add(Person(newName, newAge, newAddress));
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _editPerson(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String updatedName = _persons[index].name;
        int updatedAge = _persons[index].age;
        String updatedAddress = _persons[index].address;
        return AlertDialog(
          title: Text('Edit Person'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  updatedName = value;
                },
                controller: TextEditingController(text: _persons[index].name),
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  updatedAge = int.tryParse(value) ?? 0;
                },
                controller:
                    TextEditingController(text: _persons[index].age.toString()),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  updatedAddress = value;
                },
                controller:
                    TextEditingController(text: _persons[index].address),
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _persons[index] =
                            Person(updatedName, updatedAge, updatedAddress);
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _deletePerson(int index) {
    setState(() {
      _persons.removeAt(index);
    });
  }
}
