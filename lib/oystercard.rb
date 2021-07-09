class Oystercard

attr_reader :bal, :entry_station, :exit_station, :history_journey, :trip
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

    def initialize
        @bal = 0
        @in_journey = false
        @history_journey = []
    end

    def top_up(amt)
        fail "Your balance is already: £#{@bal}. This transaction would take over the £#{MAXIMUM_BALANCE} limit." if (@bal+amt) > 90
        @bal += amt
    end


    def in_journey?
        !entry_station.nil?
    end

    def touch_in(entry_station)
        fail "Balance must be #{MINIMUM_BALANCE} or above to touch_in" if bal < MINIMUM_BALANCE
        
        @entry_station = entry_station
        @in_journey = true
    end

    def touch_out(exit_station)
        deduct(1)
        @in_journey = false
        @exit_station = exit_station
        update_trip
        @entry_station = nil
    end

    def update_trip
        @trip = { entry_station: @entry_station, exit_station: @exit_station  }
    end

    private

    def deduct(amt)
        @bal -= amt
    end

end