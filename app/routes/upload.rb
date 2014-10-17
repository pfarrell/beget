class App < Sinatra::Application
  get "/upload" do
  end

  post '/upload' do
    content_type :text
    page = Page[params[:page_id]]
    FileUtils.mkdir_p("public/gumbo/#{page.id}")

    params['images'].map do |f| 
      Image.mv(f[:tempfile], "public/gumbo/#{page.id}/#{f[:filename]}")
      image = Image.find_or_create(page: page, file_name: f[:filename])
      image.save
    end
    redirect("#{url_for "/page/#{page.id}"}")
  end
end
