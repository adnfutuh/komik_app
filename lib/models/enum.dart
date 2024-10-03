enum Komik {
  manhua(title: 'Manhua'),
  manhwa(title: 'ManHwa'),
  manga(title: 'Manga');

  final String title;
  const Komik({required this.title});
}
