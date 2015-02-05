class CreatePredicates < ActiveRecord::Migration
  def change
    create_table :predicates do |t|
      t.string :name
      t.string :prolog

      t.timestamps null: false
    end
  end
end
