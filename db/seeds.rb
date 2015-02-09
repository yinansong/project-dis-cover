r1 = Role.create({name: "Viewer", description: "Can see manholecovers"})
r2 = Role.create({name: "Collector", description: "Can read and create manholecovers. Can update and destroy own manholecovers"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

c1 = Collector.create({name: "Sally", email: "sally@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
c2 = Collector.create({name: "Sue", email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
c3 = Collector.create({name: "Kev", email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
c4 = Collector.create({name: "Jack", email: "jack@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})

m1 = Manholecover.create({
  country: "China",
  region: "Sichuan",
  city: "Chengdu",
  year: "2014",
  color: "black",
  keywords: "",
  featured: false,
  collector_id: c2.id
  })

m2 = Manholecover.create({
  country: "USA",
  region: "Connecticut",
  city: "New Haven",
  year: "2014",
  color: "brown",
  keywords: "",
  featured: false,
  collector_id: c2.id
  })

m3 = Manholecover.create({
  country: "USA",
  region: "New York",
  city: "New York",
  year: "2014",
  color: "grey",
  keywords: "",
  featured: false,
  collector_id: c3.id
  })

m4 = Manholecover.create({
  country: "USA",
  region: "Massachusetts",
  city: "Boston",
  year: "2014",
  color: "brown",
  keywords: "",
  featured: false,
  collector_id: c4.id
  })
