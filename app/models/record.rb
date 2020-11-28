class Record < ApplicationRecord
    
    belongs_to :user
    
    enum batter_record: {"打率":0, "打数":1, "安打":2, "本塁打":3, "二塁打":4, "三塁打":5, "打点":6, "得点":7, "三振":8, 
    "四死球":9, "犠打":10, "犠飛":11, "出塁率":12, "盗塁":13, "失策":14}
    
end
