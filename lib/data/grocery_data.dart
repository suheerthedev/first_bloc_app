class GroceryData {
  static List<Map<String, dynamic>> groceryProducts = [
    {
      "id": 1,
      "name": "Apple",
      "category": "Fruits",
      "price": 3.99,
      "unit": "kg",
      "imageUrl":
          "https://assets.clevelandclinic.org/transform/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg", // red apple :contentReference[oaicite:2]{index=2}
      "inStock": true,
    },
    {
      "id": 2,
      "name": "Banana",
      "category": "Fruits",
      "price": 1.49,
      "unit": "kg",
      "imageUrl":
          "https://www.bobtailfruit.co.uk/media/mageplaza/blog/post/4/2/42e9as7nataai4a6jcufwg.jpeg", // bananas :contentReference[oaicite:3]{index=3}
      "inStock": true,
    },
    {
      "id": 3,
      "name": "Milk",
      "category": "Dairy",
      "price": 2.49,
      "unit": "L",
      "imageUrl":
          "https://images.immediate.co.uk/production/volatile/sites/30/2020/02/Glass-and-bottle-of-milk-fe0997a.jpg?resize=1366,1366", // example milk carton
      "inStock": true,
    },
    {
      "id": 4,
      "name": "Bread",
      "category": "Bakery",
      "price": 2.99,
      "unit": "loaf",
      "imageUrl":
          "https://assets.bonappetit.com/photos/5c62e4a3e81bbf522a9579ce/16:9/w_4000,h_2250,c_limit/milk-bread.jpg", // example bread loaf
      "inStock": false,
    },
    {
      "id": 5,
      "name": "Eggs",
      "category": "Dairy",
      "price": 3.29,
      "unit": "dozen",
      "imageUrl":
          "https://bluejeanchef.com/uploads/2019/04/Eggs-1280--640x800.jpg", // eggs example
      "inStock": true,
    },
  ];
}
