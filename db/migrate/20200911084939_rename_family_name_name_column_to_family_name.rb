class RenameFamilyNameNameColumnToFamilyName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :family_name_name, :family_name
  end
end
