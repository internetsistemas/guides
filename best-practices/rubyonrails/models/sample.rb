# app/models/product.rb
class Product < ActiveRecord::Base
  has_many :reviews
  
  belongs_to :supplier

  validates :supplier, presence: true, associated: true
  validates :quantity, presence: true
  
  has_enumeration_for :status, with: ProductStatus, required: true, create_helpers: true, create_scopes: true

  def self.canceled
    where(status: :canceled)
  end

  def canceled?
    status == :canceled
  end

  def cancel!
    update!(status: :canceled)
  end
end

# spec/models/product_spec.rb
RSpec.describe Product, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:reviews) }
    it { is_expected.to belong_to(:supplier) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:supplier) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_inclusion_of(:status).in_range(ProductStatus.list) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:quantity) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:supplier) }
  end

  context 'factory' do
    it 'be valid' do
      product = build :product
      expect(product).to be_valid
    end

    it 'be invalid' do
      product = build :invalid_product
      expect(product).not_to be_valid
    end
  end
  
  context 'enumerations' do
    ProductStatus.list.each do |enumeration|
      let!(:product) { create :product, list: enumeration }
      let!(:key) { ProductStatus.key_for(enumeration) }

      it { expect(ProductStatus.send(key)).to eq([product]) }
      it { expect(product).to respond_to("#{key}?") }
    end
  end

  describe '.class_method' do
    let!(:products) {...}

    it 'awesome test' do
      expect(Product.canceled).to eq([products])
    end
  end

  describe '#instance_method' do
    let(:product) {...}

    it 'awesome test name' do
      expect(product.status).to eq(:canceled)
    end

    it 'awesome test name 2' do
      expect(product).to be_canceled
    end
  end
end
