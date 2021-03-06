hadoop=hadoop 
hadoop_xmx_mb=8192 #4096
hadoop_mb=8000 #4000
spark=spark-submit 
spark_gb=8

hadoop_conf_dir=/etc/hadoop/conf/
yarn_conf_dir=/etc/hadoop/conf.cloudera.yarn/
mwe_dict_path="voc/voc.txt" # "voc/voc-mwe6446031-dbpedia-babelnet-wordnet-dela.csv" #"voc/voc-mwe-dela-wiki-druid-wordnet-babelnet-8m.csv" 
queue=default
master=yarn
num_executors=2000

bin_spark=`ls ../bin/spark/jo*.jar`
bin_hadoop="../bin/hadoop/"

export HADOOP_CONF_DIR=/etc/hadoop/conf/
export YARN_CONF_DIR=/etc/hadoop/conf.cloudera.yarn/
