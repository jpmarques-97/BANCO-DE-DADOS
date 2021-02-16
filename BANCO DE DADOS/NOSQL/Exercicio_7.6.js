db.grades_complete.aggregate([ 
{$unwind: "$scores"},  
{$match:{'scores.type':{$in:['exam','homework']}}}, {$group:{_id:{'student_id':'$student_id','class_id':'$class_id'},
aaa:{$avg:"$scores.score"}}}, 
{$group:{'_id':'$_id.class_id','avg':{$avg:'$aaa'}}}, {$sort:{'_id':1}}
])
