feature 'User can' do
  let(:user) { FactoryBot.create(:user) }
  before do
  login_as(user, scope: :user)
  visit mailbox_inbox_path
  end

  
end