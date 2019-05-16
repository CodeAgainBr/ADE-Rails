# AddOnDeleteCascadeToAllModels class
class AddOnDeleteCascadeToAllModels < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :avaliacao_jogadores,
                       :associados
    add_foreign_key :avaliacao_jogadores,
                    :associados,
                    dependent: :delete

    remove_foreign_key :parentes,
                       :associados
    add_foreign_key :parentes,
                    :associados,
                    dependent: :delete

    remove_foreign_key :relatorio_participacao_parentes,
                       :parentes
    add_foreign_key :relatorio_participacao_parentes,
                    :parentes,
                    dependent: :delete

    remove_foreign_key :jogos,
                       :clubes
    add_foreign_key :jogos,
                    :clubes,
                    dependent: :delete

    remove_foreign_key :relatorio_jogos,
                       :jogos
    add_foreign_key :relatorio_jogos,
                    :jogos,
                    dependent: :delete

    remove_foreign_key :avaliacao_jogadores,
                       :relatorio_jogos
    add_foreign_key :avaliacao_jogadores,
                    :relatorio_jogos,
                    dependent: :delete

    remove_foreign_key :relatorio_participacao_parentes,
                       :relatorio_jogos
    add_foreign_key :relatorio_participacao_parentes,
                    :relatorio_jogos,
                    dependent: :delete
  end
end
