class CreateQuestionDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :question_details do |t|
      t.text :notes
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
