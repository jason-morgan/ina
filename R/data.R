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
##' In this directed network an edge from i to j indicates that senator i cosponsored
##' at least two bills sponsored by j in the 106th Congress.
##'
##' @format A directed statnet network object with 10 nodes:
##' \describe{
##'   \item{vertex.names}{vertex attribute, name of each senator
##'       in the network}
##'   \item{ideol}{vertex attribute, DW-nominate ideology score of each senator}
##'   \item{dist}{network attribute, Euclidean distance in lat/lon units, between state capitals}
##' }
##' @docType data
##' @keywords datasets
##' @name senate_network
##' @usage data(senate_network)
##' @references Fowler, J. H. (2006). Connecting the Congress: A study of
##'     cosponsorship networks. Political Analysis, 14(4), 456-487.
##' @source \url{http://jhfowler.ucsd.edu/cosponsorship.htm}
NULL
