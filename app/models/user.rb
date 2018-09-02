class User < ApplicationRecord

    # 保存時に小文字変換
    before_save {self.email = email.downcase}

    # Railsチュートリアルから拝借したメールアドレスの正規表現
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    has_secure_password

    validates :name,
        presence: true,
        length: {maximum: 50}
    validates :email,
        presence: true,
        length: {maximum: 255},
        format: {with: VALID_EMAIL_REGEX},
        uniqueness: {case_sensitive: false}
    validates :password,
        presence: true,
        length: {minimum: 6}

    # 少ないコストの文字列のハッシュ値を返す
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine::cost
        BCrypt::Password.create(string, cost: cost)
    end
end
