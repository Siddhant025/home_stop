class Coffee {
  String shopName;
  String address;
  String thumbNail;
  double lat;
  double long;

  Coffee({
    this.shopName,
    this.address,
    this.thumbNail,
    this.lat,
    this.long,
  });
}

final List<Coffee> coffeeShops = [
  Coffee(
    shopName: 'Stumptown Coffee Roasters',
    address: '18 W 29th St',
    thumbNail:
        'https://i.pinimg.com/originals/49/20/78/492078c545f91879445193de25ceeed5.jpg',
    lat: 22.292511,
    long: 73.164375
  ),
  Coffee(
    shopName: 'Andrews Coffee Shop',
    address: '463 7th Ave',
    thumbNail:
        'https://media-cdn.tripadvisor.com/media/photo-s/10/2d/1e/eb/andrews-coffee-shop.jpg',
    lat: 22.270041,
    long: 73.149727
  ),
  Coffee(
    shopName: 'Third Rail Coffee',
    address: '240 Sullivan St',
    thumbNail:
        'https://s3-media0.fl.yelpcdn.com/bphoto/gqAmnRMyn18zqbEcuTb1PA/348s.jpg',
    lat: 22.291061,
    long: 73.243126
  ),
  Coffee(
    shopName: 'Hi-Collar',
    address: '214 E 10th St',
    thumbNail:
        'https://www.screenly.io/assets/coffee-shop-digital-sign-c1a802afd67812d4f641854893f2ea8b94ade4c9df445cac471c4f8f27208e94.png',
    lat: 22.323494,
    long: 73.187221
  ),
  Coffee(
    shopName: 'Everyman Espresso',
    address: '301 W Broadway',
    thumbNail:
        'https://images.squarespace-cdn.com/content/v1/5518a643e4b0ad84142c80a6/1428040616862-YHPSW6O68EM09DWCVCH0/ke17ZwdGBToddI8pDm48kC67Bb35Ud-XEefWBusFwAxZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpyPUxGsLqu9r5wyz_a8BO4zFTXzssYQE6iuI9f3zGsIp4jxGsyqshwGj2VLLj33yFI/New+13th+St%282%29.png?format=1500w',
    lat: 22.3073,
    long: 73.1811
  )
];
