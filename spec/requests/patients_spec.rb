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
      expect(current_path).to eq("/en" + patient_path(@p1))
    end

    it "click Edit link to redirect_to edit" do
      first(:link, "Edit").click
      expect(current_path).to eq("/en" + edit_patient_path(@p1))
    end

    it "click Destroy link to destroy" do
      first(:link, "Destroy").click
      expect(Patient.all.count).to eq(1)
      expect(Patient.unscoped.count).to eq(2)
    end
    
    it "click New Patient link to redirect_to new" do
      click_link "New Patient"
      expect(current_path).to eq("/en" + new_patient_path)
    end

    it "click Location HZ link to redirect_to location#show" do
      first(:link, "HZ").click
      expect(current_path).to eq("/en" + location_path(@l1))
    end

    it "click 中文 link to redirect to /zh-CN/patients" do
      visit "/en/patients"
      click_link "中文"
      expect(current_path).to eq("/zh-CN/patients")
      click_link "English"
    end

  end

  describe "GET /patients/:id" do
    it "works" do
      visit patient_path(@p1)
      expect(page).to have_content("Showing patient")
    end
    it "click 中文 link to redirect to /zh-CN/patients/:id" do
      visit patient_path(@p1)
      click_link "中文"
      expect(current_path).to eq("/zh-CN" + patient_path(@p1))
      click_link "English"
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
      click_button "submit"
      expect(page).to have_content("Patient was successfully created")
    end
    it "click 中文 link to redirect to /zh-CN/patients/new" do
      visit "/en/patients/new"
      click_link "中文"
      expect(current_path).to eq("/zh-CN/patients/new")
      click_link "English"
    end

  end

  describe "PUT /Patients/:id/edit" do
    it "show Patient was successfully updated after edit" do
      visit edit_patient_path(@p1)
      expect(page).to have_content("Editing patient")
      fill_in "Last name", with: "Da"
      click_button "submit"
      expect(page).to have_content("Patient was successfully updated")
    end

    it "click 中文 link to redirect to /zh-CN/patients/:id/edit" do
      visit edit_patient_path(@p1)
      click_link "中文"
      expect(current_path).to eq("/zh-CN" + edit_patient_path(@p1))
      click_link "English"
    end
  end
end


