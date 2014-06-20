PadrinoApp::App.controllers  do
  get :index do
    render :index
  end

  get :random, with: :something, cache: true do
    expires 30
    cache_key do
      params[:something]
    end
    Time.new.to_s
  end

  websocket :channel do
    on :ping do |message|
      send_message(:channel, session['websocket_user'], {pong: true, data: render(:ping, formats: :json)})
    end
  end
end
