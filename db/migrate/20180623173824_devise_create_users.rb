# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username,           null: false
      t.string :email,              null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
