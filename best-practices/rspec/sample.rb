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

describe SomeClass do
  #BAD - Not used in all examples
  #BAD - ! Not needed
  let!(:project) { create :project, hours: 10}
  let!(:project_two) { create :project, hours: 20 }
  let!(:project_three) { create :project, hours: 30 }
  let!(:projects) { [project, project_two, project_three] }
  
  #Good - Used in all examples
  subject { described_class.new }
	
  context "when not database related" do
	
	subject.sum(projects, 10)
	
	#BAD - Unecessary its
	it { expect(project.hours).to eq 20 }
    it { expect(project_two.hours).to eq 20 }
    it { expect(project_three.hours).to eq 30 }
  end

  context "when objects only used inside example" do
	#Good - 'let' only within the scope they are used 
	let(:other_project) { Project.new hours: 10 }
	let(:other_project_two) { Project.new hours: 20 }
	let(:other_project_three) { Project.new hours: 20 }
	let(:other_projects) { [another_project, other_project_two, other_project_three] }
	
	#GOOD - Group your tests with same focus in one it
	it "sums negative" do
      subject.sum(other_projects, -5)
	  
	  expect(other_project.hours).to eq 5
	  expect(other_project_two.hours).to eq 15
	  expect(other_project_three.hours).to eq 15
    end
  end
end
