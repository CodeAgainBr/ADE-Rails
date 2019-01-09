json.extract! avaliacao_jogador, :id, :status, :participante_confraternizacao, :cartao_amarelo, :cartao_vermelho, :goleiro, :gol_pro, :gol_sofrido, :destaque, :associado_id, :relatorio_jogo_id, :created_at, :updated_at
json.url avaliacao_jogador_url(avaliacao_jogador, format: :json)
