class AddUserBandoToBandos < ActiveRecord::Migration[6.1]
  def change
    add_column :bandos, :user_bando, :string
  end
end
