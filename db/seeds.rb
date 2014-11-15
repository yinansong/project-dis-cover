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
  string: "yinan.e.song@gmail.com",
  password_digest: "manholes4eva"
)

mhcv01 = Manholecovers.create(
  manhole_url: "http://photos-a.ak.instagram.com/hphotos-ak-xaf1/10507830_783192385081928_661478825_n.jpg",
  country: "China",
  region: "Sichuan",
  city: "Chengdu",
  year: "2014",
  color: "black",
  keywords: "frogs", "traditional",
  notes: "wow so fun!",
  featured: true
)

mhcv.collector_id = collector01.id