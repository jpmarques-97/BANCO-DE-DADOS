db.grades.find({'score':{'$gt':65},'type':'exam'},{'student_id':1, '_id':0}).sort({'score':1});
