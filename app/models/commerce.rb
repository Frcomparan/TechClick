class Commerce < ApplicationRecord
  belongs_to :user

  has_one_attached :dni_photo

  # Validaciones
  # Validate dni file format
  validate :validate_dni_photo
  # Validate RFC structure
  validate :validate_RFC_structure
  # Validación del Codigo Postal
  validate :validate_postal_code_structure

  private
  def validate_dni_photo
    unless dni_photo and dni_photo.content_type =~ /^image\/(jpeg|pjpeg|gif|png|bmp)$/ 
      errors.add(:dni_photo, "La imagen subida no es valida") 
    end
  end

  def validate_RFC_structure
    unless rfc =~ /^[A-Z]{4}[0-9]{6}([A-Z]|[0-9]){3}$/
      errors.add(:rfc, " El RFC invalido") 
    end
  end

  def validate_postal_code_structure
    unless postal_code =~ /^[0-9]{5}$/
      errors.add(:postal_code, " El codigo postal invalido") 
    end
  end
end
