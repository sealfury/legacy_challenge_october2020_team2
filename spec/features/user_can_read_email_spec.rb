require "rails_helper"


feature 'User can' do
    let(:user) { FactoryBot.create(:user) }
    before do
        login_as(user, scope: :user)
        visit user_session_path
    end

    it 'displays the inbox button' do
        expect(page).to have_content 'Inbox'
    end

    it 'navigates to inbox' do
        click_on 'Inbox'
        expect(page).to have_content 'Sent'
        expect(page).to have_content 'Trash'
    end
end