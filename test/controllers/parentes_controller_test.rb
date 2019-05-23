require 'test_helper'

class ParentesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parente = parentes(:one)
  end

  test "should get index" do
    get parentes_url
    assert_response :success
  end

  test "should get new" do
    get new_parente_url
    assert_response :success
  end

  test "should create parente" do
    assert_difference('Parente.count') do
      post parentes_url, params: { parente: { associado_id: @parente.associado_id, data_nascimento: @parente.data_nascimento, nome: @parente.nome, parentesco: @parente.parentesco } }
    end

    assert_redirected_to parente_url(Parente.last)
  end

  test "should show parente" do
    get parente_url(@parente)
    assert_response :success
  end

  test "should get edit" do
    get edit_parente_url(@parente)
    assert_response :success
  end

  test "should update parente" do
    patch parente_url(@parente), params: { parente: { associado_id: @parente.associado_id, data_nascimento: @parente.data_nascimento, nome: @parente.nome, parentesco: @parente.parentesco } }
    assert_redirected_to parente_url(@parente)
  end

  test "should destroy parente" do
    assert_difference('Parente.count', -1) do
      delete parente_url(@parente)
    end

    assert_redirected_to parentes_url
  end
end
