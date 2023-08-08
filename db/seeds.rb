# seeds.rb

# Create users
user1 = User.create(name: "John Doe")
user2 = User.create(name: "Jane Smith")
user3 = User.create(name: "Michael Johnson")
user4 = User.create(name: "Emily Brown")
user5 = User.create(name: "David Williams")

# Create recipes
Recipe.create(
  name: "Homestyle Chicken Pot Pie",
  preparation_time_minutes: 45,
  cooking_time_minutes: 30,
  description: "A comforting chicken and vegetable pie with a flaky crust.",
  public: true,
  user: user1
)

Recipe.create(
  name: "Creamy Mushroom Risotto",
  preparation_time_minutes: 30,
  cooking_time_minutes: 25,
  description: "A creamy and savory rice dish with sautéed mushrooms and Parmesan cheese.",
  public: true,
  user: user2
)

Recipe.create(
  name: "Spicy Beef Tacos",
  preparation_time_minutes: 20,
  cooking_time_minutes: 15,
  description: "Delicious beef tacos with a spicy kick, topped with fresh salsa and guacamole.",
  public: true,
  user: user3
)

Recipe.create(
  name: "Lemon Herb Grilled Salmon",
  preparation_time_minutes: 10,
  cooking_time_minutes: 15,
  description: "Flaky salmon fillets marinated in a zesty lemon and herb mixture, perfect for grilling.",
  public: true,
  user: user4
)

Recipe.create(
  name: "Pesto Pasta with Sun-Dried Tomatoes",
  preparation_time_minutes: 15,
  cooking_time_minutes: 10,
  description: "Tender pasta tossed in homemade pesto sauce and garnished with sun-dried tomatoes.",
  public: true,
  user: user5
)

Recipe.create(
  name: "Classic Beef Burger",
  preparation_time_minutes: 20,
  cooking_time_minutes: 15,
  description: "A timeless favorite featuring a juicy beef patty, melted cheese, and all the fixings.",
  public: true,
  user: user1
)

Recipe.create(
  name: "Vegetable Stir-Fry",
  preparation_time_minutes: 15,
  cooking_time_minutes: 10,
  description: "A colorful medley of fresh vegetables stir-fried in a savory soy and ginger sauce.",
  public: true,
  user: user2
)

Recipe.create(
  name: "Decadent Chocolate Brownies",
  preparation_time_minutes: 15,
  cooking_time_minutes: 25,
  description: "Indulgent chocolate brownies with a rich and fudgy texture, perfect for dessert.",
  public: true,
  user: user3
)

puts "Seeds created successfully."
