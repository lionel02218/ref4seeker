class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.belongs_to :user, foreign_key: true
      t.text :body
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
