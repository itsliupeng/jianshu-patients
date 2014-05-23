class Patient < ActiveRecord::Base
  GENDER_TYPE =  ["Not Available", "Male", "Female"]
  STATUS_TYPE =  ["Initial", "Referred", "Treatment", "Closed"]


  belongs_to :location

  validates :first_name, :last_name, :status, :location_id, presence: true
  validates :first_name, length: {maximum: 30}
  validates :middle_name, length: {maximum: 10}
  validates :last_name, length: {maximum: 30}
  validates :gender, inclusion: GENDER_TYPE
  validates :status, inclusion: STATUS_TYPE

  default_scope {where(is_deleted: false)}
  scope :on_treatment, -> {where(status: "Treatment")}
  
  def mr
    "MR" + medical_record_number.to_s.rjust(6, '0')
  end
  def fullname
    "#{last_name}, #{first_name} #{middle_name}"
  end

  def age_in_years
    now = Date.today
    now.year - date_of_birth.year - (date_of_birth.change(year: now.year) > now ? 1 : 0)
  end
end
