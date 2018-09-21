json.extract! relatorio_jogadore, :id, :status, :participante_confraternizacao, :cartao_amarelo, :cartao_vermelho, :goleiro, :gol_pro, :gol_sofrido, :destaque, :associado_id, :relatorio_id, :created_at, :updated_at
json.url relatorio_jogadore_url(relatorio_jogadore, format: :json)
