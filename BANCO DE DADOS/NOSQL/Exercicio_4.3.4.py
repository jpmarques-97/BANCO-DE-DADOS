from pymongo import MongoClient, ASCENDING
from functools import reduce

client = MongoClient("mongodb+srv://jpmarques:akin2010@cluster0.pnqhe.mongodb.net/?retryWrites=true&w=majority")

db = client.students
grades = db.grades_full

myagg =   [
            { '$unwind': '$scores' },
            {'$group':{'_id': '$_id','average': { '$avg': '$scores.score' }}},
            { '$sort': { 'average' : -1 } },
            { '$limit': 1 } 
        ]


mydoc = grades.aggregate(myagg)
print(*mydoc)