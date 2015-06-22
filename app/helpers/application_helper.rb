module ApplicationHelper
	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end

	def link_to_add_article_images(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |article_image|
			render(association.to_s.singularize + "_form", article_image: article_image)
		end
		link_to(name, '#', class: "Add_field btn btn-warning", data: {id: id, fields: fields.gsub("\n","")})
	end

	def storehouse_categories(storehouse)
		category_hash = {}
		storehouse.articles.each do |article|
			if !category_hash.include?(article.subcategory.category)
				category_hash[article.subcategory.category] = [article.subcategory]
			else
				if !category_hash[article.subcategory.category].include?(article.subcategory)
					category_hash[article.subcategory.category].push(article.subcategory)
				end
			end
		end
		category_hash
	end

end
