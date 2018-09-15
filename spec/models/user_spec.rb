require 'rails_helper'

RSpec.describe User, type: :model do

  let(:nil_user) { User.new(nil_params) }
  let(:nil_params) {{ name: nil, email: nil, password: nil }}

  it '名前が空だったら無効であること' do
    nil_user.valid?
    expect(nil_user.errors[:name]).to_not include(nil)
  end
  it 'メールアドレスが空だったら無効であること' do
    nil_user.valid?
    expect(nil_user.errors[:email]).to_not include(nil)
  end
  it 'メールアドレスに@がなかったら無効であること' do
    user = User.new(
      name: 'sample_user',
      email: 'sample_user+ex.com',
      password: 'sample_user'
    )
    user.valid?
    expect(user.errors[:email]).to_not include(nil)
  end
  it ' メールアドレスが重複していたら無効であること' do
    User.create(
      name: 'sample_user',
      email: 'sample_user@ex.com',
      password: 'sample_user'
    )
    user = User.new(
      name: 'sample_user2',
      email: 'sample_user@ex.com',
      password: 'sample_user2'
    )
    expect(user).to_not be_valid
  end
  it 'パスワードが空だったら無効であること' do
    nil_user.valid?
    expect(nil_user.errors[:password]).to_not include(nil)
  end
  it '正常であること' do
    user = User.new(
      name: 'sample_user',
      email: 'sample_user@ex.com',
      password: 'sample_user'
    )
    expect(user).to be_valid
  end
end
