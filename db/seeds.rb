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
  keywords: ["1", "2", "3"],
  notes: "I was born near this!",
  featured: true,
  user_id: u2.id
)

m2 = Manholecover.create(
  country: "China",
  region: "Sichuan",
  city: "Chengdu",
  year: "2002",
  color: "white",
  keywords: ["1", "2", "3"],
  notes: "Growing up",
  featured: true,
  user_id: u2.id
)

m3 = Manholecover.create(
  country: "USA",
  region: "Connecticut",
  city: "New Haven",
  year: "2003",
  color: "yellow",
  keywords: ["4", "5", "6"],
  notes: "Good morning New Haven",
  featured: true,
  user_id: u3.id
)

m4 = Manholecover.create(
  country: "USA",
  region: "New York",
  city: "New York City",
  year: "2004",
  color: "green",
  keywords: ["7", "8", "9"],
  notes: "New Chapter in life",
  featured: false,
  user_id: u4.id
)
