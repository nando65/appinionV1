class Post < ActiveRecord::Base

   has_attached_file :video, styles: {
    :medium => {
      :geometry => "300x300",
      :format => 'mp4'
    },
    :thumb => { :geometry => "160x120", :format => 'jpeg', :time => 10}
  }, :processors => [:transcoder]

end
