# frozen_string_literal: true

ActiveRecord::Schema.define do
  create_table :active_storage_attachments, force: :cascade do |t|
    t.string :name, null: false
    t.string :record_type, null: false
    t.integer :record_id, null: false
    t.integer :blob_id, null: false
    t.datetime :created_at, null: false
    t.index %i[blob_id], name: :index_active_storage_attachments_on_blob_id
    t.index %i[record_type record_id name blob_id], name: :index_active_storage_attachments_uniqueness, unique: true
  end

  create_table :active_storage_blobs, force: :cascade do |t|
    t.string :key, null: false
    t.string :filename, null: false
    t.string :content_type
    t.text :metadata
    t.bigint :byte_size, null: false
    t.string :checksum, null: false
    t.datetime :created_at, null: false
    t.index %i[key], name: :index_active_storage_blobs_on_key, unique: true

    if ActiveStorage.version >= Gem::Version.new('6.1')
      t.string :service_name, null: false
    end
  end

  if ActiveStorage.version >= Gem::Version.new('6.1')
    create_table :active_storage_variant_records, force: :cascade do |t|
      t.bigint :blob_id, null: false
      t.string :variation_digest, null: false
      t.index %i[blob_id variation_digest], name: :index_active_storage_variant_records_uniqueness, unique: true
    end
  end

  create_table :documents, force: :cascade do |t|
    t.datetime :created_at, precision: 6, null: false
    t.datetime :updated_at, precision: 6, null: false
  end

  create_table :limit_attachments, force: :cascade do |t|
    t.string :name
  end

  create_table :only_images, force: :cascade do |t|
    t.datetime :created_at, precision: 6, null: false
    t.datetime :updated_at, precision: 6, null: false
  end

  create_table :projects, force: :cascade do |t|
    t.string :title
    t.datetime :created_at, null: false
    t.datetime :updated_at, null: false
  end

  create_table :ratio_models, force: :cascade do |t|
    t.string :name
    t.datetime :created_at, precision: 6, null: false
    t.datetime :updated_at, precision: 6, null: false
  end

  create_table :users, force: :cascade do |t|
    t.string :name
    t.datetime :created_at, null: false
    t.datetime :updated_at, null: false
  end
end
