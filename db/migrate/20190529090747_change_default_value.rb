class ChangeDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:requests, :count, from: 1, to: 0)
  end
end
