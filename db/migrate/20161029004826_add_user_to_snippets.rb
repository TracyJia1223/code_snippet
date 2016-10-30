class AddUserToSnippets < ActiveRecord::Migration[5.0]
  def change
    add_reference :snippets, :user, foreign_key: true, index: true
  end
end
