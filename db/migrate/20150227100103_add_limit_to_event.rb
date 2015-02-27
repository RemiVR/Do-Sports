class AddLimitToEvent < ActiveRecord::Migration
  def change
  	add_column :events, :max_size, :integer
  end
end
