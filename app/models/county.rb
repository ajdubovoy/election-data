class County < ApplicationRecord
  belongs_to :state

  def list_name
    return "##{self.fips} - #{self.name}"
  end

  def paper_status_pretty
    case self.paper_status
    when 'some_paperless' then 'Some paperless electronic ballots'
    when 'vvpat_provided_not_paperless' then 'VVPAT is provided for all electronic ballots'
    when 'paper_only' then 'Only paper voting, no electronic'
    else 'No data provided'
    end
  end
end
