class Medium < ActiveRecord::Base

  def url_params
    {media_type: media_type, id: id }
  end
end
