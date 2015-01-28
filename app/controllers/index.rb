get '/' do
  # Look in app/views/index.erb
  @urls = Url.all
  erb :index
end

post '/urls' do
  if params[:thelink] =~ /^http:\/\//
    link = params[:thelink]
  else
    link = "http://#{params[:thelink]}"
  end

  Url.create(long_url: link)
  redirect to('/')
end

get '/:short_url' do

  itslink = Url.find_by_short_url(params[:short_url])
  redirect itslink.long_url

  itslink.click_count += 1

end
