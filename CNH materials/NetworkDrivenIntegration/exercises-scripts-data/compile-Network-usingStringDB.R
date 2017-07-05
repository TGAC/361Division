# Get StringInteractome Network 

#INPUT 
# fileName - table with column 'name'
# Uncomment next two lines and add values accordingly
# speciesName = 'human'
# speciesCode = 9606  #homo sapiens

# networkFileName = "network.csv"   # output file name

# Load file with list of genes  
# Read data table
# with at least a column "name" for the list of genes
inputData <- read.delim( fileName, header = TRUE, 
                         sep = '\t', stringsAsFactors = FALSE)
geneList <- inputData$name

# begin compiling network
library(STRINGdb)
string_db <- STRINGdb$new( version="10", species = 9606, 
                           score_threshold=0, input_directory="" )
mapped <- string_db$map( inputData,  "name", removeUnmappedRows = TRUE )

#get interactions 
inter<-string_db$get_interactions(mapped$STRING_id)

#annotate source and target nodes
from <- gsub("9606.","",inter$from)
to <- gsub("9606.","",inter$to)
#divide combined_score values by 1000 to have
#scores in the range [0,1]
network <- cbind(from,to,inter[16]/1000)  
threshold <- 0.6   # select some relevant threshold
subNetwork <- network[network$combined_score > threshold,] 

#edit STRING_id (speciesCode.ENSPxxxxx) to remove speciesCode.
stringID <- gsub(paste(speciesCode, ".", sep = ""), "", mapped$STRING_id)
drops <- "STRING_id"
mapped$STRINGID <- mapped$STRING_id
mapped <- mapped[!(names(mapped) %in% drops)]

# end compiling network

#write two files: 
#1) all network edges and 
#2) edges above specified threshold
cat(sprintf('\nSaving network (edges) to file: %s', fileName))
cat('. . .')
fileName <- paste(networkFileName, '.txt', sep = "")
write.table(mapped, fileName, sep = '\t', col.names = TRUE, 
            row.names = FALSE, quote = FALSE)
cat(sprintf('Done!'))

cat(sprintf('\nSaving network for threshold: 0.60 in file: %s', fileName))
cat('. . .')
fileName <- paste(networkFileName, 'score_0.60.txt', sep = "")
write.table(subNetwork, fileName, sep = '\t', col.names = TRUE, 
            row.names = FALSE, quote = FALSE)
cat(sprintf('Done!'))
