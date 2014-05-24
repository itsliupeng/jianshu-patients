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
  scope :onTreatment, -> {where(status: "Treatment")}
  
  def mr
    "MR" + medical_record_number.to_s.rjust(6, '0')
  end
  def fullname
    if middle_name
      "#{last_name}, #{first_name} #{middle_name}"
    else
      "#{last_name}, #{fist_name}"
    end
  end

  def age_in_years
    now = Date.today
    now.year - date_of_birth.year - (date_of_birth.change(year: now.year) > now ? 1 : 0)
  end

  def increment(by = 1)
    self.viewed_count += by
    self.save
  end

  def make_delete
    self.is_deleted = true
    self.save
  end
end
