require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user) }

  context '2文字以上のタイトルと記事内容の場合' do
    let!(:article) { build(:article, user: user) }

    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end

  context 'タイトルが一文字の場合' do
    let!(:article) { build(:article, title: Faker::Lorem.characters(number: 1), user: user) }

    it '記事を保存できない' do
      article.save
      expect(article.errors.messages[:title][0]).to eq('は2文字以上で入力してください')
    end
  end
end
