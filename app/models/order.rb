class Order < ApplicationRecord

    has_many_attached :files
    has_many :homes, dependent: :destroy
    has_many :picks, dependent: :destroy

    validates :paper_size, presence: true
    validates :color, presence: true
    validates :quantity, presence: true, numericality: true
    validates :paper_style, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone_number, presence: true, numericality: true, length: { minimum: 10, maximum: 10, too_long: "do not include +91/91" }, format: { with: /\A\d+\z/, alert: "Integer only. No sign allowed." }
    validates :email, presence: true
    validates :delivery, presence: true
    validate :correct_file_type

    

    include Roleable

    private

        def correct_file_type
            if files.attached? == false
                errors.add(:files, ",You forgot to upload your Files for printing/xerox")
            end
        end

        

        

   


end
