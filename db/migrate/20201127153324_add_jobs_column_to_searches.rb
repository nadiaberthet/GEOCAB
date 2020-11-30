class AddJobsColumnToSearches < ActiveRecord::Migration[6.0]
  def change
    add_column :searches, :job, :string
  end
end
