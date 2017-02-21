# Ruby on Rails with Cassandra

You can create a Rails project with help of Cassandra easily.

#### Installation of Cassandra on Mac
https://gist.github.com/hkhamm/a9a2b45dd749e5d3b3ae

```
brew install python
pip install cql
brew services start cassandra
```

#### Create a Rails Project
1. Create your Rails project with the '--skip-active-record' switch.

```
rails new cassandra_example --skip-active-record
```

2. Remove sqlite3 from your Gemfile (if present), add below gems to your Gemfile, and run 'bundle'.

```
gem 'cequel'
gem 'activemodel-serializers-xml'
```

3. Cequel is ready to go. The Rails generators for 'model', 'scaffold' etc have been overridden by Cequel. Any models, scaffolds etc that you create will create classes that include the Cequel::Record module instead of inheriting from ApplicationRecord in the models folder.

4. Start your local server and access your project at http://localhost:3000/

#### Indexing for Cassandra

* You can create an index in Cassandra using the command CREATE INDEX. Its syntax is as follows:

```
CREATE INDEX <identifier> ON <tablename>
```

Given below is an example to create an index to a column. Here we are creating an index to a column title in a table named posts.

```
cqlsh:cassandra_example_development> CREATE INDEX index_title_on_posts ON posts (title);
```

* You can drop an index using the command DROP INDEX. Its syntax is as follows:

```
DROP INDEX <identifier>
```
Given below is an example to drop an index of a column in a table. Here we are dropping the index of the column name in the table emp.

```
cqlsh:cassandra_example_development> DROP INDEX index_title_on_posts;
```

Indexing improves the performance of application.
