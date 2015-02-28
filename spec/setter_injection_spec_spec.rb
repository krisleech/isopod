RSpec.describe 'Medicine' do
    let(:medicated_class) { new_medicated_class }

    def new_medicated_class
      Class.new do
        include Medicine.di

        # access to otherwise private method
        def _vote_repo
          vote_repo
        end
      end
    end

    subject { medicated_class.new }

  describe '#injections' do
    it 'starts empty' do
      expect(subject.injections).to be_empty
    end

    it 'returns Injections object' do
      expect(subject.injections).to be_an_instance_of(Medicine::Injections)
    end

    it 'is frozen' do
      expect(subject.injections).to be_frozen
    end
  end

  describe '#inject' do
    it 'is a public method' do
      expect(subject).to respond_to :inject
    end

    it 'injects a dependency' do
      subject.inject(:name, double)
      expect(subject.injections).not_to be_empty
    end
  end
end