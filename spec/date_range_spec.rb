require_relative "spec_helper"


describe "Date Range Class" do
    let (:dates) {Hotel::Date_Range.new(start_date: 19940901, end_date: 19940904)}
    
    it "is an instance of Date Range" do
        expect(dates).must_be_kind_of Hotel::Date_Range
    end

    it "turns start date into instance of Date" do
        expect(dates.start_date).must_be_kind_of Date
    end

    it "turns end date into instance of Date" do
        expect(dates.end_date).must_be_kind_of Date
    end

    it "raises an exception for end date before start date" do
        expect{Hotel::Date_Range.new(start_date: 19960716, end_date: 19940904)}.must_raise ArgumentError
    end

    it "fills in the range array with instances of Dates" do
        expect(dates.range).must_be_kind_of Array
        expect(dates.range[0]).must_be_kind_of Date
    end

    it "takes out last date to show that the room will be available that day again" do
        expect(dates.range.length).must_equal 3
    end
  
end