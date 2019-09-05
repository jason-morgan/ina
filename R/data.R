##' Informal communication within a sawmill on strike.
##'
##' This undirected network contains the informal communication network between
##' 24 striking sawmill workers (Michael 1997). See Details below.
##'
##' The source link provides this description of the data:
##'
##' ``In a wood-processing facility, a new management team proposed changes to the
##' workers' compensation package, which the workers did not accept. They
##' started a strike, which led to a negotiation stalemate. Then, management
##' asked an outsider to analyze the communication structure among the employees
##' because it felt that information about the proposed changes was not
##' effectively communicated to all employees by the union negotiators.
##'
##' The outside consultant asked all employees to indicate the frequency in
##' which they discussed the strike with each of their colleagues on a 5-point
##' scale, ranging from `almost never' (less then once per week) to `very often'
##' (several times per day). The consultant used three as a cut-off value. If at
##' least one of two persons indicated that they discussed work with a frequency
##' of three or more, a line between them was added to the informal
##' communication network.
##'
##' The network displays fairly stringent demarcations between groups defined on
##' age and language. The Spanish-speaking young employees, who are of age 30 or
##' younger, are almost disconnected from the English- speaking young employees,
##' who communicate with no more than two of the older English-speaking
##' employees.
##'
##' All ties between groups have special backgrounds. Among the Hispanics,
##' Alejandro is most proficient in English and Bob speaks some Spanish, which
##' explains their tie. Bob owes Norm for getting his job and probably because
##' of this, they developed a friendship tie. Finally, Ozzie is the father of
##' Karl.''
##'
##' @format A undirected statnet network object with 24 nodes:
##' \describe{
##'   \item{vertex.names}{vertex attribute, name of striking worker.}
##'   \item{group}{vertex attribute, language/age group to which each vertex
##'     belongs, defined as follows: (1) Spanish-speaking workers under 30-years
##'     of age; (2) English-speaking workers under 30-years of age; and (3)
##'     English-speaking workers over 30. It should be noted that Alejandro also
##'     speaks some English, while Bob speaks some Spanish.}
##' }
##' @docType data
##' @keywords datasets
##' @name Strike
##' @usage data(Strike)
##' @references Michael, Judd H. (1997), "Labor dispute reconciliation in a forest
##'     products manufacturing facility", Forest Products Journal, 47, 41--45.
##' @source \url{https://sites.google.com/site/ucinetsoftware/datasets/informalcommunicationwithinasawmillonstrike}
NULL


##' Advice network between managers in a high-tech manufacturing compnay
##'
##' This directed network contains the advice communication network between
##' 21 managers in a high-tech manufacturing company (Krackhardt 1987).
##'
##' @format A directed statnet network object with 21 nodes:
##' \describe{
##'   \item{vertex.names}{vertex attribute, unique id number for each manager
##'       in the network}
##'   \item{Age}{vertex attribute, age of each manager}
##'   \item{Department}{vertex attribute, integer indicating the manager's
##'       department}
##'   \item{Level}{vertex attribute, integer rank of the manager in the
##'       company, ranging from 1 to 3}
##'   \item{Tenure}{vertex attribute, number of years of tenure at the
##'       company}
##' }
##' @docType data
##' @keywords datasets
##' @name Krackhardt
##' @usage data(Krackhardt)
##' @references Krackhardt, D. (1987), "Cognitive social structures",
##'     Social Networks 9(2), 109--134.
##' @source \url{http://networkdata.ics.uci.edu/netdata/html/krackHighTech.html}
NULL


##' Cosponsorship network among the 5 most liberal and 5 most conservative
##'
##' In this directed network an edge from i to j indicates that senator i
##' cosponsored at least two bills sponsored by j in the 106th Congress.
##'
##' @format A directed statnet network object with 10 nodes:
##' \describe{
##'   \item{vertex.names}{vertex attribute, name of each senator
##'       in the network}
##'   \item{ideol}{vertex attribute, DW-nominate ideology score of each senator}
##'   \item{dist}{network attribute, Euclidean distance in lat/lon units,
##'               between state capitals}
##' }
##' @docType data
##' @keywords datasets
##' @name Senate
##' @usage data(Senate)
##' @references Fowler, J. H. (2006). Connecting the Congress: A study of
##'     cosponsorship networks. Political Analysis, 14(4), 456-487.
##' @source \url{http://jhfowler.ucsd.edu/cosponsorship.htm}
NULL



##' Full cosponsorship network of the 108th senate
##'
##' This undirected network consists of 101 vertices
##'
##' @format A list object containing a weighted adjacency matrix (net), and a character vector of senator names (labels). Also a data frame containing the ideology scores of senators.
##' \describe{
##'   \item{senlist}{List object with weighted adjacency matrix.}
##'   \item{dwnom}{Data frame with ideology scores of senators.}
##' }
##' @docType data
##' @keywords datasets
##' @name cosponsorship
##' @usage data(cosponsorship)
##' @references Gathered by James Fowler.
##' @source \url{}
NULL

##' Grey's Anatomy hookup network
##'
##' This undirected network consists of 44 vertices representing
##'
##' @format A undirected statnet network object with 44 nodes:
##' \describe{
##'   \item{birthyear}{}
##'   \item{name}{}
##'   \item{position}{}
##'   \item{race}{}
##'   \item{season}{}
##'   \item{sex}{}
##'   \item{sign}{}
##'   \item{vertex.names}{}
##' }
##' @docType data
##' @keywords datasets
##' @name Hookups
##' @usage data(Hookups)
##' @references Gathered by Gary Weissman and Augmented by Benjamin Lind
##' @source \url{}
NULL

##' NCAA Men's Basketball data
##'
##' This directed network of 15 nodes represents scoring between
##' teams in the Atlantic Coast Conference in the 2016 Regular season.
##'
##' @format Two matrices and a data frame:
##' \describe{
##' \item{adjacencyMatrix}{Matrix in which the (i,j) element is the number of
##'     points, in thousands, that team i scored on team j over the regular season.}
##' \item{covariateData}{Data frame that includes that name of the school and
##'     its enrollment.}
##' \item{nGames}{Matrix in which the (i,j) element is the number of games
##'     played between teams i and j.} }
##' @docType data
##' @keywords datasets
##' @name ACCBasketball
##' @usage data(ACCBasketball)
##' @references Gathered from spreadsheetsports.com.
##' @source \url{spreadsheetsports.com}
NULL


##' U.S. Estuary Networks
##'
##' This is a directed network with 194 total nodes, spread over separate networks
##' that cover ten U.S. estuaries.
##'
##' @format Five matrices:
##' \describe{
##' \item{nets1}{Matrix in which the (i,j) element is an indicator of the 
##' relationship category from i to j in the first wave. Category values
##' include '10' for "structural zero", which is included if i and j are
##' in different networks, '0' for not tied, '1' for tied, and 'NA' for
##' missing (i.e., i did not fill out the respective cell in the survey).}
##' \item{nets2}{Matrix in which the (i,j) element is an indicator of the 
##' relationship category from i to j in the second wave.}
##' \item{govact}{One-column matrix in which a 0 indicates non-governmental
##'  organization and 1 indicates governmental organization. }
##' \item{prodev}{One-column matrix in which higher values indicate 
##' that the respondent is more supportive of development.}
##' \item{trust}{Two-column matrix, with one column for each wave, 
##' in which higher values indicate greater trust for the other organizations
##' in the network.}}
##' @docType data
##' @keywords datasets
##' @name estuaries
##' @usage data(estuaries)
##' @references Berardo, Ramiro, and John T. Scholz. "Self‐organizing policy networks: 
##' Risk, partner selection, and cooperation in estuaries." American Journal of 
##' Political Science 54, no. 3 (2010): 632-649.
##' 
##' Desmarais, Bruce A., and Skyler J. Cranmer. "Micro‐level interpretation of 
##' exponential random graph models with application to estuary networks." 
##' Policy Studies Journal 40, no. 3 (2012): 402-434.
NULL

##' Golden Age of Hollywood Actor Networks
##'
##' This is a directed network of film actors with 55 nodes, over seven time periods
##'
##' @format Seven network objects and one data frame:
##' \describe{
##' \item{n1--n7}{Each of these seven objects is is a network object.  
##' Each node is an actor, and an edge from i to j indicates that
##' i appeard in at least one film in a supporting role to j during 
##' the respective time period.}
##' \item{attributes}{A data frame that includes vertex attributes.}}
##' @docType data
##' @keywords datasets
##' @name gaoh
##' @usage data(gaoh)
##' @references Taylor, Dane, Sean A. Myers, Aaron Clauset, Mason A. Porter,
##'  and Peter J. Mucha. "Eigenvector-based centrality measures for temporal
##'   networks." Multiscale Modeling & Simulation 15, no. 1 (2017): 537-574.
NULL

##' Books about US Politics
##'
##' This network consistens of 105 vertices, each representing a book about
##' politics sold in the early 2000s in Amazon.
##'
##' Newman's note on the data:
##'
##' ``Books about US politics \newline
##' Compiled by Valdis Krebs
##'
##' Nodes represent books about US politics sold by the online bookseller
##' Amazon.com.  Edges represent frequent co-purchasing of books by the same
##' buyers, as indicated by the "customers who bought this book also bought
##' these other books" feature on Amazon.
##'
##' Nodes have been given values "l", "n", or "c" to indicate whether they are
##' "liberal", "neutral", or "conservative".  These alignments were assigned
##' separately by Mark Newman based on a reading of the descriptions and
##' reviews of the books posted on Amazon.
##'
##' These data should be cited as V. Krebs, unpublished,
##' \url{http://www.orgnet.com/}.''
##'
##' @format An undirected statnet network onject with 105 nodes
##' \describe{
##' \item{title}{Title of the book.}
##' \item{political_leaning}{The political leaning of the book, as compiled
##'     by Mark Newman from descriptions on Amazon. These have been recoded
##'     to "liberal", "neutral", and "conservative".}
##' }
##' @docType data
##' @keywords datasets
##' @name Books
##' @usage data(Books)
##' @references \url{http://www-personal.umich.edu/~mejn/netdata/};
##'     Valdis Krebs, Unpublished.
##' @source \url{http://vlado.fmf.uni-lj.si/pub/networks/data/mix/mixed.htm}
NULL
