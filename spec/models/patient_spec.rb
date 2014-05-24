require 'spec_helper'

describe Patient, :type => :model do

  let(:p) { FactoryGirl.build(:patient)}

  it "belongs_to location" do
    expect(Patient.reflect_on_association(:location).macro).to eq(:belongs_to)
  end

  describe "attributes" do

    it "creats a patient given valid attributes" do
      expect(p).to be_valid
    end

    describe "first_name" do
      it "requires a first_name" do
        expect(FactoryGirl.build(:patient, first_name: "")).not_to be_valid
      end

      it "rejects first_name that > 30 characters" do
        name = "a" * 31
        expect(FactoryGirl.build(:patient, first_name: name)).not_to be_valid
      end
      it "accepts first_name that = 30 characters" do
        name = "a" * 30
        expect(FactoryGirl.build(:patient, first_name: name)).to be_valid
      end
    end

    describe "middle_name" do
      it "not require a middle_name" do
        expect(build(:patient, middle_name: "")).to be_valid
      end

      it "rejects middle_name that > 10 characters" do
        name = "a" * 11
        expect(build(:patient, middle_name: name)).to be_invalid
      end
      it "accepts first_name that = 10 characters" do
        name = "a" * 10
        expect(build(:patient, middle_name: name)).to be_valid
      end
    end

    describe "last_name" do
      it "requires a last_name" do
        expect(build(:patient, last_name: "")).to be_invalid
      end
      it "rejects last_name that > 30 characters" do
        name = 'a' * 31
        expect(build(:patient, last_name: name)).to be_invalid
      end
      it "accepts last_name that = 30 characters" do
        name = "a" * 30
        expect(build(:patient, last_name: name)).to be_valid
      end
    end

    describe "gender" do

      it "rejects gender not in Patient::GENDER_TYPE" do
        %w(male female man women boy girl).each do |g|
          expect(build(:patient, gender: g)).to be_invalid
        end
      end

      it "accepts gender in Patient::GENDER_TYPE" do
        Patient::GENDER_TYPE.each do |g|
          expect(build(:patient, gender: g)).to be_valid
        end
      end
    end

    describe "status" do
      it "requires a status" do
        expect(build(:patient, status: "")).to be_invalid
      end

      it "rejects status not in Patient::STATUS_TYPE" do
        %w(initial referred treatement closed).each do |s|
          expect(build(:patient, status: s)).to be_invalid
        end
      end

      it "accepts status in Patient::STATUS_TYPE" do
        Patient::STATUS_TYPE.each do |s|
          expect(build(:patient, status: s)).to be_valid
        end
      end
    end

    describe "location_id" do
      it "requires a location" do
        # expect(Patient.new(attrs.merge(location_id: nil))).to be_invalid
        expect(build(:patient, location: nil)).not_to be_valid
      end
    end
  end

  describe "#method" do

    subject { build(:patient, medical_record_number: 1) }

    it "#mr" do
      expect(subject.respond_to?(:mr)).to be_true
      expect(subject.mr).to eq("MR000001")
    end

    it "#fullname" do
      expect(subject.respond_to?(:fullname)).to be_true
      expect(subject.fullname).to eq("Liu, Peng Da")
    end

    it "#age_in_years" do
      expect(subject.respond_to?(:age_in_years)).to be_true
      expect(subject.age_in_years).to eq(10)
    end

    it "#increment" do
      expect {subject.increment}.to change{subject.viewed_count}.by(1)
    end

    it "#make_delete" do
      expect {create(:patient).make_delete}.to change{Patient.count}.by(0)
    end

  end

  describe "scope" do
    it "default_scope works" do
      expect{FactoryGirl.create(:patient, is_deleted: true)}.not_to change{Patient.count}.by(1)
    end

    it "onTreatment scope works" do
      p1 = FactoryGirl.create(:patient, status: "Treatment")
      p2 = FactoryGirl.create(:patient, status: "Treatment")
      expect(Patient.onTreatment).to eq([p1, p2])
    end
  end
end
