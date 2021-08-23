class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :model
      t.text :description

      t.timestamps
    end
  end
end
