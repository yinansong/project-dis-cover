r1 = Role.create({name: "Regular", description: "Can read items"})
r2 = Role.create({name: "Seller", description: "Can read and create items. Can update and destroy own items"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

u1 = User.create({name: "Sally", email: "sally@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
u2 = User.create({name: "Sue", email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u3 = User.create({name: "Kev", email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u4 = User.create({name: "Jack", email: "jack@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})

m1 = Manholecover.create(
  country: "China",
  region: "Henan",
  city: "Xinxiang",
  year: "2001",
  color: "black",
  keywords: ["animal", "frog", "traditional"],
  notes: "From a historical site in my hometown",
  featured: true,
  user_id: u2.id
)

m2 = Manholecover.create(
  country: "China",
  region: "Henan",
  city: "Xinxiang",
  year: "2002",
  color: "black",
  keywords: ["animal", "frog", "traditional"],
  notes: "From a historical site in my hometown",
  featured: true,
  user_id: u2.id
)

m3 = Manholecover.create(
  country: "China",
  region: "Henan",
  city: "Xinxiang",
  year: "2003",
  color: "black",
  keywords: ["animal", "frog", "traditional"],
  notes: "From a historical site in my hometown",
  featured: true,
  user_id: u3.id
)

m4 = Manholecover.create(
  country: "China",
  region: "Henan",
  city: "Xinxiang",
  year: "2004",
  color: "black",
  keywords: ["animal", "frog", "traditional"],
  notes: "From a historical site in my hometown",
  featured: false,
  user_id: u4.id
)
