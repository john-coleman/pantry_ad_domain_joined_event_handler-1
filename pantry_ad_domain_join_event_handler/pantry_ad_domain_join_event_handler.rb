module Wonga
  module Daemon
    class PantryAdDomainJoinEventHandler
      def initialize(api_client)
        @api_client = api_client
      end

      def handle_message(message)
        message[:joined] = true
        @api_client.update_ec2_instance(message['pantry_request_id'], message)
      end
    end
  end
end
