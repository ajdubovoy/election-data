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
    toss_up: row['Senate_Toss_Up'],
    abbreviation: row['Abbreviation'],
    audit_status: row['NCSL_Audit_Composite'].to_sym,
    hava: row['DD_2018_County_Average_HAVA_Csecurity_Funds_Quartile'].to_i,
    population: row['Total_Pop_2016'].to_i,
    security_score: row['CAP_VR_Score'].to_i,
    online_registration: row['NCSL_Online_Registration'] == 'Y',
    dhs_assessment: row['DHS_Security_Assessment'] == 'Y',
    registration_innovation: row['NCSL_Registration_Innovation'],
    ease: row['DD_COVI_Bin'],
    early_voting: row['NCSL_Early_Voting'],
    voter_id: row['NCSL_VoterIDrequirements'],
    poll_book: row['Pew_E_Pollbooks'],
    modem: row['Voting_Machine_Wireless_Modem'] == 'Y',
    security_score_2: row['ITIF_Security_Combined'].to_i
  ) unless row['State'].nil?
end

puts 'Seeding state county show all entries...'
State.all.each do |state|
  County.create!(
    fips: state.fips * 10**3,
    name: "* State of " + state.name,
    state_id: state.fips
  )
end

puts 'Seeding counties...'
CSV.foreach(Rails.root.join('db', 'counties.csv'), csv_options) do |row|
  County.create!(
    fips: row['FIPS'].to_i,
    state_id: row['State'].to_i,
    name: row['County_name'],
    equipment_age: row['DD_equipment_age_years'].to_i,
    paper_status: row['Paper_status'].to_sym,
    population: row['Population'],
    population_quartile: row['DD_population_quartile'],
    toss_up: row['Toss_up_house'],
    toss_ups: row['Toss_up_cds'],
    leans: row['Lean_cds'],
    internet_ballots: row['FVAP_ballots_returned_digital']
  ) unless row['State'].nil?
end

puts 'Seeding EAVS data...'
CSV.foreach(Rails.root.join('db', 'eavs.csv'), csv_options) do |row|
  selected = County.find_by fips: row['FIPS'].to_i

  unless selected.nil?
    selected.registered_voters = row['EAVS Registered Voters Total'].to_i
    selected.canceled_registrations = row['EAVS_2016_Voters_Removed_Total'].to_i
    selected.canceled_other = row['EAVS_2016_Voters_Removed_Other'].to_i
    selected.canceled_other_percent = (row['DD_EAVS_2016_Voters_Removed_Other_Percent_By_Total_Registration'].to_f * 100.0).round(2)
    selected.rejected = row['EAVS_Ballots_Absentee_Provisional_Total_Not_Counted'].to_i
    selected.rejected_other = row['EAVS_Ballots_Absentee_Provisional_Total_Not_Counted_Other'].to_i
    selected.save!
  end
end

puts 'Seeding machines...'
CSV.foreach(Rails.root.join('db', 'machines.csv'), csv_options) do |row|
  code_unedited = row['FIPS code'].to_i
  fips = ( code_unedited / 10**5 ).to_i

  Machine.create(
    county_id: fips,
    make: row['Make'],
    model: row['Model'],
    category: row['Equipment Type']
  ) unless Machine.exists?(county_id: fips, model: row['Model'])
end
