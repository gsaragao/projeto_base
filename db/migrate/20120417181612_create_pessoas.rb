class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.integer :idade
      t.string :cpf
      t.string :rg
      t.string :titulo_eleitor
      t.date :data_nascimento
      t.text :observacoes

      t.timestamps
    end
  end
end
