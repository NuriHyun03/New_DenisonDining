import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Thank you for usings',
          style: TextStyle(
            fontFamily: 'Lora',
            fontSize: 13,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        ),
        const Text(
          'Denison Dining App',
          style: TextStyle(
            fontFamily: 'merri',
            fontSize: 15,
            color: Color(0xffb71c1c),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        ),
        const Text(
          'Please do not hesitate to contact me',
          style: TextStyle(
            fontFamily: 'Lora',
            fontSize: 13,
          ),
        ),
        const Text(
          'if you have any questions or feedback',
          style: TextStyle(
            fontFamily: 'Lora',
            fontSize: 13,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        InkWell(
          child: const Text(
            'hyun_n1@denison.edu',
            style: TextStyle(
              fontFamily: 'Lora',
              fontSize: 13,
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Clipboard.setData(
              const ClipboardData(text: 'hyun_n1@denison.edu'),
            ).then((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Email Copied!'),
                ),
              );
            });
          },
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        ),
        InkWell(
          child: const Text(
            'jeong_j1@denison.edu',
            style: TextStyle(
              fontFamily: 'Lora',
              fontSize: 13,
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Clipboard.setData(
              const ClipboardData(text: 'jeong_j1@denison.edu'),
            ).then((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Email Copied!'),
                ),
              );
            });
          },
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        ),
        InkWell(
          child: const Text(
            'lee_e3@denison.edu',
            style: TextStyle(
              fontFamily: 'Lora',
              fontSize: 13,
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Clipboard.setData(
              const ClipboardData(text: 'lee_e3@denison.edu'),
            ).then((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Email Copied!'),
                ),
              );
            });
          },
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        ),
        InkWell(
          child: const Text(
            'youn_j1@denison.edu',
            style: TextStyle(
              fontFamily: 'Lora',
              fontSize: 13,
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Clipboard.setData(
              const ClipboardData(text: 'youn_j1@denison.edu'),
            ).then((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Email Copied!'),
                ),
              );
            });
          },
        ),
      ],
    );
  }
}
