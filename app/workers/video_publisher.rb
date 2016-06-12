class VideoPublisher
  include Sidekiq::Worker
  include Sidetiq::Schedulable


    recurrence { minutely.second_of_minute(100, 0, 0, 10, 0, 5) }


  def perform
    Video.where(published: nil).each do |video|
      video.publish! if video.all_formats_encoded?
    end
  end
end