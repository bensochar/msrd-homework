class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.integer :weight
      t.date :birthdate

      t.timestamps
    end
  end
end
