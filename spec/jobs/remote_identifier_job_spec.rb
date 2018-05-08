require 'rails_helper'

RSpec.describe RemoteIdentifierJob do
  include ActiveJob::TestHelper

  let(:work) { Work.create!(title: ["Free Willy"]) }

  it "assigns an identifier" do
    perform_enqueued_jobs do
      described_class.perform_later(work)
    end

    expect(work.reload.identifier).to eq ["something"]
  end
end