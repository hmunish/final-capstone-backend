# spec/support/request_helpers.rb
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

module RequestHelpers
  def generate_jwt_token(user)
    secret_key = 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.SRykN3CF-soWGfrD33q0Tme3a--wmGQ5Vl9dohn_fz4'

    payload = { user_id: user.id }
    JWT.encode(payload, secret_key)
  end
end
