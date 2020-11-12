require "rails_helper"
require "pry"


feature 'User can' do
    let(:user) { FactoryBot.create(:user) }
    before do
        login_as(user, scope: :user)
        visit user_session_path
    end

    it 'display the inbox button' do
        expect(page).to have_content 'Inbox'
    end

    it 'navigate to inbox' do
        click_on 'Inbox'
        expect(page).to have_content 'Sent'
        expect(page).to have_content 'Trash'
    end
end

feature 'User' do
    let(:sender) { FactoryBot.create(:user, name: 'Nametoo', email: 'sender@mail.com') }
    let(:receiver) { FactoryBot.create(:user, name: 'Namethree', email: 'receiver@mail.com') }
    before do
        sender.send_message(receiver, 'A message', 'Subject')
        login_as(receiver, scope: :user)
        visit mailbox_inbox_path   
    end
    

    it 'should have one new message in the inbox' do
        count = receiver.mailbox.inbox.count
        expect(count).to eq 1
    end
    
    it 'can read a message' do
        click_on "View"
        expect(page).to have_text 'A message'
    end

    # it 'compose' do
    #     click_on "Compose"
    #     expect(page).to have_field "Text"
    # end

    
end

