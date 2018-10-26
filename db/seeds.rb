require 'csv'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row, encoding:'iso-8859-1:utf-8' }

puts 'Destroying previous models'
State.destroy_all
County.destroy_all

puts 'Seeding states...'
CSV.foreach(Rails.root.join('db', 'states.csv'), csv_options) do |row|
  State.create!(
    fips: row['FIPS_State'].to_i,
    name: row['State'],
  ) unless row['State'].nil?
end

puts 'Seeding counties...'
CSV.foreach(Rails.root.join('db', 'counties.csv'), csv_options) do |row|
  County.create!(
    fips: row['FIPS'].to_i,
    state_id: row['State'].to_i,
    name: row['County_name'],
    equipment_age: row['DD_equipment_age_years'].to_i,
    paper_status: row['Paper_status'].to_sym
  )
end

