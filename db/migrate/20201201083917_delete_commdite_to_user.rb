class DeleteCommditeToUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :commodite
  end
end
