class CreateCompetitors < ActiveRecord::Migration[6.0]
  def change
    create_table :competitors do |t|

      t.timestamps
    end
  end
end
