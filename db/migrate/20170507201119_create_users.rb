class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string   "fname"
      t.string   "lname"
      t.integer  "age"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string   "email"
      t.string   "password"

      t.timestamps
    end
  end
end
