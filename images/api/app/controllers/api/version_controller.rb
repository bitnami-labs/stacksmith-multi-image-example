class Api::VersionController < ApplicationController
  def version
    info = {
      id: (File.read('.build.id') rescue 'N/A').strip,
      date: (File.read('.build.date') rescue 'N/A').strip,
    }
    render json: info
  end
end
