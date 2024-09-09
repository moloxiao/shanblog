+++
title = 'Relational Databases and Normalization'
date = 2024-09-09T15:01:22+12:00
draft = false
tags = ["Database", "SQL"]
+++
![landing page](/images/2024-09/edgar-f-codd.png)  
Two-dimensional data is the most commonly used form of information representation by humans. In 1970, **Edgar F. Codd** first introduced how to efficiently use two-dimensional data to represent transactions, laying the foundation for modern databases.  
> The core of this theory is: normalization.  

Let’s demonstrate how database normalization helps us build a better two-dimensional data model through an example.  

# 1 Scenario  
We have a system that tracks students registering for courses at a technical institute. Each student has a unique ID, and each course has a unique course number, course name, and instructor. We need to design a normalized database structure.  

**Initial Unnormalized Data**  
Suppose we have a table where each student can register for multiple courses, but the course information and instructor names are stored in a single field:  
|Student ID	|Student Name|	Courses	|Instructors|
|-|--|--|--|
|1	|John Smith	 |Mathematics, Physics|	Dr. Brown, Dr. Green|
|2	|Emily Davis	|Mathematics|	Dr. Brown|
|3	|Michael Lee	|Chemistry|	Dr. White|
|4	|Sarah Wilson	|Mathematics, Chemistry|	Dr. Brown, Dr. White|

Problems with this structure :  
* Redundancy: Both course names and instructor names are repeated.
* Data integrity: If an instructor changes their name, we would have to manually update multiple records.
* Querying issues: Retrieving specific data (like a list of students in a particular course) would be inefficient due to the combined fields.  

## 1.1 First Normal Form (1NF)
To meet the 1NF requirements, we must ensure each field contains **only atomic (indivisible) values**. We would split the multi-valued fields into separate rows:  
| Student ID | Student Name  | Course ID | Course Name  | Instructor Name |
|------------|---------------|-----------|--------------|-----------------|
| 1          | John Smith    | 101       | Mathematics  | Dr. Brown       |
| 1          | John Smith    | 102       | Physics      | Dr. Green       |
| 2          | Emily Davis   | 101       | Mathematics  | Dr. Brown       |
| 3          | Michael Lee   | 103       | Chemistry    | Dr. White       |
| 4          | Sarah Wilson  | 101       | Mathematics  | Dr. Brown       |
| 4          | Sarah Wilson  | 103       | Chemistry    | Dr. White       |

  
## 1.2 Second Normal Form (2NF) & Third Normal Form (3NF)   

Second Normal Form (2NF) requirement: A table is in 2NF if it is already in 1NF and every non-primary key attribute is fully dependent on the entire primary key (in the case of a composite primary key, it must depend on all parts of the key):  
* In the original table, the primary key is the combination of Student ID and Course ID.
* Issue: The non-primary key attribute Student Name only depends on Student ID and not on the entire composite primary key. This is called a partial dependency, which violates 2NF because Student Name is not dependent on the whole key (Student ID + Course ID), just on a part of it (Student ID). 
* Similarly, Course Name and Instructor Name depend only on Course ID, not on the entire composite key (Student ID + Course ID).    

> Because of these partial dependencies, the table does not satisfy 2NF.

Third Normal Form (3NF) requirement: A table is in 3NF if it is in 2NF and there are no transitive dependencies. This means that non-primary key attributes should not depend on other non-primary key attributes :  
* Issue: In the original table, the attribute Instructor Name depends on Course ID, which is another non-primary key attribute. This creates a transitive dependency, because Instructor Name is indirectly dependent on the composite primary key through Course ID. Essentially, Instructor Name depends on Course ID, and Course ID is part of the primary key.  

> Due to this transitive dependency, the table violates 3NF.

To meet 2NF & 3NF, we need to remove partial dependencies by separating student registrations from course details. We split the table into N.   

**table1 - Students** : 
| Student ID | Student Name  |
|------------|---------------|
| 1          | John Smith    |
| 2          | Emily Davis   |
| 3          | Michael Lee   |
| 4          | Sarah Wilson  |


 **table2 Instructors Table** :  
| Instructor ID | Instructor Name |
|---------------|-----------------|
| 1             | Dr. Brown       |
| 2             | Dr. Green       |
| 3             | Dr. White       |

**table3 Course Table** :  
| Course ID | Course Name  |
|-----------|--------------|
| 101       | Mathematics  |
| 102       | Physics      |
| 103       | Chemistry    |


**table4 Course-Instructor Relationship Table** :  
| Course ID | Instructor ID |
|-----------|---------------|
| 101       | 1             |
| 102       | 2             |
| 103       | 3             |

  
# 2 Define
**First Normal Form (1NF)**: A table is in 1NF if all the values in each column are atomic (indivisible). This means that each field should contain only one value, and there should be no repeating groups or arrays of values in a single column.  
**Second Normal Form (2NF)**: A table is in 2NF if it is in 1NF and all non-primary key attributes are fully dependent on the entire primary key (if a composite primary key is used). It eliminates partial dependencies, where a non-primary key attribute depends only on part of a composite key.  
**Third Normal Form (3NF)**: A table is in 3NF if it is in 2NF and all non-primary key attributes are not only fully dependent on the primary key but also not transitively dependent on other non-primary key attributes. This eliminates transitive dependencies, where one non-key attribute depends on another non-key attribute.  
  
# 3 Next step
Next, we can consider two aspects: 
1. In more complex scenarios, explore other normal forms or even denormalization.  
2. How to enable computers to more efficiently store and query normalized data (a central theme of database products in the decades following the 1970s).  









