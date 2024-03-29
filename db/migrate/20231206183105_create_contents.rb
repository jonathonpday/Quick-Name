class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.references :display, null: false, foreign_key: true

      t.timestamps
    end
  end
end
