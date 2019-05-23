require 'test_helper'

class RelatorioJogosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relatorio_jogo = relatorio_jogos(:one)
  end

  test "should get index" do
    get relatorio_jogos_url
    assert_response :success
  end

  test "should get new" do
    get new_relatorio_jogo_url
    assert_response :success
  end

  test "should create relatorio_jogo" do
    assert_difference('RelatorioJogo.count') do
      post relatorio_jogos_url, params: { relatorio_jogo: { gols_contra: @relatorio_jogo.gols_contra, gols_pro: @relatorio_jogo.gols_pro, jogo_id: @relatorio_jogo.jogo_id, observacao: @relatorio_jogo.observacao, responsavel_uniforme: @relatorio_jogo.responsavel_uniforme, uniforme: @relatorio_jogo.uniforme } }
    end

    assert_redirected_to relatorio_jogo_url(RelatorioJogo.last)
  end

  test "should show relatorio_jogo" do
    get relatorio_jogo_url(@relatorio_jogo)
    assert_response :success
  end

  test "should get edit" do
    get edit_relatorio_jogo_url(@relatorio_jogo)
    assert_response :success
  end

  test "should update relatorio_jogo" do
    patch relatorio_jogo_url(@relatorio_jogo), params: { relatorio_jogo: { gols_contra: @relatorio_jogo.gols_contra, gols_pro: @relatorio_jogo.gols_pro, jogo_id: @relatorio_jogo.jogo_id, observacao: @relatorio_jogo.observacao, responsavel_uniforme: @relatorio_jogo.responsavel_uniforme, uniforme: @relatorio_jogo.uniforme } }
    assert_redirected_to relatorio_jogo_url(@relatorio_jogo)
  end

  test "should destroy relatorio_jogo" do
    assert_difference('RelatorioJogo.count', -1) do
      delete relatorio_jogo_url(@relatorio_jogo)
    end

    assert_redirected_to relatorio_jogos_url
  end
end
