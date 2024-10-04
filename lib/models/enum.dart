enum Komik {
  manhua(title: 'Manhua'),
  manhwa(title: 'Manhwa'),
  manga(title: 'Manga');

  final String title;
  const Komik({required this.title});
}
