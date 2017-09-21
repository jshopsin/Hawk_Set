class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.references :card, foreign_key: true
      t.references :game, foreign_key: true
      t.references :card_set, foreign_key: true
      t.string     :card_status

      t.timestamps
    end
  end
end
