class Oystercard

attr_reader :bal
MAXIMUM_BALANCE = 90

    def initialize
        @bal = 0
        @card_status = false
    end

    def top_up(amt)
        fail "Your balance is already: £#{@bal}. This transaction would take over the £#{MAXIMUM_BALANCE} limit." if (@bal+amt) > 90
        @bal += amt
    end

    def deduct(amt)
        @bal -= amt
    end

    def in_journey?
        @card_status
    end

    def touch_in
        @card_status = true
    end

end