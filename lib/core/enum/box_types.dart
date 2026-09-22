enum BoxType {
  habit('habits'),
  user('user'),
  store('store'),
  products('products'),
  settings('settings');

  final String name;

  const BoxType(this.name);
}
