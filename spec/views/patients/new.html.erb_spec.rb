require 'spec_helper'

describe "patients/new" do
  before(:each) do
    assign(:patient, stub_model(Patient,
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :medical_record_number => 1,
      :gender => "MyString",
      :status => "MyString",
      :viewed_count => 1,
      :is_deleted => false,
      :location => nil
    ).as_new_record)
  end

  it "renders new patient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", patients_path, "post" do
      assert_select "input#patient_first_name[name=?]", "patient[first_name]"
      assert_select "input#patient_middle_name[name=?]", "patient[middle_name]"
      assert_select "input#patient_last_name[name=?]", "patient[last_name]"
      assert_select "input#patient_medical_record_number[name=?]", "patient[medical_record_number]"
      assert_select "input#patient_gender[name=?]", "patient[gender]"
      assert_select "input#patient_status[name=?]", "patient[status]"
      assert_select "input#patient_viewed_count[name=?]", "patient[viewed_count]"
      assert_select "input#patient_is_deleted[name=?]", "patient[is_deleted]"
      assert_select "input#patient_location[name=?]", "patient[location]"
    end
  end
end
