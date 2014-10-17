class App < Sinatra::Application
  get "/page/new" do
    p = Page.new
    haml :page, locals: {page: p}
  end

  post "/page/new" do
    p = Page.new
    p.title = params[:page_name]
    p.save
    redirect url_for("/page/#{p.id}")
  end

  get "/page/:id" do
    haml :page, locals: {page: Page[params[:id]]}
  end
end
