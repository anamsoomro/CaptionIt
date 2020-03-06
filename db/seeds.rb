
Comic.destroy_all
User.destroy_all
Topic.destroy_all
ComicTopic.destroy_all
Caption.destroy_all

# suckr = ImageSuckr::GoogleSuckr.new



# AnamS = User.create(username: "AnamS", password: "abc")
# BlakeG = User.create(username: "BlakeG", password: "abc")
# PlacidoW = User.create(username: "PlacidoW", password: "abc")
# GianM = User.create(username: "GianM", password: "abc")
# PaulH = User.create(username: "PaulH", password: "abc")
# MitchellA = User.create(username: "MitchellA", password: "abc")
# VidhiS = User.create(username: "VidhiS", password: "abc")
# StevenN = User.create(username: "StevenN", password: "abc")

20.times do 
  User.create(username: "#{Faker::Color.color_name}#{Faker::Dessert.variety}".delete(" "), password: "abc")
end
User.create(username: "BlakeG", password: "abc")
User.create(username: "AnamS", password: "abc")


satire = Topic.create(label: "Satire" )
politics = Topic.create(label: "Politics" )
popculture = Topic.create(label: "Pop culture" )
animals = Topic.create(label: "Animals" )
tech = Topic.create(label: "Technology" )
memes = Topic.create(label: "Memes" )
dogs = Topic.create(label: "Dogs" )
cats = Topic.create(label: "Cats" )
aww = Topic.create(label: "Aww" )
cars = Topic.create(label: "Cars" )
sports = Topic.create(label: "Sports" )
music = Topic.create(label: "Music" )
food = Topic.create(label: "Food" )

def text 
  case Array(1..4).sample 
  when 1 
    Faker::Quote.most_interesting_man_in_the_world
  when 2
    Faker::Quote.yoda
  when 3
    Faker::Quote.matz
  when 4
    Faker::Quote.singular_siegler
  end
end


def seedIt (url, topics)
  # user_id = Array(User.first.id..User.last.id).sample
  # likes = Array(1..10).sample
  a = Comic.create(image_url: url, user_id: u_id)
  topics.each do |topic| 
    ComicTopic.create(comic_id: a.id, topic_id: topic.id)
  end 
  Array(1..4).sample.times do 
    Caption.create(text: text, user_id: u_id , comic_id: a.id, likes: num_likes)
  end

end

def u_id 
  Array(User.first.id..User.last.id).sample
end

def num_likes
  likes = Array(1..10).sample
end

# "https://giphy.com/gifs/brooklynninenine-1gRUSigghV"

# "https://giphy.com/gifs/richard-ayoade-it-crowd-ma"

# "https://giphy.com/gifs/eating-spongebob-squarepant"

seedIt("https://mymodernmet.com/wp/wp-content/uploads/archive/v9r0zDhCCVu3YJuKrEh1_pawelkuczynski2.jpg", [satire, popculture, tech])
seedIt("https://cdn.cnn.com/cnnnext/dam/assets/200228230410-don-lemon-ctn-dons-take-022819-large-169.jpg", [popculture])
seedIt("https://d.newsweek.com/en/full/607858/adsgads.jpg", [popculture])
seedIt("https://piximus.net/media/25784/when-celebrities-look-funny-11.jpg", [popculture])
seedIt("https://keyassets-p2.timeincuk.net/wp/prod/wp-content/uploads/sites/29/2015/01/PA-18937719.jpg", [popculture])
seedIt("https://i.insider.com/5c79b7e2eb3ce83af24c4403?width=1100&format=jpeg&auto=webp", [animals, memes])
seedIt("https://i.ytimg.com/vi/O5d1R7G3-wk/maxresdefault.jpg", [animals, cats])
seedIt("https://media.giphy.com/media/21GCae4djDWtP5soiY/giphy.gif", [dogs, aww, memes])
seedIt("https://media.giphy.com/media/B2vBunhgt9Pc4/giphy.gif", [dogs, aww, memes])
seedIt("https://www.101soundboards.com/storage/board_pictures/11091.jpg?c=1570385616", [memes, popculture])
seedIt("https://assets3.thrillist.com/v1/image/2739525/size/gn-gift_guide_variable_c.jpg", [sports])
seedIt("https://images.unsplash.com/photo-1523567353-71ea31cb9f73?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60", [dogs, aww])
seedIt("https://images.unsplash.com/photo-1559305035-72f285d2528e?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60", [cats, aww])
seedIt("https://images.unsplash.com/photo-1525785967371-87ba44b3e6cf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", [cats, aww])
seedIt("https://www.shearcomfort.com/blog/wp-content/uploads/7.-Funny-GIF-with-Dog.gif", [dogs, aww, cars])
seedIt("https://i.kym-cdn.com/photos/images/original/000/655/565/910.gif", [cars])
seedIt("https://i.insider.com/5dd7f73efd9db269c1036f38?width=1100&format=jpeg&auto=webp", [tech, cars])
seedIt("https://media.giphy.com/media/9Pk6tjP4BNXmxkOJE7/giphy.gif", [popculture])
# seedIt("https://giphy.com/gifs/brooklynninenine-1gRUSigghVkA0vztfc", [popculture])
seedIt("https://i.kym-cdn.com/entries/icons/facebook/000/029/229/JG0z00q.jpg", [food])
seedIt("https://i.insider.com/5970c122c50c298d088b5692?width=655&format=jpeg", [memes])
# seedIt("https://giphy.com/gifs/richard-ayoade-it-crowd-maurice-moss-dbtDDSvWErdf2", [tech])
seedIt("https://media1.giphy.com/media/a8RO6kWdcjVp6/source.gif", [tech])
seedIt("https://media.giphy.com/media/qBOPYoHONzzB6/giphy.gif", [popculture])
seedIt("https://toledolibrary.s3.amazonaws.com/uploads/images/blog/_large/ostrich-satire-farce.jpg", [animals])
seedIt("https://66.media.tumblr.com/e40456cfe435596ea2dc8975ca11ddfc/tumblr_ps7brsQSni1w1cbm3_540.jpg", [popculture])
seedIt("https://media1.tenor.com/images/a9e748c8abfd91685d21e2a2c5fba7b2/tenor.gif?itemid=8617355", [popculture])
seedIt("https://media.giphy.com/media/HteV6g0QTNxp6/giphy.gif", [tech])
seedIt("https://media.giphy.com/media/oShObTfbg3S5G/giphy.gif", [sports])
seedIt("https://assets-auto.rbl.ms/0e6efc9c6e56b23c997e12adca051248fbd24cc289f3746f1aedff30219a35f4", [politics])
seedIt("https://media0.giphy.com/media/pGByhItRP8lpe/source.gif", [politics])
seedIt("https://media.giphy.com/media/12uXi1GXBibALC/giphy.gif", [food, popculture])
seedIt("data:image/jpeg;base64,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", [food])
seedIt("https://media.giphy.com/media/qTd24wzmpiyis/giphy.gif", [food, aww, dogs])
# seedIt("https://giphy.com/gifs/eating-spongebob-squarepants-patrick-K4x1ZL36xWCf6", [food, popculture])





# Comic.create(image_url: "https://i1.wp.com/thanetwriters.com/wp-content/uploads/five-things-you-should-know-about-writing-satire.jpg?fit=1000%2C300&ssl=1", user_id: User.first.id)
# Comic.create(image_url: "https://www.irishtimes.com/polopoly_fs/1.3751286.1546956007!/image/image.jpg_gen/derivatives/ratio_1x1_w1200/image.jpg", user_id: User.first.id)
# Comic.create(image_url: "https://cdn.cnn.com/cnnnext/dam/assets/200228230410-don-lemon-ctn-dons-take-022819-large-169.jpg", user_id: User.first.id)
# Comic.create(image_url: "data:image/jpeg;base64,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", user_id: User.second.id)
# Comic.create(image_url: "https://d.newsweek.com/en/full/607858/adsgads.jpg", user_id: User.second.id)
# Comic.create(image_url: "https://piximus.net/media/25784/when-celebrities-look-funny-11.jpg", user_id: User.first.id)
# Comic.create(image_url: "https://keyassets-p2.timeincuk.net/wp/prod/wp-content/uploads/sites/29/2015/01/PA-18937719.jpg", user_id: User.third.id)
# Comic.create(image_url: "https://www.google.com/search?q=celebrities+funny&tbm=isch&ved=2ahUKEwjridGH2fznAhUC_qwKHWaAAtkQ2-cCegQIABAA&oq=celebrities+funny&gs_l=img.3..0l10.5391.6094..6322...0.0..0.63.334.6......0....1..gws-wiz-img.......0i67.plgob9EYcDw&ei=a3VdXquoMYL8swXmgIrIDQ&bih=821&biw=1440&rlz=1C5CHFA_enUS867US867#imgrc=fVq7RSDkC87sNM", user_id: User.first.id)
# Comic.create(image_url: "https://i.insider.com/5c79b7e2eb3ce83af24c4403?width=1100&format=jpeg&auto=webp", user_id: User.fourth.id)
# Comic.create(image_url: "https://i.ytimg.com/vi/O5d1R7G3-wk/maxresdefault.jpg", user_id: User.first.id)
# Comic.create(image_url: "https://friendlystock.com/wp-content/uploads/2018/03/2-angry-woman-smashing-computer-cartoon-clipart.jpg", user_id: User.first.id)
# Comic.create(image_url: "https://i.insider.com/5d7179ca2e22af16b05e2a75?width=1100&format=jpeg&auto=webp", user_id: User.first.id)
# Comic.create(image_url: "https://img1.grunge.com/img/gallery/secret-code-words-that-no-one-is-supposed-to-know/intro-1554929306.jpg", user_id: User.second.id)

# ComicTopic.create(comic_id: Comic.first.id, topic_id: Topic.first.id)
# ComicTopic.create(comic_id: Comic.first.id, topic_id: Topic.second.id)
# ComicTopic.create(comic_id: Comic.first.id, topic_id: Topic.fourth.id)


# ComicTopic.create(comic_id: Comic.second.id, topic_id: Topic.third.id)
# ComicTopic.create(comic_id: Comic.second.id, topic_id: Topic.second.id)
# ComicTopic.create(comic_id: Comic.second.id, topic_id: Topic.first.id)

# ComicTopic.create(comic_id: Comic.third.id, topic_id: Topic.third.id)
# ComicTopic.create(comic_id: Comic.third.id, topic_id: Topic.second.id)
# ComicTopic.create(comic_id: Comic.third.id, topic_id: Topic.fourth.id)

# ComicTopic.create(comic_id: Comic.second.id, topic_id: Topic.first.id)
# ComicTopic.create(comic_id: Comic.second.id, topic_id: Topic.fourth.id)

# ComicTopic.create(comic_id: Comic.fourth.id, topic_id: Topic.third.id)
# ComicTopic.create(comic_id: Comic.fourth.id, topic_id: Topic.first.id)
# ComicTopic.create(comic_id: Comic.fourth.id, topic_id: Topic.second.id)


# Caption.create(text: Faker::Quote.most_interesting_man_in_the_world, user_id: User.first.id, comic_id: Comic.second.id, likes: 10)
# Caption.create(text: Faker::Quote.matz, user_id: User.first.id, comic_id: Comic.first.id, likes: 5)
# Caption.create(text: Faker::Quote.most_interesting_man_in_the_world, user_id: User.fifth.id, comic_id: Comic.fifth.id, likes: 4)
# Caption.create(text: Faker::Quote.singular_siegler, user_id: User.fourth.id, comic_id: Comic.second.id, likes: 8)
# Caption.create(text: Faker::Quote.yoda, user_id: User.first.id, comic_id: Comic.third.id, likes: 3)
# Caption.create(text: Faker::Quote.yoda, user_id: User.fifth.id, comic_id: Comic.third.id, likes: 1)
# Caption.create(text: Faker::Quote.yoda, user_id: User.first.id, comic_id: Comic.first.id, likes: 1)
# Caption.create(text: Faker::Quote.yoda, user_id: User.fifth.id, comic_id: Comic.third.id, likes: 9)
# Caption.create(text: Faker::Quote.yoda, user_id: User.second.id, comic_id: Comic.first.id, likes: 1)
# Caption.create(text: Faker::Quote.most_interesting_man_in_the_world, user_id: User.last.id, comic_id: Comic.last.id, likes: 10)
# Caption.create(text: Faker::Quote.most_interesting_man_in_the_world, user_id: User.second.id, comic_id: Comic.last.id, likes: 2)
# Caption.create(text: Faker::Quote.most_interesting_man_in_the_world, user_id: User.last.id, comic_id: Comic.second.id, likes: 1)



















