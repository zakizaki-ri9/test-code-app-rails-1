class User < ApplicationRecord

    # インスタンス変数への読み書き用アクセサを定義
    attr_accessor :remember_token

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
        length: {minimum: 6},
        allow_nil: true # allow_blankとの同じエラーメッセージを発生させないかつ空文字は許さないための処置

    # 永続セッションのためにユーザー情報をDBに記憶
    def remember
        # 新たに生成したトークンで更新
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # 記憶ダイジェストの初期化
    def forget
        update_attribute(:remember_digest, nil)
    end

    class << self
        # 少ないコストの文字列のハッシュ値を返す
        def digest(string)
            cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine::cost
            BCrypt::Password.create(string, cost: cost)
        end
    
        # ランダムトークン生成
        def new_token
            # A-Z,a-z,0-9,-,_の組み合わせで計22文字の文字列を出力
            SecureRandom.urlsafe_base64
        end
    end
end
