Sequel.migration do
  change do
    create_table(:images) do
      primary_key :id
      Integer :page_id
      String :file_name
      String :title
      String :caption
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
