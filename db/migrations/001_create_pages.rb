Sequel.migration do
  change do
    create_table(:pages) do
      primary_key :id
      String :url
      String :title
      Integer :main_image_id
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
