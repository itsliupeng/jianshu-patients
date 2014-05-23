require 'spec_helper'

describe Patient, :type => :model do
  let :attrs do
    {
      first_name: "Peng",
      last_name: "Liu",
      status: "Initial",
      location_id: 1,
      gender: "Not Available"
    }
  end

  it "belongs_to location" do
    
    expect(Patient.reflect_on_association(:location).macro).to eq(:belongs_to)
  end

  describe "attributes" do
    it "creats a patient given valid attributes" do
     expect(Patient.new(attrs)).to be_valid
    end

    describe "first_name" do
      it "requires a first_name" do
        expect(Patient.new(attrs.merge(first_name: ""))).to be_invalid
      end

      it "rejects first_name that > 30 characters" do
        name = "a" * 31
        expect(Patient.new(attrs.merge(first_name: name))).to be_invalid
      end
      it "accepts first_name that = 30 characters" do
        name = "a" * 30
        expect(Patient.new(attrs.merge(first_name: name))).to be_valid
      end
    end

    describe "middle_name" do
      it "not require a middle_name" do
        expect(Patient.new(attrs.merge(middle_name: ""))).to be_valid
      end

      it "rejects middle_name that > 10 characters" do
        name = "a" * 11
        expect(Patient.new(attrs.merge(middle_name: name))).to be_invalid
      end
      it "accepts first_name that = 10 characters" do
        name = "a" * 10
        expect(Patient.new(attrs.merge(middle_name: name))).to be_valid
      end
    end

    describe "last_name" do
      it "requires a last_name" do
        expect(Patient.new(attrs.merge(last_name: ""))).to be_invalid
      end
      it "rejects last_name that > 30 characters" do
        name = 'a' * 31
        expect(Patient.new(attrs.merge(last_name: name))).to be_invalid
      end
      it "accepts last_name that = 30 characters" do
        name = "a" * 30
        expect(Patient.new(attrs.merge(last_name: name))).to be_valid
      end
    end

    describe "gender" do
      # it "not require a gender" do
      #   expect(Patient.new(attrs.merge(gender: ""))).to be_valid
      # end

      it "rejects gender not in Patient::GENDER_TYPE" do
        %w(male female man women boy girl).each do |g|
          expect(Patient.new(attrs.merge(gender: g))).to be_invalid
        end
      end

      it "accepts gender in Patient::GENDER_TYPE" do
        Patient::GENDER_TYPE.each do |g|
          expect(Patient.new(attrs.merge(gender: g))).to be_valid
        end
      end
    end

    describe "status" do
      it "requires a status" do
        expect(Patient.new(attrs.merge(status: ""))).to be_invalid
      end

      it "rejects status not in Patient::STATUS_TYPE" do
        %w(initial referred treatement closed).each do |s|
          expect(Patient.new(attrs.merge(status: s))).to be_invalid
        end
      end

      it "accepts status in Patient::STATUS_TYPE" do
        Patient::STATUS_TYPE.each do |s|
          expect(Patient.new(attrs.merge(status: s))).to be_valid
        end
      end
    end

    describe "location_id" do
      it "requires a location" do
        expect(Patient.new(attrs.merge(location_id: nil))).to be_invalid
      end
    end
  end

  describe "#method" do

    subject { Patient.create(attrs.merge(medical_record_number: 1, date_of_birth: 10.years.ago.to_date )) }

    it "#mr" do
      expect(subject.respond_to?(:mr)).to be_true
      expect(subject.mr).to eq("MR000001")
    end

    it "#fullname" do
      expect(subject.respond_to?(:fullname)).to be_true
      expect(subject.fullname).to eq("Liu, Peng ")
    end

    it "#age_in_years" do
      expect(subject.respond_to?(:age_in_years)).to be_true
      expect(subject.age_in_years).to eq(10)
    end

  end
end
