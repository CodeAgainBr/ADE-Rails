json.extract! relatorio_jogador, :id, :status, :participante_confraternizacao, :cartao_amarelo, :cartao_vermelho, :goleiro, :gol_pro, :gol_sofrido, :destaque, :associado_id, :relatorio_id, :created_at, :updated_at
json.url relatorio_jogador_url(relatorio_jogador, format: :json)
