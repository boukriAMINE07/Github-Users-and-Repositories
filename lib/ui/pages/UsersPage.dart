import 'dart:convert';

import 'package:first_app_flutter/ui/pages/repositories/GitRepositoriesPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class UsersPage extends StatefulWidget {

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String query="";
  bool notVisible=false;
  dynamic data;
  int currentPage=0;
  int totalPages=0;
  int pageSize=20;
  List<dynamic> items=[];
  ScrollController scrollController=new ScrollController();
  // pour récuperer les donneés saiser dans la zone de text
  TextEditingController queryTextEditingController=new TextEditingController();

  void _search(String query) {
      String url='https://api.github.com/search/users?q=${query}&per_page=$totalPages&page=$currentPage';
      print(url);

      http.get(Uri.parse(url) )
          .then(((response){
           setState(() {
             //print(response.body);
             this.data=json.decode(response.body);
             items.addAll(data['items']);
             if(data['total_count']%pageSize==0){
               this.totalPages=data['total_count']~/pageSize;

             }else{
               this.totalPages=(data['total_count']/pageSize).floor()+1;

             }
           });
      }))
          .catchError((err){
            print(err);
          })
      ;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        setState(() {
          if(currentPage<totalPages-1){
            ++currentPage;
            _search(query);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users : ${query} => $currentPage / $totalPages '),),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      obscureText: notVisible,
                      onChanged: (value){
                        setState(() {
                          this.query=value;

                        });
                      },
                      controller: queryTextEditingController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(
                                notVisible==true? (Icons.visibility):(Icons.visibility_off_outlined)
                                    ,color: Colors.blue,
                            ),
                          onPressed: () {
                              setState(() {
                                this.notVisible=!notVisible;
                              });
                          },
                        ),
                          contentPadding: EdgeInsets.only(left: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.blue
                          )
                        )
                      ),
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.search,color: Colors.blue,),
                  onPressed: (){
                  setState(() {
                    items=[];
                    currentPage=0;
                    this.query=queryTextEditingController.text;
                    _search(query);
                  });

                  },)
              ],
            ),
            Expanded(
              child: ListView.separated(

                controller: scrollController,
                  itemCount:items.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context)=>GitRepositoriesPage(login: items[index]['login'],avatrUrl: items[index]['avatar_url'],)));
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(items[index]['avatar_url']),
                                radius: 30,
                              ),
                              SizedBox(width: 20,),
                              Text("${items[index]['login']}")
                            ],
                          ),
                          CircleAvatar(
                            child: Text("${items[index]['score']}"),
                          )
                        ],
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index)=>Divider(height: 2,color: Colors.blue,),),
            )
          ],
        )
      ),
    );
  }

}


