require "rails_helper"


feature 'User can' do
    let(:user) { FactoryBot.create(:user) }
    before do
        login_as(user, scope: :user)
        visit user_session_path
    end

    it 'displays the inbox' do
        expect(page).to have_content 'Inbox'
        
    end
end