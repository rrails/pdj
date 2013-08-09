User.destroy_all
Restaurant.destroy_all
Plat.destroy_all
Cuisine.destroy_all


thai = Cuisine.create(:name => 'thai', :icon => 'http://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/32/Thailand-Flag-icon.png',)
french = Cuisine.create(:name => 'french', :icon => 'http://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/32/France-Flag-icon.png')
italian = Cuisine.create(:name => 'italian', :icon => 'http://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/32/Italy-Flag-icon.png')
japanese = Cuisine.create(:name => 'japanese', :icon => 'http://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/32/Japan-Flag-icon.png')
chinese = Cuisine.create(:name => 'chinese', :icon => 'http://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/32/China-Flag-icon.png')


u1 = User.create(:name => 'Bob', :address => '610 Harris St Sydney', :phone => '0412222', :email => 'bob@gmail.com', :password => 'a', :city => 'Sydney',  :password_confirmation => 'a')


r1 = Restaurant.create(:name => 'Lego House', :address => '700 Harris St Sydney', :phone => '0422222', :email => 'lego@gmail.com', :password => 'a', :city => 'Sydney', :password_confirmation => 'a', :cuisine_id => thai.id)

r2 = Restaurant.create(:name => 'The RockPool', :address => '66 Hunter St
Sydney NSW', :phone => '(02) 8078 1900', :email => 'rockpool@gmail.com', :password => 'b', :city => 'Sydney', :password_confirmation => 'b' , :cuisine_id => french.id)

r3 = Restaurant.create(:name => 'Thai hut', :address => '29 Commonwealth St Sydney', :phone => '0422232', :email => 'thai@gmail.com', :password => 'a', :city => 'Sydney', :password_confirmation => 'a', :cuisine_id => thai.id)


p1 = Plat.create(:description => '2 Piri Piri Burgers with fries', :price => '20', :release => '2013-07-08 11:01', :image => 'http://www.healthyfood.co.nz/sites/default/files/styles/recipe_320x295/public/recipeimages/5723.jpg')
p2 = Plat.create(:description => 'All you can eat Sushi', :price => '25', :release => '2013-07-08 11:01', :image => 'http://thetased.files.wordpress.com/2010/09/sushi2.jpg')
p3 = Plat.create(:description => 'Pork Buns', :price => '10', :release => '2013-07-08 11:01', :image => 'http://www.foodpeoplewant.com/wp-content/uploads/2009/11/Barbecued-Pork-Buns-1024x768.jpg' )

r1.plats << p1
r2.plats << p2
r3.plats << p3