class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :price
      t.string :author
      t.integer :stock
      t.date :release_day

      t.timestamps
    end
  end
end
