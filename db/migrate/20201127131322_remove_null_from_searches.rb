class RemoveNullFromSearches < ActiveRecord::Migration[6.0]
  def change
    change_column :searches, :user_id, :integer, null: true
  end
end
