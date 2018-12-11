class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :author
      t.string :country
      t.string :language
      t.string :link
      t.integer :pages
      t.integer :year

      t.timestamps
    end
  end
end
