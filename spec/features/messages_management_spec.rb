feature 'Creating messages' do

  scenario 'I can create a new messagee' do
    sign_up
    sign_in
    visit '/messages/new'
    fill_in 'message',   with: 'Hello, Marco'
    click_button 'Create message'
    expect(current_path).to eq '/messages'
    within 'ul#messages' do
      expect(page).to have_content 'Hello, Marco'
    end
  end

  scenario 'User cannot create message if not loged in' do
    visit '/messages/new'
    expect(current_path).to eq '/sessions/new'
  end
end

feature 'Viewing messages' do

  scenario 'I have a index page to selet options' do
    visit '/'
    expect(page). to have_content 'Messages'
  end

  scenario 'I can see existing messages on the messages page' do
    Message.create(message: 'Hello Chitter!')
    visit '/messages'
    within 'ul#messages' do
      expect(page).to have_content 'Hello Chitter!'
    end
  end
end
