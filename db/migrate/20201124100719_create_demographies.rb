class CreateDemographies < ActiveRecord::Migration[6.0]
  def change
    create_table :demographies do |t|

      t.timestamps
    end
  end
end
