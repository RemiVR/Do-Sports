class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
    	t.string :title
      t.timestamps null: false
    end
  end
end
