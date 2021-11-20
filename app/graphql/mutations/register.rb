module Mutations
  class Register < Mutations::BaseMutation
    argument :params, Types::Input::LoginType, required: true

    field :user, Types::UserType, null: false

    def resolve(params:)
      registration_params = Hash params

      begin
        user = User.create!(registration_params)

        { user: user }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new "Invalid attributes #{e.record.errors.full_messages}"
      end
    end
  end
end
