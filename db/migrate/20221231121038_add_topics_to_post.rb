class AddTopicsToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :topics, :text, array: true, default: []
  end
end
