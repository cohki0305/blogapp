require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user, email: 'cohki0305@gmail.com') }

  context '2文字以上のタイトルと記事内容の場合' do
    let!(:article) do
      user.articles.build({
        title: Faker::Lorem.characters(number: 10),
        content: Faker::Lorem.characters(number: 300)
      })
    end

    it '記事を保存できる' do
      puts '--------------'
      puts user.email
      puts '--------------'
      expect(article).to be_valid
    end
  end

  context 'タイトルが一文字の場合' do
    let!(:article) do
      user.articles.create({
        title: Faker::Lorem.characters(number: 1),
        content: Faker::Lorem.characters(number: 300)
      })
    end

    it '記事を保存できない' do
      expect(article.errors.messages[:title][0]).to eq('は2文字以上で入力してください')
    end
  end
end
