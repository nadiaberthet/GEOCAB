class User < ApplicationRecord
  JOBS = %w[Infirmier Kinésithérapeute Médecin généraliste Ostéopathe Sage-Femme]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
