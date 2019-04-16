class KeyGenerator
  def initialize(user)
    @user = user
    generate_key
  end

  private

  def generate_key
    user_with_that_key = 'starting_value'
    while user_with_that_key
      key = SecureRandom.hex
      user_with_that_key = User.find_by(api_key: key)
    end
    @user.update(api_key: key)
    return key
  end
end
