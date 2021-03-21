class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas do |t|

      t.integer :category_id, null: false, foreign_key: true
      t.text    :body, null: false

      t.timestamps
    end
  end
end
