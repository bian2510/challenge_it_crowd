class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.references :person, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.string :kind

      t.timestamps
    end
  end
end
