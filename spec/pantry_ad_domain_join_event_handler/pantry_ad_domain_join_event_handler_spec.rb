require 'spec_helper'
require_relative '../../pantry_ad_domain_join_event_handler/pantry_ad_domain_join_event_handler'

describe Wonga::Daemon::PantryAdDomainJoinEventHandler do
  let(:api_client) { instance_double('Wonga::Daemon::PantryApiClient').as_null_object }
  subject { described_class.new(api_client) }
  let(:message) { { 'pantry_request_id' => 42, 'instance_id' => 24 } }
  it_behaves_like "handler"

  it "updates Pantry using PantryApiClient" do
    expect(api_client).to receive(:update_ec2_instance).with(42, { instance_id: 24, joined: true })
    subject.handle_message(message)
  end
end

