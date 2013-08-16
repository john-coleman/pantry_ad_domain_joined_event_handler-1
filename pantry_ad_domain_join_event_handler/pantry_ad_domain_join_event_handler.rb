module Wonga
  module Daemon
    class PantryAdDomainJoinEventHandler
      def initialize(api_client)
        @api_client = api_client
      end

      def handle_message(message)
        @api_client.update_ec2_instance(message['pantry_request_id'], { joined: true, instance_id: message['instance_id'] })
      end
    end
  end
end
