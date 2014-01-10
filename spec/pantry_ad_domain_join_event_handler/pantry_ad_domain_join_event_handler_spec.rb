require 'spec_helper'
require_relative '../../pantry_ad_domain_joined_event_handler/pantry_ad_domain_joined_event_handler'

describe Wonga::Daemon::PantryAdDomainJoinedEventHandler do
  let(:api_client) { instance_double('Wonga::Daemon::PantryApiClient').as_null_object }
  let(:logger) { instance_double('Logger').as_null_object }
  subject { described_class.new(api_client,logger) }
  let(:message) { { 'pantry_request_id' => 42 } }
  it_behaves_like "handler"

  it "updates Pantry using PantryApiClient" do
    expect(api_client).to receive(:update_ec2_instance).with(
      42,
      { 'user_id' => 1, 'pantry_request_id' => 42, 'instance_id' => 24, :joined => true }
    )
    subject.handle_message(message)
  end
end

