# This is a starting point. Feel free to add / modify, as long as the tests pass
require 'pry'
require 'sinatra'
require 'sinatra/json'

class ShopDBApp < Sinatra::Base
  set :logging, true
  set :show_exceptions, false

  error do |e|
    if e.is_a? ActiveRecord::RecordNotFound
      raise e
    end
    #binding.pry
    raise e
  end

  def self.reset_database
    [User, Item, Purchase].each { |klass| klass.delete_all }
  end

  before do
    require_authorization!
  end

  get "/items/:item_id/purchases" do
    show_purchases_for_an_item
  end

  post "/users" do
    create_new_user
  end

  post "/items" do
    add_new_item
  end

  post "/items/:item_id/buy" do
    purchase_item
  end

  delete "/items/:item_id" do
    delete_item
  end

  def create_new_user
    User.first_or_create params
  end

  def add_new_item
    Item.first_or_create params.merge "listed_by"=>user_id
  end

  def purchase_item
      Purchase.create quantity: params["quantity"], item_id: item_id, user_id: user_id
  end

  def show_purchases_for_an_item
    i = Item.find(item_id)
    json i.purchases
  end

  def delete_item
    i = User.find(user_id).items.find_by(item_id)
    if i
      i.destroy
    else
      halt 403
    end
  end

  def require_authorization!
    unless username
      halt(
        401,
        json("status": "error", "error": "You must log in.")
      )
    end
  end

  def username
    request.env["HTTP_AUTHORIZATION"]
  end

  def user_id
    user_id ||= User.find_by(first_name: username).id
    user_id
  end

  def item_id
    item_id ||= Item.find(params["item_id"]).id
  end

end

ShopDBApp.run! if $PROGRAM_NAME == __FILE__
