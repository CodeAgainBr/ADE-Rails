require 'test_helper'

class RelatorioParticipacaoParentesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relatorio_participacao_parente = relatorio_participacao_parentes(:one)
  end

  test "should get index" do
    get relatorio_participacao_parentes_url
    assert_response :success
  end

  test "should get new" do
    get new_relatorio_participacao_parente_url
    assert_response :success
  end

  test "should create relatorio_participacao_parente" do
    assert_difference('RelatorioParticipacaoParente.count') do
      post relatorio_participacao_parentes_url, params: { relatorio_participacao_parente: { Relatorio_jogo_id: @relatorio_participacao_parente.Relatorio_jogo_id, parente_id: @relatorio_participacao_parente.parente_id } }
    end

    assert_redirected_to relatorio_participacao_parente_url(RelatorioParticipacaoParente.last)
  end

  test "should show relatorio_participacao_parente" do
    get relatorio_participacao_parente_url(@relatorio_participacao_parente)
    assert_response :success
  end

  test "should get edit" do
    get edit_relatorio_participacao_parente_url(@relatorio_participacao_parente)
    assert_response :success
  end

  test "should update relatorio_participacao_parente" do
    patch relatorio_participacao_parente_url(@relatorio_participacao_parente), params: { relatorio_participacao_parente: { Relatorio_jogo_id: @relatorio_participacao_parente.Relatorio_jogo_id, parente_id: @relatorio_participacao_parente.parente_id } }
    assert_redirected_to relatorio_participacao_parente_url(@relatorio_participacao_parente)
  end

  test "should destroy relatorio_participacao_parente" do
    assert_difference('RelatorioParticipacaoParente.count', -1) do
      delete relatorio_participacao_parente_url(@relatorio_participacao_parente)
    end

    assert_redirected_to relatorio_participacao_parentes_url
  end
end
