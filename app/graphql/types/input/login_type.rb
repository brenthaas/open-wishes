module Types
  module Input
    class LoginType < Types::BaseInputObject
      description 'This thing is a user'
      argument :email, type: String, required: true
      argument :password, type: String, required: true
      argument :password_confirmation, type: String, required: true
    end
  end
end
