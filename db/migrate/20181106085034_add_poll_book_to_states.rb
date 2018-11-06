class AddPollBookToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :poll_book, :string
  end
end
