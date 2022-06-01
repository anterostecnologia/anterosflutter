import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowVsAnterosRowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AnterosColors.DARK,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: const Text(
          'Row x AnterosRow Example',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: AnterosBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //
              // ------------------
              //
              explanation(
                  "Row onde as células são menores que a largura disponível:"),
              Row(children: [
                text("How"),
                text("are you all,"),
                text("my dearest friends?"),
              ]),
              //
              //
              explanation(
                  "AnterosRow com `fill:false` (default) onde as células são menores que a largura disponível. "
                  "Semelhante a Row:"),
              AnterosRow(fill: false, children: [
                text("How"),
                text("are you all,"),
                text("my dearest friends?"),
              ]),
              //
              // ------------------
              //
              divider(),
              //
              explanation(
                  "Row onde as células são menores que a largura disponível, mas use expandido. "
                  "Ele preenche todo o espaço, mas as células têm o mesmo tamanho:"),
              Row(children: [
                Expanded(child: text("How")),
                Expanded(child: text("are you,")),
                Expanded(child: text("my dear friend?")),
              ]),
              //
              //
              explanation(
                  "Anteros com `fill:true` onde as células são menores que a largura disponível. "
                  "Ele preenche todo o espaço e as células são proporcionais à sua largura de conteúdo:"),
              AnterosRow(fill: true, children: [
                text("How"),
                text("are you all,"),
                text("my dearest friends?"),
              ]),
              //
              // ------------------
              //
              divider(),
              //
              explanation(
                  "Row onde as células são maiores que a largura disponível. "
                  "Ele transbordará (e mostrará o aviso de transbordamento):"),
              Row(children: [
                text("Este é um texto muito longo"),
                text(
                    "Isso certamente não se encaixa no espaço disponível na tela de um telefone celular comum."),
              ]),
              //
              explanation(
                  "Anteros onde as células são maiores que a largura disponível "
                  "(Não importa se `fill:false` ou `true`). "
                  "ele preenche todo o espaço e as células são proporcionais à sua largura de conteúdo:"),
              AnterosRow(fill: false, children: [
                text("this is a long text"),
                text(
                    "that surely won't fit the available space in a regular cell phone's screen."),
              ]),
              //
              // ------------------
              //
              divider(),
            ],
          ),
        ),
      ),
    );
  }

  Column divider() => Column(
        children: [
          const SizedBox(height: 40),
          Container(color: Colors.black, height: 1, width: double.infinity),
          const SizedBox(height: 10),
        ],
      );

  Widget explanation(String text) => Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 8.0, right: 15.0, bottom: 10),
        child: Text(text),
      );

  List<Widget> texts() => [
        text("How"),
        text("are you all,"),
        text("my dearest friends?"),
      ];

  Widget text(String text) => AnterosBox.rand(
        padding: const AnterosPad(top: 4.0, bottom: 4.0),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      );
}
