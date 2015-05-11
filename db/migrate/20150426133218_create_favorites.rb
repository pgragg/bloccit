class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :post
      t.references :user
    end
  end
end


#This is called a "join table."