require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'バリデーションのテスト' do
    let(:team) { build(:team) }
    subject { test_team.valid? }
    context 'teamnameカラム' do
      let(:test_team) { team }
      it '空欄でないこと' do
        test_team.teamname = ''
        is_expected.to eq false;
      end
    end
    context 'prefecture_codeカラム' do
      let(:test_team) { team }
      it '空欄でないこと' do
        test_team.prefecture_code = ''
        is_expected.to eq false;
      end
    end
    context 'cityカラム' do
      let(:test_team) { team }
      it '空欄でないこと' do
        test_team.city = ''
        is_expected.to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'userモデルとの関係' do
      it '1:Nとなっている' do
        expect(Team.reflect_on_association(:users).macro).to eq :has_many
      end
    end
    context 'team_recordモデルとの関係' do
      it '1:Nとなっている' do
        expect(Team.reflect_on_association(:team_records).macro).to eq :has_many
      end
    end
    context 'postモデルとの関係' do
      it '1:Nとなっている' do
        expect(Team.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    context 'infoモデルとの関係' do
      it '1:Nとなっている' do
        expect(Team.reflect_on_association(:infos).macro).to eq :has_many
      end
    end
    context 'notificationモデルとの関係' do
      it '1:Nとなっている' do
        expect(Team.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
  end
end
