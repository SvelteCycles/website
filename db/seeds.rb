# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jerseys = Category.create(category: "jerseys")
jackets = Category.create(category: "jackets")
shirts = Category.create(category: "shirts")
bottoms = Category.create(category: "bottoms")
accessories = Category.create(category: "accessories")
baselayers = Category.create(category: "baselayers")

male = Gender.create(sex: "male")
female = Gender.create(sex: "female")

small = Size.create(size: "small")
medium = Size.create(size: "medium")
large = Size.create(size: "large")

red = Colour.create(colour: "red")
blue = Colour.create(colour: "blue")
pink = Colour.create(colour: "pink")
blue = Colour.create(colour: "blue")
green = Colour.create(colour: "green")
black = Colour.create(colour: "black")
grey = Colour.create(colour: "grey")
beige = Colour.create(colour: "beige")
floral = Colour.create(colour: "floral")
white = Colour.create(colour: "white")
print_pattern = Colour.create(colour: "print")
poc_blue = Colour.create(colour: "poc-blue")
wo_blue = Colour.create(colour: "wo-blue")
pattern = Colour.create(colour: "pattern")

OrderStatus.create(name: "in progress")

continental = Product.create(name: "continental", details: "Italian fabric, Light weight pigment dyed, Concealed phone pocket in seam, Fitted hem with silicon gripper",
              description: "Classic styling meets modern functionality. The continental jersey features a race fit and is made of a high tech fabric that enables it be to lightweight, streamlined and durable.",
              price: 60, category_id: jerseys.id)
heritage = Product.create(name: "heritage", details: "Danish Merino wool based, Merino Perform Fabric, Manufactured in London, Athletic fit, Concealed pocket in seam, Key pocket in addition to tradition three across the back",
              description: "Our Heritage jersey is the marriage of minimalist design and functional fabrics. Produced in London from Merino perform fabric, it features the breathability and body temperature regulation of merino wool, while benefiting from the strength and resilience of a synthetic fabric.",
              price: 60, category_id: jerseys.id)
maverick = Product.create(name: "maverick", details: "Danish Merino wool based, Merino Perform Fabric, Manufactured in Italy, Athletic fit, Extended hand guards, Concealed pocket in seam, Secure hem with silicon gripper",
              description: "Our premier Long Sleeved jersey, The Maverick is designed to take the edge out of riding in chilly climes. Produced in Italy from brushed Merino perform fabric, it has the great features of the Heritage, but with added heat retention and warmth.",
              price: 60, category_id: jerseys.id)
the_heavy = Product.create(name: "the heavy", details: "Swiss Fabric featuring C-Change technology, Fully taped seams, Commuter cut, Waterproof zipper",
              description: "Our Heavy jacket is made for days of persistent precipitation. Featuring industry leading C-Change technology, the jacket is fully wind and waterproof, but maintains breathability thanks to the fabric ability to react to prevailing conditions, balancing out temperature and body moisture, to keep you warm and dry.",
              price: 60, category_id: jackets.id)
the_nimble = Product.create(name: "the nimble", details: "Swiss Fabric featuring C-Change technology, Fully taped seams, Athletic cut, Waterproof zipper, Light weight",
              description: "Our Nimble jacket is a fully waterproof, packable waterproof enabling riders to keep going, no matter the weather. Featuring industry leading C-Change technology, the jacket is fully wind and waterproof, but maintains breathability thanks to the fabric ability to react to prevailing conditions, balancing out temperature and body moisture, to keep you warm and dry.",
              price: 60, category_id: jackets.id)
gilet = Product.create(name: "gilet", details: "Swiss Fabric featuring 3xDry technology, High cut perfect for cycling, Accommodating rear pockets, Reflective detailing, Expansion zips, enables wearing over jersey on the go",
              description: "Our Gilet is made from a Swiss designed fabric that works to keep you dry and warm on, wicking away perspiration, wind and water repellent and quick drying.",
              price: 60, category_id: jackets.id)
the_commute = Product.create(name: "the commute", details: "Danish fabric, Merino wool based blend, Athletic cut, Button down collar, Mother of pearl buttons",
              description: "Our Commute shirt is a technical shirt that does not compromise on fit or style. The merino perform fabric used in the Commute benefits from the breathability and body temperature regulation of merino wool, while benefiting from the strength and resilience of a synthetic fabric.",
              price: 60, category_id: shirts.id)
lounge = Product.create(name: "lounge", details: "Portuguese fabric, 80% Cotton 20% Wool, Single chest pocket, Pearl buttons",
              description: "Our Lounge shirt in three timeless pastel colours. Produced in a piece dyed wool cotton fabric, the shirt features a buttoned down collar, a single chest pocket, curved hem and mother of pearl buttons.",
              price: 60, category_id: shirts.id)
classic = Product.create(name: "classic", details: "Italian fabrics, Male specific ergonomic fit, Highest quality high density road performance pad, Breathable mesh body construction",
              description: "An all round workhorse, the classic bib will see you through long training rides in comfort and style. Features include: mesh top, road performance pad, flattened shoulder.",
              price: 60, category_id: bottoms.id)
arm_warmers = Product.create(name: "arm warmers", details: "Brushed interior for warmth, Silicon gripper on hem to stop slippage, Classic styling",
              description: "Our Arm Warmers are perfect for days where the temperature demands optionality in your apparel.  Providing insulation from their brushed interior while breathable and anti-UV they are the perfect cycling add-on for all weather conditions.",
              price: 60, category_id: accessories.id)
classic_tee = Product.create(name: "classic tee", details: "High quality combed Egyptian cotton, Straight hem, Relaxed fit",
              description: "The men’s white Classic Tee is a wardrobe essential; versatile and timeless. It is perfect for a clean, crisp look – and we’re confident that once you try one, it’ll quickly become your go-to plain white t-shirt",
              price: 60, category_id: baselayers.id)
# the_base= Product.create(name: "the base", details: "100% merino wool, Flat-lock seams for comfort, Ride specific cut",
