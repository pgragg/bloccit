class AddTitleToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :title, :string
  end
end
