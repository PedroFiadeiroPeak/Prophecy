WITH Department_Lookup AS (

  SELECT * 
  
  FROM {{ ref('Department_Lookup')}}

),

d_department AS (

  SELECT * 
  
  FROM {{ source('pedrofiadeiro.hsbc', 'd_department') }}

),

department_join AS (

  SELECT * 
  
  FROM d_department AS in0
  INNER JOIN Department_Lookup AS in1
     ON in0.DDEPT_KEY = in1.DEPARTMENT_ID

)

SELECT *

FROM department_join
