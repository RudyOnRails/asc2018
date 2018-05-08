class RemoteIdentifierJob < ApplicationJob
  def perform(work)
    begin
      work.identifier = ["something"]
      work.save
      # raise "derp"
    rescue RuntimeError => e
    end
  end
end