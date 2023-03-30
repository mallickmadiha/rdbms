
# 1. Determine the highest normal form of this relation scheme.
 The relation scheme student Performance (StudentName, CourseNo, EnrollmentNo, Grade) has
 the following functional dependencies:

 StudentName, courseNo → grade

 EnrollmentNo, courseNo → grade

 StudentName →EnrollmentNo

 EnrollmentNo →StudentName

<br/>

## ANS:

First we will find the candidate keys for the relation scheme. 

Candidate keys are the attributes that uniquely identify a tuple in a relation.

StudentName, courseNo → grade
EnrollmentNo, courseNo → grade
StudentName →EnrollmentNo
EnrollmentNo →StudentName

From the above functional dependencies,

{courseNo}* does not uniquely identify a tuple in the relation scheme. Hence, it is not a candidate key. SO we will check the combinations with courseNo that gives all the columns in the relation scheme.


`{StudentName, courseNo}* = {StudentName, courseNo, EnrollmentNo, Grade} `

uniquely identifies a tuple in the relation scheme. Hence, it is a candidate key.

`{EnrollmentNo courseNo}* = {StudentName, courseNo, EnrollmentNo, Grade} `

uniquely identifies a tuple in the relation scheme. Hence, it is a candidate key.



So the prime attributes are, 

`{StudentName, courseNo, EnrollmentNo}`

And the non prime attributes are,

`{Grade}`

Now we will check for BCNF,

If we see the Functional dependencies, 

The first two functional dependencies are in BCNF as their left hand side is a candidate key. But the last two functional dependencies are not in BCNF as their left hand side is not a candidate key.


So the relation scheme is not in BCNF.


Now we will check for 3NF,

If we see the Functional dependencies, all the functional dependencies are follow the 3NF as their left hand side is a candidate key or the RHS isa prime attribute.


So the relation scheme is in 3NF.

<br/>
<br/>

## 2.Suppose you are given a relation R= (A, B, C, D, E )

the following functional dependencies:{CE →D, D→B, C →A}

a. Find all candidate keys.

b. Identify the best normal form that R satisfies (1NF, 2NF, 3NF, or BCNF).

c. If the relation is not in BCNF, decompose it until it becomes BCNF. At each step, identify a
new relation, decompose and re-compute the keys and the normal forms they satisfy.


<br/>

## ANS:

### a. Find all candidate keys.

Candidate keys are the attributes that uniquely identify a tuple in a relation.

From the above functional dependencies,
CE →D, D→B, C →A

If we see the functional dependencies, 

`{CE}* = {A, B, C, D, E}`

Then we see that CE is a candidate key as it uniquely identifies all the columns in the relation scheme.


### b. Identify the best normal form that R satisfies (1NF, 2NF, 3NF, or BCNF).

If we see the Functional dependencies,

`CE →D`

`D →B`

`C →A`

Only the first functional dependency is in BCNF as its left hand side is a candidate key. But the last two functional dependencies are not in BCNF as their left hand side is not a candidate key.


Now we will check for 3NF,

Only the first and last functional dependencies are in 3NF as their left hand side is a candidate key or the RHS is a prime attribute.


Now we will check for 2NF,

Only the first and second functional dependencies are in 2NF as their exist no partial dependencies.


So the relation scheme is in 1NF.


### c. If the relation is not in BCNF, decompose it until it becomes BCNF. At each step, identify a new relation, decompose and re-compute the keys and the normal forms they satisfy.

If we see the Functional dependencies,

`CE →D`

`D →B`

`C →A`

Here `C →A` is a partial dependency. So we will decompose the relation scheme as,

If we decompose the relation scheme as,

R1 = (B, C, D, E)

R2 = (A, C)

Now the functional dependencies are,

R1 = (B, C, D, E)

`D →B`

`CE →D`

R2 = (A, C)

`C →A`

Then we see that R1 and R2 are in BCNF as their left hand side is a candidate key.

In R1, the candidate key is {CE} and in R2, the candidate key is {C}.

<br/>

Now we will check for 3NF,

If we see the Functional dependencies, `D →B` is not in 3NF as their left hand side is not a candidate key or the RHS is a prime attribute.


Convert R1 to 3NF,

R11 = (B, D, E, C)

R12 = (D, B)

R2 = (A, C)

Now the functional dependencies are,

R11 = (B, D, E, C)

`D →B`

`CE →D`

R12 = (D, B)

`D →B`

R2 = (A, C)

`C →A`

Then we see that R11, R12 and R2 are in 3NF as their left hand side is a candidate key or the RHS is a prime attribute.

And finally if we check for BCNF,

We see that all the relations are in BCNF as their left hand side is a candidate key.

<br/>

# 3. You are given the following set F of functional dependencies for relation R(A, B, C, D, E, F):
F={ABC →D, ABD→E,CD→F,CDF →B,BF →D}

a. Find all keys of R based on these functional dependencies.

b. Is this relation in Boyce-Codd Normal Form? Is it 3NF? Explain your answers


<br/>

## ANS:

### a. Find all keys of R based on these functional dependencies.

Candidate keys are the attributes that uniquely identify a tuple in a relation.

Here we have the following functional dependencies,

`ABC →D`

`ABD →E`

`CD →F`

`CDF →B`

`BF →D`

So if we check the combinations of the attributes that gives all the columns in the relation scheme,

`{ABC}* = {A, B, C, D, E, F}`

`{ACD}* = {A, B, C, D, E, F}`


So the candidate keys are,

`{ABC}`

`{ACD}`

Hence the prime attributes are,

`{A, B, C, D}`

And the non prime attributes are,

`{E, F}`

### b. Is this relation in Boyce-Codd Normal Form? Is it 3NF? Explain your answers


If we see the Functional dependencies, we see that the relation scheme is not in BCNF as the last 4 functional dependency is not in BCNF as its left hand side is not a candidate key.


Now we will check for 3NF,

If we see the Functional dependencies, we see that the relation scheme is not in 3NF as the last 2 functional dependency is in 3NF as its left hand side is a candidate key or the RHS is a prime attribute.


So the relation scheme is not in BCNF or 3NF.


<br/>


# 4. Write the advantages and disadvantages of Normalization.

<br/>

## ANS:

The advantages of Normalization are,

1. It reduces the redundancy of data.

2. It reduces the modification anomalies.

3. It reduces the insertion anomalies.

4. It reduces the deletion anomalies.

5. It improves the query performance.



The disadvantages of Normalization are,

1. It increases the complexity of the database.

2. It increases the complexity of the queries.

3. It increases the complexity of the database design.

4. It increases the complexity of the database maintenance.

<br/>

# 5.Determine the decomposition.
Consider the schema R = (S T U V) and the dependencies S → T, T → U, U → V, and V → S.
Let R = (R1 and R2) be a decomposition such that R1 ∩ R2 ≠ ∅

<br/>

## ANS:

Here we have the following functional dependencies,

`S → T`

`T → U`

`U → V`

`V → S`

So if we check the combinations of the attributes that gives all the columns in the relation scheme,

`{S}* = {S, T, U, V}`

`{T}* = {S, T, U, V}`

`{U}* = {S, T, U, V}`

`{V}* = {S, T, U, V}`

So the candidate keys are,

`{S}`

`{T}`

`{U}`

`{V}`

If we divide R into R1 and R2 such that,

R1 = (S, T, U)

R2 = {T, U, V}

Then we see that R1 ∩ R2 ≠ ∅


<br/>
