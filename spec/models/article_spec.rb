require 'rails_helper'

RSpec.describe Article, type: :model do
  context '2文字以上のタイトルと記事内容の場合' do
    let!(:user) do
      User.create!({
        email: 'cohki0305@gmail.com',
        password: 'password'
      })
    end

    let!(:article) do
      user.articles.build({
        title: Faker::Lorem.characters(number: 10),
        content: Faker::Lorem.characters(number: 300)
      })
    end

    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end
end
