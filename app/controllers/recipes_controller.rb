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
        # @tweet = Tweet.create(content: params[:content], user: @user)
        if !params[:content].empty?
            @recipe = Recipe.create(:name=>params[:name], :content=>params[:content], user: @user)
            @user.recipes << @recipe
            @user.save

            redirect to "/recipes"
        else
            redirect to 'recipes/new'
        end
    end

end