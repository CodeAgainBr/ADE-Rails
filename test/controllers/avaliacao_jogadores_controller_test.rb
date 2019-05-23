require 'test_helper'

class AvaliacaoJogadoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avaliacao_jogador = avaliacao_jogadores(:one)
  end

  test "should get index" do
    get avaliacao_jogadores_url
    assert_response :success
  end

  test "should get new" do
    get new_avaliacao_jogador_url
    assert_response :success
  end

  test "should create avaliacao_jogador" do
    assert_difference('AvaliacaoJogador.count') do
      post avaliacao_jogadores_url, params: { avaliacao_jogador: { associado_id: @avaliacao_jogador.associado_id, cartao_amarelo: @avaliacao_jogador.cartao_amarelo, cartao_vermelho: @avaliacao_jogador.cartao_vermelho, destaque: @avaliacao_jogador.destaque, gol_pro: @avaliacao_jogador.gol_pro, gol_sofrido: @avaliacao_jogador.gol_sofrido, goleiro: @avaliacao_jogador.goleiro, participante_confraternizacao: @avaliacao_jogador.participante_confraternizacao, relatorio_jogo_id: @avaliacao_jogador.relatorio_jogo_id, status: @avaliacao_jogador.status } }
    end

    assert_redirected_to avaliacao_jogador_url(AvaliacaoJogador.last)
  end

  test "should show avaliacao_jogador" do
    get avaliacao_jogador_url(@avaliacao_jogador)
    assert_response :success
  end

  test "should get edit" do
    get edit_avaliacao_jogador_url(@avaliacao_jogador)
    assert_response :success
  end

  test "should update avaliacao_jogador" do
    patch avaliacao_jogador_url(@avaliacao_jogador), params: { avaliacao_jogador: { associado_id: @avaliacao_jogador.associado_id, cartao_amarelo: @avaliacao_jogador.cartao_amarelo, cartao_vermelho: @avaliacao_jogador.cartao_vermelho, destaque: @avaliacao_jogador.destaque, gol_pro: @avaliacao_jogador.gol_pro, gol_sofrido: @avaliacao_jogador.gol_sofrido, goleiro: @avaliacao_jogador.goleiro, participante_confraternizacao: @avaliacao_jogador.participante_confraternizacao, relatorio_jogo_id: @avaliacao_jogador.relatorio_jogo_id, status: @avaliacao_jogador.status } }
    assert_redirected_to avaliacao_jogador_url(@avaliacao_jogador)
  end

  test "should destroy avaliacao_jogador" do
    assert_difference('AvaliacaoJogador.count', -1) do
      delete avaliacao_jogador_url(@avaliacao_jogador)
    end

    assert_redirected_to avaliacao_jogadores_url
  end
end
