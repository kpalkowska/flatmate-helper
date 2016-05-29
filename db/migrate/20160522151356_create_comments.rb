class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table "comments", force: :cascade do |t|
    t.string   "category"
    t.string   "body"
    t.references :Flatmate, foreign_key: true

    t.timestamps
    end
  end
end
