module Queries
  class FetchUsers < Queries::BaseQuery
    type [Types::UserType], null: false

    def resolve
      User.all.order(email: :asc)
    end
  end
end
