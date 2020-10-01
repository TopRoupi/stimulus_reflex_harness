# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_30_170246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercices", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "submission_tests", force: :cascade do |t|
    t.bigint "submission_id", null: false
    t.bigint "test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "process_state"
    t.index ["submission_id"], name: "index_submission_tests_on_submission_id"
    t.index ["test_id"], name: "index_submission_tests_on_test_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "exercice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercice_id"], name: "index_submissions_on_exercice_id"
  end

  create_table "tests", force: :cascade do |t|
    t.bigint "exercice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercice_id"], name: "index_tests_on_exercice_id"
  end

  add_foreign_key "submission_tests", "submissions"
  add_foreign_key "submission_tests", "tests"
  add_foreign_key "submissions", "exercices"
  add_foreign_key "tests", "exercices"
end
