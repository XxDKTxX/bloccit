class CreateAnsers < ActiveRecord::Migration
  def change
    create_table :ansers do |t|
      t.references :question, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
