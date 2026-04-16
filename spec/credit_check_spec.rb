require 'rspec'
require_relative '../lib/credit_check.rb'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe do 
  describe 'initialization' do
    it 'exists and has a card number and limit' do
      card_number = "5541808923795240"
      credit_check = CreditCheck.new(card_number, 15000)
      expect(credit_check).to be_an_instance_of(CreditCheck)
      expect(credit_check.card_number).to eq(card_number)
      expect(credit_check.limit).to eq(15000)
    end
  end

  describe 'instance methods' do
    describe "#is_valid?" do
      it 'returns boolean of if card_number is valid' do
        valid_card_number = "5541808923795240"
        credit_check = CreditCheck.new(valid_card_number, 15000)
        expect(credit_check.is_valid?).to be true

        invalid_card_number = "5541801923795240"
        invalid_credit_check = CreditCheck.new(invalid_card_number, 15000)
        expect(invalid_credit_check.is_valid?).to be false
      end
      it 'returns false if the card_number is incomplete' do
        incomplete_card_number = "5541802379520"
        incomplete_credit_check = CreditCheck.new(incomplete_card_number, 15000)
        expect(incomplete_credit_check.is_valid?).to be false
      end
    end
    describe '#last_four' do
      it 'returns a String of the last four digits of the card number' do
        card_number = "5541808923795240"
        credit_check = CreditCheck.new(card_number, 15000)
        expect(credit_check.last_four).to be_an_instance_of(String)
        expect(credit_check.last_four).to eq("5240")
      end
    end
  end
end
