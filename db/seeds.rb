Comic.destroy_all
User.destroy_all
Topic.destroy_all
ComicTopic.destroy_all
Caption.destroy_all

# suckr = ImageSuckr::GoogleSuckr.new



  User.create(username: "AnamS", password: "abc")
  User.create(username: "BlakeG", password: "abc")
  User.create(username: "PlacidoW", password: "abc")
  User.create(username: "GianM", password: "abc")
  User.create(username: "PaulH", password: "abc")
  User.create(username: "MitchellA", password: "abc")
  User.create(username: "VidhiS", password: "abc")
  User.create(username: "StevenN", password: "abc")



Topic.create(label: "satire" )
Topic.create(label: "politics" )
Topic.create(label: "grim" )
Topic.create(label: "pop culture" )
Topic.create(label: "animals" )
Topic.create(label: "technology" )
Topic.create(label: "memes" )
Topic.create(label: "dogs" )
Topic.create(label: "cats" )




# Comic.create(image_url: suckr.get_image_url({"q" => "satire"}), user_id: User.first.id)
# Comic.create(image_url: RandomImages::Image.get("satire", "any"), user_id: User.first.id)
Comic.create(image_url: "https://mymodernmet.com/wp/wp-content/uploads/archive/v9r0zDhCCVu3YJuKrEh1_pawelkuczynski2.jpg", user_id: User.fifth.id)
Comic.create(image_url: "https://i1.wp.com/thanetwriters.com/wp-content/uploads/five-things-you-should-know-about-writing-satire.jpg?fit=1000%2C300&ssl=1", user_id: User.first.id)
Comic.create(image_url: "https://www.irishtimes.com/polopoly_fs/1.3751286.1546956007!/image/image.jpg_gen/derivatives/ratio_1x1_w1200/image.jpg", user_id: User.first.id)
Comic.create(image_url: "https://cdn.cnn.com/cnnnext/dam/assets/200228230410-don-lemon-ctn-dons-take-022819-large-169.jpg", user_id: User.first.id)
Comic.create(image_url: "data:image/jpeg;base64,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", user_id: User.second.id)
Comic.create(image_url: "https://d.newsweek.com/en/full/607858/adsgads.jpg", user_id: User.second.id)
Comic.create(image_url: "https://piximus.net/media/25784/when-celebrities-look-funny-11.jpg", user_id: User.first.id)
Comic.create(image_url: "https://keyassets-p2.timeincuk.net/wp/prod/wp-content/uploads/sites/29/2015/01/PA-18937719.jpg", user_id: User.third.id)
Comic.create(image_url: "https://www.google.com/search?q=celebrities+funny&tbm=isch&ved=2ahUKEwjridGH2fznAhUC_qwKHWaAAtkQ2-cCegQIABAA&oq=celebrities+funny&gs_l=img.3..0l10.5391.6094..6322...0.0..0.63.334.6......0....1..gws-wiz-img.......0i67.plgob9EYcDw&ei=a3VdXquoMYL8swXmgIrIDQ&bih=821&biw=1440&rlz=1C5CHFA_enUS867US867#imgrc=fVq7RSDkC87sNM", user_id: User.first.id)
Comic.create(image_url: "https://i.insider.com/5c79b7e2eb3ce83af24c4403?width=1100&format=jpeg&auto=webp", user_id: User.fourth.id)
Comic.create(image_url: "https://i.ytimg.com/vi/O5d1R7G3-wk/maxresdefault.jpg", user_id: User.first.id)
Comic.create(image_url: "https://friendlystock.com/wp-content/uploads/2018/03/2-angry-woman-smashing-computer-cartoon-clipart.jpg", user_id: User.first.id)
Comic.create(image_url: "https://i.insider.com/5d7179ca2e22af16b05e2a75?width=1100&format=jpeg&auto=webp", user_id: User.first.id)
Comic.create(image_url: "https://img1.grunge.com/img/gallery/secret-code-words-that-no-one-is-supposed-to-know/intro-1554929306.jpg", user_id: User.second.id)

ComicTopic.create(comic_id: Comic.first.id, topic_id: Topic.first.id)
ComicTopic.create(comic_id: Comic.first.id, topic_id: Topic.second.id)
ComicTopic.create(comic_id: Comic.first.id, topic_id: Topic.fourth.id)


ComicTopic.create(comic_id: Comic.second.id, topic_id: Topic.third.id)
ComicTopic.create(comic_id: Comic.second.id, topic_id: Topic.second.id)
ComicTopic.create(comic_id: Comic.second.id, topic_id: Topic.first.id)

ComicTopic.create(comic_id: Comic.third.id, topic_id: Topic.third.id)
ComicTopic.create(comic_id: Comic.third.id, topic_id: Topic.second.id)
ComicTopic.create(comic_id: Comic.third.id, topic_id: Topic.fourth.id)

ComicTopic.create(comic_id: Comic.second.id, topic_id: Topic.first.id)
ComicTopic.create(comic_id: Comic.second.id, topic_id: Topic.fourth.id)

ComicTopic.create(comic_id: Comic.fourth.id, topic_id: Topic.third.id)
ComicTopic.create(comic_id: Comic.fourth.id, topic_id: Topic.first.id)
ComicTopic.create(comic_id: Comic.fourth.id, topic_id: Topic.second.id)


Caption.create(text: Faker::Quote.most_interesting_man_in_the_world, user_id: User.first.id, comic_id: Comic.second.id, likes: 10)
Caption.create(text: Faker::Quote.matz, user_id: User.first.id, comic_id: Comic.first.id, likes: 5)
Caption.create(text: Faker::Quote.most_interesting_man_in_the_world, user_id: User.fifth.id, comic_id: Comic.fifth.id, likes: 4)
Caption.create(text: Faker::Quote.singular_siegler, user_id: User.fourth.id, comic_id: Comic.second.id, likes: 8)
Caption.create(text: Faker::Quote.yoda, user_id: User.first.id, comic_id: Comic.third.id, likes: 3)
Caption.create(text: Faker::Quote.yoda, user_id: User.fifth.id, comic_id: Comic.third.id, likes: 1)
Caption.create(text: Faker::Quote.yoda, user_id: User.first.id, comic_id: Comic.first.id, likes: 1)
Caption.create(text: Faker::Quote.yoda, user_id: User.fifth.id, comic_id: Comic.third.id, likes: 9)
Caption.create(text: Faker::Quote.yoda, user_id: User.second.id, comic_id: Comic.first.id, likes: 1)
Caption.create(text: Faker::Quote.most_interesting_man_in_the_world, user_id: User.last.id, comic_id: Comic.last.id, likes: 10)
Caption.create(text: Faker::Quote.most_interesting_man_in_the_world, user_id: User.second.id, comic_id: Comic.last.id, likes: 2)
Caption.create(text: Faker::Quote.most_interesting_man_in_the_world, user_id: User.last.id, comic_id: Comic.second.id, likes: 1)



















