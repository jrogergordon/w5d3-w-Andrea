# # It's a Sequel


# #table of nobels
# #table of columns: winner year subj
# #subj = only physics or chem

# SELECT 
#     year
# FROM
#     nobels
# GROUP BY
#     year
# WHERE
#     subj IS NOT (
#         SELECT
#             year
#         FROM
#             nobels
#         WHERE
#             subj = 'Chemistry'
#     );

# SELECT DISTINCT
#     yr
# FROM
#     nobels
# WHERE
#     (subject = 'Physics' AND yr NOT IN (
#     SELECT
#         yr
#     FROM
#         nobels
#     WHERE
#         subject = 'Chemistry'
#     ));

# employees #table 1 = employees & departmnet corresponds
# department table 2 = department
#sql query: find employees name who work in that department

# SELECT
#     employees.name = name
# FROM
#     employees
# JOIN
#     department ON employees.department_id = department.id
# WHERE
#     departments.name = ?;

# #reutrn all names of employees who dont have a department
# SELECT
#     employees.name
# FROM
#     employees
# WHERE
#     employees.department_id IS NULL;

#reverse

def reverse(arr_chars)
    size = arr_chars.length
    i = 0
    j = -1
    size /= 2
    if arr_chars.length % 2 == 0
        (0..size).each do |ele| #1n
            arr_chars[i], arr_chars[j] = arr_chars[j], arr_chars[i]
            i += 1
            j -= 1
        end
    else
        size -= 1
        (0..size).each do |ele| #1n
            arr_chars[i], arr_chars[j] = arr_chars[j], arr_chars[i]
            i += 1
            j -= 1
        end
    end
    arr_chars
end
arr = ["h", "e", "l", "l", "o"]
p reverse(arr)
p
p

    