class App < Sinatra::Application
  get "/page/new" do
    p = Page.new
    p.name = "hello"
    haml :page, locals: {page: p}
  end

  post "/page/new" do
    "hello"
  end

  get "/page/:id" do
    haml :page, locals: {page: Page[params[:id]]}
  end
end
