class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
