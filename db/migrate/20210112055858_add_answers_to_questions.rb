class AddAnswersToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :answer1, :string, null: false, default: ''
    add_column :questions, :answer2, :string, null: false, default: ''
    add_column :questions, :answer3, :string, null: false, default: ''
    add_column :questions, :answer4, :string, null: false, default: ''
  end
end
