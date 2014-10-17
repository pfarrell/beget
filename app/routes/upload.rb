class App < Sinatra::Application
  get "/upload" do
  end

  post '/upload' do
    content_type :text

    params['images'].map do |f| 
      puts f[:tempfile]
      #FileUtils.mv(f[:tempfile], "public/tmp/uploads/#{f[:filename]}")
    end
    redirect("#{url_for "/page/#{params[:page_id]}"}")
  end
end
