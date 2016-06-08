# This is a starting point. Feel free to add / modify, as long as the tests pass
require 'pry'
require 'sinatra'

class ShopDBApp < Sinatra::Base
  set :logging, true
  set :show_exceptions, false

  error do |e|
    binding.pry
    raise e
  end

  def self.reset_database
    [User, Item, Purchase].each { |klass| klass.delete_all }
  end

  post "/users" do
    create_new_user
  end

  def create_new_user
    User.first_or_create params
  end

end

ShopDBApp.run! if $PROGRAM_NAME == __FILE__
