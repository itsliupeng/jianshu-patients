require 'spec_helper'

describe Location do
  let(:attrs) do
    {
      code: "123",
      name: "HZ"
    }
  end  
  it "has_many patients" do
    expect(Location.reflect_on_association(:patients).macro).to eq(:has_many)
  end

  it "new location with valid attributes" do
    location = Location.new(attrs)
    expect(location).to be_a(Location)
  end

  describe "attributes" do
    describe "code" do
      it "rejects length > 10" do
        c = 'a' * 11
        location = Location.new(attrs.merge(code: c))
        expect(location).to be_invalid
      end

      it "accepts length = 10" do
        c = 'a' * 10
        location = Location.new(attrs.merge(code: c))
        expect(location).to be_valid
      end
    end

    describe "name" do
      it "rejects length > 80" do
        c = 'a' * 81
        location = Location.new(attrs.merge(name: c))
        expect(location).to be_invalid
      end

      it "accepts length = 80" do
        c = 'a' * 80
        location = Location.new(attrs.merge(name: c))
        expect(location).to be_valid
      end

      it "requires a name" do
        location = Location.new(attrs.merge(name: ""))
        expect(location).to be_invalid
      end

    end
  end

end
