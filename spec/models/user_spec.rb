require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user_nil) { build(:user_nil) }
  let(:user) { build(:user) }

  it '名前が空だったら無効であること' do
    user_nil.valid?
    expect(user_nil.errors[:name]).to_not include(nil)
  end
  it 'メールアドレスが空だったら無効であること' do
    user_nil.valid?
    expect(user_nil.errors[:email]).to_not include(nil)
  end
  it 'メールアドレスに@がなかったら無効であること' do
    user.email = 'example_user+ex.com'
    user.valid?
    expect(user.errors[:email]).to_not include(nil)
  end
  it ' メールアドレスが重複していたら無効であること' do
    build(:user).save
    expect(user).to_not be_valid
  end
  it 'パスワードが空だったら無効であること' do
    user_nil.valid?
    expect(user_nil.errors[:password]).to_not include(nil)
  end
  it '正常であること' do
    expect(user).to be_valid
  end
end
