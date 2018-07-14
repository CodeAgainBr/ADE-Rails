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

ActiveRecord::Schema.define(version: 20180713173446) do

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
  end

  create_table "clubes", force: :cascade do |t|
    t.string   "nome"
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
    t.string   "cor_uniforme"
    t.boolean  "campo"
    t.string   "telefone_clube"
    t.string   "telefone_contato"
    t.string   "nome_contato"
    t.date     "data_fundacao"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "jogos", force: :cascade do |t|
    t.date     "data"
    t.string   "horario"
    t.string   "local"
    t.boolean  "relatorio"
    t.integer  "clube_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clube_id"], name: "index_jogos_on_clube_id"
  end

  create_table "parentes", force: :cascade do |t|
    t.string   "nome"
    t.string   "parentesco"
    t.date     "data_nascimento"
    t.integer  "associado_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["associado_id"], name: "index_parentes_on_associado_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
