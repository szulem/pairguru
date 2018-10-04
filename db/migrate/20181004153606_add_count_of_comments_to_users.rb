class AddCountOfCommentsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :count_of_comments, :integer
  end
end
