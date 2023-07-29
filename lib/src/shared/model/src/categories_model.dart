class CategoriesModel {
  final int id;
  final String name;
  final String? imageUrl;
  final List<SubCategoryModel> subCategories;

  const CategoriesModel(
      {required this.id,
      required this.name,
      required this.subCategories,
      this.imageUrl});

  static List<CategoriesModel> categoriesDummy() {
    List<CategoriesModel> categories = List.empty(growable: true);

    categories.add(
      CategoriesModel(
        id: 1,
        name: "Sayur & Buah",
        imageUrl:
            "https://sesa.id/cdn/shop/files/Category_icon_Sayur_buah_220x@2x.jpg?v=1689226398",
        subCategories: [
          SubCategoryModel(id: "1b", name: "Sayur"),
          SubCategoryModel(id: "2b", name: "Jamur & Kecambah"),
          SubCategoryModel(
            id: "3b",
            name: "Rempah & Bumbu",
          ),
          SubCategoryModel(
            id: "4b",
            name: "Tahu & Fermentasi",
          ),
        ],
      ),
    );
    categories.add(
      const CategoriesModel(
          id: 2,
          name: "Daging & Seafood",
          imageUrl:
              "https://sesa.id/cdn/shop/files/Category_icon_Daging_Seafood_220x@2x.jpg?v=1689169125",
          subCategories: []),
    );
    categories.add(
      const CategoriesModel(
          id: 3,
          name: "Beras & Kacang",
          imageUrl:
              "https://sesa.id/cdn/shop/files/Category_icon_Beras_Kacang_220x@2x.jpg?v=1689226348",
          subCategories: []),
    );
    categories.add(
      const CategoriesModel(
          id: 4,
          name: "Bahan Masakan",
          imageUrl:
              "https://sesa.id/cdn/shop/files/Category_icon_Bahan_Masak_220x@2x.jpg?v=1689226360",
          subCategories: []),
    );
    categories.add(
      const CategoriesModel(
          id: 5,
          name: "Makanan Anak",
          imageUrl:
              "https://sesa.id/cdn/shop/files/Category_icon_makanan_anak_220x@2x.jpg?v=1689226305",
          subCategories: []),
    );
    categories.add(
      const CategoriesModel(
          id: 6,
          name: "Sarapan",
          imageUrl:
              "https://sesa.id/cdn/shop/files/Category_icon_Sarapan_220x@2x.jpg?v=1689226259",
          subCategories: []),
    );
    categories.add(
      const CategoriesModel(
          id: 7,
          name: "Susu & Olahan",
          imageUrl:
              "https://sesa.id/cdn/shop/files/Category_icon_Susu_Olahan_220x@2x.jpg?v=1689189389",
          subCategories: []),
    );
    const CategoriesModel(
        id: 8,
        name: "Makanan Beku",
        imageUrl:
            "https://sesa.id/cdn/shop/files/Category_icon_Makanan_Beku_220x@2x.jpg?v=1689226317",
        subCategories: []);

    return categories;
  }
}

class SubCategoryModel {
  final String id;
  final String name;
  final String? imageUrl;

  SubCategoryModel({
    required this.id,
    required this.name,
    this.imageUrl,
  });
}
