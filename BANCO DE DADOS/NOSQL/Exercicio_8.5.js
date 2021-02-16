 $ db.zips.aggregate([ 
{$group:{_id:'$city',pop:{$sum:'$pop'}}}, {$project:{first_char:{$substr:["$_id",0,1]},'pop':'$pop'}},
{$match:{'first_char':{$in:['B', 'D', 'O', 'G', 'N' , 'M']}}},  {$sort:{'pop':-1}}
        ])
