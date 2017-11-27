class AddProgressToDoses < ActiveRecord::Migration[5.1]
  def change
    add_column :doses, :progress, :integer
  end
end
