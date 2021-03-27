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

ActiveRecord::Schema.define(version: 2021_03_27_041634) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "criterions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "right_id", null: false
    t.integer "sp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["right_id"], name: "index_criterions_on_right_id"
    t.index ["user_id"], name: "index_criterions_on_user_id"
  end

  create_table "definitions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "right_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["right_id"], name: "index_definitions_on_right_id"
    t.index ["user_id"], name: "index_definitions_on_user_id"
  end

  create_table "like_reviews", force: :cascade do |t|
    t.integer "review_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_id"], name: "index_like_reviews_on_review_id"
    t.index ["user_id"], name: "index_like_reviews_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "visiter_id"
    t.integer "visited_id"
    t.integer "post_id"
    t.integer "reply_id"
    t.integer "right_id"
    t.integer "support_id"
    t.string "action"
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "image", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_photos_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "caption"
    t.string "title"
    t.string "image"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "reasons", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rejections", force: :cascade do |t|
    t.integer "right_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["right_id"], name: "index_rejections_on_right_id"
    t.index ["user_id"], name: "index_rejections_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "follow_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follow_id"], name: "index_relationships_on_follow_id"
    t.index ["user_id", "follow_id"], name: "index_relationships_on_user_id_and_follow_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "reply_reviews", force: :cascade do |t|
    t.text "comment", null: false
    t.integer "review_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_id"], name: "index_reply_reviews_on_review_id"
    t.index ["user_id"], name: "index_reply_reviews_on_user_id"
  end

  create_table "reps", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.text "caption", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_reps_on_post_id"
    t.index ["user_id"], name: "index_reps_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.integer "right_id", null: false
    t.string "caption"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_reviews_on_post_id"
    t.index ["right_id"], name: "index_reviews_on_right_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "rights", force: :cascade do |t|
    t.text "content"
    t.integer "point"
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.integer "owner"
    t.integer "deadline"
    t.integer "due"
    t.integer "status", default: 0
    t.index ["post_id"], name: "index_rights_on_post_id"
    t.index ["user_id"], name: "index_rights_on_user_id"
  end

  create_table "rrs", force: :cascade do |t|
    t.integer "rejection_id", null: false
    t.integer "reason_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reason_id"], name: "index_rrs_on_reason_id"
    t.index ["rejection_id"], name: "index_rrs_on_rejection_id"
  end

  create_table "supports", force: :cascade do |t|
    t.text "message"
    t.integer "point"
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_supports_on_post_id"
    t.index ["user_id"], name: "index_supports_on_user_id"
  end

  create_table "sympathies", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.integer "right_id", null: false
    t.string "caption"
    t.integer "point"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_sympathies_on_post_id"
    t.index ["right_id"], name: "index_sympathies_on_right_id"
    t.index ["user_id"], name: "index_sympathies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "profile_photo"
    t.text "info"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zipfiles", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "right_id"
    t.index ["right_id"], name: "index_zipfiles_on_right_id"
    t.index ["user_id"], name: "index_zipfiles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "criterions", "rights"
  add_foreign_key "criterions", "users"
  add_foreign_key "definitions", "rights"
  add_foreign_key "definitions", "users"
  add_foreign_key "like_reviews", "reviews"
  add_foreign_key "like_reviews", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "photos", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "rejections", "rights"
  add_foreign_key "rejections", "users"
  add_foreign_key "relationships", "users"
  add_foreign_key "relationships", "users", column: "follow_id"
  add_foreign_key "reply_reviews", "reviews"
  add_foreign_key "reply_reviews", "users"
  add_foreign_key "reps", "posts"
  add_foreign_key "reps", "users"
  add_foreign_key "reviews", "posts"
  add_foreign_key "reviews", "rights"
  add_foreign_key "reviews", "users"
  add_foreign_key "rights", "posts"
  add_foreign_key "rights", "users"
  add_foreign_key "rrs", "reasons"
  add_foreign_key "rrs", "rejections"
  add_foreign_key "supports", "posts"
  add_foreign_key "supports", "users"
  add_foreign_key "sympathies", "posts"
  add_foreign_key "sympathies", "rights"
  add_foreign_key "sympathies", "users"
  add_foreign_key "zipfiles", "rights"
  add_foreign_key "zipfiles", "users"
end
