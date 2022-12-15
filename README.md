# GGA
**Clustring with Grouping Genetic algorithm**

Grouping Genetic algorithm is a novel clustering algorithm. In this algorithm, the method finds the best number of clusters and then does the best clustering with the highest rand index. The method is completely illustrated in “An Efficient Grouping Genetic Algorithm for Data Clustering and Big Data Analysis”.

Link of paper: https://link.springer.com/chapter/10.1007/978-3-319-16598-1_5


**Dependency**

Matlab 2015a



**Run**

GGA is the main function of the algorithm. “Createdata” functions simulate artificial data to be used for clustering. You could also use the a1 to a3 artificial data that exists in the files.
	

**Input files and Parameters**


* Numpopulation: number of members that build the initial population. The best mimimun number for Numpopulation is 30.

+ Numiteration: The number of iterations of the algorithm. The best mimimun number for Numiteration is 50.

- Data: The data to be clustered


**Output files**


* Offspring: String of numbers that depicts the number of cluster that each member belong to.

+ Numcluster: Depicts the best number of clusters.

- RI: Depicts the rand index of best and final clustering.


Please do not hesitate to contact us at (hourirazavi@gmail.com) if there is any question.
