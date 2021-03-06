wget http://files.grouplens.org/datasets/movielens/ml-1m.zip
unzip ml-1m.zip

cat ml-1m/ratings.dat | sed 's/::/,/g' | cut -f1-3 -d, > ratings.csv

hdfs dfs -put ratings.csv /ratings.csv

mahout recommenditembased --input /ratings.csv --output recommendations --numRecommendations 10 --outputPathForSimilarityMatrix similarity-matrix --similarityClassname SIMILARITY_COSINE

hdfs dfs -ls recommendations

hdfs dfs -cat recommendations/part-r-00000 | head



sudo pip3 install twisted
sudo pip3 install klein
sudo pip3 install redis

wget http://download.redis.io/releases/redis-2.8.7.tar.gz
tar xzf redis-2.8.7.tar.gz
cd redis-2.8.7
make
./src/redis-server &

# created hello8081.py file

twistd -noy hello8081.py &

curl localhost:8081/37