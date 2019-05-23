# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190516014554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "associados", force: :cascade do |t|
    t.string   "nome",             null: false
    t.date     "data_nascimento"
    t.string   "local_nascimento"
    t.string   "rg"
    t.string   "cpf"
    t.string   "cep"
    t.string   "email"
    t.string   "cidade"
    t.string   "estado"
    t.string   "bairro"
    t.string   "rua"
    t.integer  "numero"
    t.string   "telefone"
    t.string   "prato_preferido"
    t.text     "observacoes"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "data_ingresso"
  end

  create_table "avaliacao_jogadores", force: :cascade do |t|
    t.string   "status"
    t.boolean  "participante_confraternizacao"
    t.integer  "cartao_amarelo"
    t.integer  "cartao_vermelho"
    t.boolean  "goleiro"
    t.integer  "gol_pro"
    t.integer  "gol_sofrido"
    t.boolean  "destaque"
    t.integer  "associado_id"
    t.integer  "relatorio_jogo_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["associado_id"], name: "index_avaliacao_jogadores_on_associado_id", using: :btree
    t.index ["relatorio_jogo_id"], name: "index_avaliacao_jogadores_on_relatorio_jogo_id", using: :btree
  end

  create_table "clubes", force: :cascade do |t|
    t.string   "nome",                 null: false
    t.string   "cep"
    t.string   "cep_campo"
    t.string   "rua"
    t.string   "rua_campo"
    t.string   "bairro"
    t.string   "bairro_campo"
    t.string   "cidade"
    t.string   "cidade_campo"
    t.string   "estado"
    t.string   "estado_campo"
    t.integer  "numero"
    t.integer  "numero_campo"
    t.string   "categoria"
    t.string   "cor_camisa_uniforme"
    t.string   "cor_bermuda_uniforme"
    t.string   "cor_meias_uniforme"
    t.boolean  "campo"
    t.string   "telefone_clube"
    t.string   "telefone_contato"
    t.string   "nome_contato"
    t.date     "data_fundacao"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "jogos", force: :cascade do |t|
    t.date     "data",             null: false
    t.string   "horario"
    t.string   "local"
    t.boolean  "relatorio"
    t.boolean  "campo_adversario"
    t.string   "cep"
    t.string   "rua"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.integer  "numero"
    t.integer  "clube_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["clube_id"], name: "index_jogos_on_clube_id", using: :btree
  end

  create_table "parentes", force: :cascade do |t|
    t.string   "nome",            null: false
    t.string   "parentesco"
    t.date     "data_nascimento"
    t.integer  "associado_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["associado_id"], name: "index_parentes_on_associado_id", using: :btree
  end

  create_table "relatorio_jogadores", force: :cascade do |t|
    t.string   "status"
    t.boolean  "participante_confraternizacao"
    t.integer  "cartao_amarelo"
    t.integer  "cartao_vermelho"
    t.boolean  "goleiro"
    t.integer  "gol_pro"
    t.integer  "gol_sofrido"
    t.boolean  "destaque"
    t.integer  "associado_id"
    t.integer  "relatorio_jogo_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["associado_id"], name: "index_relatorio_jogadores_on_associado_id", using: :btree
    t.index ["relatorio_jogo_id"], name: "index_relatorio_jogadores_on_relatorio_jogo_id", using: :btree
  end

  create_table "relatorio_jogos", force: :cascade do |t|
    t.integer  "gols_pro"
    t.integer  "gols_contra"
    t.string   "observacao"
    t.string   "uniforme"
    t.string   "responsavel_uniforme"
    t.integer  "jogo_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["jogo_id"], name: "index_relatorio_jogos_on_jogo_id", using: :btree
  end

  create_table "relatorio_participacao_parentes", force: :cascade do |t|
    t.integer  "parente_id"
    t.integer  "relatorio_jogo_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "participou"
    t.index ["parente_id"], name: "index_relatorio_participacao_parentes_on_parente_id", using: :btree
    t.index ["relatorio_jogo_id"], name: "index_relatorio_participacao_parentes_on_relatorio_jogo_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "avaliacao_jogadores", "associados"
  add_foreign_key "avaliacao_jogadores", "relatorio_jogos"
  add_foreign_key "jogos", "clubes"
  add_foreign_key "parentes", "associados"
  add_foreign_key "relatorio_jogadores", "associados"
  add_foreign_key "relatorio_jogadores", "relatorio_jogos"
  add_foreign_key "relatorio_jogos", "jogos"
  add_foreign_key "relatorio_participacao_parentes", "parentes"
  add_foreign_key "relatorio_participacao_parentes", "relatorio_jogos"
end
