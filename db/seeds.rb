# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

competition_response = HTTP.get("https://api.football-data.org/v4/competitions")
competitions = JSON.parse(competition_response.body)["competitions"]

competitions.each do |competition|
  Competition.create(
    external_id: competition["id"],
    name: competition["name"],
    code: competition["code"],
    country_name: competition["area"]["name"],
    country_code: competition["area"]["code"],
    country_flag: competition["area"]["flag"],
    competition_type: competition["type"],
    competition_logo: competition["emblum"],
    plan: competition["plan"],
    last_update: competition["last_updated"],
  )
end
