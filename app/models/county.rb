class County < ApplicationRecord
  belongs_to :state
  has_many :machines

  def paper_status_pretty
    case self.paper_status
    when 'some_paperless' then 'Mix of Paperless Voting and Paper Optical Scan'
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

  def toss_up_pretty
    case self.toss_up
    when 'Y' then 'Yes'
    when 'N' then 'No'
    when 'L' then 'Lean'
    end
  end

  def toss_up_color
    case self.toss_up
    when 'Y' then 'bad'
    when 'L' then 'amb'
    when 'N' then ''
    end
  end

  def population_quartile_color
    case self.population_quartile
    when 1 then 'good'
    when 2 then 'amb'
    when 3 then 'amb'
    when 4 then 'bad'
    end
  end

  def tossies
    self.toss_ups.gsub(/[\[\]]/, '').split(', ').map { |cd| cd.to_i }
  end

  def leanies
    self.leans.gsub(/[\[\]]/, '').split(', ').map { |cd| cd.to_i }
  end

  def internet_ballots_pretty
    case self.internet_ballots
    when 'missing' then 'Not Reported'
    when 'none' then 'Not Permitted'
    else self.internet_ballots.to_i
    end
  end

  def internet_ballots_color
    case self.internet_ballots
    when 'missing' then ''
    when 'none' then ''
    else 'bad'
    end
  end
end
