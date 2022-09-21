class User
  module Authentication
    def encrypt_password
      unless password.present?
        return
      end

      self.salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, salt)
    end

    def clear_password
      unless password.present?
        return
      end

      self.password = nil
    end

    def password_matches(provided_password)
      hashed_password = BCrypt::Engine.hash_secret(provided_password, self.salt)
      self.password_hash == (hashed_password)
    end
  end
end
