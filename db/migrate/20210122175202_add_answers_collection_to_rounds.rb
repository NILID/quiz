class AddAnswersCollectionToRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :answers_collection, :string, null: false
  end
end
