namespace :graphql do
  desc 'export schema to json file'
  task export_schema_json: :environment do
    File.open('open_wishes_graphql_schema.json', 'w') do |file|
      file.write(
        OpenWishesSchema.to_json
      )
    end
  end

  desc 'export schema to in GraphQL format'
  task export_schema_sdl: :environment do
    File.open('open_wishes_graphql_schema.graphql', 'w') do |file|
      file.write(
        OpenWishesSchema.to_graphql.to_definition
      )
    end
  end
end
