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
    when 'T' then 'bad'
    when 'L' then 'amb'
    when 'N' then ''
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

  def online_registration_pretty
    case self.online_registration
    when true then 'Yes'
    when false then 'No'
    end
  end

  def online_registration_color
    case self.online_registration
    when true then 'good'
    when false then 'amb'
    end
  end

  def dhs_assessment_pretty
    case self.dhs_assessment
    when true then 'Yes'
    when false then 'No'
    end
  end

  def dhs_assessment_color
    case self.dhs_assessment
    when true then 'good'
    when false then 'amb'
    end
  end

  def registration_innovation_pretty
    case self.registration_innovation
    when nil then 'Traditional Only'
    when '' then 'Traditional Only'
    when 'Automatic' then 'Automatic'
    when 'SameDay' then 'Same Day'
    when 'EarlyVoteOnly' then 'Early Vote Only'
    when 'NoVR' then 'Not Required'
    end
  end

  def ease_color
    case self.ease
    when 'A' then 'good'
    when 'B' then 'amb'
    when 'C' then 'bad'
    end
  end

  def early_voting_pretty
    case self.early_voting
    when 'Y' then 'Yes'
    when 'AllMail' then 'All-Mail Voting'
    when 'N' then 'No'
    end
  end

  def early_voting_color
    case self.early_voting
    when 'Y' then 'good'
    when 'AllMail' then 'amb'
    when 'N' then 'bad'
    end
  end

  def voter_id_pretty
    case self.voter_id
    when 'N ' then 'None'
    when 'NonPhotoID' then 'ID Required (but not photo ID)'
    when 'PhotoID' then 'Photo ID Required'
    end
  end

  def poll_book_pretty
    case self.poll_book
    when 'N' then 'None'
    when 'P' then 'Some Counties'
    when 'A' then 'Statewide'
    end
  end

  def security_score_2_color
    if self.security_score_2 >= 176
      return 'good'
    else
      return 'bad'
    end
  end
end
