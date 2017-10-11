class CreateEmpties < ActiveRecord::Migration[5.1]
  def change
    create_table :empties do |t|

      t.timestamps
    end
  end
end
