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

ActiveRecord::Schema.define(version: 20180712004046) do

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
