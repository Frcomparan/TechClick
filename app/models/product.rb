class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :name, :description, :price, :discount, presence: true;
  validates :price, numericality: { message: "El precio debe tener un valor numerico" }
  validates :discount, numericality: { only_integer: true, message: "Debes ingresar un numero entero" }
  validate :validate_photos

  scope :filter_by_price_lower, -> { order :price }
  scope :filter_by_price_higher, -> { order price: :desc }
  scope :filter_by_score, -> { order score: :desc }
  scope :filter_by_date, -> { order created_at: :desc }

  def self.search(search)
    if search !=""
      product = self.where('name ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%")
    else 
      self.order(:id).all
    end
  end

  def self.search_filter(filtering_param)
    results = self.where(nil)
    results = results.public_send("filter_by_#{filtering_param}")
    results
  end

  private
  def validate_photos
    if photos.size > 0
      photos.each do |photo| 
        unless photo.content_type =~ /^image\/(jpeg|pjpeg|gif|png|bmp)$/ 
          errors.add(:dni_photo, "Una de las imagenes tiene un formato invalido") 
        end
      end
    else
      errors.add(:photos, "Debe subir al menos una foto del producto") 
    end
  end
end
