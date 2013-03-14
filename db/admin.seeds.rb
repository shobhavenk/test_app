# user = User.create!([{:first_name => 'John'},{:last_name => 'Deo'}, {:email => 'john@gmail.com'}, {:password => 'ThreadHistory'}, {:password_confirmation => 'ThreadHistory'},{:secret_code => 'foobar'}])
user = User.create!(:email => 'john@gmail.com', :password => 'password', :secret_code => 'History' )
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])