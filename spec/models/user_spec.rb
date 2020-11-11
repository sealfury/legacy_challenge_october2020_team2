RSpec.describe User, type: :model do
    describe 'Validations' do
        it { is_expected.to validate_uniqueness_of :name }
    end

    describe 'Factory' do
        it 'expects a valid Factory' do
            expect(create(:user)).to be_valid
        end
    end
end