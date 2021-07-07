class Oystercard

attr_reader :bal, :entry_station
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

    def initialize
        @bal = 0
        @in_journey = false
    end

    def top_up(amt)
        fail "Your balance is already: £#{@bal}. This transaction would take over the £#{MAXIMUM_BALANCE} limit." if (@bal+amt) > 90
        @bal += amt
    end


    def in_journey?
        !!entry_station
    end

    def touch_in(station)
        fail "Balance must be #{MINIMUM_BALANCE} or above to touch_in" if bal < MINIMUM_BALANCE
        @entry_station = station
        @in_journey = true
    end

    def touch_out
        deduct(1)
        @in_journey = false
        @entry_station = nil
    end

    private

    def deduct(amt)
        @bal -= amt
    end

end