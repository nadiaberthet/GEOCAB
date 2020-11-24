class AddAnswersToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :ordre, :boolean, default: false
    add_column :users, :cpam, :boolean, default: false
    add_column :users, :urssaf, :boolean, default: false
    add_column :users, :retraite, :boolean, default: false
    add_column :users, :assurance_rcp, :boolean, default: false
    add_column :users, :budget, :integer
    add_column :users, :commodite, :string
  end
end
