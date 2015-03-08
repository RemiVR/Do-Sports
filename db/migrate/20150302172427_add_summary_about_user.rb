class AddSummaryAboutUser < ActiveRecord::Migration
  def change
  	add_column :users, :summary, :text
  	add_column :users, :birthday, :date
  end
end
