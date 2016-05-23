class TimerJob < ApplicationJob
  queue_as :default

  def perform(connection)
    ConnectionDatum.create(
      value: 1.0,
      time: DateTime.now,
      name: connection.name,
      connection_id: connection.id,
      data_id: rand(10**8)
    )
  end
end
