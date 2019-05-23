require 'test_helper'

class ClubesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clube = clubes(:one)
  end

  test "should get index" do
    get clubes_url
    assert_response :success
  end

  test "should get new" do
    get new_clube_url
    assert_response :success
  end

  test "should create clube" do
    assert_difference('Clube.count') do
      post clubes_url, params: { clube: { bairro: @clube.bairro, bairro_campo: @clube.bairro_campo, campo: @clube.campo, categoria: @clube.categoria, cep: @clube.cep, cep_campo: @clube.cep_campo, cidade: @clube.cidade, cidade_campo: @clube.cidade_campo, cor_uniforme: @clube.cor_uniforme, data_fundacao: @clube.data_fundacao, estado: @clube.estado, estado_campo: @clube.estado_campo, nome: @clube.nome, nome_contato: @clube.nome_contato, numero: @clube.numero, numero_campo: @clube.numero_campo, rua: @clube.rua, rua_campo: @clube.rua_campo, telefone_clube: @clube.telefone_clube, telefone_contato: @clube.telefone_contato } }
    end

    assert_redirected_to clube_url(Clube.last)
  end

  test "should show clube" do
    get clube_url(@clube)
    assert_response :success
  end

  test "should get edit" do
    get edit_clube_url(@clube)
    assert_response :success
  end

  test "should update clube" do
    patch clube_url(@clube), params: { clube: { bairro: @clube.bairro, bairro_campo: @clube.bairro_campo, campo: @clube.campo, categoria: @clube.categoria, cep: @clube.cep, cep_campo: @clube.cep_campo, cidade: @clube.cidade, cidade_campo: @clube.cidade_campo, cor_uniforme: @clube.cor_uniforme, data_fundacao: @clube.data_fundacao, estado: @clube.estado, estado_campo: @clube.estado_campo, nome: @clube.nome, nome_contato: @clube.nome_contato, numero: @clube.numero, numero_campo: @clube.numero_campo, rua: @clube.rua, rua_campo: @clube.rua_campo, telefone_clube: @clube.telefone_clube, telefone_contato: @clube.telefone_contato } }
    assert_redirected_to clube_url(@clube)
  end

  test "should destroy clube" do
    assert_difference('Clube.count', -1) do
      delete clube_url(@clube)
    end

    assert_redirected_to clubes_url
  end
end
