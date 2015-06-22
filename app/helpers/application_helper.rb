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

	def favorite_counter
		0
    User.find( current_user ).wishlist_items.count if user_signed_in?
	end

	def favorite_list
    if favorite_counter > 0
     	@favitems = User.find( current_user ).wishlist_items
    else
    	@favitems = ''
    end
  end

  def favorite_total_price
	   total_price = 0
     if favorite_counter > 0
       favorite_list
       @favitems.each do |item|
        total_price += item.article.price
       end
     end
     number_with_delimiter(total_price, :delimiter => ',')

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

