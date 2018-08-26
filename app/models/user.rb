class User < ApplicationRecord

    # 保存時に小文字変換
    before_save {self.email = email.downcase}

    # Railsチュートリアルから拝借したメールアドレスの正規表現
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :name,
        presence: true,
        length: {maximum: 50}
    validates :email,
        presence: true,
        length: {maximum: 255},
        format: {with: VALID_EMAIL_REGEX},
        uniqueness: {case_sensitive: false}
end
