class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :title
    	t.time :time
    	t.datetime :date
      t.timestamps null: false
    end
  end
end
