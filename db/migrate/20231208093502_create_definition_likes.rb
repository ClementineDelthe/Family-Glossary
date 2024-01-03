class CreateDefinitionLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :definition_likes do |t|
      t.references :definition, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
