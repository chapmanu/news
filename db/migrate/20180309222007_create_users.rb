class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, default: "", null: false
      t.string :last_name, default: "", null: false
      t.string :role, default: nil, null: true
      t.string :username, default: "", null: true
      t.string :email, default: "", null: false

      t.timestamps
    end
  end
end
