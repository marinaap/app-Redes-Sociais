import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app.dart';

class Pages extends StatelessWidget {
  const Pages({Key? key}) : super(key: key);

  void _launcherURL(String url) async {
    await launch(url);
  }

  PageViewModel _pageView({title, body, urlImg, urllauncher}) {
    return PageViewModel(
        title: title,
        body: body,
        image: Center(
          child: Image.network(urlImg),
        ),
        footer: ElevatedButton(
          child: const Text("Let's Go!"),
          onPressed: () {
            _launcherURL(urllauncher);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    var listPages = [
      _pageView(title: 'TikTok', body: 'Perfil do Merlon', urlImg: 'https://cdn.pixabay.com/photo/2022/01/16/05/38/social-media-6941290_960_720.jpg', urllauncher: 'https://www.tiktok.com/@merlonboriz'),
      _pageView(title: 'YouTube', body: 'Assista aqui alguns clipes de músicas que eu ouço', urlImg: 'https://cdn.pixabay.com/photo/2020/11/01/03/08/youtube-5702765_960_720.jpg', urllauncher: 'https://www.youtube.com/watch?v=76mkEfxxIl0'),
      _pageView(title: 'GitHub', body: 'Acesse os meus projetinhos', urlImg: 'https://cdn.pixabay.com/photo/2013/07/12/19/25/github-154769_960_720.png', urllauncher: 'https://github.com/marinaap'),
      _pageView(title: 'Linkedin', body: 'Me acompanhe no Linkedin', urlImg: 'https://cdn.pixabay.com/photo/2015/07/13/07/33/icons-842861_960_720.png', urllauncher: 'https://www.linkedin.com/in/marina-a-souza/')
    ];
    return Scaffold(
      body: IntroductionScreen(
        pages: listPages,
        next: const Icon(Icons.navigate_next),
        done: const Text('Fechar'),
        showSkipButton: true,
        skip: const Text('Pular'),
        onDone: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => App(),));
        },
        onSkip: () {
           Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => App(),
          ));
        },
      ),
    );
  }
}
