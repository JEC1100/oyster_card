require 'oystercard'

describe Oystercard do
    it 'Creates an instance of Oystercard' do
        expect(subject).to be_instance_of(Oystercard)
    end
    it 'Card has default balance zero' do
        expect(subject.bal).to eq(0)
    end

    it "Adds empty history_journey" do 
        expect(subject.history_journey).to eq []
    end


describe '#top_up' do
let(:bal) { subject.bal }

    it 'Card responds to top_up' do
        expect(subject).to respond_to(:top_up).with(1).argument
    end
    it 'top_up will add to balance' do
        expect{ subject.top_up(1) }.to change{ subject.bal }.by(1)
    end
    it 'Raises error if attempting to add more than £90 limit' do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up(maximum_balance)
        expect { subject.top_up(1) }.to raise_error "Your balance is already: £#{bal}. This transaction would take over the £#{maximum_balance} limit."
    end
end
    describe '#deduct' do
        xit 'Card responds to deduct' do
            expect(subject).to respond_to(:deduct).with(1).argument
        end
        xit 'Deducts the fayre from card balance' do
            expect{ subject.deduct(1) }.to change{ subject.bal }.by(-1)
        end
    end

    describe '#in_journey' do
        it 'Is initially not in_journey' do
            expect(subject).not_to be_in_journey
        end
    end

    describe '#touch_in' do
    let(:station){ double :station }
        it 'Touches card in' do
            subject.top_up(10)
            subject.touch_in(station)
            expect(subject).to be_in_journey
        end
    end

    describe '#touch_out' do
        it 'Touches card out' do
        expect(subject).not_to be_in_journey
        end
    end

    describe '#touch_out' do
    let(:station){ double :station }
    it 'Touches card out' do
        subject.top_up(10)
        subject.touch_in(station)
        subject.touch_out
        expect(subject.in_journey?).to eq(false)
    end

    # it do
    
    # end
    
    it "Check that amt is deducted on touch_out" do
        subject.top_up(10)
        subject.touch_in(station)
        expect { subject.touch_out }.to change{ subject.bal }.by(-1)
    end
    
    it "Check if entry_station = nil on touch_out" do
        subject.top_up(10)
        subject.touch_in(station)
        subject.touch_out
        expect(subject.entry_station).to eq(nil)
    end
end

    describe 'Prevent journey on empty card' do
        let(:station){ double :station }
        it 'Raises error if attempting to touch in when limit less than MINIMUM BALANCE' do
            expect { subject.touch_in(station) }.to raise_error "Balance must be #{Oystercard::MINIMUM_BALANCE} or above to touch_in"
        end
    end

    describe "save entry station" do 
        let(:station){ double :station }
        it "saves entry station" do
            subject.top_up(10)
            subject.touch_in(station)
            expect(subject.entry_station).to eq station
        end
    end

    
            

end