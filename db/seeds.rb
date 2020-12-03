# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "Cleaning database..."
Ad.destroy_all
puts "Adding Ads to the DB"

Ad.create(
        title: 'salle de consultation à louer en mi-temps',
        address: '10 Quai Achille Lignon, 69006 Lyon',
        rent_cents:  345,
        published_at:  DateTime.strptime("03/12/2020 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img.leboncoin.fr/api/v1/tenants/9a6387a1-6259-4f2c-a887-7e67f23dd4cb/domains/20bda58f-d650-462e-a72a-a5a7ecf2bf88/buckets/24265337-e7cc-489d-80fc-0c564d62a63b/images/e9/42/44/e942449419972944e4650f1d67d90aad7e4cf4f4.jpg?rule=ad-large'
      )
Ad.create(
        title: 'A LOUER 1 ou 2 BUREAUX INDEPENDANTS FERMES',
        address: '2 Rue Amédée Bonnet, 69006 Lyon',
        rent_cents:  545,
        published_at:  DateTime.strptime("03/12/2020 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img.leboncoin.fr/api/v1/tenants/9a6387a1-6259-4f2c-a887-7e67f23dd4cb/domains/20bda58f-d650-462e-a72a-a5a7ecf2bf88/buckets/24265337-e7cc-489d-80fc-0c564d62a63b/images/b8/4a/58/b84a584c58e6b482753a3dce3b3d2f438d573324.jpg?rule=ad-large'
      )
Ad.create(
        title: 'Très beaux bureaux à louer Lyon 6 Foch',
        address: '30 Boulevard Anatole France, 69006 Lyon',
        rent_cents:  180,
        published_at:  DateTime.strptime("02/12/2020 18:05", "%m/%d/%Y %H:%M"),
        image_url: 'https://img.leboncoin.fr/api/v1/tenants/9a6387a1-6259-4f2c-a887-7e67f23dd4cb/domains/20bda58f-d650-462e-a72a-a5a7ecf2bf88/buckets/24265337-e7cc-489d-80fc-0c564d62a63b/images/ae/4e/ef/ae4eef800786530d5ecb7973e878e3db0ec4e554.jpg?rule=ad-large'
      )
Ad.create(
        title: 'Local médical / paramédical',
        address: '5 Rue Antoine Barbier, 69006 Lyon',
        rent_cents:  332,
        published_at:  DateTime.strptime("01/10/2020 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img.leboncoin.fr/api/v1/tenants/9a6387a1-6259-4f2c-a887-7e67f23dd4cb/domains/20bda58f-d650-462e-a72a-a5a7ecf2bf88/buckets/24265337-e7cc-489d-80fc-0c564d62a63b/images/89/74/89/8974893b44610ca7592f33269b336122ec97f752.jpg?rule=ad-large'
      )
Ad.create(
        title: 'Bureau paramédical Lyon6 parking',
        address: '15 Rue Antoine Remond, 69006 Lyon',
        rent_cents:  905,
        published_at:  DateTime.strptime("03/12/2019 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img.leboncoin.fr/api/v1/tenants/9a6387a1-6259-4f2c-a887-7e67f23dd4cb/domains/20bda58f-d650-462e-a72a-a5a7ecf2bf88/buckets/24265337-e7cc-489d-80fc-0c564d62a63b/images/67/48/b5/6748b5b8edfd0dcd6f9fcea0e18fd5d83990fbd3.jpg?rule=ad-large'
      )
Ad.create(
        title: 'Cabinet médical / paramédical',
        address: '12 Rue Baraban, 69006 Lyon',
        rent_cents:  980,
        published_at:  DateTime.strptime("03/12/2020 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img.leboncoin.fr/api/v1/tenants/9a6387a1-6259-4f2c-a887-7e67f23dd4cb/domains/20bda58f-d650-462e-a72a-a5a7ecf2bf88/buckets/24265337-e7cc-489d-80fc-0c564d62a63b/images/21/59/77/21597772cd32a4f603a39de6e752c899f1841ea4.jpg?rule=ad-large'
      )
Ad.create(
        title: 'Partage cabinet Lyon 6ème',
        address: '1 Rue Barrême, 69006 Lyon',
        rent_cents:  720,
        published_at:  DateTime.strptime("03/12/2020 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img.leboncoin.fr/api/v1/tenants/9a6387a1-6259-4f2c-a887-7e67f23dd4cb/domains/20bda58f-d650-462e-a72a-a5a7ecf2bf88/buckets/24265337-e7cc-489d-80fc-0c564d62a63b/images/17/e6/e7/17e6e7a29568b6387f19cd2499e7f42fb281b132.jpg?rule=ad-large'
      )
Ad.create(
        title: 'Local 20 m² état neuf',
        address: '22 Rue du 24 Février 1848, 69003 Lyon',
        rent_cents:  500,
        published_at:  DateTime.strptime("03/12/2020 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img7.leboncoin.fr/ad-large/4a960bff859edf40b37292f1255ba8f227609024.jpg'
      )

Ad.create(
        title: 'Sous location cabinet 12 m2 temps partiel Lyon 6',
        address: '28 Rue de l\'Abbé Boisard, 69003 Lyon',
        rent_cents:  240,
        published_at:  DateTime.strptime("03/12/2020 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img5.leboncoin.fr/ad-large/f27220dfc950982ef1578ca7d00961d32d95fd96.jpg'
      )



Ad.create(
        title: 'Recherche associé ou locataire pour maison de santé',
        address: '3 Rue de l\'Abondance, 69003 Lyon',
        rent_cents:  402,
        published_at:  DateTime.strptime("03/12/2020 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img5.leboncoin.fr/ad-large/80722a8a68654013675c4169129b4e81edb60f36.jpg'
      )



Ad.create(
        title: 'Cabinet médical',
        address: '33 Rue Aimé Collomb, 69003 Lyon',
        rent_cents:  320,
        published_at:  DateTime.strptime("03/12/2020 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img.leboncoin.fr/api/v1/tenants/9a6387a1-6259-4f2c-a887-7e67f23dd4cb/domains/20bda58f-d650-462e-a72a-a5a7ecf2bf88/buckets/24265337-e7cc-489d-80fc-0c564d62a63b/images/00/04/b2/0004b2bbf868f674fb2be75683d20001ec070209.jpg?rule=ad-large'
      )



Ad.create(
        title: 'Cabinet Médical paramédical neuf',
        address: '17 Avenue des Acacias, 69003 Lyon',
        rent_cents:  940,
        published_at:  DateTime.strptime("03/12/2020 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img5.leboncoin.fr/ad-large/a1e839f959b704d6b771b2fe69a5cafa142dd1b4.jpg'
      )

Ad.create(
        title: 'Cabinet paramédical',
        address: '8 Avenue Esquirol, 69003 Lyon',
        rent_cents:  740,
        published_at:  DateTime.strptime("03/12/2020 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img7.leboncoin.fr/ad-large/061345410f593bec76237f8c8b230deb28533e90.jpg'
      )
Ad.create(
        title: 'Cabinet Médical paramédical neuf',
        address: 'rue Bara, 69003 Lyon',
        rent_cents:  990,
        published_at:  DateTime.strptime("03/12/2020 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img5.leboncoin.fr/ad-large/c3bd3d266b1aeb8b04db9f6fe0517bf291f583d9.jpg'
      )
Ad.create(
        title: 'Cabinet paramédical - centre Lyon',
        address: '11 Rue d\'Essling, 69003 Lyon',
        rent_cents:  640,
        published_at:  DateTime.strptime("03/12/2020 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img.leboncoin.fr/api/v1/tenants/9a6387a1-6259-4f2c-a887-7e67f23dd4cb/domains/20bda58f-d650-462e-a72a-a5a7ecf2bf88/buckets/24265337-e7cc-489d-80fc-0c564d62a63b/images/02/e6/b0/02e6b0f4606695053e8c2e4af99b626c7f718a37.jpg?rule=ad-large'
      )
Ad.create(
        title: 'Cabinet Médical paramédical ',
        address: '3 Rue de l\'Est, 69003 Lyon',
        rent_cents:  611,
        published_at:  DateTime.strptime("03/12/2020 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img.leboncoin.fr/api/v1/tenants/9a6387a1-6259-4f2c-a887-7e67f23dd4cb/domains/20bda58f-d650-462e-a72a-a5a7ecf2bf88/buckets/24265337-e7cc-489d-80fc-0c564d62a63b/images/a2/50/ef/a250efee71f25205643f9a876433d03c106e09a1.jpg?rule=ad-large'
      )
Ad.create(
        title: 'Cabinet Médical paramédical neuf Berthelot/ Perrache/ Jean Macé',
        address: '32 Rue Étienne Dolet, 69003 Lyon',
        rent_cents:  700,
        published_at:  DateTime.strptime("03/12/2020 12:50", "%m/%d/%Y %H:%M"),
        image_url: 'https://img6.leboncoin.fr/ad-large/d7eb24f3c542ca40ac9b8c20b91692e98ec92860.jpg'
      )
