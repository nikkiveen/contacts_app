class AddMiddleNameAndBioToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :middle_name, :string
  end
end
