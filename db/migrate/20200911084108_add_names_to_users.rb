class AddNamesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :family_name, :string
    add_column :users, :family_name_katakana, :string
    add_column :users, :first_name_katakana, :string
    add_column :users, :birth_day, :date
  end
end
