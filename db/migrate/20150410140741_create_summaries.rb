class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.integer :topic_id
      t.string :title 
      t.timestamps null: false
    end
  end
end


