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

  def toss_up_pretty
    case self.toss_up
    when 'T' then 'Yes'
    when 'N' then 'No'
    when 'L' then 'Lean'
    end
  end

  def toss_up_color
    case self.toss_up
    when 'T' then 'good'
    when 'L' then 'amb'
    when 'N' then 'bad'
    end
  end

  def hava_color
    case self.hava
    when 0 then 'bad'
    when 1 then 'good'
    when 2 then 'amb'
    when 3 then 'amb'
    when 4 then 'bad'
    end
  end

  def security_score_color
    case self.security_score
    when 1 then 'good'
    when 2 then 'amb'
    when 3 then 'amb'
    when 4 then 'bad'
    end
  end
end
