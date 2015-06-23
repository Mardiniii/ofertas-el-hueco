# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# SCRIPT PARA GENERAR N VECES COPIA DEL ULTIMO PRODUCTO CON SUS IMAGENES
# UNCOMMENT AND ENJOY KAIZEN DEVS
# 10.times do |article|
#   a = Article.last.dup
#   a.id = Article.last.id+1
#   Article.last.article_images.each do |ai|
#     image = ai.dup
#     image.id = ArticleImage.last.id+1
#     image.article_id = a.id
#     image.image = ai.image
#     image.save
#   end
#   a.save
# end
