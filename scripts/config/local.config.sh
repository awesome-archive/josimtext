hadoop=hadoop 
hadoop_xmx_mb=8192
hadoop_mb=8000
spark=/Users/panchenko/Desktop/spark-2.2.0-bin-hadoop2.7/bin/spark-submit # change accordingly
spark_gb=8
hadoop_conf_dir=/etc/hadoop/conf/
yarn_conf_dir=/etc/hadoop/conf.cloudera.yarn/
mwe_dict_path="voc/voc-mwe6446031-dbpedia-babelnet-wordnet-dela.csv"
queue=default
master=local[*]
num_executors=4

bin_spark=`ls ../target/scala-*/jo*.jar`
bin_hadoop="../bin/hadoop/"
