import 'package:flutter/material.dart';
class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  Future<void> _loadData(BuildContext context, bool reload) async {

  }

  late TextEditingController _idController;
  late TextEditingController _seekToController;

  final bool _isPlayerReady = false;
  int currentStation = 0;

  bool button1 = true;
  bool button2 = false;

  void _button1() {
    setState(() {
      button1 = false;
      button2 = true;
    });
  }

  void _button2() {
    setState(() {
      button1 = true;
      button2 = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController();
    _seekToController = TextEditingController();
  }

  void listener() {

  }


  @override
  void dispose() {
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _loadData(context, false);

    return Stack(
        children:[
          Positioned(
            top: 0, left: 0, bottom: 0, right: 0,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
            ),
          ),
          Scaffold(
            appBar: AppBar(title: const Text("Now Playing"),backgroundColor: Colors.black,),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black,
                        Colors.grey
                      ]
                  )
              ),
              child: Column(
                children: [
                  Container(
                    height: 400,
                    width: 600,
                    child: Stack(
                        children: [
                          Positioned(
                            top: 65, left: 65, bottom: 65, right: 65,
                            child: ClipRect(
                              child: FadeInImage.assetNetwork(
                                placeholder: "assets/image/1.jpg",
                                image: 'https://i.ytimg.com/vi/gjOLk0L830c/maxresdefault.jpg',
                                width: 200, height: 200, fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.black,
                              Colors.black,
                              Colors.black
                            ]
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Nanga vera Mari",style: TextStyle(color: Colors.white,fontSize: 25),),
                          ),
                          Slider.adaptive(value: 0.1, onChanged: (double value) {
                            print("Value : "+value.toString());
                          },),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.skip_previous,size: 40,color: Colors.white,),
                                  onPressed:(){
                                    if(_isPlayerReady){

                                    }
                                  }
                              ),
                              IconButton(padding: EdgeInsets.only(bottom: 40),
                                icon: Icon(
                                  button1 ? Icons.pause_circle
                                      : Icons.play_circle, size: 65,color: Colors.white,),
                                onPressed: _isPlayerReady
                                    ? () {
                                  setState(() {});
                                }
                                    : null,
                              ),
                              IconButton(
                                  icon: const Icon(Icons.skip_next,size: 40,color: Colors.white),
                                  onPressed:(){
                                    if(_isPlayerReady){
                                    }
                                  }
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
    );

  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }

}
