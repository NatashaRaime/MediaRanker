class Medium < ActiveRecord::Base

  def upvote
    self.votes += 1
  end

  def url_params
    {media_type: media_type, id: id }
  end
end
