-- Retrieves sales amounts grouped by date and store.

select
  A.sodate,
  A.storecode,
  B.storename,
  sum(CASE WHEN type ='S'
  	   THEN A.totalamount
  	   ELSE -A.totalamount
      END) as amount
from slsOrder A left outer join masStore B on A.storecode = B.storecode
Group by A.sodate, A.storecode, B.storename
