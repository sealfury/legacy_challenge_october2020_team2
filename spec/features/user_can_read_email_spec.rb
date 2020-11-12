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
end

