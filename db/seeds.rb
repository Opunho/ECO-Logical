# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Recommendation.destroy_all
Pledge.destroy_all
Impact.destroy_all
Emmission.destroy_all
Expense.destroy_all
Account.destroy_all
User.destroy_all

puts "Creating user"
@user = User.create!(
  email: 'user@user.com',
  password: 'password',
  first_name: 'user',
  last_name: 'user'
)
puts "User created"

puts "Creating Recommendations"
Recommendation.create!(
  category: "Transportation",
  title: "Cycle",
  description: "Going carless for a year could save about 2.6 tons of carbon dioxide, according to 2017 study from researchers at Lund University and the University of British Columbia — that’s a little more than a roundtrip transatlantic flight. How can you stop using a car? Try taking a train, bus or better yet, ride a bike.",
  link_to_article: "https://www.nytimes.com/guides/year-of-living-better/how-to-reduce-your-carbon-footprint",
  co2_grams: 50000,
  photo: "https://res.cloudinary.com/dyjkajjgg/image/upload/v1638265759/cycling.jpg",
  icon: "https://res.cloudinary.com/dyjkajjgg/image/upload/v1638371366/icons/bicycle_hc866i.png"
)

Recommendation.create!(
  category: "Travel",
  title: "Reduce flights",
  description: "Flying leads to lots of carbon emissions. For an average household, flying comes at number 6 of in the top 10 list of activities that cause the most carbon emissions. However, if you frequently go on distant flights, flying quickly becomes number 1 on the list.",
  link_to_article: "https://flygrn.com/page/sustainable-air-travel",
  co2_grams: 70000,
  photo: "https://res.cloudinary.com/dyjkajjgg/image/upload/v1638265777/train.jpg",
  icon: "https://res.cloudinary.com/dyjkajjgg/image/upload/v1638371366/icons/train_qfmjdd.png"
)

Recommendation.create!(
  category: "Fashion",
  title: "Shop vintage",
  description: "When we think of pollution, we think of big oil companies and smog from coal mines—but the truth is, the fast fashion industry is one of the central polluting industries in the world. Not only is clothing production harmful to our planet, but the process also kills thousands of farmers and producers each year due to chemicals and waste.",
  link_to_article: "https://www.thegoodtrade.com/features/eco-friendly-clothing-brands",
  co2_grams: 60000,
  photo: "https://res.cloudinary.com/dyjkajjgg/image/upload/v1638265784/ecomarket.jpg",
  icon: "https://res.cloudinary.com/dyjkajjgg/image/upload/v1638371366/icons/t-shirt_srb9jj.png"
)

Recommendation.create!(
  category: "Clothing consumption",
  title: "Recycle clothes",
  description: "Is it time to break up with fast fashion? If the answer wasn’t already a resounding yes, the past year’s worth of evidence of our warming planet should make you reconsider your fashion choices and the clothing brands you shop.",
  link_to_article: "https://www.fastcompany.com/90626395/best-sustainable-clothing-brands",
  co2_grams: 55000,
  photo: "https://res.cloudinary.com/dyjkajjgg/image/upload/v1638269932/vintage.jpg",
  icon: "https://res.cloudinary.com/dyjkajjgg/image/upload/v1638371366/icons/clothes-hanger_qgkdra.png"
)

Recommendation.create!(
  category: "Home",
  title: "Limit Heating",
  description: "Natural gas consists of mainly methane and other hydrocarbons. It is formed naturally underground when the remains of plant and animal matter are exposed to heavy pressures under the Earth’s surface. Because it occurs naturally under the Earth’s surface, it must be extracted. During the extraction process, much of the gas is lost to the atmosphere. Methane is a greenhouse gas, meaning it has a negative effect on our environment through global warming. In fact, a 2015 report by the Environmental Defense Fund surmises that natural gas released during the extraction process may negate much of its clean-burning benefit over other fossil fuels.",
  link_to_article: "https://evergreenhomeheatingandenergy.com/blog/146142",
  co2_grams: 62500,
  photo: "https://res.cloudinary.com/dyjkajjgg/image/upload/v1638269945/blanket.jpg",
  icon: "https://res.cloudinary.com/dyjkajjgg/image/upload/v1638371366/icons/thermometer_f6mgmn.png"

)

Recommendation.create!(
  category: "Garden",
  title: "Optmise Garden",
  description: "Very few of us are blessed to garden on a floodplain that is annually inundated with fresh, fertile topsoil, so if we want our garden to last more than a season, we need to insure the soil is replenished with nutrients the plants need.  To do this we can rely on the nitrogen-fixing bacteria that live in the roots of legumes, such as clover, and the natural weathering of the rocks for other nutrients.  The cost of this approach is land use, since land being replenished by these natural processes can’t be used simultaneously for growing food.",
  link_to_article: "https://biologistsgarden.net/2017/04/29/vegetable-gardens-are-not-sustainable/",
  co2_grams: 65000,
  photo: "https://res.cloudinary.com/dyjkajjgg/image/upload/v1638269957/garden.jpg",
  icon:"https://res.cloudinary.com/dyjkajjgg/image/upload/v1638371366/icons/gardening_wojnew.png"
)

Recommendation.create!(
  category: "Food",
  title: "Try Vegan",
  description: "There are some important things to consider about the environmental impact of meat. First up: the water footprint. Past research has found the water footprint of meat and other animal products is much higher than plants. While it takes 1,800 gallons of water to produce one pound of beef, a salad with tomato, lettuce, and cucumbers only requires 21 gallons.There’s also the greenhouse gases, which contribute to global warming. And—you guessed it—a 2019 study published in Animal Frontiers found livestock is responsible for 14.5 percent of the world’s greenhouses gases. Ultimately, research shows that the best thing to do for the environment is to eat more plants, with a 2020 study published in Nature Sustainability showing a widespread shift to a plant-based diet by 2050 could remove over 16 years of CO2 emissions.",
  link_to_article: "https://brightly.eco/environmental-impact-of-meat/",
  co2_grams: 65000,
  photo: "https://res.cloudinary.com/dyjkajjgg/image/upload/v1638269968/veggies.jpg",
  icon: "https://res.cloudinary.com/dyjkajjgg/image/upload/v1638371366/icons/broccoli-vegetable_acqlku.png"
)

Recommendation.create!(
  category: "Beverage",
  title: "Resuable Bottles",
  description: "80 percent of plastic water bottles end up in landfills. ... Each bottle leaks harmful chemicals into our environment along the way as it decomposes. Studies show that the toxins decomposing bottles of water leach into our environment cause a variety of health issues, including reproductive problems and cancer.",
  link_to_article: "https://healthyhumanlife.com/blogs/news/plastic-water-bottle-pollution-plastic-bottles-end#:~:text=80%20percent%20of%20plastic%20water%20bottles%20end%20up%20in%20landfills.&text=Each%20bottle%20leaks%20harmful%20chemicals,including%20reproductive%20problems%20and%20cancer.",
  co2_grams: 65000,
  photo: "https://res.cloudinary.com/dyjkajjgg/image/upload/v1638269979/water.jpg",
  icon: "https://res.cloudinary.com/dyjkajjgg/image/upload/v1638371366/icons/bottle_gwqhno.png"
)
