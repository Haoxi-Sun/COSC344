# COSC344 Database Theory and Applications

The aim of COSC344 is to teach the principles of designing a database, use of a database management system, and the design and implementation of the underlying database management system software.

Issues of data modelling and database design are explored briefly. The relational model, relational algebra and operators are covered as well as functional dependencies and normalisation. The query language, SQL, and programming within the database using PL/SQL and triggers are explored. The course introduces interfacing SQL externally to Java, C, and PHP. Database recovery and protection, issues of transactions, concurrent access and query optimisation are covered. The underlying storage structures and access methods are explained. New techniques such as NoSQL data modelling will be introduced.

# Two Assignments/Group Projects need to do:
## The Assignment 1:
Select an application domain or mini-world that your team is interested in. It can be a hobby, a personal interest, or something similar. Pick something fun. The company database used in lectures and labs is not acceptable. COSC 344 Assignment 1 There is no need to model everything in the selected mini-world, but you should choose one with proper size so that each team member can model at least two entity types and at least two relationship types.
### In general the ER diagram should

  • have at least one weak entity type;
  
  • have at least one 1:1, 1:N and M:N relationship between entity types. In some cases, you may not have both 1:1 and 1:N relationships. That is acceptable as long as you have at least one M:N relationship and at least one either 1:1 or 1:N relationship;
  
  • include attributes with several data types: integer and/or reals, character strings, etc.;
  
  • have at least one date data type;
  
  • have at least one derived attribute, and at least one composite attribute.
  
  ## The Assignment 2:
  In this assignment, you will turn your ER diagram into a set of Oracle tables, normalize your design, and populate your database.
  ### Relational Schema:
  Revise your ER diagram based on the feedback for Assignment 1, and then use the 7-step algorithm introduced in Lecture 4 to convert the revised ER diagram to a relation schema. The result should be similar to the diagram discussed in Lecture 4. Underline the primary key, and show all attributes except the derived attributes. As we usually don’t store the value for derived attributes, there is no need to consider them for schema creation and normalization. For referential integrity constraints, draw an arrow from the foreign key terminating on the primary key it refers to.
  ### Normalization:
  Turn your schema diagram into a set of tables in BCNF. You should go to 1NF, 2NF, 3NF, then BCNF. It might happen that a relation may be already in a given normal form (e.g 3NF). In such a case, you just explain why it is in that normal form. Explain your steps in a manner similar to the example given in the attached sample for the assignment report. If you cannot get to BCNF, explain why. Your write-up should be reasonable to follow and include no jumps in logic – it's possible that your BCNF schema may be a 'good representation' of your miniworld, but 'not be correct' based on your initial ERD. 
  ### Create Database:
  Create an SQL script which will create your tables in their BCNF form. The CREATE TABLE commands should be as complete as possible. This means where possible they should:
  1. specify domains if some subset of normal data types is appropriate
  2. specify the primary key
  3. specify uniqueness, not null, and/or a default where appropriate
  4. referential integrity constraints where appropriate

Depending upon your constraints, the order of table creation may be important. 

Put a series of DROP TABLE commands ahead of the CREATE TABLE commands in your script so that the database can be reloaded without any error. Again the order may matter.

Populate your database with a series of INSERT commands. These should follow the CREATE TABLE commands. If at all possible, the INSERT commands for a given table should be grouped together and followed by a COMMIT.

The script described above must be called load.sql and is a deliverable. It should execute without errors. The allowed exception is a DROP TABLE error when the table does not exist.
