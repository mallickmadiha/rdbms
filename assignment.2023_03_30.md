## 1. What are the main features of redis?

<br/>

    The main features of redis are:

    * It is an in-memory database.
    * It is a key-value store.
    * It is a NoSQL database.
    * It is a distributed database.
    * It is a cache database.
    * It is a pub/sub database.


    Also it is a database with persistence, replication, transactions, Lua scripting, high availability, clustering, sharding, master-slave replication, master-master replication, sentinel, cluster.


  ## 2. Write down the limitations of redis?

<br/>

    The limitations of redis are:

    1. Redis is not a relational database. It is a key-value store.

    2. Redis is not a multi-threaded database. It is a single-threaded database.

    3. Redis is not a multi-user database. It is a single-user database.

    4. Redis is not a multi-process database. It is a single-process database.

    5. Redis is not a multi-tenant database. It is a single-tenant database.




## 3. Perform a basic CRUD operation using redis.

<br/>

The example of creating a key-value pair in redis is as follows:

    redis> SET name "John"
    OK
    redis> GET name
    "John"

The example of updating a key-value pair in redis is as follows:

    redis> SET name "John"
    OK
    redis> GET name
    "John"
    redis> SET name "Jack"
    OK
    redis> GET name
    "Jack"


The example of deleting a key-value pair in redis is as follows:

    redis> SET name "John"
    OK
    redis> GET name
    "John"
    redis> DEL name
    (integer) 1
    redis> GET name
    (nil)

The example of reading a key-value pair in redis is as follows:

    redis> SET name "John"
    OK
    redis> GET name
    "John"


## 4. Explain TTL command with an example.

<br/>

    TTL command is used to set the time to live for a key in redis. The time to live is the number of seconds after which the key will be deleted. The example of TTL command is as follows:

    redis> SET name "John"
    OK
    redis> GET name
    "John"
    redis> TTL name
    (integer) -1
    redis> SET name "John" EX 10
    OK
    redis> TTL name
    (integer) 10

Here the key name will be deleted after 10 seconds, because we have set the TTL for the key name to 10 seconds. 


## 5. Create a transaction in redis to perform the following operations.

- Create two keys in a single line and one key differently. (one value should be number)

- Read any two value in a single line

- Increment the number value

- Expire any two keys after some time

<br/>


Creating Transaction in redis:

    MULTI
    MSET name "John" age 30
    MGET name age
    INCR age
    EXPIRE name 10
    EXPIRE age 10
    EXEC


