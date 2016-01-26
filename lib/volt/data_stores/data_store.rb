require 'volt/data_stores/base_adaptor_server'
require 'thread'

module Volt
  class DataStore
    @@data_store_mutex = Mutex.new

    # TODO: cache based on volt_app
    def self.fetch(volt_app)
      @@data_store_mutex.synchronize do
        # Cache the driver
        return @adaptor if @adaptor

        database_name = self.get_db_driver_name
        unless database_name
          raise "No data store configured, please include volt-mongo or " +
            "another similar gem."
        end
        adaptor_name = database_name.camelize + 'AdaptorServer'

        root = Volt::DataStore
        if root.const_defined?(adaptor_name)
          adaptor_name = root.const_get(adaptor_name)
          @adaptor = adaptor_name.new(volt_app)
        else
          raise "#{database_name} is not a supported database (as configured " +
          "by Volt.config.db.driver), you might be missing a " +
          "volt-#{database_name} gem"
        end

        @adaptor
      end
    end

    def self.adaptor_client
      # Load the client adaptor
      @adaptor_client ||= begin
        ds_name = Volt.config.public.datastore_name
        unless ds_name
          raise "No data store configured, please include volt-mongo or " +
            "another similar gem."
        end
        adaptor_class_name = ds_name.capitalize + "AdaptorClient"
        Volt::DataStore.const_get(adaptor_class_name)
      end
    end

    private

    def self.get_db_driver_name
      db_name = Volt.config.db.driver
      unless db_name
        # Default to mongo or sqlite if either volt-mongo or volt-sql adapters are in the bundle.
        root = Volt::DataStore
        if root.const_defined?('MongoAdaptorServer')
          db_name = 'mongo'
        elsif root.const_defined?('SqlAdaptorServer')
          db_name = 'sqlite'
        end
      end
      db_name
    end
  end
end
