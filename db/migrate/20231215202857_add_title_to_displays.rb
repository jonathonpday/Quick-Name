class AddTitleToDisplays < ActiveRecord::Migration[7.0]
  def change
    add_column :displays, :title, :string
  end
end
