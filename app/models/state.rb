class State < ApplicationRecord
  has_many :counties

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
