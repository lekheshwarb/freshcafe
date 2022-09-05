"" '
User.create({
  name: "admin",
  role: "owner",
  phone: 9999999999,
  address: "Hyderabad Telangan, India.",
  email: "lekheshwar.bejjarapu@freshworks.com",
})

MenuCategory.create({
  name: "Breakfast",
})

MenuItem.create({
  name: "Idli",
  description: "Ghee with chutny and sambar",
  price: 15,
  is_out_of_stock: false,
  production_cost: 5.5,
  menu_category_id: 1,
})


Order.create({
  user_id: 2,
  status: "Queued",
  instructions: "Make it spicy..",
})


OrderItem.create({
  order_id: 1,
  menu_item_id: 1,
  quantity: 2,
  menu_item_name: "Idli",
  menu_item_price: 15,
})


' ""
