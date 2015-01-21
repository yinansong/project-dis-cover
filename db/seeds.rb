collector01 = Collector.create(
  name: "yinansong",
  email: "yinan.e.song@gmail.com",
  password_digest: "manholes4eva"
)

collector02 = Collector.create(
  name: "evasong",
  email: "eva.song.yinan@gmail.com",
  password_digest: "manholes4eva"
)

mhcv01 = Manholecover.create(
  country: "China",
  region: "Sichuan",
  city: "Chengdu",
  year: "2014",
  color: "black",
  keywords: ["animal", "frog", "traditional"],
  notes: "From a historical site in my hometown",
  featured: true,
  collector_id: 1
)

mhcv02 = Manholecover.create(
  country: "USA",
  region: "Connecticut",
  city: "New Haven",
  year: "2014",
  color: "brown",
  keywords: ["nicefont", "sewer"],
  notes: "I think it's on the Beinecke Plaza",
  featured: true,
  collector_id: 1
)

mhcv03 = Manholecover.create(
  country: "USA",
  region: "Connecticut",
  city: "New Haven",
  year: "2014",
  color: "blue",
  keywords: ["circular", "watermeter"],
  notes: "It's bigger than the normal tiny ones tho.",
  featured: true,
  collector_id: 2
)

mhcv04 = Manholecover.create(
  country: "USA",
  region: "Connecticut",
  city: "New Haven",
  year: "2014",
  color: "orange",
  keywords: ["sun", "circular"],
  notes: "Good morning, New Haven. Good morning, Chapel Street.",
  featured: true,
  collector_id: 2
)

mhcv05 = Manholecover.create(
  country: "USA",
  region: "Connecticut",
  city: "New Haven",
  year: "2014",
  color: "purple",
  keywords: ["SNET", "circular"],
  notes: "This could be a snowflake.",
  featured: true,
  collector_id: 2
)
