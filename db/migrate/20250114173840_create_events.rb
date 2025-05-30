class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :date_time
      t.string :location
      t.boolean :visibility
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
