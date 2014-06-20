PadrinoApp::App.controllers  do
  get :index do
    render :index
  end

  websocket :channel do
    on :ping do |message|
      send_message(:channel, session['websocket_user'], {pong: true, data: message})
      broadcast(:channel, {pong: true, data: message, broadcast: true})
    end
  end
end
