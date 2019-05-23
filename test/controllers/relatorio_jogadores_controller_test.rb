require 'test_helper'

class RelatorioJogadoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relatorio_jogadore = relatorio_jogadores(:one)
  end

  test "should get index" do
    get relatorio_jogadores_index_url
    assert_response :success
  end

  test "should get new" do
    get new_relatorio_jogadore_url
    assert_response :success
  end

  test "should create relatorio_jogadore" do
    assert_difference('RelatorioJogadores.count') do
      post relatorio_jogadores_index_url, params: { relatorio_jogadore: { associado_id: @relatorio_jogadore.associado_id, cartao_amarelo: @relatorio_jogadore.cartao_amarelo, cartao_vermelho: @relatorio_jogadore.cartao_vermelho, destaque: @relatorio_jogadore.destaque, gol_pro: @relatorio_jogadore.gol_pro, gol_sofrido: @relatorio_jogadore.gol_sofrido, goleiro: @relatorio_jogadore.goleiro, participante_confraternizacao: @relatorio_jogadore.participante_confraternizacao, relatorio_id: @relatorio_jogadore.relatorio_id, status: @relatorio_jogadore.status } }
    end

    assert_redirected_to relatorio_jogadore_url(RelatorioJogadores.last)
  end

  test "should show relatorio_jogadore" do
    get relatorio_jogadore_url(@relatorio_jogadore)
    assert_response :success
  end

  test "should get edit" do
    get edit_relatorio_jogadore_url(@relatorio_jogadore)
    assert_response :success
  end

  test "should update relatorio_jogadore" do
    patch relatorio_jogadore_url(@relatorio_jogadore), params: { relatorio_jogadore: { associado_id: @relatorio_jogadore.associado_id, cartao_amarelo: @relatorio_jogadore.cartao_amarelo, cartao_vermelho: @relatorio_jogadore.cartao_vermelho, destaque: @relatorio_jogadore.destaque, gol_pro: @relatorio_jogadore.gol_pro, gol_sofrido: @relatorio_jogadore.gol_sofrido, goleiro: @relatorio_jogadore.goleiro, participante_confraternizacao: @relatorio_jogadore.participante_confraternizacao, relatorio_id: @relatorio_jogadore.relatorio_id, status: @relatorio_jogadore.status } }
    assert_redirected_to relatorio_jogadore_url(@relatorio_jogadore)
  end

  test "should destroy relatorio_jogadore" do
    assert_difference('RelatorioJogadores.count', -1) do
      delete relatorio_jogadore_url(@relatorio_jogadore)
    end

    assert_redirected_to relatorio_jogadores_index_url
  end
end
