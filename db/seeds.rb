puts "Destroying existing seeds"

Bottle.destroy_all
User.destroy_all

puts "Creating users..."

francois = User.create!(
  first_name: 'Francois',
  last_name: 'Dumas',
  email: 'dumas.francois@lewagon.fr',
  password: '123456',
  role: "admin"
)

file = URI.open("https://avatars.githubusercontent.com/u/33062224")
francois.photo.attach(io: file, filename: "profile.jpeg", content_type: "image/jpeg")
francois.save

puts "Creating bottles..."

menetou_salon = Bottle.create!(
  name: '',
  country: 'France',
  region: 'Loire',
  appelation: 'Menetou-Salon',
  domaine_name: 'Cellier du Monastère',
  producer: 'Chavet',
  color: 'blanc',
  year: 2018,
  user: francois
)

file = File.open(Rails.root.join('db/seeds/menetou_salon_chavet.jpeg'))
menetou_salon.photo.attach(io: file, filename: "label.jpeg", content_type: "image/jpeg")
menetou_salon.save

sancerre = Bottle.create!(
  name:'',
  country: 'France',
  region: 'Loire',
  appelation: 'Sancerre',
  domaine_name: 'Jérôme Godon',
  producer: 'Jérôme Godon',
  color: 'blanc',
  year: 2021,
  user: francois
)

file = File.open(Rails.root.join('db/seeds/sancerre.jpeg'))
sancerre.photo.attach(io: file, filename: "label.jpeg", content_type: "image/jpeg")
sancerre.save

quincy = Bottle.create!(
  name: '',
  country: 'France',
  region: 'Loire',
  appelation: 'Quincy',
  domaine_name: 'Jacques Rouzé',
  producer: 'Jacques Rouzé',
  color: 'blanc',
  year: 2018,
  user: francois
)

file = File.open(Rails.root.join('db/seeds/quincy.jpeg'))
quincy.photo.attach(io: file, filename: "label.jpeg", content_type: "image/jpeg")
quincy.save

pouilly_fume = Bottle.create!(
  name: 'Cuvée des Acoins',
  country: 'France',
  region: 'Loire',
  appelation: 'Pouilly-Fumé',
  domaine_name: 'Bel Air',
  producer: 'Mauroy Gauliez',
  color: 'blanc',
  year: 2015,
  user: francois
)

file = File.open(Rails.root.join('db/seeds/pouilly_fume.jpeg'))
pouilly_fume.photo.attach(io: file, filename: "label.jpeg", content_type: "image/jpeg")
pouilly_fume.save
