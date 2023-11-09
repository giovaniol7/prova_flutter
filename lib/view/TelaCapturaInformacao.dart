import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/informacaoStore.dart';

class TelaCapturaInformacao extends StatefulWidget {
  const TelaCapturaInformacao({super.key});

  @override
  State<TelaCapturaInformacao> createState() => _TelaCapturaInformacaoState();
}

class _TelaCapturaInformacaoState extends State<TelaCapturaInformacao> {
  informacaoStore store = informacaoStore();

  @override
  void initState() {
    super.initState();
    store.carregarUsuario();
    store.carregarListaSalva();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(29, 79, 97, 1),
          Color.fromRGBO(51, 144, 137, 1),
        ],
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          containerCards(),
          containerPolitica(),
        ],
      ),
    )));
  }

  containerCards() {
    return Container(
      padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.elliptical(10, 80), bottom: Radius.elliptical(10, 80)),
                color: Colors.white,
                boxShadow: [BoxShadow(offset: Offset(0, 2), color: Colors.black38, blurRadius: 2)],
              ),
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                itemCount: store.listCard.length,
                itemBuilder: (context, index) => listarCard(index),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(offset: Offset(0, 2), color: Colors.black38, blurRadius: 2)
                    // changes position of shadow
                  ]),
              child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    controller: store.txtTexto,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      prefixIconColor: Colors.black,
                      label: const Center(
                        child: Text(
                          'Digite seu texto',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      labelStyle: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                      border: const OutlineInputBorder(),
                      focusColor: Colors.grey[100],
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (value) {
                      if (store.txtTexto.text.isNotEmpty) {
                        if (store.editIndex != null) {
                          store.listCard[store.editIndex!] = store.txtTexto.text;
                          store.editIndex = null;
                          store.txtTexto.text = '';
                        } else {
                          store.listCard.add(store.txtTexto.text);
                          store.txtTexto.text = '';
                        }
                        store.salvarLista();
                      }
                    },
                  ))),
        ],
      ),
    );
  }

  listarCard(index) {
    return Column(children: [
      ListTile(
        title: Center(
          child: Text(store.listCard[index],
              style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  store.txtTexto.text = store.listCard[index];
                  store.editIndex = index;
                  store.salvarLista();
                  store.carregarListaSalva();
                });
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.cancel,
                color: Colors.red,
                size: 30,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirmar Exclusão do Card!'),
                        content:
                            const Text('Tem certeza que deseja excluir esse Card?.\n', style: TextStyle(fontSize: 16)),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              'Cancelar',
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'Apagar',
                              style: TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                            onPressed: () {
                              store.listCard.removeAt(index);
                              setState(() {
                                store.salvarLista();
                                store.carregarListaSalva();
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
            )
          ],
        ),
        onTap: () {},
      ),
      const Divider(height: 1, color: Colors.grey),
    ]);
  }

  containerPolitica() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Align(
          child: TextButton(
            child: const Text('Política de Privacidade', style: TextStyle(color: Colors.white, fontSize: 16)),
            onPressed: () async {
              Uri url = Uri.parse('https://www.google.com.br/');
              if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
                throw Exception('Could not launch $url');
              }
            },
          ),
        ),
      ),
    );
  }
}
