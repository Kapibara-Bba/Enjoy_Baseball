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
describe 'チーム詳細画面のテスト' do
  let(:user) { create(:user) }
  let(:user_team) { create(:user, team: team) }
  context '表示のテスト' do
    it '画像が表示される' do
      expect(page).to have_css('img.team_image')
    end
    it 'チーム情報が表示される' do
      visit team_path(user_team)
      expect(page).to have_link 'チーム情報'
    end
    it 'チームコメントが表示される' do
      visit team_path(user_team)
      expect(page).to have_link 'チームコメント'
    end
    it 'イベント追加が表示される' do
      visit team_path(team)
      expect(page).to have_link 'イベント追加'
    end
  end
  context '記録追加のテスト' do
    it 'イベントを追加できる' do
      fill_in 'info[body]', with: info.body
      select_date("2021,1,5", from: "日付")
    end
  end
end
