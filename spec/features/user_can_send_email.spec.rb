feature 'User can' do
  let(:sender) { FactoryBot.create(:user, name: 'Nametoo', email: 'sender@mail.com') }
  let(:receiver) { FactoryBot.create(:user, name: 'Namethree', email: 'receiver@mail.com') }
  before do
    login_as(sender, scope: :user)
    visit mailbox_inbox_path
  end
 
  it 'compose an email' do
    click_on "Compose"
    recipient = User.select(name: 'Namethree')
    fill_in 'Subject', with: 'title'
    fill_in 'Type your message here', with: 'messageline'
    click_on 'Send Message'
    expect(page).to have_content 'Your message was successfully sent!'
  end

  it 'not compose an email with no content' do
    click_on "Compose"
    recipient = User.select(name: 'Namethree')
    fill_in 'Subject', with: 'title'
    fill_in 'Type your message here', with: ''
    click_on 'Send Message'
    expect(current_path).to eq mailbox_inbox_path
    expect(page).to have_content 'Please write a message'
  end
end