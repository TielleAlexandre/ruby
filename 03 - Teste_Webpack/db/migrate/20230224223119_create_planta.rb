class CreatePlanta < ActiveRecord::Migration[6.1]
  def change
    create_table :planta do |t|
      t.string :nome
      t.string :cor
      t.float :valor

      t.timestamps
    end
  end
end
