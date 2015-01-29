# app/models/product.rb
class Product < ActiveRecord::Base
  belongs_to :supplier

  validates :supplier, presence: true, associated: true
  validates :quantity, presence: true

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
RSpec.describe Product, :type => :model do
  context 'Associations' do
    it { is_expected.to belong_to(:supplier) }
  end

  context 'DB validations' do
    it { is_expected.to validate_presence_of(:supplier) }
    it { is_expected.to validate_presence_of(:quantity) }
  end

  context 'Attributes' do
    it { is_expected.to have_db_column(:quantity) }
  end

  context 'Indexes' do
    it { is_expected.to have_db_index(:supplier) }
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
