require 'spec_helper'

describe "Patients" do
  before :each do
    @l1 = FactoryGirl.create(:location)
    @p1 = FactoryGirl.create(:patient, location: @l1)
    @p2 = FactoryGirl.create(:patient, location: @l1) 
  end


  describe "GET /patients" do

    before :each do
      visit "/patients"
    end

    it "works" do
      expect(page).to have_content("Listing patients")
      expect(page).to have_content("MR")
      expect(page).to have_content("HZ")
      expect(page).to have_content("Liu, Peng Da")
      expect(page).to have_content("10")
      expect(page).to have_content("Male")
      expect(page).to have_content("Initial")
    end

    it "click Show link to redirect_to show" do
      first(:link, "Show").click
      expect(current_path).to eq(patient_path(@p1))
    end

    it "click Edit link to redirect_to edit" do
      first(:link, "Edit").click
      expect(current_path).to eq(edit_patient_path(@p1))
    end

    it "click Destroy link to destroy" do
      first(:link, "Destroy").click
      expect(Patient.all.count).to eq(1)
      expect(Patient.unscoped.count).to eq(2)
    end
    
    it "click New Patient link to redirect_to new" do
      click_link "New Patient"
      expect(current_path).to eq(new_patient_path)
    end

    it "click Locaiont HZ linkt to redirect_to location#show" do
      first(:link, "HZ").click
      expect(current_path).to eq(location_path(@l1))
    end

  end

  describe "GET /patients/:id" do
    it "works" do
      visit patient_path(@p1)
      expect(page).to have_content("Patient")
    end
  end

  describe "GET /patients/new" do
    it "show Patient was successfully created after create" do
      visit "/patients/new"
      fill_in "First name", with: "Liu"
      fill_in "Last name", with: "Peng"
      choose "patient_gender_male"
      select "Initial", from: "Status"
      select "HZ", from: "Location"
      click_button "Create Patient"
      expect(page).to have_content("Patient was successfully created")
    end
  end


  describe "EDIT /Patients/edit/:id" do
    it "show Patient was successfully updated after edit" do
      visit edit_patient_path(@p1)
      fill_in "Last name", with: "Da"
      click_button "Update Patient"
      expect(page).to have_content("Patient was successfully updated")
    end
  end
end
