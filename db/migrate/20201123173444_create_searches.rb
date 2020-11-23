class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :query
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
