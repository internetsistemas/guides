class product < ActiveRecord::Base
  belongs_to :supplier
  validates :supplier, presence: true

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


RSpec.describe Product, :type => :model do
  context 'Associations' do
    it { should belong_to(:supplier) }
  end

  context 'DB validations' do
    it { should validate_presence_of(:quantity) }
  end

  context 'Attributes' do
    subject { build :stock }
    it { should respond_to(:product) }
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
