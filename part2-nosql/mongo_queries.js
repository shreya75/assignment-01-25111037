// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    _id: 1,
    name: "Samsung 55-inch Smart TV",
    category: "Electronics",
    price: 65000,
    brand: "Samsung",
    warranty_years: 2,
    specifications: {
      resolution: "4K",
      voltage: "220V",
      screen_type: "LED"
    },
    features: ["Smart TV", "WiFi", "Bluetooth"],
    ratings: { average: 4.5, reviews_count: 1200 }
  },
  {
    _id: 2,
    name: "Men's Casual Shirt",
    category: "Clothing",
    price: 1500,
    brand: "Allen Solly",
    size_options: ["S", "M", "L", "XL"],
    material: "Cotton",
    color: "Blue",
    variants: [
      { size: "M", stock: 20 },
      { size: "L", stock: 15 }
    ],
    ratings: { average: 4.2, reviews_count: 300 }
  },
  {
    _id: 3,
    name: "Organic Milk 1L",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: new Date("2024-12-20"),
    weight: "1L",
    nutritional_info: {
      calories: 150,
      fat: "8g",
      protein: "6g"
    },
    storage_instructions: ["Keep Refrigerated"],
    ratings: { average: 4.6, reviews_count: 800 }
  }
]);


// OP2: find() — Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add discount_percent to a specific product
db.products.updateOne(
  { _id: 1 },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — index on category
db.products.createIndex({ category: 1 });

