class Stack
  def initialize
    @elements = []
  end

  def push element
    @elements << element
  end

  def top
    @elements[-1]
  end

  def pop
    @elements.pop
    @elements
  end
end

describe Stack do
  describe '#push' do
    let(:stack) { Stack.new }

    it 'puts an element at the top of stack' do
      expect(stack.push(1)).to eq [1]
    end
  end

  describe '#pop' do
    it 'remove the last element from stack' do
      stack = Stack.new
      stack.push 3
      stack.push 4
      stack.push 1
      expect(stack.pop).to eq [3,4]
    end
  end
end

describe SomeClass do
  context "when defining a subject" do
    # GOOD
    # it's okay to define a `subject` here:
    subject { "foo" }

    it { should eq "foo" }
  end

  context "when using an explicit subject" do
    subject { "foo" }

    it "should equal foo" do
      # BAD
      # although it's valid RSpec code and this test passes,
      # it's not okay to use `subject` here:
      expect(subject).to eq "foo"
    end
  end
end
