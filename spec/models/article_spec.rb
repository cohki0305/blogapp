require 'rails_helper'

RSpec.describe Article, type: :model do
  it '2文字以上のタイトルと記事内容があれば、記事を保存できる' do
    user = User.create!({
      email: 'cohki0305@gmail.com',
      password: 'password'
    })
    article = user.articles.build({
      title: Faker::Lorem.characters(number: 10),
      content: Faker::Lorem.characters(number: 300)
    })
    expect(article).to be_valid
  end
end
