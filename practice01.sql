-- Practice01.SQL_실습문제_기본

-- 문제1
-- 사원의 사원번호 이름(first_name) 성(last_name) 입사일을 출력하세요
SELECT employee_id
       ,first_name
       ,last_name
       ,hire_date
  FROM employees;

-- 문제2
-- 사원의 사원번호 이름(first_name) 성(last_name) 입사일을 출력하세요
-- (사원번호 올림차순으로)
SELECT employee_id
       ,first_name
       ,last_name
       ,hire_date
  FROM employees
 ORDER BY employee_id ASC;

-- 문제3
-- 사원의 사원번호 이름(first_name) 성(last_name) 입사일을 출력하세요
-- (입사일 내림차순으로 출력하되 입사일이 같으면 사원번호 올림차순으로 출력)
SELECT employee_id
       ,first_name
       ,last_name
       ,hire_date
  FROM employees
 ORDER BY hire_date DESC, employee_id ASC;

-- 문제4
-- 사원의 이름(fisrt_name)과 성(last_name)을 붙여서 '성 명' 이라는 1개의 이름으로
-- (이름과 성은 1개의 공백으로 구분),
-- 그리고 전화번호 입사일 연봉 부서번호가 표시되도록 출력하세요
SELECT first_name || ' ' || last_name AS "성 명"
       ,phone_number
       ,hire_date
       ,salary
       ,department_id
  FROM employees;

-- 문제5
-- 사원의 이름(fisrt_name)과 성(last_name)을 붙여서 '성 명' 이라는 1개의 이름으로
-- (이름과 성은 1개의 공백으로 구분),
-- 그리고 전화번호 입사일 연봉 부서번호를 최근에 입사한 사람부터 출력하세요
SELECT first_name || ' ' || last_name AS "성 명"
       ,phone_number
       ,hire_date
       ,salary
       ,department_id
  FROM employees
 ORDER BY hire_date DESC;

-- 문제6
-- 사원의 이름(fisrt_name)과 성(last_name)을 붙여서 '성 명' 이라는 1개의 이름으로
-- (이름과 성은 1개의 공백으로 구분),
-- 그리고 전화번호 입사일 연봉 부서번호를 부서번호 순으로 출력하세요
SELECT first_name || ' ' || last_name AS "성 명"
       ,phone_number
       ,hire_date
       ,salary
       ,department_id
  FROM employees
 ORDER BY department_id;

-- 문제7
-- 사원의 이름(fisrt_name)과 성(last_name)을 붙여서 '성 명' 이라는 1개의 이름으로
-- (이름과 성은 1개의 공백으로 구분),
-- 그리고 전화번호 입사일 연봉 부서번호를 부서번호 올림차순으로 출력하세요
-- 부서번호가 같은경우 입사일이 늦은 사람부터 출력하세요
SELECT first_name || ' ' || last_name AS "성 명"
       ,phone_number
       ,hire_date
       ,salary
       ,department_id
  FROM employees
 ORDER BY department_id ASC, hire_date DESC;

-- 문제8
-- 사원의 이름(fisrt_name)과 성(last_name)을 붙여서 '성 명' 이라는 1개의 이름으로
-- (이름과 성은 1개의 공백으로 구분),
-- 그리고 전화번호 입사일 연봉 부서번호를 부서번호 올림차순으로 출력하세요
-- 부서번호가 같은경우 입사일이 늦은 사람부터 출력하세요
-- 단 부서번호가 없는 사람은 부서번호를 0으로 표시합니다
SELECT first_name || ' ' || last_name AS "성 명"
       ,phone_number
       ,hire_date
       ,salary
       ,NVL(department_id,0)
  FROM employees
 ORDER BY department_id ASC, hire_date DESC;

-- 문제9
-- 전체직원의 다음 정보를 조회하세요
-- 정렬은 입사일(hire_date)의 올림차순(ASC)으로 가장 선임부터 출력이 되도록 하세요
-- 이름(first_name last_name), 연봉(salary), 전화번호(phone_number), 입사일(hire_date) 순서이고
-- “이름”, “연봉”, “전화-번호”, “입사일” 로 컬럼이름을 대체해 보세요
SELECT first_name || ' ' || last_name 이름
       ,salary 연봉
       ,phone_number "전화-번호"
       ,hire_date 입사일
  FROM employees
 ORDER BY hire_date DESC;

-- 문제10
-- 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회하세요
SELECT last_name
       ,salary
  FROM employees
 WHERE salary >= 12000;

-- 문제11
-- 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회하세요
-- 출력순서는 연봉이 높은사람부터 출력합니다
SELECT last_name
       ,salary
  FROM employees
 WHERE salary >= 12000
 ORDER BY salary DESC;

-- 문제12
-- 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회하세요
-- 연봉이 높은사람부터 출력하고 연봉이 같으면 입사일이 빠른 사람부터 출력하세요
SELECT last_name
       ,salary
  FROM employees
 WHERE salary >= 12000
 ORDER BY salary DESC, hire_date ASC;

-- 문제13
-- 07/01/01 이후에 입사한 사원들의 이름과 입사일을 출력하세요
-- 입사일은 03-07-2007 과 같이 일, 월, 년도(서양식) 로 출력하세요
-- 이름은 모두 대문자로 출력하세요
SELECT UPPER(first_name)
       ,TO_CHAR(hire_date, 'DD-MM-YYYY')
  FROM employees;

-- 문제14
-- 사원번호가 100 인 사람의 사번 LAST_NAME 과 부서 번호를 출력하세요
SELECT employee_id
       ,last_name
       ,department_id
  FROM employees
 WHERE employee_id = 100;

-- 문제15
-- 사원번호가 100번대인 사람의 사번 LAST_NAME 과 부서 번호를 조회한다
-- (100~199번)
SELECT employee_id
       ,last_name
       ,department_id
  FROM employees
 WHERE employee_id BETWEEN 100 AND 199;

-- 문제16
-- 연봉이 5000 에서 12000 의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회힌다
-- (연봉이 5000 인 사람과 12000 인 사람은 출력하지 않습니다)
SELECT last_name
       ,salary
  FROM employees
 WHERE salary NOT BETWEEN 5000 AND 12000;

-- 문제17
-- 07년도에 고용된 모든 사람들의 LAST_NAME 및 입사일을 조회한다
-- 입사일이 늦은순으로 출력하세요 입사일은 2007-06-17 과 같이 출력하세요
SELECT last_name
       ,TO_CHAR(hire_date, 'YYYY-MM-DD')
  FROM employees
 WHERE hire_date LIKE '07/__/__'
 ORDER BY hire_date DESC;

-- 문제18
-- 연봉이 2,500, 3,500, 7000 인 사람을 출력하세요
SELECT *
  FROM employees
 WHERE salary IN (2500, 3500, 7000);

-- 문제19
-- 연봉이 2,500, 3,500, 7000 이 아닌 사람을 출력하세요
SELECT *
  FROM employees
 WHERE salary NOT IN (2500, 3500, 7000);

-- 문제20
-- 연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 인 사람을 출력하세요
SELECT *
  FROM employees
 WHERE salary NOT IN (2500, 3500, 7000)
   AND job_id = 'SA_REP';

-- 문제21
-- 연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 과 ST_CLERK 인 사람 모두를 구하시오
SELECT *
  FROM employees
 WHERE salary NOT IN (2500, 3500, 7000)
   AND job_id IN ('SA_REP', 'ST_CLERK');

-- 문제22
-- 부서번호가 20 번 또는 50 번 부서에서 근무하는 모든 사원들의
-- LAST_NAME 및 부서 번호를 알파벳순으로 조회한다 (a->z)
SELECT last_name
       ,department_id
  FROM employees
 WHERE department_id IN (20, 50)
 ORDER BY last_name, department_id;

-- 문제23
-- 부서번호가 20 번 및 50 번 부서에 근무하며,
-- 연봉이 5000 ~ 12,000 사이인 사원들의 LAST_NAME 및 연봉을 조회한다
SELECT last_name
       ,salary
  FROM employees
 WHERE department_id IN (20, 50)
   AND salary BETWEEN 5000 AND 12000;

-- 문제24
-- first_name 에 a 및(OR) e 글자가 있는 사원들의 first_name 과 사번을 조회한다
SELECT first_name
       ,employee_id
  FROM employees
 WHERE first_name LIKE '%a%'
    OR first_name LIKE '%e%';

-- 문제25
-- first_name 이 J로 시작하고 n으로 끝나는 사람의 first_name 과 사번 연봉을 조회한다
SELECT first_name
       ,employee_id
       ,salary
  FROM employees
 WHERE first_name LIKE 'J%n';

-- 문제26
-- first_name 이 J로 시작하고 n으로 끝나는 사람 중 
-- 이름이 4글자인 사람의 first_name 사번 연봉 전화번호를 조회한다
SELECT first_name
       ,employee_id
       ,salary
       ,phone_number
  FROM employees
 WHERE first_name LIKE 'J__n';

-- 문제27
-- 커미션이 있는 모든 사원들의 LAST_ANME, 연봉 및 커미션을 조회합니다
-- 출력순서는 연봉 큰순서 부터, 연봉이 같을경우 커미션이 큰사람부터 출력합니다
SELECT last_name
       ,salary
       ,commission_pct
  FROM employees
 WHERE commission_pct IS NOT NULL
 ORDER BY salary DESC, commission_pct DESC;

-- 문제28
-- 매니저가 있는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다
SELECT last_name
       ,job_id
  FROM employees
 WHERE manager_id IS NOT NULL;

-- 문제29
-- 사번(employeed_id) 이름(first_name) 연봉(salary) 10년연봉(salay10)을
-- 연봉이 높은 사람부터 출력하세요
-- 출력컬럼명은 사번, 이름, 연봉, 10년연봉 이며 연봉과 10년연봉은 천단위에 콤마를 표시합니다
SELECT employee_id 사번
       ,first_name 이름
       ,TO_CHAR(salary, '999,999') 연봉
       ,TO_CHAR(salary*10, '999,999') "10년연봉"
  FROM employees
 ORDER BY salary DESC;

-- 문제30
-- 사번(employeed_id) 이름(first_name) 연봉(salary) 월급 세금 실수령액을 출력하세요
-- 출력컬럼명과 계산식은 사번, 이름, 연봉, 월급(연봉/12), 세금(연봉/12*3.3%),
-- 실수령액(월급-세금)이며 천단위에 콤마를 출력합니다
SELECT employee_id 사번
       ,first_name 이름
       ,TO_CHAR(salary, '999,999') 연봉
       ,TO_CHAR(salary/12, '999,999') 월급
       ,TO_CHAR((salary/12)*0.033, '999,999') 세금
       ,TO_CHAR((salary/12)-((salary/12)*0.033), '999,999') 실수령액
  FROM employees;

-- 문제31
-- 업무(jobs)별로 업무이름(job_title)과 최고월급(max_salary)을 최고 월급의 내림차순(DESC)로 정렬하세요
SELECT job_title
       ,max_salary
  FROM jobs
 ORDER BY max_salary DESC;

-- 문제32
-- 담당 매니저가 배정되어있으나 커미션비율이 없고,
-- 월급이 3000초과인 직원의 이름, 매니저아이디, 커미션 비율, 연봉 을 출력하세요
SELECT first_name
       ,manager_id
       ,commission_pct
       ,salary
  FROM employees
 WHERE manager_id IS NOT NULL
   AND commission_pct IS NULL
   AND salary > 3000;

-- 문제33
-- 최고월급(max_salary)이 10000 이상인 업무의 이름(job_title)과
-- 최고월급(max_salary)을 최고월급의(max_salary) 내림차순(DESC)로 정렬하여 출력하세요
SELECT job_title
       ,max_salary
  FROM jobs
 WHERE max_salary >= 10000
 ORDER BY max_salary DESC;

-- 문제34
-- 연봉이 14000 미만 10000 이상인 직원의 이름(first_name), 월급, 커미션퍼센트 를
-- 연봉순(내림차순) 출력하세요. 단 커미션퍼센트 가 null 이면 0 으로 나타내시오
SELECT first_name
       ,TO_CHAR(salary/12, '999,999') 월급
       ,NVL(commission_pct,0)
  FROM employees
 WHERE salary >= 10000
   AND salary < 14000
 ORDER bY salary DESC;

-- 문제35
-- 부서번호가 10, 90, 100 인 직원의 이름, 연봉, 입사일, 부서번호를 나타내시오
-- 입사일은 2007-12-22 12:00:00 (년-월) 와 같이 표시하시오
-- (시간은 12:00:00 으로 표현됩니다)
SELECT first_name
       ,salary
       ,TO_CHAR(hire_date, 'YYYY-MM-DD HH12:MI:SS')
       ,department_id
  FROM employees
 WHERE department_id IN (10, 90, 100);

-- 문제36
-- 이름(first_name)에 S 또는 s 가 들어가는 직원의 이름, 연봉을 나타내시오
SELECT first_name
       ,salary
  FROM employees
 WHERE first_name LIKE 'S%'
    OR first_name LIKE '%s%';

-- 문제37
-- 전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세요
SELECT *
  FROM departments
 ORDER BY LENGTH(department_name) DESC;

-- 문제38
-- 지사가 있을 것으로 예상되는 나라들을 나라이름을 대문자로 출력하고
-- 올림차순(ASC)으로 정렬해 보세요
SELECT UPPER(country_name)
  FROM countries
 WHERE region_id IS NOT NULL
 ORDER BY country_name;

-- 문제39
-- 입사일이 03/12/31 일 이전 입사한 직원의 이름, 연봉, 전화 번호, 입사일을 출력하세요
-- 전화번호는 545-343-3433 과 같은 형태로 출력하시오
SELECT first_name
       ,salary
       ,REPLACE(phone_number,'.','-') 
       ,hire_date
  FROM employees
 WHERE hire_date < '03/12/31';