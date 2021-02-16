db.small_zips.aggregate([{"$match": { "pop": {"$gt" : 25000} }},{$match:{'state':{$in:['NY','CT']}}},{$group:{"_id":"$state","population":{$avg:"$pop"}}}])
