# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

News.create([
  { title: "Rails API Now Live!", description: "Our API is fully functional and serving data.", image_url: "https://source.unsplash.com/random/800x400?technology" },
  { title: "React Frontend Connected", description: "The frontend is successfully fetching data from Rails.", image_url: "https://source.unsplash.com/random/800x400?coding" },
  { title: "Full Stack Dev on the Rise", description: "More developers are mastering full-stack development with Rails and React.", image_url: "https://source.unsplash.com/random/800x400?developer" }
])

