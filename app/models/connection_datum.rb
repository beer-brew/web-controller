class ConnectionDatum < ApplicationRecord
  belongs_to :connection

  after_create {
    EvaluateJob.perform_later(self) if connection.type.io_type == 'input'
  }
end
