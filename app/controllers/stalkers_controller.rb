class StalkersController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
  end

  def leaved
    WebsocketRails[:stalkers].trigger 'leaved'
  end
end
