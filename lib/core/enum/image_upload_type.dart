enum ImageUploadType {
  product('product'),
  storelogo('storelogo');

  final String folder;

  const ImageUploadType(this.folder);
}
