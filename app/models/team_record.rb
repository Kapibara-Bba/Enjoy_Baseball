class TeamRecord < ApplicationRecord

  belongs_to :team, optional: true

  enum result: {"勝":0, "敗":1, "引き分け":2}

end
