import org.apache.spark.{SparkConf, SparkContext}
import org.apache.spark.SparkContext._

object WordSimPseudoSenseErrorEval {

    def computeRelativeError(word1:String, word2:String, scores:Array[Float]):Float = {
        if (scores.length == 2) {
            2*math.abs(scores(0) - scores(1)) / (scores(0) + scores(1))
        } else 0
    }

    def main(args: Array[String]) {
        if (args.size < 1) {
            println("Usage: WordSimPseudoSenseErrorEval sims [output]")
            return
        }

        val param_dataset = args(0)
        val outDir = if (args.size > 1) args(1) else param_dataset + "__"

        val conf = new SparkConf().setAppName("WordSim")
        val sc = new SparkContext(conf)

        val res:(Float, Int) = sc.textFile(param_dataset)
            .map(line => line.split("\t"))
            .filter(array => array.length == 4) // filter erroneous lines
            .map({case Array(word1, word2, score, features) => ((word1, word2.replaceAll("\\$\\$.*", "")), score.toFloat)})
            .groupByKey()
            .map({case ((word1, word2), scores) => (computeRelativeError(word1, word2, scores.toArray), 1)})
            .reduce({case ((score1, aggr1), (score2, aggr2)) => (score1+score2, aggr1+aggr2)})

        println("Result: " + res._1 / res._2)
    }
}