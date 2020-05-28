require 'pry'
class RecipesController < ApplicationController

    get '/recipes' do
        if is_logged_in?
            @user = current_user
            @recipes = Recipe.all
            erb :'recipes/recipes'
        else
            redirect '/login'
        end
    end

    get '/recipes/new' do
        if is_logged_in?
            @user = current_user
            erb :'recipes/create_recipe'
        else
            redirect '/login'
        end
    end

    post '/recipes' do
        @user = current_user
        if !params[:content].empty?
            @recipe = Recipe.create(:name=>params[:name], :content=>params[:content], user: @user)
            @user.recipes << @recipe
            @user.save
            redirect to "/recipes"
        else
            redirect to 'recipes/new'
        end
    end

    get '/recipes/:id' do
        if is_logged_in?
            @user = current_user
            @recipe = Recipe.find_by_id(params[:id])
            erb :'/recipes/show_recipe'
        else
            redirect to '/login'
        end
    end

    # get '/recipes/:id/edit' do
    #     if is_logged_in?
    #     @user = current_user
    #     @recipe = Recipe.find_by_id(params[:id])
    #         if @recipe.user 
    #         # binding.pry
    #             erb :"recipes/edit_recipe"
    #         else
    #             redirect to '/recipes'
    #          end
    #     else
    #         redirect to '/recipes'
    #     end
    # end
end

    # get '/recipes/:id/edit' do
    #     @recipe = Recipe.find_by_id(params[:id])
    #     if is_logged_in? && @recipe.user == current_user
    #         erb :'recipes/edit_recipe'
    #     else
    #         redirect '/login'
    #     end
    # end


    # patch '/recipes/:id/edit' do
    #     @recipe = Recipe.find_by_id(params[:id])
    #     @user = current_user
    #     if !params[:content].empty? 
    #         @recipe.update(:content => params[:content])
    #         @recipe.save
    #         redirect "recipes/#{@recipe[:id]}"
    #     else 
    #         redirect "recipes/#{@recipe[:id]}/edit"
    #     end
    # end



#     patch '/recipes/:id/edit' do
#         @recipe = Recipe.find_by(id: params[:id])
#         @recipe.name = params[:cause][:name]
#         @cause.description = params[:cause][:description]
#         @cause.funding = params[:cause][:funding]
#         if params[:cause][:category_id]
#       @cause.category_id = params[:cause][:category_id]
#     else
#       @cause.category = Category.find_or_create_by(name: params[:new_category].capitalize)
#     end

#     if @cause.save
#       redirect to "/cause/#{@cause.id}"
#     else
#       erb :"causes/show", locals: {message: "The cause wasn't updated."}
#     end
#   end