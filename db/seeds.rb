require_relative("../models/content")
require_relative("../models/user")
require_relative("../models/rentals")

Rental.delete_all
User.delete_all
Content.delete_all

content1 = Content.new({'title' => 'Geralds Game', 'type' => 'Movie', 'cost' => 2, 'watch' => 'src="https://www.youtube.com/embed/twbGU2CqqQU"'})
content2 = Content.new({'title' => 'To All the Boys Ive Loved Before', 'type' => 'Movie', 'cost' => 2, 'watch' => 'src="https://www.youtube.com/embed/555oiY9RWM4"'})
content3 = Content.new({'title' => 'Love, Death and Robots', 'type' => 'Series', 'cost' => 4, 'watch' => 'src="https://www.youtube.com/embed/wUFwunMKa4E"'})
content4 = Content.new({'title' => 'The Umbrella Academy', 'type' => 'Series', 'cost' => 4, 'watch' => 'src="https://www.youtube.com/embed/0DAmWHxeoKw"'})
content5 = Content.new({'title' => 'John Mulaney: Comeback Kid', 'type' => 'Special', 'cost' => 1, 'watch' => 'src="https://www.youtube.com/embed/63RcymipKuY"'})
content6 = Content.new({'title' => 'The Only Living Boy in New York', 'type' => 'Movie', 'cost' => 2, 'watch' => 'src="https://www.youtube.com/embed/qwLphqOs4vA"'})
content7 = Content.new({'title' => 'American Gods', 'type' => 'Series', 'cost' => 4, 'watch' => 'src="https://www.youtube.com/embed/z6HLeNl8DOs"'})
content8 = Content.new({'title' => 'Vikings', 'type' => 'Series', 'cost' => 4, 'watch' => 'src="https://www.youtube.com/embed/8dGCvJkzQSE"'})
content9 = Content.new({'title' => 'The Handmaids Tale', 'type' => 'Series', 'cost' => 4, 'watch' => 'src="https://www.youtube.com/embed/SAXy_NyUN6k"'})
content10 = Content.new({'title' => 'Fyre Fraud', 'type' => 'Special', 'cost' => 1, 'watch' => 'src="https://www.youtube.com/embed/ljkaq_he-BU"'})
content11 = Content.new({'title' => 'Lazer Team', 'type' => 'Movie', 'cost' => 2, 'watch' => 'src="https://www.youtube.com/embed/TI455Z37o30"'})
content12 = Content.new({'title' => 'Day 5', 'type' => 'Series', 'cost' => 4, 'watch' => 'src="https://www.youtube.com/embed/Qkm2qdUuXcA"'})
content13 = Content.new({'title' => 'The Worlds Greatest Head Message: An ASMR Journey', 'type' => 'Special', 'cost' => 1, 'watch' => 'src="https://www.youtube.com/embed/qjdqF2F_X-U"'})
content14 = Content.new({'title' => 'Young Justice', 'type' => 'Series', 'cost' => 4, 'watch' => 'src="https://www.youtube.com/embed/R0tVBhBg9Jo"'})
content15 = Content.new({'title' => 'Wonder Woman', 'type' => 'Movie', 'cost' => 3, 'watch' => 'src="https://www.youtube.com/embed/1Q8fG0TtVAY"'})
content16 = Content.new({'title' => 'Titans', 'type' => 'Series', 'cost' => 0, 'watch' => 'src="https://www.youtube.com/embed/9xIZoih_DaE"'})
content17 = Content.new({'title' => 'Dance Camp', 'type' => 'Movie', 'cost' => 1, 'watch' => 'src="https://www.youtube.com/embed/a_qicbmrEMU"'})
content18 = Content.new({'title' => 'Game Lab', 'type' => 'Series', 'cost' => 1, 'watch' => 'src="https://www.youtube.com/embed/gx1n9yv6oXY"'})
content19 = Content.new({'title' => 'Total Forgiveness', 'type' => 'Series', 'cost' => 2, 'watch' => 'src="https://www.youtube.com/embed/b9RoQvbKw7Q"'})
content20 = Content.new({'title' => 'Ummm... Actually', 'type' => 'Series', 'cost' => 2, 'watch' => 'src="https://www.youtube.com/embed/Hpr57s-oil4"'})

content1.save
content2.save
content3.save
content4.save
content5.save
content6.save
content7.save
content8.save
content9.save
content10.save
content11.save
content12.save
content13.save
content14.save
content15.save
content16.save
content17.save
content18.save
content19.save
content20.save

user1 = User.new({'user_name' => 'Alasdair', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user2 = User.new({'user_name' => 'Amy', 'wallet' => 100, 'profile_pic' => '/default/jpg'})
user3 = User.new({'user_name' => 'Annabel', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user4 = User.new({'user_name' => 'Becky', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user5 = User.new({'user_name' => 'Ben', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user6 = User.new({'user_name' => 'Charlie', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user7 = User.new({'user_name' => 'Colin', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user8 = User.new({'user_name' => 'Eric', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user9 = User.new({'user_name' => 'Grant', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user10 = User.new({'user_name' => 'Jarrod', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user11 = User.new({'user_name' => 'Jen', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user12 = User.new({'user_name' => 'Jon', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user13 = User.new({'user_name' => 'Juan', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user14 = User.new({'user_name' => 'Pim', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user15 = User.new({'user_name' => 'Katharina', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user16 = User.new({'user_name' => 'Lidia', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user17 = User.new({'user_name' => 'Maria', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user18 = User.new({'user_name' => 'Mark', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user19 = User.new({'user_name' => 'Matt', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user20 = User.new({'user_name' => 'Myriam', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user21 = User.new({'user_name' => 'Pawel', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user22 = User.new({'user_name' => 'Rob', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user23 = User.new({'user_name' => 'Rory', 'wallet' => 100, 'profile_pic' => '/default.jpg'})
user24 = User.new({'user_name' => 'Stephen', 'wallet' => 100, 'profile_pic' => '/default.jpg'})

user1.save
user2.save
user3.save
user4.save
user5.save
user6.save
user7.save
user8.save
user9.save
user10.save
user11.save
user12.save
user13.save
user14.save
user15.save
user16.save
user17.save
user18.save
user19.save
user20.save
user21.save
user22.save
user23.save
user24.save

rental1 = Rental.new({
  "user_id" => user1.id,
  "content_id" => content1.id,
  "start_date" => "2019-03-11",
  "end_date" => "2019-03-30",
  })

  rental2 = Rental.new({
    "user_id" => user9.id,
    "content_id" => content15.id,
    "start_date" => "2019-03-12",
    "end_date" => "2019-03-26",
    })

    rental3 = Rental.new({
      "user_id" => user9.id,
      "content_id" => content15.id,
      "start_date" => "2019-03-27",
      "end_date" => "2019-03-30",
      })

      rental4 = Rental.new({
        "user_id" => user20.id,
        "content_id" => content18.id,
        "start_date" => "2019-03-19",
        "end_date" => "2019-03-20",
        })

        rental1.save
        rental2.save
        rental3.save
        rental4.save
