require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }
    context 'nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false;
      end
    end
    context 'emailカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.email = ''
        is_expected.to eq false;
      end
    end
    context 'passwordカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.password = ''
        is_expected.to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'teamモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:team).macro).to eq :belongs_to
      end
    end
    context 'recordモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:records).macro).to eq :has_many
      end
    end
    context 'post_commentsモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
  end
end
