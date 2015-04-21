class AddPrivacyToGroups < ActiveRecord::Migration
  def change
  	add_column :groups, :private_group, :boolean, default: false
  end
end
