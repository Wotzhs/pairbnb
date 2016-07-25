class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    ReservationMailer.notify_client(args[0], args[1]).deliver
  end
end
