Class.new Sequel::Migration do
  def up
    create_table(:users) do
      primary_key :id
      String :login, null: false
      String :crypted_password
      String :email, null: false
      String :salt, null: false
      Boolean :confirmed, null: false, default: false
      DateTime :confirmed_at, null: false, default: Sequel.function(:now)
    end unless DB.tables.include? :users
  end

  def down
    remove_table(:users) if DB.tables.include? :users
  end
end
