class AddAuthenticationTokenToConsumers < ActiveRecord::Migration[5.1]
  def change
    add_column :consumers, :authentication_token, :string, limit: 30
    add_index :consumers, :authentication_token, unique: true
  end
end
