import 'package:anterosflutter/anterosflutter.dart';

List<AnterosChoice<String>> days = [
  AnterosChoice<String>(value: 'mon', title: 'Monday'),
  AnterosChoice<String>(value: 'tue', title: 'Tuesday'),
  AnterosChoice<String>(value: 'wed', title: 'Wednesday'),
  AnterosChoice<String>(value: 'thu', title: 'Thursday'),
  AnterosChoice<String>(value: 'fri', title: 'Friday'),
  AnterosChoice<String>(value: 'sat', title: 'Saturday'),
  AnterosChoice<String>(value: 'sun', title: 'Sunday'),
];

List<AnterosChoice<String>> months = [
  AnterosChoice<String>(value: 'jan', title: 'January'),
  AnterosChoice<String>(value: 'feb', title: 'February'),
  AnterosChoice<String>(value: 'mar', title: 'March'),
  AnterosChoice<String>(value: 'apr', title: 'April'),
  AnterosChoice<String>(value: 'may', title: 'May'),
  AnterosChoice<String>(value: 'jun', title: 'June'),
  AnterosChoice<String>(value: 'jul', title: 'July'),
  AnterosChoice<String>(value: 'aug', title: 'August'),
  AnterosChoice<String>(value: 'sep', title: 'September'),
  AnterosChoice<String>(value: 'oct', title: 'October'),
  AnterosChoice<String>(value: 'nov', title: 'November'),
  AnterosChoice<String>(value: 'dec', title: 'December'),
];

List<AnterosChoice<String>> os = [
  AnterosChoice<String>(value: 'and', title: 'Android'),
  AnterosChoice<String>(value: 'ios', title: 'IOS'),
  AnterosChoice<String>(value: 'mac', title: 'Macintos'),
  AnterosChoice<String>(value: 'tux', title: 'Linux'),
  AnterosChoice<String>(value: 'win', title: 'Windows'),
];

List<AnterosChoice<String>> heroes = [
  AnterosChoice<String>(value: 'bat', title: 'Batman'),
  AnterosChoice<String>(value: 'sup', title: 'Superman'),
  AnterosChoice<String>(value: 'hul', title: 'Hulk'),
  AnterosChoice<String>(value: 'spi', title: 'Spiderman'),
  AnterosChoice<String>(value: 'iro', title: 'Ironman'),
  AnterosChoice<String>(value: 'won', title: 'Wonder Woman'),
];

List<AnterosChoice<String>> fruits = [
  AnterosChoice<String>(value: 'app', title: 'Apple'),
  AnterosChoice<String>(value: 'ore', title: 'Orange'),
  AnterosChoice<String>(value: 'mel', title: 'Melon'),
];

List<AnterosChoice<String>> frameworks = [
  AnterosChoice<String>(value: 'ion', title: 'Ionic'),
  AnterosChoice<String>(value: 'flu', title: 'Flutter'),
  AnterosChoice<String>(value: 'rea', title: 'React Native'),
];

List<AnterosChoice<String>> categories = [
  AnterosChoice<String>(value: 'ele', title: 'Electronics'),
  AnterosChoice<String>(value: 'aud', title: 'Audio & Video'),
  AnterosChoice<String>(value: 'acc', title: 'Accessories'),
  AnterosChoice<String>(value: 'ind', title: 'Industrial'),
  AnterosChoice<String>(value: 'wat', title: 'Smartwatch'),
  AnterosChoice<String>(value: 'sci', title: 'Scientific'),
  AnterosChoice<String>(value: 'mea', title: 'Measurement'),
  AnterosChoice<String>(value: 'pho', title: 'Smartphone'),
];

List<AnterosChoice<String>> sorts = [
  AnterosChoice<String>(value: 'popular', title: 'Popular'),
  AnterosChoice<String>(value: 'review', title: 'Most Reviews'),
  AnterosChoice<String>(value: 'latest', title: 'Newest'),
  AnterosChoice<String>(value: 'cheaper', title: 'Low Price'),
  AnterosChoice<String>(value: 'pricey', title: 'High Price'),
];

List<Map<String, String>> cars = [
  {'value': 'bmw-x1', 'title': 'BMW X1', 'brand': 'BMW', 'body': 'SUV'},
  {'value': 'bmw-x7', 'title': 'BMW X7', 'brand': 'BMW', 'body': 'SUV'},
  {'value': 'bmw-x2', 'title': 'BMW X2', 'brand': 'BMW', 'body': 'SUV'},
  {'value': 'bmw-x4', 'title': 'BMW X4', 'brand': 'BMW', 'body': 'SUV'},
  {
    'value': 'honda-crv',
    'title': 'Honda C-RV',
    'brand': 'Honda',
    'body': 'SUV'
  },
  {
    'value': 'honda-hrv',
    'title': 'Honda H-RV',
    'brand': 'Honda',
    'body': 'SUV'
  },
  {
    'value': 'mercedes-gcl',
    'title': 'Mercedes-Benz G-class',
    'brand': 'Mercedes',
    'body': 'SUV'
  },
  {
    'value': 'mercedes-gle',
    'title': 'Mercedes-Benz GLE',
    'brand': 'Mercedes',
    'body': 'SUV'
  },
  {
    'value': 'mercedes-ecq',
    'title': 'Mercedes-Benz ECQ',
    'brand': 'Mercedes',
    'body': 'SUV'
  },
  {
    'value': 'mercedes-glcc',
    'title': 'Mercedes-Benz GLC Coupe',
    'brand': 'Mercedes',
    'body': 'SUV'
  },
  {
    'value': 'lr-ds',
    'title': 'Land Rover Discovery Sport',
    'brand': 'Land Rover',
    'body': 'SUV'
  },
  {
    'value': 'lr-rre',
    'title': 'Land Rover Range Rover Evoque',
    'brand': 'Land Rover',
    'body': 'SUV'
  },
  {
    'value': 'honda-jazz',
    'title': 'Honda Jazz',
    'brand': 'Honda',
    'body': 'Hatchback'
  },
  {
    'value': 'honda-civic',
    'title': 'Honda Civic',
    'brand': 'Honda',
    'body': 'Hatchback'
  },
  {
    'value': 'mercedes-ac',
    'title': 'Mercedes-Benz A-class',
    'brand': 'Mercedes',
    'body': 'Hatchback'
  },
  {
    'value': 'hyundai-i30f',
    'title': 'Hyundai i30 Fastback',
    'brand': 'Hyundai',
    'body': 'Hatchback'
  },
  {
    'value': 'hyundai-kona',
    'title': 'Hyundai Kona Electric',
    'brand': 'Hyundai',
    'body': 'Hatchback'
  },
  {
    'value': 'hyundai-i10',
    'title': 'Hyundai i10',
    'brand': 'Hyundai',
    'body': 'Hatchback'
  },
  {'value': 'bmw-i3', 'title': 'BMW i3', 'brand': 'BMW', 'body': 'Hatchback'},
  {
    'value': 'bmw-sgc',
    'title': 'BMW 4-serie Gran Coupe',
    'brand': 'BMW',
    'body': 'Hatchback'
  },
  {
    'value': 'bmw-sgt',
    'title': 'BMW 6-serie GT',
    'brand': 'BMW',
    'body': 'Hatchback'
  },
  {
    'value': 'audi-a5s',
    'title': 'Audi A5 Sportback',
    'brand': 'Audi',
    'body': 'Hatchback'
  },
  {
    'value': 'audi-rs3s',
    'title': 'Audi RS3 Sportback',
    'brand': 'Audi',
    'body': 'Hatchback'
  },
  {
    'value': 'audi-ttc',
    'title': 'Audi TT Coupe',
    'brand': 'Audi',
    'body': 'Coupe'
  },
  {
    'value': 'audi-r8c',
    'title': 'Audi R8 Coupe',
    'brand': 'Audi',
    'body': 'Coupe'
  },
  {
    'value': 'mclaren-570gt',
    'title': 'Mclaren 570GT',
    'brand': 'Mclaren',
    'body': 'Coupe'
  },
  {
    'value': 'mclaren-570s',
    'title': 'Mclaren 570S Spider',
    'brand': 'Mclaren',
    'body': 'Coupe'
  },
  {
    'value': 'mclaren-720s',
    'title': 'Mclaren 720S',
    'brand': 'Mclaren',
    'body': 'Coupe'
  },
];

List<Map<String, String>> smartphones = [
  {
    'id': 'sk3',
    'name': 'Samsung Keystone 3',
    'brand': 'Samsung',
    'category': 'Budget Phone'
  },
  {
    'id': 'n106',
    'name': 'Nokia 106',
    'brand': 'Nokia',
    'category': 'Budget Phone'
  },
  {
    'id': 'n150',
    'name': 'Nokia 150',
    'brand': 'Nokia',
    'category': 'Budget Phone'
  },
  {
    'id': 'r7a',
    'name': 'Redmi 7A',
    'brand': 'Xiaomi',
    'category': 'Mid End Phone'
  },
  {
    'id': 'ga10s',
    'name': 'Galaxy A10s',
    'brand': 'Samsung',
    'category': 'Mid End Phone'
  },
  {
    'id': 'rn7',
    'name': 'Redmi Note 7',
    'brand': 'Xiaomi',
    'category': 'Mid End Phone'
  },
  {
    'id': 'ga20s',
    'name': 'Galaxy A20s',
    'brand': 'Samsung',
    'category': 'Mid End Phone'
  },
  {
    'id': 'mc9',
    'name': 'Meizu C9',
    'brand': 'Meizu',
    'category': 'Mid End Phone'
  },
  {
    'id': 'm6',
    'name': 'Meizu M6',
    'brand': 'Meizu',
    'category': 'Mid End Phone'
  },
  {
    'id': 'ga2c',
    'name': 'Galaxy A2 Core',
    'brand': 'Samsung',
    'category': 'Mid End Phone'
  },
  {
    'id': 'r6a',
    'name': 'Redmi 6A',
    'brand': 'Xiaomi',
    'category': 'Mid End Phone'
  },
  {
    'id': 'r5p',
    'name': 'Redmi 5 Plus',
    'brand': 'Xiaomi',
    'category': 'Mid End Phone'
  },
  {
    'id': 'ga70',
    'name': 'Galaxy A70',
    'brand': 'Samsung',
    'category': 'Mid End Phone'
  },
  {
    'id': 'ai11',
    'name': 'iPhone 11 Pro',
    'brand': 'Apple',
    'category': 'Flagship Phone'
  },
  {
    'id': 'aixr',
    'name': 'iPhone XR',
    'brand': 'Apple',
    'category': 'Flagship Phone'
  },
  {
    'id': 'aixs',
    'name': 'iPhone XS',
    'brand': 'Apple',
    'category': 'Flagship Phone'
  },
  {
    'id': 'aixsm',
    'name': 'iPhone XS Max',
    'brand': 'Apple',
    'category': 'Flagship Phone'
  },
  {
    'id': 'hp30',
    'name': 'Huawei P30 Pro',
    'brand': 'Huawei',
    'category': 'Flagship Phone'
  },
  {
    'id': 'ofx',
    'name': 'Oppo Find X',
    'brand': 'Oppo',
    'category': 'Flagship Phone'
  },
  {
    'id': 'gs10',
    'name': 'Galaxy S10+',
    'brand': 'Samsung',
    'category': 'Flagship Phone'
  },
];

List<Map<String, String>> transports = [
  {
    'title': 'Plane',
    'image': 'https://source.unsplash.com/Eu1xLlWuTWY/100x100',
  },
  {
    'title': 'Train',
    'image': 'https://source.unsplash.com/Njq3Nz6-5rQ/100x100',
  },
  {
    'title': 'Bus',
    'image': 'https://source.unsplash.com/qoXgaF27zBc/100x100',
  },
  {
    'title': 'Car',
    'image': 'https://source.unsplash.com/p7tai9P7H-s/100x100',
  },
  {
    'title': 'Bike',
    'image': 'https://source.unsplash.com/2LTMNCN4nEg/100x100',
  },
];
