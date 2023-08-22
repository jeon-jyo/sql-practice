-- 문제1
-- 매니저가 있는 직원은 몇 명입니까?
SELECT COUNT(*) "haveMngCnt"
  FROM employees
 WHERE manager_id IS NOT NULL;

-- 문제2
-- 직원중에 최고임금(salary)과  최저임금을 “최고임금, “최저임금” 프로젝션 타이틀로 함께 출력해 보세요.
-- 두 임금의 차이는 얼마인가요?  “최고임금 – 최저임금”이란 타이틀로 함께 출력해 보세요.
SELECT MAX(salary) 최고임금
       ,MIN(salary) 최저임금
       ,MAX(salary)-MIN(salary) "최고임금-최저임금"
  FROM employees;

-- 문제3
-- 마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
-- 예) 2014년 07월 10일
SELECT TO_CHAR(MAX(hire_date), 'YYYY"년 "MM"월 "DD"일"') "마지막 신입사원"
  FROM employees;

-- 문제4
-- 부서별로 평균임금, 최고임금, 최저임금을 부서아이디(department_id)와 함께 출력합니다.
-- 정렬순서는 부서번호(department_id) 내림차순입니다.
SELECT AVG(salary)
       ,MAX(salary)
       ,MIN(salary)
       ,department_id
  FROM employees
 GROUP BY department_id
 ORDER BY department_id DESC;

-- 문제5
-- 업무(job_id)별로 평균임금, 최고임금, 최저임금을 업무아이디(job_id)와 함께 출력하고
-- 정렬순서는 최저임금 내림차순, 평균임금(소수점 반올림), 오름차순 순입니다.
-- (정렬순서는 최소임금 2500 구간일때 확인해볼 것)
SELECT AVG(salary)
       ,MAX(salary)
       ,MIN(salary)
       ,job_id
  FROM employees
 GROUP BY job_id
 ORDER BY MIN(salary) DESC, ROUND(AVG(salary), 0) ASC;

-- 문제6
-- 가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
-- 예) 2001-01-13 토요일
SELECT TO_CHAR(MIN(hire_date), 'YYYY"년 "MM"월 "DD"일"') "오래 근속한 사원"
  FROM employees;

-- 문제7
-- 평균임금과 최저임금의 차이가 2000 미만인 부서(department_id), 평균임금, 최저임금
-- 그리고 (평균임금 – 최저임금)를 (평균임금 – 최저임금)의 내림차순으로 정렬해서 출력하세요.
SELECT department_id
       ,AVG(salary)
       ,MIN(salary)
       ,AVG(salary)-MIN(salary) "평균임금 – 최저임금"
  FROM employees
 GROUP BY department_id
HAVING AVG(salary)-MIN(salary) < 20000
 ORDER BY AVG(salary)-MIN(salary) DESC;

-- 문제8
-- 업무(JOBS)별로 최고임금과 최저임금의 차이를 출력해보세요.
-- 차이를 확인할 수 있도록 내림차순으로 정렬하세요
SELECT MAX(salary)-MIN(salary)
  FROM employees
 GROUP BY job_id
 ORDER BY MAX(salary)-MIN(salary) DESC;

-- 문제9
-- 2005년 이후 입사자중 관리자별로 평균급여 최소급여 최대급여를 알아보려고 한다.
-- 출력은 관리자별로 평균급여가 5000이상 중에 평균급여 최소급여 최대급여를 출력합니다.
-- 평균급여의 내림차순으로 정렬하고 평균급여는 소수점 첫째짜리에서 반올림 하여 출력합니다.
SELECT ROUND(AVG(salary), 1)
       ,MIN(salary)
       ,MAX(salary)
  FROM employees
 GROUP BY manager_id
HAVING AVG(salary) >= 5000
 ORDER BY AVG(salary) DESC;

-- 문제10
-- 아래회사는 보너스 지급을 위해 직원을 입사일 기준으로 나눌려고 합니다. 
-- 입사일이 02/12/31일 이전이면 '창립맴버, 03년은 '03년입사’, 04년은 ‘04년입사’ 
-- 이후입사자는 ‘상장이후입사’ optDate 컬럼의 데이터로 출력하세요.
-- 정렬은 입사일로 오름차순으로 정렬합니다.
SELECT CASE
            WHEN hire_date < '02/12/31' THEN '창립멤버'
            WHEN hire_date LIKE '03/__/__' THEN '03년입사'
            WHEN hire_date LIKE '04/__/__' THEN '04년입사'
            WHEN hire_date LIKE '04/__/__' THEN '04년입사'
            ELSE '상장이후입사'
       END "optDate"
  FROM employees
 ORDER BY hire_date ASC;