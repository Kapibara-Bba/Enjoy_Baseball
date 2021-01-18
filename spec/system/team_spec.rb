require 'rails_helper'

describe 'チームのテスト' do
  let(:user) { create(:user) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end
  describe 'チーム登録のテスト' do
    before do
      visit new_team_path
    end
    context 'チーム新規登録画面' do
      it '新規登録に成功する' do
        fill_in 'team[teamname]', with: Faker::Lorem.characters(number:10)
        select "福岡県", from: 'team_prefecture_code'
        fill_in 'team[city]', with: '福岡市'
      end
      it '新規登録に失敗する' do
        fill_in 'team[teamname]', with: ''
        fill_in 'team[city]', with: ''
      end
    end
  end
end
