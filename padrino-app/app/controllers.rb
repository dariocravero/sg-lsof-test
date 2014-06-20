PadrinoApp::App.controllers  do
  get :index do
    render :index
  end

  websocket :channel do
    on :ping do |message|
      send_message(:channel, session['websocket_user'], {pong: true, data: render(:ping, formats: :json)})
    end
  end
end
