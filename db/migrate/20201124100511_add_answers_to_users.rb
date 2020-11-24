class AddAnswersToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :completed
  end
end
