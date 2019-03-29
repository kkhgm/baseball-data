class CreateDooms < ActiveRecord::Migration[5.2]
  def change
    create_table :dooms do |t|
      t.string :name
      t.timestamps
    end
  end
end
