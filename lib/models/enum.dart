enum Type {
  manhua(title: 'Manhua'),
  manhwa(title: 'ManHwa'),
  manga(title: 'Manga');

  final String title;
  const Type({required this.title});
}
