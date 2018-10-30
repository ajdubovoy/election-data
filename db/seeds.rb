require 'csv'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row, encoding:'iso-8859-1:utf-8' }

puts 'Destroying previous models'
Machine.destroy_all
County.destroy_all
State.destroy_all

puts 'Seeding states...'
CSV.foreach(Rails.root.join('db', 'states.csv'), csv_options) do |row|
  State.create!(
    fips: row['FIPS_State'].to_i,
    name: row['State'],
    toss_up: row['Senate_Toss_Up']
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
  ) unless row['State'].nil?
end

puts 'Seeding machines...'
CSV.foreach(Rails.root.join('db', 'machines.csv'), csv_options) do |row|
  code_unedited = row['FIPS code'].to_i
  fips = ( code_unedited / 10**5 ).to_i

  Machine.create!(
    county_id: fips,
    make: row['Make'],
    model: row['Model'],
    category: row['Equipment Type']
  )
end
