class AddCabinetToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cabinet, :boolean, default: false
    add_column :users, :materiel, :boolean, default: false
    add_column :users, :doctolib, :boolean, default: false
    add_column :users, :google_business, :boolean, default: false
    add_column :users, :ecole, :boolean, default: false
    add_column :users, :sport, :boolean, default: false
    add_column :users, :parc, :boolean, default: false
    add_column :users, :transport, :boolean, default: false
  end
end
