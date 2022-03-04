class Image {
  final int id;
  final String title;
  final String thumnailUrl;

  Image(this.id, this.title, this.thumnailUrl);
}

List<Image> imageList = [
  Image(1, 'Title1',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png'),
  Image(2, 'Title2',
      'https://img-19.ccm2.net/cI8qqj-finfDcmx6jMK6Vr-krEw=/1500x/smart/b829396acc244fd484c5ddcdcb2b08f3/ccmcms-commentcamarche/20494859.jpg'),
  Image(3, 'Title3',
      'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fA%3D%3D&w=1000&q=80')
];
