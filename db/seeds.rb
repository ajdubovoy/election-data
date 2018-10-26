require 'csv'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row, encoding:'iso-8859-1:utf-8' }

CSV.foreach('states.csv', csv_options) do |row|
  State.create(
    fips: row['FIPS_State'].to_i,
    name: row['State'],
  )
end

CSV.foreach('counties.csv', csv_options) do |row|
  County.create(
    fips: row['FIPS'].to_i,
    state: State.find(row['State'].to_i),
    county: row['County'].to_i,
    name: row['County_name'],
    equipment_age: row['DD_equipment_age_years'].to_i,
    paper_status: row['Paper_status'].to_sym
  )
end

