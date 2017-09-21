class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :shape
      t.string :color
      t.string :shade
      t.integer :number
      t.string :image_url

      t.timestamps
    end
  end
end
