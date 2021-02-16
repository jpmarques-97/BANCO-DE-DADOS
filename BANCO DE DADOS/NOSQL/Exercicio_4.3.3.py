from pymongo import MongoClient, ASCENDING
from functools import reduce

#############function

def get_indice(doc):
    flag = 100
    indice = -1
    for idx, score in enumerate(doc['scores']):
        if score['type'] == 'homework':
            if flag>score['score']:
                flag = score['score']
                indice = idx
    return indice

def remove_homework(doc,indice):
    doc['scores'].pop(indice)
    return doc

def update(doc):
    resultado = db.grades_full.update_one({'_id':doc['_id']},{'$set':{'scores':doc['scores']}})
    return resultado


#############code

client = MongoClient("mongodb+srv://jpmarques:akin2010@cluster0.pnqhe.mongodb.net/?retryWrites=true&w=majority")

db = client.students
grades = db.grades_full

my_doc = grades.find({},{'scores':1})
docs = [*my_doc]

indices = list(map(get_indice,docs))

new_docs = list(map(remove_homework,docs,indices))

a = list(map(update,new_docs))


    
