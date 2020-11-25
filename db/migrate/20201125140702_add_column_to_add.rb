class AddColumnToAdd < ActiveRecord::Migration[6.0]
  def change
    add_column :ads, :title, :string
    add_column :ads, :address, :string
    add_column :ads, :rent_cents, :integer
    add_column :ads, :published_at, :date
    add_column :ads, :image_url, :text
  end
end
