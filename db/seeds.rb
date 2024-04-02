# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
%w(a b c piquant supply greasy bright plug intend abiding fry temper club remember unusual writer grin slim business best jar bury skip beef bite-sized gate flimsy spill standing flight repulsive thunder channel destruction happy basket curved mend perfect button squalid bear hanging structure tow irate heavenly ugly work boiling overjoyed depressed insurance rose cellar protest faithful female talk ragged verse protect cloistered month nest mint babies cry authority numberless automatic quarrelsome spray hideous ray edge pretty educated unruly green shaggy attraction pour snakes overconfident thread gaze wrathful snails lumpy optimal premium mask kiss nerve slippery plain fruit place hurried cheat bucket plot).each do |user_name|
  User.create(email: user_name+"@gmail.com", password: 'test123')
end