class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.resources :post
      t.resources :user

      t.timestamps
    end
  end
end
