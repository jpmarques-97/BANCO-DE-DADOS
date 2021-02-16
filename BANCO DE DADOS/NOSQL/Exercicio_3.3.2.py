from pymongo import MongoClient, ASCENDING
from functools import reduce

client = MongoClient("mongodb+srv://jpmarques:akin2010@cluster0.pnqhe.mongodb.net/?retryWrites=true&w=majority")

db = client.students
grades = db.grades_flat

myagg = [
            {'$match':{'type':'homework'}},
            {'$group':{'_id':'$_id'}},
            {'$sort':{'_id':1}}
        ]

mydoc = grades.aggregate(myagg)

id_docs_remove = list()
reduce(lambda x,y: id_docs_remove.append(y['_id']),[*mydoc])

grades.delete_many({'_id':{'$in':id_docs_remove}})