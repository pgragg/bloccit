class AddTopicIdToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :topic_id, :integer
  end
end
