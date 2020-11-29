class Record < ApplicationRecord

    belongs_to :user

    enum batter_record: {"test0":0, "test1":1, "test2":2, "test3":3, "test4":4, "test5":5, "test6":6, "test7":7, "test8":8,
    "test9":9, "test10":10, "test11":11, "test12":12, "test13":13, "test14":14}

    #@users = User.joins(:records).where(records: {batter_record: self.all.sum(batter_records)})
    attr_accessor :search_column
    
end
