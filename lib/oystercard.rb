class Oystercard

attr_reader :bal
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

    def initialize
        @bal = 0
        @card_status = false
    end

    def top_up(amt)
        fail "Your balance is already: £#{@bal}. This transaction would take over the £#{MAXIMUM_BALANCE} limit." if (@bal+amt) > 90
        @bal += amt
    end


    def in_journey?
        @card_status
    end

    def touch_in
        fail "Balance must be #{MINIMUM_BALANCE} or above to touch_in" if bal < MINIMUM_BALANCE
        @card_status = true
    end

    def touch_out
        deduct(1)
        @card_status = false
    end

    private

    def deduct(amt)
        @bal -= amt
    end

end