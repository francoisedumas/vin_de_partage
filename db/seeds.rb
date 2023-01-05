puts "Destroying existing seeds"

Bottle.destroy_all
Producer.destroy_all
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
  region: 'loire',
  appelation: 'Menetou-Salon',
  domaine_name: 'Cellier du Monastère',
  producer: 'Chavet',
  color: 'white',
  year: 2018,
  user: francois
)

file = File.open(Rails.root.join('db/seeds/menetou_salon_chavet.jpeg'))
menetou_salon.photo.attach(io: file, filename: "label.jpeg", content_type: "image/jpeg")
menetou_salon.save

sancerre = Bottle.create!(
  name:'',
  country: 'France',
  region: 'loire',
  appelation: 'Sancerre',
  domaine_name: 'Jérôme Godon',
  producer: 'Jérôme Godon',
  color: 'white',
  year: 2021,
  user: francois
)

file = File.open(Rails.root.join('db/seeds/sancerre.jpeg'))
sancerre.photo.attach(io: file, filename: "label.jpeg", content_type: "image/jpeg")
sancerre.save

quincy = Bottle.create!(
  name: '',
  country: 'France',
  region: 'loire',
  appelation: 'Quincy',
  domaine_name: 'Jacques Rouzé',
  producer: 'Jacques Rouzé',
  color: 'white',
  year: 2018,
  user: francois
)

file = File.open(Rails.root.join('db/seeds/quincy.jpeg'))
quincy.photo.attach(io: file, filename: "label.jpeg", content_type: "image/jpeg")
quincy.save

pouilly_fume = Bottle.create!(
  name: 'Cuvée des Acoins',
  country: 'France',
  region: 'loire',
  appelation: 'Pouilly-Fumé',
  domaine_name: 'Bel Air',
  producer: 'Mauroy Gauliez',
  color: 'white',
  year: 2015,
  user: francois
)

file = File.open(Rails.root.join('db/seeds/pouilly_fume.jpeg'))
pouilly_fume.photo.attach(io: file, filename: "label.jpeg", content_type: "image/jpeg")
pouilly_fume.save

chinon = Bottle.create!(
  name: '',
  country: 'France',
  region: 'loire',
  appelation: 'Chinon',
  domaine_name: 'Château de Naie',
  producer: 'Charles Pain',
  color: 'red',
  year: 2018,
  user: francois
)

puts "Creating producers..."

charles_pain = Producer.create(
  name: 'Charles Pain',
  domaine_name: 'Château de Naie',
  region: 'loire',
  address: '12 Rue de Chezelet, 37220 Panzoult'
)
