class Appointment < ApplicationRecord
  belongs_to :patient

  validates :title, presence: true
end
