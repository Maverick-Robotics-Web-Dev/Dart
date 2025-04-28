import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(21, 152, 213, 1),
          padding: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 60),
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 60, bottom: 40),
          decoration: BoxDecoration(
            color: Color.fromRGBO(24, 181, 254, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              bottomLeft: Radius.circular(36),
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(right: 26, left: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'back...',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/img/car_white.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 52, right: 22, left: 22),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text('Email'),
                      border: InputBorder.none,
                      prefixIcon: Container(
                        margin: EdgeInsets.only(top: 12),
                        child: Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.email_outlined),
                            Container(height: 20, width: 1, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 34, right: 22, left: 22),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text('Password'),
                      border: InputBorder.none,
                      prefixIcon: Container(
                        margin: EdgeInsets.only(top: 12),
                        child: Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.lock_outline),
                            Container(height: 20, width: 1, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 80, right: 40, left: 40),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No tienes cuenta?',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Registrate',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 42),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
