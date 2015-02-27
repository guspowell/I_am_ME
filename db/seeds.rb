# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

Event.create(name: "Taylor Swift", location: "Roundhouse", date: Date.new(2015, 3, 3),
             image_file_name: 'http://www.billboard.com/files/styles/promo_650/public/media/taylor-swift-2014-sarah-barlow-billboard-650.jpg')
Event.create(name: 'Beyonce', location: 'Makers Academy', date: Date.new(2015, 3, 4),
             image_file_name: 'https://pbs.twimg.com/profile_images/378800000825366505/ee5752df616efa87ee76f1db873670ca.jpeg')
Event.create(name: 'Bjork', location: 'The Gherkin', date: Date.new(2015, 3, 4),
             image_file_name: 'http://res.artnet.com/news-upload/2015/01/Bjork_vijesti-me.jpg')

