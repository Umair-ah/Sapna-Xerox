module Roleable

    extend ActiveSupport::Concern
    included do
      # List user roles
      ROLES = [:SpiralBinding, :Lamination, :Folder, :File]
    
      # json column to store roles 
      store_accessor :roles, *ROLES
    
      # Cast roles to/from booleans
      ROLES.each do |role|
        scope role, -> { where("roles @> ?", {role => true}.to_json) }
        define_method(:"#{role}=") { |value| super ActiveRecord::Type::Boolean.new.cast(value) }
        define_method(:"#{role}?") { send(role) }
      end
    
      def active_roles # Where value true
        ROLES.select { |role| send(:"#{role}?") }.compact
      end

    end
end