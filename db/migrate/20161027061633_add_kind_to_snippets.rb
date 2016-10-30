class AddKindToSnippets < ActiveRecord::Migration[5.0]
  def change
    add_reference :snippets, :kind, foreign_key: true
  end
end
