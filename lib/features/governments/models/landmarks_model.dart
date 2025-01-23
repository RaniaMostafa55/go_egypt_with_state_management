class LandmarksModel {
  final String enName;
  final String arName;
  final String image;
  final String enGovernorateName;
  final String arGovernorateName;

  const LandmarksModel({
    required this.enName,
    required this.image,
    required this.enGovernorateName,
    required this.arName,
    required this.arGovernorateName,
  });

  static const List<LandmarksModel> landmarks = [
    LandmarksModel(
      enName: 'Pyramids of Giza',
      arName: 'أهرامات الجيزة',
      image:
          'https://www.touristegypt.com/wp-content/uploads/2023/03/giza-pyramids-cairo-egypt-with-palm-1024x634.jpg',
      enGovernorateName: 'Cairo',
      arGovernorateName: 'القاهرة',
    ),
    LandmarksModel(
      enName: 'Egyptian Museum',
      arName: 'المتحف المصري',
      image:
          'https://images.e-flux-systems.com/526205_de263a8418a1ac64e0b7ad4673eeb0f7.jpg,1600',
      enGovernorateName: 'Cairo',
      arGovernorateName: 'القاهرة',
    ),
    LandmarksModel(
      enName: 'Library of Alexandria',
      arName: 'مكتبة الإسكندرية',
      image:
          'https://momaa.org/wp-content/uploads/2019/10/Bibliotheca-Alexandrina-1-1024x568.png',
      enGovernorateName: 'Alexandria',
      arGovernorateName: 'الإسكندرية',
    ),
    LandmarksModel(
      enName: 'Qaitbay Citadel',
      arName: 'قلعة قايتباي',
      image: 'https://images.memphistours.com/large/1117259721_alexandria.jpg',
      enGovernorateName: 'Alexandria',
      arGovernorateName: 'الإسكندرية',
    ),
    LandmarksModel(
      enName: 'Valley of the Kings',
      arName: 'وادي الملوك',
      image:
          'https://i0.wp.com/www.touristegypt.com/wp-content/uploads/2023/05/luxor.jpg?fit=1000%2C552&ssl=1',
      enGovernorateName: 'Luxor',
      arGovernorateName: 'الأقصر',
    ),
    LandmarksModel(
      enName: 'Karnak Temple',
      arName: 'معبد الكرنك',
      image:
          'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/mandators/49581/file-manager/karnak-temple.jpg',
      enGovernorateName: 'Luxor',
      arGovernorateName: 'الأقصر',
    ),
  ];
}