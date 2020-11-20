class Doctor < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :users, through: :appointmets
end
