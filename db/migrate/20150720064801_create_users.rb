class CreateUsers < ActiveRecord::Migration
# カラムを追加するときは「def change」
  def change
    #create_tableでテーブルの作成
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :profile
      t.string :area
      t.string :password_digest
      t.timestamps
      t.index :email, unique: true # この行を追加
    end
  end
end