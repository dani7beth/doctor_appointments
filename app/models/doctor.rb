class Doctor < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointmets
end
