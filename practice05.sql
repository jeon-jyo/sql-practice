-- Practice04.SQL_실습문제_혼합

-- 문제1
-- 담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의
-- 이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
-- (45건)
SELECT first_name
       ,manager_id
       ,commission_pct
       ,salary
  FROM employees
 WHERE manager_id IS NOT NULL
   AND commission_pct IS NULL
   AND salary > 3000;

-- 문제2
-- 각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name), 급여(salary), 입사일(hire_date),
-- 전화번호(phone_number), 부서번호(department_id) 를 조회하세요
-- 조건절비교 방법으로 작성하세요
-- 급여의 내림차순으로 정렬하세요
-- 입사일은 2001-01-13 토요일 형식으로 출력합니다.
-- 전화번호는 515-123-4567 형식으로 출력합니다.
-- (11건)
SELECT employee_id
       ,first_name
       ,salary
       ,TO_CHAR(hire_date, 'YYYY-MM-DD DAY')
       ,REPLACE(phone_number,'.','-')
       ,department_id
  FROM employees
 WHERE (salary, department_id) IN (SELECT MAX(salary), department_id
                                     FROM employees
                                    GROUP BY department_id)
 ORDER BY salary DESC;

-- 문제3
-- 매니저별 담당직원들의 평균급여 최소급여 최대급여를 알아보려고 한다.
-- 통계대상(직원)은 2005년 이후(2005년 1월 1일 ~ 현재)의 입사자 입니다.
-- 매니저별 평균급여가 5000이상만 출력합니다.
-- 매니저별 평균급여의 내림차순으로 출력합니다.
-- 매니저별 평균급여는 소수점 첫째자리에서 반올림 합니다.
-- 출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균급여, 매니저별최소급여, 매니저별최대급여 입니다.
-- (9건)
SELECT e.employee_id, e.first_name, m.avgS, m.minS, m.maxS
  FROM employees e, (SELECT ROUND(AVG(salary),1) avgS, MIN(salary) minS, MAX(salary) maxS, manager_id
                       FROM employees
                      WHERE hire_date >= '2005/01/01'
                      GROUP BY manager_id
                     HAVING AVG(salary) >= 5000
                    ) m
 WHERE e.employee_id = m.manager_id
 ORDER BY m.avgS DESC;

-- 문제4
-- 각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
-- 부서가 없는 직원(Kimberely)도 표시합니다.
-- (106명)
SELECT e.employee_id
       ,e.first_name
       ,d.department_name
       ,m.first_name
  FROM employees e, employees m, departments d
 WHERE e.manager_id = m.employee_id
   AND e.department_id = d.department_id(+);

-- 문제5
-- 2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의
-- 사번, 이름, 부서명, 급여, 입사일을 입사일 순서로 출력하세요
SELECT ort.rn
       ,ort.employee_id
       ,ort.first_name
       ,ort.department_name
       ,ort.salary
       ,ort.hire_date
  FROM (SELECT ROWNUM rn
               ,ot.employee_id
               ,ot.first_name
               ,ot.department_name
               ,ot.salary
               ,ot.hire_date
          FROM (SELECT e.employee_id
                       ,e.first_name
                       ,d.department_name
                       ,e.salary
                       ,e.hire_date
                  FROM employees e, departments d
                 WHERE e.department_id = d.department_id
                   AND e.hire_date >= '2005/01/01'
                 ORDER BY hire_date
               ) ot
        ) ort
 WHERE ort.rn BETWEEN 11 AND 20;
 
-- 문제6
-- 가장 늦게 입사한 직원의 이름(first_name last_name)과 연봉(salary)과 근무하는 부서 이름(department_name), 입사일은?
SELECT e.first_name || ' ' || e.last_name AS "이름"
       ,e.salary
       ,d.department_name
       ,e.hire_date
  FROM employees e, departments d
 WHERE e.department_id = d.department_id
   AND e.hire_date IN (SELECT MAX(hire_date)
                         FROM employees);

-- 문제7
-- 평균연봉(salary)이 가장 높은 부서 직원들의 직원번호(employee_id), 이름(first_name), 성(last_name)과 업무(job_title), 연봉(salary)을 조회하시오.
SELECT e.employee_id
       ,e.first_name
       ,e.last_name
       ,j.job_title
       ,e.salary
       ,d.avgS
  FROM employees e, jobs j, (SELECT AVG(salary) avgS, department_id
                               FROM employees
                              GROUP BY department_id
                             HAVING AVG(salary) >= ALL (SELECT AVG(salary)
                                                          FROM employees
                                                         GROUP BY department_id)) d
 WHERE e.job_id = j.job_id
   AND e.department_id = d.department_id;

-- 문제8
-- 평균 급여(salary)가 가장 높은 부서는?
SELECT d.department_name
  FROM departments d, (SELECT AVG(salary), department_id
                         FROM employees
                        GROUP BY department_id
                       HAVING AVG(salary) >= ALL (SELECT AVG(salary)
                                                    FROM employees
                                                   GROUP BY department_id)) dd
 WHERE d.department_id = dd.department_id;

-- 문제9
-- 평균 급여(salary)가 가장 높은 지역은?
SELECT ree.region_name
  FROM (SELECT ROWNUM rn, re.region_name
          FROM (SELECT AVG(salary), r.region_name
                  FROM employees e, departments d, locations l, countries c, regions r
                 WHERE e.department_id = d.department_id
                   AND d.location_id = l.location_id
                   AND l.country_id = c.country_id
                   AND c.region_id = r.region_id
                 GROUP BY r.region_name
                 ORDER BY AVG(salary) DESC
               ) re
         ) ree
 WHERE ree.rn = 1;

-- 문제10
-- 평균 급여(salary)가 가장 높은 업무는?
SELECT job.job_title
  FROM (SELECT ROWNUM rn, jo.job_title
          FROM (SELECT AVG(salary), j.job_title
                  FROM employees e, departments d, jobs j
                 WHERE e.department_id = d.department_id
                   AND e.job_id = j.job_id
                 GROUP BY j.job_title
                 ORDER BY AVG(salary) DESC
               ) jo
         ) job
 WHERE job.rn = 1;