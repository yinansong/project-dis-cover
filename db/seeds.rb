# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

collector01 = Collector.create(
  headshot_url: "",
  name: "yinan",
  email: "yinan.e.song@gmail.com",
  password_digest: "manholes4eva"
)

mhcv01 = Manholecover.create(
  manhole_url: "http://photos-a.ak.instagram.com/hphotos-ak-xaf1/10507830_783192385081928_661478825_n.jpg",
  country: "China",
  region: "Sichuan",
  city: "Chengdu",
  year: "2014",
  color: "black",
  keywords: ["animal", "frog", "traditional"],
  notes: "wow so fun!",
  featured: true
)

mhcv02 = Manholecover.create(
  manhole_url: "http://photos-a.ak.instagram.com/hphotos-ak-xaf1/10507830_783192385081928_661478825_n.jpg",
  country: "USA",
  region: "New York",
  city: "New York",
  year: "2014",
  color: "green",
  keywords: ["cross", "tape", "conedison"],
  notes: "punk",
  featured: true
)


mhcv01.collector_id = collector01.id
mhcv02.collector_id = collector01.id
