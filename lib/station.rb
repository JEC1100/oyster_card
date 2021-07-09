class Station

    attr_reader :station_name, :station_zone

    def name(input)
        @station_name = input
    end

    def zone(zone_input)
        @station_zone = zone_input
    end
end