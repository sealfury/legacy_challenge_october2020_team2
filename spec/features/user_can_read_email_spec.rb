require "rails_helper"

feature 'User can read email' do
    context 'with emails in db' do
        before do
            create(:inbox)

            visit root_path
        end

        it 'expect inbox to exist' do
            expect(inbox).to_be :active
        end
    end
end