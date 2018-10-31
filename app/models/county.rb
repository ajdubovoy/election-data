class County < ApplicationRecord
  belongs_to :state
  has_many :machines

  def paper_status_pretty
    case self.paper_status
    when 'some_paperless' then 'Paperless Voting'
    when 'vvpat_provided_not_paperless' then 'Mix of Paper Ballots and Paper-Trails'
    when 'paper_only' then 'All Paper Ballots'
    else 'No data provided'
    end
  end

  def paper_status_color
    case self.paper_status
    when 'some_paperless' then 'bad'
    when 'vvpat_provided_not_paperless' then 'amb'
    when 'paper_only' then 'good'
    else 'No data provided'
    end
  end

  def audit_status_pretty
    case self.audit_status
    when 'NotRequiredAsPaper' then 'No Required Audits / Machine-Based Audits'
    when 'Paperless' then 'Paperless Voting'
    when 'RequiredPaper' then 'Required Manual Audit of Paper Ballots'
    else 'No data provided'
    end
  end

  def audit_status_color
    case self.audit_status
    when 'NotRequiredAsPaper' then 'amb'
    when 'Paperless' then 'bad'
    when 'RequiredPaper' then 'good'
    end
  end
end
