eric = User.create(:username => "ericjohnson0216", :email => "ericjohnson0216@icloud.com", :password => "Hello")
fruit_smoothie = Recipe.create(:name => "Banana Fruit Smoothie", :content => "In a blender, combine pineapple juice, bananas, honey and ice!", :item => "Pineapple Juice", :quantity => 1, :unit => "Cups", :item => "Bananas", :quantity => 3)
# fruit_smoothie.Recipe.create(:item => "Pineapple Juice", :quantity => 1, :unit => "Cup")
# fruit_smoothie.Recipe.create(:item => "Bananas", :quantity => 3)
# fruit_smoothie.Recipe.create(:item => "Honey", :quantity => 1, :unit => "Tablespoon")
# fruit_smoothie.Recipe.create(:item => "Ice", :quantity => 2, :unit => "Cups")
fruit_smoothie.save

