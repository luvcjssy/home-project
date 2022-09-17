# How to run

1. Open terminal (MacOS or Linux) or Command Line (Windows)

2. Please check that ruby is installed on your system

```bash
ruby -v
```

If not, please visit this [link](https://www.ruby-lang.org/en/documentation/installation/) to install ruby

3. Clone repo

```bash
git clone git@github.com:luvcjssy/home-project.git
```

4. On terminal, move to the repo

```bash
cd <path-to-project>
```

5. Execute `test.rb` file on terminal

```bash
irb test.rb
```

# Troubles

- I think I spent more 2 hours to solve this exam. Because, I immediately think of Binary tree when the first time I approach the exam. 
But, the BST just has 2 children for each node after I spent more time to research about BST. Then, I back to array to solve this problem.
 
# Solution

- Transform the input (csv data) to array of hash with id, name, parent's id and children list for each hash object

- Validate the data

- Find the root item and print data in the required format using recursion
