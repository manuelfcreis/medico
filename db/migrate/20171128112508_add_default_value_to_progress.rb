class AddDefaultValueToProgress < ActiveRecord::Migration[5.1]
  def change
    change_column :doses, :progress, :integer, default: 0
  end
end
