class AddUniqueConstraintToAppName < ActiveRecord::Migration[7.1]
  def change
    add_index :apps, :name, unique: true
  end
end
