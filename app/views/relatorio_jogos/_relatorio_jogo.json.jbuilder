json.extract! relatorio_jogo, :id, :gols_pro, :gols_contra, :observacao, :uniforme, :responsavel_uniforme, :jogo_id, :created_at, :updated_at
json.url relatorio_jogo_url(relatorio_jogo, format: :json)
