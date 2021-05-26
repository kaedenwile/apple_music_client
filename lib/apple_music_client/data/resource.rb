# frozen_string_literal: true

module AppleMusicClient
  # Data class that initializes values with the contents
  # of a hash, as expected from Apple Music Api. Contents
  # are frozen at initialization.
  class Resource
    def initialize(args)
      args = args.merge(args["attributes"]) if args.key? "attributes"

      args.each do |k, v|
        set_method = "#{to_snake_case(k)}="
        public_send(set_method, v) if self.class.method_defined? set_method
      end

      freeze
    end

    def to_s
      variables = instance_variables.sort.map do |var|
        "#{var}=#{instance_variable_get(var)}"
      end

      "#{self.class.name} {#{variables.join(", ")}}"
    end

    private

    def to_snake_case(camel_cased_str)
      camel_cased_str.split(/(?=[A-Z])/).join("_").downcase
    end
  end
end
