# HOME STOP

## Table of Contents

- [Flutter Application](#For-Application-Side)
- [Server Side](#For-Server-Side)
- [App UI](#UI)


## For Application Side
Home_stop is an android application for E-Commerce Store where a user can select any store and buy the items from it.

As the User Opens the App He/she Can either Login or Sign_Up on the App 

The Main Dashboard shows the nearby stores where all the stores on the map are being shown User can Select any Store and browse through the items they provide

User can Add items to cart and then pay accordingly using the Cash on delivery or any online payment service

## UI

The UI of our app are Contains:-
- [Login/SignUP Screen](#Login/SignUp-Page)
- [Dashboard Screen](#Dashboard)
- [Shop Screen](#Shop-Page)
- [Payment Screen](#Payment-Page)

### Login/SignUp Page
<img width="400" src=./assets/imgs/SplashScreen.jpeg>
<img width="400" src=./assets/imgs/LogInPage.jpeg>
<img width="400" src=./assets/imgs/SignUpPage.jpeg>

### Dashboard
<img width="400" src=./assets/imgs/Dashboard1.jpeg>
<img width="400" src=./assets/imgs/Dashboard2.jpeg>
<img width="400" src=./assets/imgs/NavBar.jpeg>

### Shop Page
<img width="400" src=./assets/imgs/ShopPage.jpeg>
<img width="400" src=./assets/imgs/ShopPage2.jpeg>
<img width="400" src=./assets/imgs/ReviewPage.jpeg>

### Payment Page
<img width="400" src=./assets/imgs/Cart.jpeg>
<img width="400" src=./assets/imgs/PaymentAlert.jpeg>
<img width="400" src=./assets/imgs/PaymentSuccess.jpeg>

## For Server Side

django server for a serving APIs forapp

The APIs are for the following tasks:
1. Sign in
2. Sign up
3. Order
4. Review
5. Stock taking
6. Monthly orders
and more.
This server would accept only post requests.
the server has a Api Auth system in place 

Make sure that nessary port forwarding is enabled for the server to be accessed from multiple networks.

### Procedure:
1. Execute the sql script named as homestop.sql
2. Create a user in the sql cl with the credintials as the one mentioned in the settings.py 
3. Update the port setting in settings.py
4. Check the nessary port fowarding settings
2. Execute init.sh for the first time
3. For the subcequent runs just running runserver.sh is enough
