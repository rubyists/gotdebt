module Gotdebt
  class User < Sequel::Model
    set_dataset Gotdebt.db[:users]

    attr_accessor :password
    attr_accessor :password_confirmation
    attr_accessor :email_confirmation

    def after_create
      self.crypted_password = encrypt(password)
      @new = false
      save
    end

    def authenticated?(password)
        crypted_password == encrypt(password)
    end

    def encrypt(password)
      self.class.encrypt(password, salt)
    end

    def self.encrypt(password, salt)
      Digest::SHA1.hexdigest("--#{salt}--#{password}--")
    end

    def self.authenticate(hash)
      login, pass = hash['login'], hash['password']

      if user = User[:login => login]
        return user unless pass
        user if user.authenticated?(pass)
      end
    end

    def validate
      super
      errors.add(:email, "must match email confirmation") unless self.email == self.email_confirmation
      errors.add(:password, "must match password confirmation") unless self.password == self.password_confirmation
    end

  end
end
